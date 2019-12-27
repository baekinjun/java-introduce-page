<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equive="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" ,initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>ABOUT INJUN </title>
</head>
<body>
	<%
		String userID=null;
		if(session.getAttribute("userID")!=null){
			userID=(String) session.getAttribute("userID");
		}
		int bbsID=0;
		if(request.getParameter("bbsID")!=null){
			bbsID=Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('this text is not available')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs=new BbsDAO().getBbs(bbsID);
	
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">ABOUT INJUN</a>
			
		</div>
		<div class="collapse navbar-collapse" id ="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">MAIN</a></li>
				<li class="active"><a href="bbs.jsp">BOARD</a></li>
			</ul>
			<%
				if(userID==null){
			%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">ACESSING<span class="ceret"></span></a>
						<ul class="dropdown-menu">
							<li ><a href="login.jsp">Login</a></li>
							<li><a href="join.jsp">Sign Up</a></li>
						</ul>
					</li>
				</ul>
			<%
				}else{
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Membership Administration<span class="ceret"></span></a>
					<ul class="dropdown-menu">
						<li ><a href="logoutAction.jsp">Logout</a></li>
					</ul>
				</li>
			
			</ul>
			
			<%
				}
			%>
		
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style ="text-align:center;border:1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color :#eeeeee; text-align:center;">To See Board Content</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width:20%;">Text Title</td>
							<td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>
						</tr>
						<tr>
							<td>Writer</td>
							<td colspan="2"><%=bbs.getUserID() %></td>
						</tr>
						<tr>
							<td>Write Date</td>
							<td colspan="2"><%=bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13)+"H"+bbs.getBbsDate().substring(14,16)+"M" %></td>
						</tr>
						<tr>
							<td>Content</td>
							<td colspan="2"style="min-height:200px; text-align:left;" ><%=bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>
						</tr>
						
					</tbody>
				</table>
				<a href="bbs.jsp" class="btn btn-primary">List</a>
				<%
					if(userID!=null && userID.equals(bbs.getUserID())){
				%>
					<a href ="update.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">Modify</a>
					<a onclick="return confirm('Do you really want to delete?')" href ="deleteAction.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">Deletion</a>
				<%							
					}
				%>
				
			</div>
	</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
	

</body>
</html>