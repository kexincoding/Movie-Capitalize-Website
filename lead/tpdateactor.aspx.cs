using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class lead_tpdateactor : System.Web.UI.Page
{
    


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Response.Redirect("../adminlogin.aspx");
    }
    protected void btnContactUs_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "select * from actor where  [aName] LIKE '%" + txtUsername.Text.ToString() + "%'";
        GridView1.DataBind();
    }
   
}