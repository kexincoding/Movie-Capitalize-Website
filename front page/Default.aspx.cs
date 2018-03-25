using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;


public partial class 首页_Default : System.Web.UI.Page
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

    }

    protected void btnContactUs_Click1(object sender, EventArgs e)
    {
        if (Session["user"] == null)
            Response.Redirect("../news.aspx");

        string strConn = ConfigurationManager.ConnectionStrings["movieConnection"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand cmd = conn.CreateCommand();

        
        cmd.CommandText = "insert into message values('" + name.Text.Trim() + "','" + email.Text.Trim() + "',getdate(),'" + message.Text.Trim() + "')";


        try
        {
            conn.Open();
            int i = cmd.ExecuteNonQuery();
            if (name.Text.Trim().Length > 20)
            {
                Response.Write("<script language =javascript>alert('姓名过长')</script>");
            }
            else if (message.Text.Trim().Length > 1000)
            {
                Response.Write("<script language =javascript>alert('内容过长')</script>");
            }
            else if (i == 1 && ProcessSqlStr(name.Text.Trim()) && ProcessSqlStr(message.Text.Trim()) && ProcessSqlStr(email.Text.Trim()))
                Response.Write("<script language =javascript>alert('发送成功！');location.href='Default.aspx';</script>");
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