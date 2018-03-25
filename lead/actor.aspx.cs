using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class lead_actor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
            Response.Redirect("../news.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "select aid,aname as 姓名,gender as 性别 ,abirthday as 生日,location as 地区 from actor,location where actor.alocation=location.lid and  [aname] LIKE '%" + TextBox3.Text.ToString() + "%'";
        GridView1.DataBind();
    }
}