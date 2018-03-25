using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class lead_addmovie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Response.Redirect("../adminlogin.aspx");
    }

    public bool ProcessSqlStr(string inputString)
    {
        string SqlStr = @"and|or|exec|execute|insert|select|delete|update|alter|create|drop|count|\*|chr|char|asc|mid|substring|master|truncate|declare|xp_cmdshell|restore|backup|net +user|net +localgroup +administrators";
        try
        {
            if ((inputString != null) && (inputString != String.Empty))
            {
                string str_Regex = @"\b(" + SqlStr + @")\b";

                Regex Regex = new Regex(str_Regex, RegexOptions.IgnoreCase);
                if (true == Regex.IsMatch(inputString))
                    return false;

            }
        }
        catch
        {
            return false;
        }
        return true;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string strConn = ConfigurationManager.ConnectionStrings["movieConnection"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        try
        {
            // 打开数据库连接

            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            string t_name = name.Text.Trim();
            string t_time = time.Text.Trim();
            string t_long1 = long1.Text.Trim();
            string t_dir = dir.Text.Trim();
            string t_message = message.Text.Trim();
            double t_score = Convert.ToDouble(score.Text.Trim());
            int t_number = Convert.ToInt32(number.Text.Trim());
            string t_locate = DropDownList1.Text.Trim();
            if (t_name.Length > 20)
                Response.Write("<script language =javascript>alert('姓名过长')</script>");
            else if (t_time.Length > 30)
                Response.Write("<script language =javascript>alert('时间过长')</script>");
            else if (t_long1.Length > 3)
                Response.Write("<script language =javascript>alert('长度过长')</script>");
            else if (t_dir.Length > 20)
                Response.Write("<script language =javascript>alert('导演名过长')</script>");
            
            else if (t_message.Length > 1000)
                Response.Write("<script language =javascript>alert('内容过长')</script>");
            else if (t_score > 10 || t_score < 0)
                Response.Write("<script language =javascript>alert('评分不对')</script>");
            else if (t_number < 0)
                Response.Write("<script language =javascript>alert('人数不对')</script>");
            else if (ProcessSqlStr(t_name) && ProcessSqlStr(t_time) && ProcessSqlStr(t_dir) && ProcessSqlStr(t_message) && ProcessSqlStr(t_long1))
            {
                cmd.CommandText = "insert into movie values ( '" + t_name + "','" + t_time + "','" + t_long1 + "',(SELECT lid FROM location WHERE location ='" + DropDownList1.Text + "'),'" + t_dir + "','" + t_message + "','" + t_score + "','" + t_number + "'," + 0 + ")";
                int i = cmd.ExecuteNonQuery();
                if (i == 1)
                    Response.Write("<script language =javascript>alert('添加成功！');location.href='updatemovie.aspx';</script>");
            }
        }
        catch (System.Exception ee)
        {
            Response.Write(ee.Message.ToString());
        }
        finally
        {
            conn.Close();
        }
    }
}