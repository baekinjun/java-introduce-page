<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equive="Content-type" content="text/html; charset=UTF-8">
<title>ABOUT INJUN </title>
</head>
<body>	
	<%	
		
		String userID=null;
		if(session.getAttribute("userID")!=null){
			userID=(String) session.getAttribute("userID");
			
		}
		if (userID ==null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('you need to login')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		int bbsID=0;
		if(request.getParameter("bbsID")!=null){
			bbsID=Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('This text is not available')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs =new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('you don't have any authority')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}else{
				BbsDAO bbsDAO =new BbsDAO();
				int result=bbsDAO.delete(bbsID);
				if (result== -1){
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('you failed to delete this text')");
					script.println("history.back()");
					script.println("</script>");			}
				else {
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("location.href='bbs.jsp'");
					script.println("</script>");

				}
				
			}
			
		

		
	%>

</body>
</html>