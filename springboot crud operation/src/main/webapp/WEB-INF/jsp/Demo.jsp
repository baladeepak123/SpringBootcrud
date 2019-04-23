<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<link rel="stylesheet"       href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    
<title>Insert title here</title>
</head>
<body>
<div id="fullrefresh">
<h1>Welcome to Spring Boot Project </h1>
 <div class="col-sm-6 container ">
<table align="center">
<tr>
 	<td>
 	<input type="hidden" name="id" id="id" value="${editobj.id}" >
 	</td>
 </tr>

	<tr>
	<td>Name:</td>
	<td><input type="text" id="txtname" placeholder="Name" value="${editobj.name }">
			<span id="err1" style="display: none; color: red">Enter the name</span></td>
	
	</tr>
	
	<tr>
		<td>Date:</td>
		 <td><fmt:formatDate value="${editobj.date}" pattern="dd-MM-YYYY" var="date"/>
		<input type="text" id="txtdate" placeholder="date" name="txtdate" readonly="readonly" value="${date}">
		<span id="err2" style="display: none; color: red">Select the date</span></td>	
	</tr>
	
	<tr>
		<td>Gender:</td>
		<td><input type="radio" name="gender" value="M" ${editobj.gender=='M'?'checked':''}>Male
		<input type="radio" name="gender" value="F" ${editobj.gender=='F'?'checked':''}>Female
		<span id="err3" style="display: none; color: red">Select the Gender</span>
		</td>
	</tr>
	
	<tr>
		<td>Address:</td>
		<td><textarea rows="3" cols="23" name="Address" id="Address" >${editobj.address }</textarea>
		<span id="err4" style="display: none; color: red">Enter the Address</span>
		</td>	
	</tr>
	
	<tr >
		<td>Hobbies:</td>
		<td><input type="checkbox" id="checkbox1" name="hobbies" value="Cricket"${editobj.hobbies=='Cricket'?'checked':''}>Cricket
			<input type="checkbox" id="checkbox2" name="hobbies" value="Swimming"${editobj.hobbies=='Swimming'?'checked':''}>Swimming
			<input type="checkbox" id="checkbox3" name="hobbies" value="Badminton"${editobj.hobbies=='Badminton'?'checked':''}>Badminton
			<span id="err5" style="display: none; color: red">Select the hobbies</span>
		</td>
	</tr>
	
	<tr>
		<td>Status:</td>
		<td>
			<select id="drstatus">
 			<option value="0">Select</option>
 			<option value="Y" ${editobj.status=='Y'?'selected':''} >Active</option>
 			<option value="N" ${editobj.status=='N'?'selected':''}>InActive</option>
 			</select>
 			<span id="err6" style="display: none; color: red">Select the hobbies</span>
 		</td>
	</tr>
	
</table>
<div align="center">
	<input type="submit" id="submit" value="submit" onclick="My_Function();">
	<button id="update" onclick="Updatedetails(id);" hidden>Update</button></center></td>
	</div>
	<br><br>
<a href="DemodetailExcel" >Download EXCEL</a><br>
<a href="CountryPDF" >Download PDF</a>
</div>
<div class="col-sm-6 container">
<table class="table">
<thead>
<tr>
	<th>S.no</th><th>Name</th><th>Date</th><th>Gender</th><th>Address</th><th>Hobbies</th><th>Status</th><th>Edit</th><th>Delete</th>
	</tr></thead>
	<tbody>
		   <c:forEach items="${demolist}" var="demo" varStatus="status">
		<tr>
		<td align="center">${status.index+1}</td>
		 <td align="left">${demo.name}</td> 
		 <td align="center"> <fmt:formatDate value="${demo.date}" pattern="dd-MM-YYYY" var="date"/>${date}</td>
		<td align="center"><c:if test="${demo.gender=='M'}"><c:out value="Male"></c:out></c:if><c:if test="${demo.gender=='F'}"><c:out value="Female"></c:out></c:if></td>
		<td align="center">${demo.address}</td>
 		<%-- <td align="center"><c:if test="${demo.hobbies=='Cricket'}"><c:out value="Cricket"></c:out></c:if><c:if test="${demo.hobbies=='Swimming'}"><c:out value="Swimming"></c:out></c:if> 	<c:if test="${demo.hobbies=='Badminton'}"><c:out value="Badminton"></c:out></c:if></td> --%>
	<td align="center">${demo.hobbies}</td>
	<td align="center"><c:if  test="${demo.status=='Y'}"><c:out value="ACTIVE"></c:out></c:if><c:if  test="${demo.status=='N'}"><c:out value="INACTIVE"></c:out></c:if></td>
	<td align="center"><img src="resources/images/edit2.png" onclick="Editdetails(${demo.id});" height=25px; width=25px;></td>
