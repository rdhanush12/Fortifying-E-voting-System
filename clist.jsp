<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="dbcon.dbconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<style>
table{
width:100%;
}
</style>
 <button onclick="goBack()" class="btn btn-outline-primary" style="float:right;">Go Back</button><br><br>
<body>

<center>
  <div class="container-fluid">  
<table class="table table-striped table-dark">
 <thead>
    <tr class="table-active">
      <th style="text-align: center;">Candidate Name</th>
      <th style="text-align: center;">Candidate</th>
            <th style="text-align: center;">Assemly Ward</th>
                  <th style="text-align: center;">Symbol</th>
      
   <!--    <th style="text-align: center;">View</th> -->
 
    </tr>
  </thead>
 


	
       <%
       
       Connection con;
       
       
       con=dbconn.create();
       PreparedStatement ps=con.prepareStatement("SELECT * FROM `vote`.`eligible` where statuss='Eligible' ORDER BY Asssembly ASC");
       
       ResultSet rs=ps.executeQuery();
       
       while(rs.next())
       {
    	String pic=rs.getString(1);
    	  
    	   
       %>
	

	


     <tr class="bg-info">
     <td style="text-align: center;"><%=rs.getString(1)%></td>
      <td style="text-align: center;"><img src="candidate/<%= rs.getString(2) %>" style="heigth:100px; width:40px;"></td>
       <td style="text-align: center;"><%=  rs.getString(5) %></td>
      <td style="text-align: center;"><img src="symbol/<%= rs.getString(6) %>" style="heigth:100px; width:40px;"></td>



<%--        <td><a href="emview.jsp?email=<%=rs.getString(3)%>&&pic=<%=rs.getString(5)%>"><button class="btn btn-primary" style="text-align:center;">View</button></a></td>
 --%>     </tr>
	<%} %>






</table>

</div>
</center>

</body>
<script>
$(window).on("load resize ", function() {
	  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
	  $('.tbl-header').css({'padding-right':scrollWidth});
	}).resize();
</script>
<script>
function goBack() {
  window.history.back();
}
</script>
</html>