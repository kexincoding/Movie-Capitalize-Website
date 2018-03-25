<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="lead_main" %>

<!DOCTYPE html>
<html>
<head>
<title>电影</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Visual Box V2 Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--// css -->
	<script src="js/jquery-1.11.0.min.js"></script>
<!--fonts-->
	<link href='http://fonts.useso.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
	<link href='http://fonts.useso.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
<!--/fonts-->
</head>
<body>
<!-- header nav -->
	<div class="header-nav">
		<div class="container">
			<div class="header">
				<div class="head-logo">
					<a href="../index.aspx"><img src="images/logo.png" alt="" /></a>
				</div>
				<div class="header-info-right">
					<div class="header cbp-spmenu-push">
						<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">
								<a class="active" href="main.aspx">主页</a>
								<a href="updateuser.aspx">修改个人信息</a>
								<a href="changeuserpwd.aspx">修改密码</a>
								<a href="actor.aspx">查看演员</a>
								<a href="../首页/Default.aspx">返回首页</a>
								
						</nav>
						<!--script-nav -->	
						<script>
						    $("span.menu").click(function () {
						        $("ul.navigatoin").slideToggle("300", function () {
						        });
						    });
						</script>
						<div class="clearfix"> </div>
						<!-- /script-nav -->
										<div class="main">
											<section class="buttonset">
												<button id="showRightPush"><img src="images/menu.png" /></button>
											</section>
										</div>
										<!-- Classie - class helper functions by @desandro https://github.com/desandro/classie -->
										<script src="js/classie.js"></script>
										<script>
										    var menuRight = document.getElementById('cbp-spmenu-s2'),
												showRightPush = document.getElementById('showRightPush'),
												body = document.body;

										    showRightPush.onclick = function () {
										        classie.toggle(this, 'active');
										        classie.toggle(body, 'cbp-spmenu-push-toleft');
										        classie.toggle(menuRight, 'cbp-spmenu-open');
										        disableOther('showRightPush');
										    };
										    function disableOther(button) {

										        if (button !== 'showRightPush') {
										            classie.toggle(showRightPush, 'disabled');
										        }
										    }
										</script>
					</div>
				</div>
                
				<div class="clearfix" > 

                   
				   

                   
				</div>
                   
			</div>
		</div>
	</div>
<!--//header nav-->
<!--banner-->
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >手机网站模板</a></div>
<div class="banner">
	
	 <form id="form1" runat="server">

	
    
    <table border="0" cellpadding="0" cellspacing="0" width="800" height="500" align="center">
  <tr>
    <td >
        <div style="width:150px; height:150px">


           
             
             <asp:TextBox type="text" runat="server" name="form-username" placeholder="电影名" class="form-username form-control" id="TextBox1" Height="37px" Width="173px" ></asp:TextBox>
             <br />
             &nbsp;&nbsp;&nbsp;<asp:Button ID="Button5" runat="server" class="btn btn-skin " Height="43px" Text="查询" type="submit" Width="111px" />
       <br />


       
     </div>
         <div style="width:200px; height:300px">


             

      
            
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:movieConnection %>" SelectCommand="SELECT [location] FROM [location]"></asp:SqlDataSource>
             <br />
             <br />
       <br />
             <br />
             
             
             <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:movieConnection %>" SelectCommand="SELECT [type] FROM [type]"></asp:SqlDataSource>
             <br />
             <br />
             <br />
            
             <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:movieConnection %>" SelectCommand="SELECT [aname] FROM [actor]"></asp:SqlDataSource>
             <br />

     </div>
    </td>

     

    <td>
        <div style="width:900px; height:130px">

            <br />
             <br />
            &nbsp;&nbsp;&nbsp; 按地区：<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="location" DataValueField="location">
             </asp:DropDownList>

             &nbsp;&nbsp;&nbsp;

             按类型：<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="type" DataValueField="type">
             </asp:DropDownList>

            &nbsp;&nbsp;&nbsp;

            按演员：<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="aname" DataValueField="aname">
             </asp:DropDownList>
       <br />
            <br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" class="btn btn-skin " Height="35px" Text="查询" type="submit" Width="111px" OnClick="Button1_Click" />
       
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" class="btn btn-skin " Height="35px" OnClick="Button2_Click" Text="查询" type="submit" Width="111px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button4" runat="server" class="btn btn-skin " Height="35px" OnClick="Button4_Click" Text="查询" type="submit" Width="111px" />
     
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button3" runat="server" class="btn btn-skin " Height="35px" OnClick="Button3_Click" Text="评分最高" type="submit" Width="111px" />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button6" runat="server" class="btn btn-skin " Height="35px" OnClick="Button6_Click" Text="最新上映" type="submit" Width="111px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button7" runat="server" class="btn btn-skin " Height="35px" OnClick="Button7_Click" Text="最受欢迎" type="submit" Width="111px" />
        </div>

         <div style="width:800px; height:400px">
&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" CellSpacing="3" DataKeyNames="mid"   Width="800px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HorizontalAlign="Center" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="mid" HeaderText="mid" SortExpression="mid" Visible="False" InsertVisible="False" ReadOnly="True" />
                <asp:HyperLinkField DataNavigateUrlFields="mid" 
                                DataNavigateUrlFormatString="detail.aspx?mid={0}" DataTextField="电影名" HeaderText="电影名" SortExpression="电影名" />
                <asp:BoundField DataField="上映时间" HeaderText="上映时间" SortExpression="上映时间" ItemStyle-Height="50"/>
                <asp:BoundField DataField="影片时长" HeaderText="影片时长" SortExpression="影片时长" HeaderStyle-Wrap="True" />
                <asp:BoundField DataField="地区" HeaderText="地区" SortExpression="地区" />
                <asp:BoundField DataField="影片评分" HeaderText="影片评分" SortExpression="影片评分" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:movieConnection %>" SelectCommand="select mid,mname as 电影名,mtime as 上映时间,mlong as 影片时长,location as 地区, left (score,3) as 影片评分
from movie,location
where movie.mlocation=location.lid
            order by score desc" ></asp:SqlDataSource></div>
       
      </td>
   <td>
       <div style="width:200px; height:300px">
           <asp:Button ID="Button8" runat="server" class="btn btn-skin pull-right" Height="43px" Text="注销" type="submit" Width="111px" OnClick="Button5_Click" />
           </div>

   </td>
  </tr>
</table>
    </form>
</div>
<!--//banner-->
<!--footer-->
<div class="footer">
	<div class="container">
		<div class="footer-grids">
			<div class="footer-left">
				
			</div>
			<div class="footer-right">
				<ul>
					<li><a class="twitter" href="#"></a></li>
					<li><a class="facebook" href="#"></a></li>
					<li><a class="sss" href="#"></a></li>
					<li><a class="vimeo" href="#"></a></li>
					<li><a class="message" href="#"></a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!--//footer-->
       
     </body>
</html>
