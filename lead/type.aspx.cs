using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class lead_type : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Response.Redirect("../adminlogin.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string t_Tname = TextBox3.Text.Trim();
        Regex regExp = new Regex("^[\u4e00-\u9fa5]{1,}$");
        if (!regExp.IsMatch(TextBox3.Text))
        {
            Response.Write("<script language =javascript>alert('请输入汉字')</script>");
        }
        else if (t_Tname.Length>10)
        {
            Response.Write("<script language =javascript>alert('类型过长')</script>");
        }
        else
        {
            SqlDataSource1.InsertCommand = "insert into type values ( '" + t_Tname + "')";
            SqlDataSource1.Insert();
            Response.Write("<script language =javascript>alert('添加成功！')</script>");
            GridView1.DataBind();
        }
    }
}