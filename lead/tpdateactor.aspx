﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tpdateactor.aspx.cs" Inherits="lead_tpdateactor" %>

<!DOCTYPE html>
<html>
<head>
<title>演员管理</title>
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
								<a href="adminlead.aspx">返回</a>
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
<div class="banner">
	
	 <form id="form1" runat="server">

	
    
    <table border="0" cellpadding="0" cellspacing="0" width="800" height="500" align="center">
  <tr>
    
      <td>
          <div style="width:100px"></div>
      </td>
    <td>
        <div style="width:700px; height:100px">
        &nbsp;<asp:TextBox type="text" runat="server" name="form-username" placeholder="演员名" class="form-username form-control" id="txtUsername" ></asp:TextBox>

      <asp:Button type="submit" runat="server" class="btn btn-skin pull-right" id="Button1" Text="查询" Height="43px" OnClick="btnContactUs_Click" Width="111px"/>  



        

        <br /></div>

         <div style="width:800px; height:400px">
&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" CellSpacing="3" DataKeyNames="aid"  Width="800px" HorizontalAlign="Center" PageSize="6" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="aid" HeaderText="aid" SortExpression="aid" InsertVisible="False" ReadOnly="True" HeaderStyle-Width="50" ItemStyle-HorizontalAlign= "Center"/>
                <asp:BoundField DataField="aname" HeaderText="aname" SortExpression="aname" HeaderStyle-Width="50"  ItemStyle-Height="50"/>
                <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" HeaderStyle-Wrap="True" HeaderStyle-Width="50" ItemStyle-HorizontalAlign= "Center"/>
                <asp:BoundField DataField="abirthday" HeaderText="abirthday" SortExpression="abirthday" HeaderStyle-Width="50" ItemStyle-HorizontalAlign= "Center"/>
                <asp:BoundField DataField="alocation" HeaderText="alocation" SortExpression="alocation" HeaderStyle-Width="50" ItemStyle-HorizontalAlign= "Center"/>
                <asp:BoundField DataField="introduction" HeaderText="introduction" SortExpression="introduction" />
             <asp:HyperLinkField DataNavigateUrlFields="aid" 
                                DataNavigateUrlFormatString="updateactor1.aspx?aid={0}" Text="修改" HeaderStyle-Width="50" ItemStyle-HorizontalAlign= "Center"/>
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" HeaderStyle-Width="50" ItemStyle-HorizontalAlign= "Center"/>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:movieConnection %>" SelectCommand="select *
from actor
" DeleteCommand="delete FROM [actor]
where aid=@aid">
            <DeleteParameters>
                <asp:Parameter Name="aid" />
            </DeleteParameters>
             </asp:SqlDataSource></div>
       
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
