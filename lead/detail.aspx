<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="lead_detail" %>


<!DOCTYPE html>
<html>
<head>
<title>详细资讯</title>
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
								<a  href="index.html"></a>
								<a href="work.html">     </a>
								<a href="clients.html">     </a>
								<a href="team.html">     </a>
								<a href="offices.html">     </a>
								<a href="main.aspx">返回</a>
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
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!--//header nav-->
<!--banner-->
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >手机网站模板</a></div>
<div class="banner" >
	
	 <form id="form1" runat="server">

	
    
    <table border="0" cellpadding="0" cellspacing="0" width="800" height="500" align="center">
  <tr>
    <td >
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    </td>
    <td>
        <div class="section-heading">
					<h2>电影详情</h2>

					</div>

         <div style="width:800px; height:400px">
&nbsp;<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BorderStyle="Dotted" CellPadding="4" DataKeyNames="mid" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="Horizontal" Height="50px" Width="100%">
                 <AlternatingRowStyle BackColor="White" />
                 <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                 <EditRowStyle BackColor="#2461BF" />
                 <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
    <AlternatingRowStyle CssClass="row2" />
                        <FieldHeaderStyle CssClass="row3" Width="20%" />
                 <Fields>
                     <asp:BoundField DataField="mid" HeaderText="mid" visible="False" InsertVisible="False" ReadOnly="True" SortExpression="mid" />
                      <asp:HyperLinkField DataNavigateUrlFields="mid" 
                                DataNavigateUrlFormatString="detail1.aspx?mid={0}" DataTextField="电影名" HeaderText="电影名" SortExpression="电影名" />
                     <asp:BoundField DataField="上映时间" HeaderText="上映时间" SortExpression="上映时间" />
                     <asp:BoundField DataField="影片时长" HeaderText="影片时长" SortExpression="影片时长" />
                     <asp:BoundField DataField="地区" HeaderText="地区" SortExpression="地区" />
                     <asp:BoundField DataField="影片评分" HeaderText="影片评分" SortExpression="影片评分" />
                     <asp:BoundField DataField="导演" HeaderText="导演" SortExpression="导演" />
                     <asp:BoundField DataField="简介" HeaderText="简介" SortExpression="简介" />
                 </Fields>
                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#EFF3FB" />
    <RowStyle CssClass="row1" HorizontalAlign="center" />
             </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:movieConnection %>" SelectCommand="select mid,mname as 电影名,mtime as 上映时间,mlong as 影片时长,location as 地区,score as 影片评分,director as 导演,introduct as 简介
from movie,location
where movie.mlocation=location.lid and movie.mid=@mid">
            <SelectParameters>
                <asp:QueryStringParameter Name="mid" QueryStringField="mid" />
            </SelectParameters>
             </asp:SqlDataSource>

             <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" BorderStyle="Dotted" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="Horizontal" Height="38px" Width="100%" >
                 <AlternatingRowStyle BackColor="White" />
                 <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                 <EditRowStyle BackColor="#2461BF" />
                 <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
    <AlternatingRowStyle CssClass="row2" />
                        <FieldHeaderStyle CssClass="row3" Width="20%" />
                 <Fields>
                     <asp:TemplateField HeaderText="演员" SortExpression="演员" >
             <ItemTemplate>
                             <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="演员" DataValueField="演员" >
                             </asp:DropDownList>
                         </ItemTemplate>
               
            </asp:TemplateField>

                 </Fields>
                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#EFF3FB" />
    <RowStyle CssClass="row1" HorizontalAlign="center" />
             </asp:DetailsView>
    
             <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:movieConnection %>" SelectCommand="select aname as 演员
from  movie,act,actor
where movie.mid=act.mid and act.aid=actor.aid and movie.mid=@mid">
                 <SelectParameters>
                     <asp:QueryStringParameter Name="mid" QueryStringField="mid" />
                 </SelectParameters>
             </asp:SqlDataSource>
        

            <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" BorderStyle="Dotted" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="Horizontal" Height="32px" Width="100%">
                 <AlternatingRowStyle BackColor="White" />
                 <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                 <EditRowStyle BackColor="#2461BF" />
                 <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
    <AlternatingRowStyle CssClass="row2" />
                        <FieldHeaderStyle CssClass="row3" Width="20%" />
                 <Fields>

                     <asp:TemplateField HeaderText="类型" SortExpression="类型" >
             <ItemTemplate>
                             <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="类型" DataValueField="类型">
                             </asp:DropDownList>
                         </ItemTemplate>
               
            </asp:TemplateField>

                 </Fields>
                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#EFF3FB" />
    <RowStyle CssClass="row1" HorizontalAlign="center" />
             </asp:DetailsView>
    
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:movieConnection %>" SelectCommand="select type as 类型
from type,movietype
where type.tid=movietype.tid and movietype.mid=@mid">
                 <SelectParameters>
                     <asp:QueryStringParameter Name="mid" QueryStringField="mid" />
                 </SelectParameters>
             </asp:SqlDataSource>
        
             <br />

            
      

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

