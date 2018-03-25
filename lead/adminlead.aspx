<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminlead.aspx.cs" Inherits="lead_adminlead" %>

<!DOCTYPE html>
<html>
<head>
<title>导航页
</title>
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
										        // disableOther('showRightPush');
										    };
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
          
          
<div class="container-fluid"  style="width:200px; height:400px">
	<div class="row-fluid">
		<div class="span6">
			<ul class="nav nav-list">
				<li class="nav-header">
					个人信息管理
				</li>
				<li class="active">
					<a href="changeadminpwd.aspx">修改登录密码</a>
				</li>

				<li class="nav-header">
					电影信息管理
				</li>
				<li>
					<a href="updatemovie.aspx">电影管理</a>
				</li>
                <li>
					<a href="addmovie.aspx">添加电影</a>
				</li>
				<li>
					<a href="tpdateactor.aspx">演员管理</a>
                 </li>
                <li>
					<a href="addactor.aspx">添加演员</a>
                 </li>
				<li>
					<a href="type.aspx">类型管理</a>
				</li>
                <li>
					<a href="locate.aspx">地区管理</a>
				</li>
                <li>
					<a href="act.aspx">绑定演员</a>
				</li>
                <li>
					<a href="addmore.aspx">绑定类型</a>
				</li>              
                <li class="nav-header">
					其他信息管理
				</li>
				<li>
					<a href="user.aspx">用户管理</a>
				</li>
				<li>
					<a href="comment.aspx">评论管理</a>
                 </li>
                <li>
					<a href="message.aspx">留言管理</a>
                </li>
                <li>
					<a href="updateadmin.aspx">管理员管理</a>
                </li>
                <li>
					<a href="addadmin.aspx">添加管理员</a>
                </li>
			</ul>
		</div>
		
	</div>
</div>

        
    </td>

       <td align="center"  >
           <div style="width:600px; height:500px">

<br />
                 <br />
           
             
             
            <asp:Button ID="Button5" runat="server" class="btn btn-skin pull-right" Height="43px" Text="注销" type="submit" Width="111px" OnClick="Button5_Click" />
     
                 <br />
                 <br />
                 <br />
               <br />
                 <br />
                 <br />
               <br />
                 <br />
                 <br />
               <br />
                 <br />
                 <br />
 欢迎管理员<asp:Label 
                        ID="lblUsername" runat="server"></asp:Label>
&nbsp;，请选择左侧超级链接进行管理！

       
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
