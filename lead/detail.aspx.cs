using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class lead_detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
            Response.Redirect("../news.aspx");


        int mid = Convert.ToInt32(Request.QueryString["mid"]);
        string strConn = ConfigurationManager.ConnectionStrings["movieConnection"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand cmd = conn.CreateCommand();

        cmd.CommandText = "update movie set click=click+1 where mid="+mid;

        try
        {
            conn.Open();
            int i = cmd.ExecuteNonQuery();
            //if (i == 1 )
            //  Response.Write("<script language =javascript>alert('发送成功！');location.href='main.aspx';</script>");
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