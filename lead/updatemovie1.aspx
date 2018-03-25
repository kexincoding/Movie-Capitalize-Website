<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updatemovie1.aspx.cs" Inherits="lead_updatemovie1" %>

<!DOCTYPE html>
<html>
<head>
<title>更新电影</title>
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
    <td width="300">
        <p>&nbsp;</p>
    </td>
    <td>
        <div style="width:600px; height:70px">
       
    
        <br /></div>

         <div style="width:500px; height:400px">
             <asp:TextBox type="text" runat="server" name="form-username" placeholder="电影名" class="form-username form-control" id="name" ></asp:TextBox>
             <br />
             <asp:TextBox type="text" runat="server" name="form-username" placeholder="上映时间" class="form-username form-control" id="time" ></asp:TextBox>

             <br />

             <asp:TextBox type="int" runat="server" name="form-username" placeholder="片长" class="form-username form-control" id="long1" ></asp:TextBox>
             <br />
              <asp:TextBox type="int" runat="server" name="form-username" placeholder="地区" class="form-username form-control" id="locate" ></asp:TextBox>
             <br />


             <asp:TextBox type="int" runat="server" name="form-username" placeholder="导演" class="form-username form-control" id="dir" ></asp:TextBox>
                        <br />  
             <asp:TextBox type="int" runat="server" name="form-username" placeholder="评分" class="form-username form-control" id="score" ></asp:TextBox>
                        <br /> 
             <asp:TextBox type="int" runat="server" name="form-username" placeholder="人数" class="form-username form-control" id="number" ></asp:TextBox>
                        <br />          
               <asp:TextBox name="评价"  Height="152px" TextMode="MultiLine"  id="message" runat="server"  Width="100%" class="form-control" rows="9" cols="25" required="required"
                                placeholder="简介"/>
             <br />  
                      <asp:Button type="submit" runat="server" class="btn btn-skin pull-right" id="Button1" Text="修改" Height="43px"  Width="111px" OnClick="Button1_Click"/>  
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
