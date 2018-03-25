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


public class aa
{
    public static int k=0;
    public static int[] b1 = new int[100000];
} 

public partial class lead_detail1 : System.Web.UI.Page
{
    
    public bool ProcessSqlStr(string inputString)
    {
        string SqlStr = @"and|or|exec|execute|insert|select|delete|update|alter|create|drop|count|\*|chr|char|asc|mid|substring|master|truncate|declare|xp_cmdshell|restore|backup|net +user|net +localgroup +administrators";
        try
        {
            if ((inputString != null) && (inputString != String.Empty))
            {
                string str_Regex = @"\b(" + SqlStr + @")\b";

                Regex Regex = new Regex(str_Regex, RegexOptions.IgnoreCase);
                if (true == Regex.IsMatch(inputString))
                    return false;

            }
        }
        catch
        {
            return false;
        }
        return true;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
            Response.Redirect("../news.aspx");
    }
    protected void btnContactUs_Click(object sender, EventArgs e)
    {
        string strConn = ConfigurationManager.ConnectionStrings["movieConnection"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand cmd = conn.CreateCommand();
        int mid1 = Convert.ToInt32(Request.QueryString["mid"]);
        SqlConnection conn2 = new SqlConnection(strConn);
        SqlConnection conn3 = new SqlConnection(strConn);
        double s = Convert.ToDouble(score.Text.Trim());
        float s1 = (float)s;
        cmd.CommandText = "insert into comment values((select uid from usertable where uname='" + Session["user"] + "')," + mid1 + ",getdate(),'" + message.Text.Trim() + "','" + title.Text.Trim() + "',0)";

        
        try
        {
            conn.Open();
            int i = cmd.ExecuteNonQuery();
            if (title.Text.Trim().Length > 20)
           {
            Response.Write("<script language =javascript>alert('标题过长')</script>");
           }
            else if (message.Text.Trim().Length > 1000)
            {
                Response.Write("<script language =javascript>alert('内容过长')</script>");
            }
            else if (s>10||s<0)
            {
                Response.Write("<script language =javascript>alert('分值不在范围内')</script>");
            }
            else if (i == 1 && ProcessSqlStr(title.Text.Trim()) && ProcessSqlStr(message.Text.Trim()) && ProcessSqlStr(score.Text.Trim()))
            {
                Response.Write("<script language =javascript>alert('发送成功！')</script>");
                conn2.Open();
                SqlCommand cmd2 = conn2.CreateCommand();
                
                cmd2.CommandText = "insert into score values((select uid from usertable where uname='" + Session["user"] + "'),'" + mid1 +"',"+ s1 + ")";
                int k = cmd2.ExecuteNonQuery();


                conn3.Open();
                string str = "updatescore";
                SqlParameter[] sqlParameter =  
                {   
                    new SqlParameter("username",Session["user"]),
                    new SqlParameter("score",s),
                    new SqlParameter("mid",mid1)
                };
                SqlCommand cmd3 = new SqlCommand(str, conn3);
                cmd3.CommandType = CommandType.StoredProcedure;
                if (sqlParameter != null)
                {
                    foreach (SqlParameter Parameter in sqlParameter)
                        cmd3.Parameters.Add(Parameter);
                }
                SqlDataAdapter adapter = new SqlDataAdapter(cmd3);
                DataSet dataset = new DataSet();
                adapter.Fill(dataset);

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

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int flag = 0;
        int a = e.NewSelectedIndex;
        int b = Convert.ToInt32(GridView1.Rows[e.NewSelectedIndex].Cells[0].Text);
        SqlDataSource3.UpdateCommand = "UPDATE comment SET good = good +" + 1 + "where cid =" + b;
        for(int i=0;i<aa.k;i++)
        if (b==aa.b1[i])
        {
            flag = 1;
        }
        if(flag ==0 )
        {
            SqlDataSource3.Update();
            GridView1.DataBind();
            aa.b1[aa.k] = b;
            aa.k++;
        }



        string c = GridView1.Rows[e.NewSelectedIndex].Cells[1].Text;
        string strConn = ConfigurationManager.ConnectionStrings["movieConnection"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand cmd = conn.CreateCommand();
            
        cmd.CommandText = "update usertable set uvalue=uvalue+5 where uid=(select uid from usertable where uname="+c+")";

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