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

public partial class lead_updateactor1 : System.Web.UI.Page
{
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

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Response.Redirect("../adminlogin.aspx");

        if (!IsPostBack)
        {
            NewsInfoBind();
        }
    }

    protected void NewsInfoBind()
    {
        int aid = Convert.ToInt32(Request.QueryString["aid"]);
        string cmdText = "select aid,aname ,gender ,abirthday ,location ,introduction from actor,location where actor.alocation=location.lid and aid=" + aid;
        string strConn = ConfigurationManager.ConnectionStrings["movieConnection"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);

        DataTable dt = null;
        try
        {
            // 打开数据库连接

            conn.Open();
            SqlDataAdapter adap = new SqlDataAdapter(cmdText, conn);

            DataSet ds = new DataSet();

            adap.Fill(ds, "tempTab");
            dt = ds.Tables["tempTab"];
        }
        catch
        {
            dt = null;
        }
        finally
        {
            conn.Close();
        }

        name.Text = dt.Rows[0][1].ToString();
        gender.Text = dt.Rows[0][2].ToString();
        birthday.Text = dt.Rows[0][3].ToString();
        location.Text = dt.Rows[0][4].ToString();
        message.Text = dt.Rows[0][5].ToString();

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        int aid1 = Convert.ToInt32(Request.QueryString["aid"]);

        string strConn = ConfigurationManager.ConnectionStrings["movieConnection"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        try
        {
            // 打开数据库连接

            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            string t_name = name.Text.Trim();
            string t_gender = gender.Text.Trim();
            string t_birthday = birthday.Text.Trim();
            string t_message = message.Text.Trim();

            string t_locate = location.Text.Trim();
            if (t_name.Length > 20)
                Response.Write("<script language =javascript>alert('姓名过长')</script>");
            Regex rx = new Regex("^[\u4E00-\u9FA5]+$");
            if (t_name.Length > 20)
                Response.Write("<script language =javascript>alert('姓名过长')</script>");

            else if (String.Compare(t_gender, "男") != 0 && String.Compare(t_gender, "女") != 0)
                Response.Write("<script language =javascript>alert('性别格式不对')</script>");
            else if (t_birthday.Length > 30)
                Response.Write("<script language =javascript>alert('生日过长')</script>");
            else if (t_locate.Length > 10)
                Response.Write("<script language =javascript>alert('地区过长')</script>");
            else if (t_message.Length > 1000)
                Response.Write("<script language =javascript>alert('简介过长')</script>");

            else if (ProcessSqlStr(t_name) && ProcessSqlStr(t_gender) && ProcessSqlStr(t_birthday) && ProcessSqlStr(t_message) && ProcessSqlStr(t_locate))
            {
                cmd.CommandText = "UPDATE actor SET aname = '" + t_name + "',  gender = '" + t_gender + "', abirthday = '" + t_birthday + "', alocation = (select lid from location where location='" + t_locate + "'),introduction = '" + t_message + "' WHERE aid= " + aid1;
                int i = cmd.ExecuteNonQuery();
                if (i == 1)
                    Response.Write("<script language =javascript>alert('修改成功！');location.href='tpdateactor.aspx';</script>");
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