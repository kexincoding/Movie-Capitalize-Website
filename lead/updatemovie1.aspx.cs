using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


public partial class lead_updatemovie1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Response.Redirect("../adminlogin.aspx");

        if (!IsPostBack)
        {   
            NewsInfoBind();          
        }
    }
    protected void NewsInfoBind()
    {
        int mid = Convert.ToInt32(Request.QueryString["mid"]);
        string cmdText = "select mid,mname ,mtime ,mlong ,location ,director,introduct,score,number from movie,location where movie.mlocation=location.lid and mid="+mid;
        string strConn = ConfigurationManager.ConnectionStrings["movieConnection"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);

        DataTable dt = null;
        try
        {
            // 打开数据库连接

            conn.Open();
            SqlDataAdapter adap = new SqlDataAdapter(cmdText, conn);

            DataSet ds = new DataSet();

            adap.Fill(ds, "tempTab");
            dt = ds.Tables["tempTab"];
        }
        catch
        {
            dt = null;
        }
        finally
        {
            conn.Close();
        }
        
        name.Text = dt.Rows[0][1].ToString();
        time.Text = dt.Rows[0][2].ToString();
        long1.Text = dt.Rows[0][3].ToString();
        locate.Text = dt.Rows[0][4].ToString();
        dir.Text = dt.Rows[0][5].ToString();
        message.Text = dt.Rows[0][6].ToString();
        score.Text = dt.Rows[0][7].ToString();
        number.Text = dt.Rows[0][8].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int mid1 = Convert.ToInt32(Request.QueryString["mid"]);
      
        string strConn = ConfigurationManager.ConnectionStrings["movieConnection"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        try
        {
            // 打开数据库连接

            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            string t_name = name.Text.Trim();
            string t_time = time.Text.Trim();
            string t_long1= long1.Text.Trim();
            string t_dir = dir.Text.Trim();
            string t_message = message.Text.Trim();
            double t_score = Convert.ToDouble(score.Text.Trim());
            int t_number = Convert.ToInt32(number.Text.Trim());
            string t_locate = locate.Text.Trim();
            if (t_name.Length > 20)
                Response.Write("<script language =javascript>alert('姓名过长')</script>");
            else if (t_time.Length > 30)
                Response.Write("<script language =javascript>alert('时间过长')</script>");
            else if (t_long1.Length > 3)
                Response.Write("<script language =javascript>alert('长度过长')</script>");
            else if (t_dir.Length > 20)
                Response.Write("<script language =javascript>alert('导演名过长')</script>");
            else if (t_locate.Length > 10)
                Response.Write("<script language =javascript>alert('地区过长')</script>");
            else if (t_message.Length > 1000)
                Response.Write("<script language =javascript>alert('内容过长')</script>");
            else if (t_score > 10 || t_score<0)
                Response.Write("<script language =javascript>alert('评分不对')</script>");
            else if (t_number<0)
                Response.Write("<script language =javascript>alert('人数不对')</script>");
            else
            {
                cmd.CommandText = "UPDATE movie SET mname = '" + t_name + "',  mtime = '" + t_time + "', mlong = '" + t_long1 + "', mlocation = (select lid from location where location='" + t_locate + "'), director = '" + t_dir + "' ,introduct = '" + t_message + "',score=" + t_score + ",number=" + t_number+ " WHERE mid= " + mid1;
                int i = cmd.ExecuteNonQuery();
                if (i == 1)
                    Response.Write("<script language =javascript>alert('修改成功！');location.href='updatemovie.aspx';</script>");
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