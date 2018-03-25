using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class lead_updatemovie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Response.Redirect("../adminlogin.aspx");
    }
    protected void btnContactUs_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "select mid,mname ,mtime ,mlong ,location ,score from movie,location where [mname] LIKE '%" + txtUsername.Text.ToString() + "%' and movie.mlocation=location.lid";
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }



   
    
}