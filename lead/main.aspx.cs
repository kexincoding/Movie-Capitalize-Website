using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class lead_main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
            Response.Redirect("../news.aspx");
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {

        SqlDataSource1.SelectCommand = "select mid,mname as 电影名,mtime as 上映时间,mlong as 影片时长,location as 地区, left (score,3) as 影片评分 from movie,location where [mname] LIKE '%" + TextBox1.Text.ToString() + "%' and movie.mlocation=location.lid order by score desc";
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "select mid,mname as 电影名,mtime as 上映时间,mlong as 影片时长,location as 地区, left (score,3) as 影片评分 from movie,location where mlocation= ( select lid from location where location ='" + DropDownList1.Text.ToString() + "') and movie.mlocation=location.lid order by score desc";
        GridView1.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "select movie.mid,mname as 电影名,mtime as 上映时间,mlong as 影片时长,location as 地区, left (score,3) as 影片评分  from movie,location,movietype,type where movie.mlocation=location.lid and movie.mid=movietype.mid and type.tid=movietype.tid and movietype.tid=(select tid from type where type='" + DropDownList2.Text.ToString() + "') order by score desc";
       
        GridView1.DataBind();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "select movie.mid,mname as 电影名,mtime as 上映时间,mlong as 影片时长,location as 地区, left (score,3) as 影片评分  from movie,location,act,actor where movie.mlocation=location.lid and movie.mid=act.mid and act.aid=actor.aid and act.aid=(select aid from actor where aname='" + DropDownList3.Text.ToString() + "') order by score desc";

        GridView1.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "select mid,mname as 电影名,mtime as 上映时间,mlong as 影片时长,location as 地区, left (score,3) as 影片评分 from movie,location where movie.mlocation=location.lid order by score desc";
        GridView1.DataBind();
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "select mid,mname as 电影名,mtime as 上映时间,mlong as 影片时长,location as 地区, left (score,3) as 影片评分 from movie,location where movie.mlocation=location.lid order by mtime desc";
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "select mid,mname as 电影名,mtime as 上映时间,mlong as 影片时长,location as 地区, left (score,3) as 影片评分 from movie,location where movie.mlocation=location.lid order by click desc";
        GridView1.DataBind();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("../news.aspx");
    }
}