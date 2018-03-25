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

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_Click(object sender, EventArgs e)
    {
        string strConn = ConfigurationManager.ConnectionStrings["movieConnection"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand cmd = conn.CreateCommand();

       
        string uname = txtUsername.Text.Trim();
        string selStr = "select * from usertable where uname='" + uname + "'";
        cmd.CommandText = "insert into usertable values('" + txtUsername.Text.Trim() + "','" + txtPwd.Text.Trim() + "','" + txtEmail.Text.Trim() + "',1)";
        try
        {
            conn.Open();
             SqlDataAdapter da = new SqlDataAdapter(selStr,conn);
        //创建满足条件的数据集
        DataSet ds = new DataSet();
        da.Fill(ds, "tempTab");
            string emailStr = @"([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,5})+";
              Regex emailReg = new Regex(emailStr);
        //如果数据集不为空，则用户名已经存在
        if (ds.Tables[0].Rows.Count != 0)
        {
            Response.Write("<script>alert('该用户名已经存在！')</script>");
        }
        else if(String.Compare(txtPwd.Text.Trim(),TextBox1.Text.Trim())!=0)
        {
            Response.Write("<script>alert('两次密码不相同')</script>");
        }


        else if (!emailReg.IsMatch(txtEmail.Text.Trim()))
        {
            Response.Write("<script language =javascript>alert('请输入正确格式的邮箱')</script>");
        }
        else
        {
            int i = cmd.ExecuteNonQuery();
            if (i == 1)
            {
                Session["user1"] = txtUsername.Text.Trim();
                Session["email"] = txtEmail.Text.Trim();
                Response.Redirect("/lead/updatemovie.aspx");
            }

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