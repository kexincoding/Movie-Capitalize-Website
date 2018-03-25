using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class lead_adminlead : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Response.Redirect("../adminlogin.aspx");
        else
            lblUsername.Text = Session["admin"].ToString();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("../adminlogin.aspx");
    }
}