<td align="center"><img src="resources/images/molumen_red_round_error_warning_icon.png" onclick="Deletedetails(${demo.id});" height=25px; width=25px;></td>
	</tr>
		</c:forEach>
	</tbody>
	</table>
	</div>
</div>
<script type="text/javascript">
$(function()
		{
			 $("#txtdate").datepicker({
				 
				 showAnim:"slide",
				 dateFormat : 'dd-mm-yy',
				 changeMonth : true,
				 changeYear : true,
				 yearRange : "1950:2050"
				 });
			 
		});
 
function My_Function()
{
	 $("#err1").hide();
		$("#err2").hide();
		$("#err3").hide();
		$("#err4").hide();
		$("#err5").hide();	
		$("#err6").hide();
	 	var name=$("#txtname").val();
		var date=$("#txtdate").val().split("-").reverse().join("-");
		var gender = $('input[name="gender"]:checked').val();
		var address = $("#Address").val();
		//var hobbies = $('input[name="hobbies"]:checked').val();
		var hobbies = new Array();
	 $('input[name="hobbies"]:checked').each(function()
			 {
		 hobbies.push(this.value);
			 });
		var status = $("#drstatus").val();
	
		if(name=="" || date=="" || gender==null || address=="" || hobbies==null || status==0)
			{
			if(name=="")
				{
					$("#err1").show();
				}
			if(date=="")
				{
					$("#err2").show();
				}
			if(gender==null)
				{
					$("#err3").show();
				}
			if(address=="")
				{
					$("#err4").show();
				}
			if(hobbies==null)
				{
					$("#err5").show();
				}
			if(status==0)
				{
					$("#err6").show();
				}
			}
		else
			{
	 $.ajax({
			url:"Insert",
			data:"name="+name+"&date="+date+"&gender="+gender+"&address="+address+"&hobbies="+hobbies+"&status="+status,
			type:"POST",
			success:function(response)
			{
				$("#fullrefresh").html(response);
				alert("successfully Added");
			}
		}); 
			}
	}
 function Editdetails(id)
 {
	 //alert("id"+id)
	 $.ajax({
		 url:"Edit",
		 data:"id="+id,
		 type:"POST",
		 success:function(response)
		 {
				$("#fullrefresh").html(response);
				$("#update").show();
				$("#submit").hide();
		 }
	 });
 }
 
 function Updatedetails()
 {
	 var id=$("#id").val();
	 var name=$("#txtname").val();
	 var date=$("#txtdate").val().split("-").reverse().join("-");
	 var gender = $('input[name="gender"]:checked').val();
	 var address = $("#Address").val();
	 var hobbies = $('input[name="hobbies"]:checked').val();
	 var status = $("#drstatus").val();
	 
	 $.ajax({
		 url:"Update",
		 data:"id="+id+"&name="+name+"&date="+date+"&gender="+gender+"&address="+address+"&hobbies="+hobbies+"&status="+status,
		 type:"POST",
		 success:function(response)
		 {
				$("#fullrefresh").html(response);
				alert("Update Successfully")
		 }
	 })
 }
 function Deletedetails(id)
 {
	 alert("iddddddddd")
	 $.ajax({
		 url:"Delete",
		 data:"id="+id,
		 type:"POST",
		 success:function(response)
		 {
				$("#fullrefresh").html(response);
				alert("Delete Successfully")

		 }
	 })
 }
 
</script>
</body>

</html>