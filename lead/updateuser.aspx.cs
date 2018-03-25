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
public partial class lead_updateuser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["user"] == null)
            Response.Redirect("../news.aspx");

         /*string strConn = ConfigurationManager.ConnectionStrings["movieConnection"].ConnectionString;

        SqlConnection conn = new SqlConnection(strConn);


        try
        {

            //SqlCommand selectedcmd = new SqlCommand("select * from LoginUser where Username=@username and Password=@password");
            conn.Open();
        TextBox4.Text = Session["email"].ToString();
        }
        catch (System.Exception ee)
        {
            Response.Write(ee.Message.ToString());
        }
        finally
        {
            conn.Close();
        }*/
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string strConn = ConfigurationManager.ConnectionStrings["movieConnection"].ConnectionString;

        SqlConnection conn2 = new SqlConnection(strConn);


        try
        {

            //SqlCommand selectedcmd = new SqlCommand("select * from LoginUser where Username=@username and Password=@password");
           conn2.Open();
                SqlCommand cmd2 = conn2.CreateCommand();
                string emailStr = @"([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,5})+";
              Regex emailReg = new Regex(emailStr);

              if (emailReg.IsMatch(TextBox4.Text.Trim()))
              {
                  cmd2.CommandText = "update usertable set uemail='" + TextBox4.Text.Trim() + "'where uname='" + Session["user"].ToString() + "'";
                  // SqlCommand updatecmd = new SqlCommand("update LoginUser set Password='" + txtnewPwd.Text.Trim() + "'where Username='" + Session["admin"].ToString() + "'", conn);
                  int i = cmd2.ExecuteNonQuery();
                  if (i == 1)
                  {
                      Response.Write("<script language =javascript>alert('修改成功')</script>");
                      Response.Redirect("main.aspx");
                  }
                  else
                  {
                      Response.Write("<script language =javascript>alert('修改失败')</script>");
                  }
              }
              else
              {
                  Response.Write("<script language =javascript>alert('请输入正确格式的邮箱')</script>");
              }
        }


        catch (System.Exception ee)
        {
            Response.Write(ee.Message.ToString());
        }
        finally
        {
            conn2.Close();
        }
    }
}