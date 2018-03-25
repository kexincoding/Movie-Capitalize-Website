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

public partial class lead_addadmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Response.Redirect("../adminlogin.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string strConn = ConfigurationManager.ConnectionStrings["movieConnection"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand cmd = conn.CreateCommand();


        string uname = name.Text.Trim();
        string selStr = "select * from usertable where uname='" + uname + "'";
        cmd.CommandText = "insert into admin values('" + name.Text.Trim() + "','" + pwd.Text.Trim() + "')";
        try
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(selStr, conn);
            //创建满足条件的数据集
            DataSet ds = new DataSet();
            da.Fill(ds, "tempTab");
            
            //如果数据集不为空，则用户名已经存在
            if (ds.Tables[0].Rows.Count != 0)
            {
                Response.Write("<script>alert('该用户名已经存在！')</script>");
            }
            else if (String.Compare(pwd.Text.Trim(), pwd2.Text.Trim()) != 0)
            {
                Response.Write("<script>alert('两次密码不相同')</script>");
            }
            
            else
            {
                int i = cmd.ExecuteNonQuery();
                if (i == 1)
                {
                    Response.Write("<script language =javascript>alert('添加成功！');location.href='updateadmin.aspx';</script>");
                    
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