
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
    String search = "";
	if (request.getParameterMap().containsKey("search")) {
		search = request.getParameter("search");
    }

	
	
	%>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />

<!-- Navbar -->
<nav
	class="navbar navbar-main navbar-expand-lg px-0 shadow-none border-radius-xl"
	id="navbarBlur" navbar-scroll="true">
	<div class="container-fluid py-1 px-0">

		<div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4 row"
			id="navbar">

			<div
				class="nav-item d-xl-none ps-5 d-flex align-items-center col-sm-2">
				<a href="javascript:;" class="nav-link text-body p-0"
					id="iconNavbarSidenav">
					<div class="sidenav-toggler-inner">
						<i class="sidenav-toggler-line"></i> <i
							class="sidenav-toggler-line"></i> <i class="sidenav-toggler-line"></i>
					</div>
				</a>
			</div>
			<div class="d-sm-none d-xl-block col-2"></div>
			<div class="ms-md-auto d-flex align-items-center col-8 col-sm-8">
				<div class="input-group" style="">
					<span class="input-group-text text-body"><i
						class="fas fa-search" aria-hidden="true"></i></span> 
						<input type="text" id="input_search" onkeypress="evt_search(event,this.value);" class="form-control" placeholder="검색" value="<%=search%>">
				</div>
			</div>
			<div
				class="ms-md-auto pe-md-5 d-flex flex-row-reverse align-items-center col-2 col-sm-2">
				<ul class="navbar-nav  justify-content-end ">
					<li class="nav-item d-flex align-items-center"><%@ page
							import="java.io.*,java.util.*"%> <% 
	            	String sess = (String)session.getAttribute("email");
	            
	            if(sess == null || "null".equals(sess)){
	            	%> <a href="/login.jsp"
						class="nav-link text-body font-weight-bold px-0"> <i
							class="fa fa-user me-sm-1"></i> <span class="d-sm-inline d-none">Login</span>
					</a> <% 
	            }else{
	            	%> <a href="/logout.jsp"
						class="nav-link text-body font-weight-bold px-0"> <i
							class="fa fa-user me-sm-1"></i> <span class="d-sm-inline d-none">Logout</span>
					</a> <%
	            }
	            %></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
<!-- End Navbar -->
<script>
$(document).ready(function() {
	$("#input_search").autocomplete({
		source : function(request, response) {
			$.ajax({

				url : "/ajax_search.jsp",
				type : "get",
				dataType: "json",
				data: {search_txt: $("#input_search").val()},

				success : function(data) {
					
					response(data);
				},

				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

				},
			});
		},

		select : function(event,ui){
			location.href="/view_document.jsp?search="+ui.item.value;
		}
	});
});
			
			
			
			
	function evt_search(e,val){

		if(e.keyCode == 13){ //엔터
			location.href="/view_document.jsp?search=" + val;
		}
	}
</script>