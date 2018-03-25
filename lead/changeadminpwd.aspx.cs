using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class lead_changeadminpwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Response.Redirect("../adminlogin.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.Trim() == "" || TextBox2.Text.Trim() == "")
            Response.Write("<script language =javascript>alert('旧密码或新密码不能为空')</script>");
        else
        {
            string strConn = ConfigurationManager.ConnectionStrings["movieConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(strConn);
            SqlConnection conn2 = new SqlConnection(strConn);
            SqlCommand cmd1 = conn.CreateCommand();

            cmd1.CommandText = "select * from admin where adname=@adname and adpwd=@adpwd";
            cmd1.Parameters.Add(new SqlParameter("adname", Session["admin"]));
            cmd1.Parameters.Add(new SqlParameter("adpwd", TextBox1.Text.Trim()));
            try
            {
                conn.Open();
                //SqlCommand selectedcmd = new SqlCommand("select * from LoginUser where Username=@username and Password=@password");
                SqlDataReader sdr1 = cmd1.ExecuteReader();
                if (sdr1.Read())
                {
                    conn2.Open();
                    SqlCommand cmd2 = conn2.CreateCommand();
                    cmd2.CommandText = "update admin set adpwd='" + TextBox2.Text.Trim() + "'where adname='" + Session["admin"].ToString() + "'";
                    // SqlCommand updatecmd = new SqlCommand("update LoginUser set Password='" + txtnewPwd.Text.Trim() + "'where Username='" + Session["admin"].ToString() + "'", conn);
                    int i = cmd2.ExecuteNonQuery();
                    if (i == 1)
                    {
                        Response.Write("<script language =javascript>alert('密码修改成功,请重新登录')</script>");
                        Response.Redirect("../adminlogin.aspx");
                    }
                    else
                    {
                        Response.Write("<script language =javascript>alert('密码修改失败')</script>");
                    }

                }
                else
                {
                    //用户不存在
                    Response.Write("<script language =javascript>alert('密码错误！')</script>");
                    TextBox1.Text = "";
                    TextBox2.Text = "";
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
}