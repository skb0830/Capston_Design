<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--
=========================================================
* Soft UI Dashboard - v1.0.7
=========================================================

* Product Page: https://www.creative-tim.com/product/soft-ui-dashboard
* Copyright 2023 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://www.creative-tim.com/license)
* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!DOCTYPE html>
<html lang="en">

<head>
  <jsp:include page='./inc/header.jsp'/>
  
	 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg=" crossorigin="anonymous">
 	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"integrity="sha256-5slxYrL5Ct3mhMAp/dgnb5JSnTYMtkr4dHby34N10qw=" crossorigin="anonymous"></script>
</head>

<body class="g-sidenav-show  bg-gray-100">
<jsp:include page='./inc/aside.jsp'/>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <jsp:include page='./inc/nav.jsp'/>
    
    
    <div class="container-fluid py-sm-4 p-0">
      <div class="row">
		<div class="col-xl-2 col-sm-0"></div>
        <div class="col-xl-8 col-sm-12">
          <div class="card h-100">
	            <form action="create_document_process.jsp"  method="post">
          			<div class="card-header pb-0">
			            <div class="row">
				          	<div class="col form-group">
						        <label for="example-text-input" class="form-control-label">제목</label>
						        <input class="form-control" type="text" value="" name="title" id="title">
						    </div>
					    </div>
				    </div>
				    <div class="card-body pt-0">
					    <div class="row">
					    	<div class="col form-group mb-0">
						        <label for="example-text-input" class="form-control-label">내용</label>
						    </div>
					    </div>
					     <div class="row">
			                <div class="col">
							  	<textarea id="content" name="content" ></textarea>
			                </div>
		                </div>
		                <div class="row pt-2">
		                	<div class="col text-end">
		                		<button type="submit" class="btn bg-gradient-dark mb-0">작성</button>
		                	</div>
		                </div>
	                </div>
	            </form>
            </div>
          </div>
          
			<div class="col-xl-2 col-sm-0"></div>
        </div>
    </div>
  </main>
  <!-- summernote -->
  <script>
	  $(document).ready(function() {
	  $('#content').summernote({
		  toolbar: [
			  ['style', ['style']],
			  ['font', ['bold', 'underline', 'clear']],
			  ['fontname', ['fontname']],
			  ['color', ['color']],
			  ['para', ['ul', 'ol', 'paragraph']],
			  ['table', ['table']],
			  ['insert', ['link', 'picture', 'video']],
			  ['view', ['help']],
			],
		  popover: {
			  image: [
			    ['image', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],
			  ]},
		  lang: 'ko-KR',
		  height: 350,
		  minHeight: 350,
		  maxHeight: 350,
		  focus: true ,
		  resize:false,
		  disableDragAndDrop: true,

	  });
	});
  </script>
  <!--   Core JS Files   -->
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>

  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>

</body>

</html>
