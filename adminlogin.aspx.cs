using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class adminlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_Click(object sender, EventArgs e)
    {
        string strConn = ConfigurationManager.ConnectionStrings["movieConnection"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand cmd = conn.CreateCommand();

        //方法二：参数化查询，ADO.NET会对一些特殊字符进行转义，这样可以在一定程序上防止SQL注入，提高程序执行效率
        cmd.CommandText = "select * from admin where adname=@adname and adpwd=@adpwd";
        cmd.Parameters.Add(new SqlParameter("adname", txtUsername.Text.Trim()));
        cmd.Parameters.Add(new SqlParameter("adpwd", txtPwd.Text.Trim()));

        try
        {
            conn.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                Session["admin"] = txtUsername.Text.Trim();
                Response.Redirect("./lead/adminlead.aspx");
            }
            else
            {
                //用户不存在
                txtUsername.Text = "";
                txtPwd.Text = "";
                Response.Write("<script language =javascript>alert('用户名或密码错误！')</script>");
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