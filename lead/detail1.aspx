<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detail1.aspx.cs" Inherits="lead_detail1" %>


<!DOCTYPE html>
<html>
<head>
<title>评价</title>
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
        

         <div style="width:800px; height:400px">

        
             <br />

            
        <div class="section-heading">
					<h2>我来评价</h2>

					</div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">
                                评论题目</label>
                            <asp:TextBox type="text"  runat="server" class="form-control" id="title" placeholder="题目" required="required"  Width="100%"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="email">
                                评分</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                </span>
                               <asp:TextBox type="float" class="form-control" runat="server" id="score" placeholder="0-10分，10分最高" required="required" /></div>
                        </div>
                        
                        <asp:Button type="submit" runat="server" class="btn btn-skin pull-right" id="Button1" Text="发送" Height="43px" OnClick="btnContactUs_Click" Width="111px"/>
                            
                    
                    </div>

                     
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">
                                Message</label>
                            <asp:TextBox name="评价"  Height="152px" TextMode="MultiLine"  id="message" runat="server"  Width="100%" class="form-control" rows="9" cols="25" required="required"
                                placeholder="评价"/>
                        </div>
                    </div>
                   
                </div>
                <div class="section-heading">
					<h2>相关评论</h2>

					</div>
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" DataSourceID="SqlDataSource3" ForeColor="#333333" AllowPaging="True" AllowSorting="True" CellSpacing="3"  PageSize="3" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" BorderStyle="Solid" HorizontalAlign="Center" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" >
                </asp:BoundField>
                <asp:BoundField DataField="用户名" HeaderText="用户名" SortExpression="用户名" HeaderStyle-Width="80">
                </asp:BoundField>
                <asp:BoundField DataField="题目" HeaderText="题目" SortExpression="题目" HeaderStyle-Wrap="True" HeaderStyle-Width="80">
                </asp:BoundField>
                <asp:BoundField DataField="发表时间" HeaderText="发表时间" SortExpression="发表时间" HeaderStyle-Width="80" >
                </asp:BoundField>
                <asp:BoundField DataField="评论" HeaderText="评论" SortExpression="评论" HeaderStyle-Width="560" >
                </asp:BoundField>
                <asp:BoundField DataField="赞" HeaderText="赞" SortExpression="赞" HeaderStyle-Width="50" ItemStyle-HorizontalAlign= "Center"/>
                <asp:CommandField HeaderText="点赞" SelectText="赞" ShowSelectButton="True" HeaderStyle-Width="50" ItemStyle-HorizontalAlign= "Center" />
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:movieConnection %>" SelectCommand="SELECT comment.cid ID,uname AS 用户名,title AS 题目, ctime AS 发表时间, comment AS 评论,good AS 赞 
FROM comment,usertable 
WHERE comment.uid=usertable.uid AND comment.mid=@mid">
            <SelectParameters>
                <asp:QueryStringParameter Name="mid" QueryStringField="mid" />
                
            </SelectParameters>
              
             </asp:SqlDataSource>

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


