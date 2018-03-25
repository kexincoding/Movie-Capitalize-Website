using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class lead_act : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Response.Redirect("../adminlogin.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int flag=0;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            if (String.Compare(GridView1.Rows[i].Cells[1].Text.Trim(), DropDownList3.Text.Trim()) == 0 && String.Compare(GridView1.Rows[i].Cells[2].Text.Trim(), DropDownList4.Text.Trim()) == 0)
            {
                flag = 1;
                break;
            }

        }
        if (flag == 0)
        {
            SqlDataSource1.InsertCommand = "insert into act values((select mid from movie where mname='" + DropDownList3.Text + "'),(select aid from actor where aname='" + DropDownList4.Text + "'))";
            SqlDataSource1.Insert();
            Response.Write("<script language =javascript>alert('添加成功！')</script>");
            GridView1.DataBind();
        }
        else
            Response.Write("<script language =javascript>alert('已经添加过！')</script>");
    }
}