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
</head>

<body class="g-sidenav-show  bg-gray-100">
<jsp:include page='./inc/aside.jsp'/>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <jsp:include page='./inc/nav.jsp'/>
    
    
    <div class="container">
      <div class="row mt-5">
          <div class="col-xl-4 col-lg-5 col-md-7 mx-auto">
            <div class="card z-index-0">
              <div class="card-header text-center pt-4">
                <h5>로그인</h5>
              </div>
              <div class="card-body">
                <form action="login_process.jsp" method="post" role="form text-left">
                  <div class="mb-3">
                    <input type="email" id="email" class="form-control" placeholder="이메일" aria-label="이메일" aria-describedby="email-addon">
                  </div>
                  <div class="mb-3">
                    <input type="password" id="password" class="form-control" placeholder="비밀번호" aria-label="비밀번호" aria-describedby="password-addon">
                  </div>
                  <%
                  	String res = request.getParameter("f");
                  	String res_txt="";
                  
                  if( res == null || "null".equals(res)){
                	  res_txt="";
                  }else if(res.equals("1")){
                	  res_txt="이메일이 없거나 비밀번호가 틀렸습니다.";
                  }else if(res.equals("2")){
                	  res_txt="아이디를 입력하세요.";
                  }else if(res.equals("3")){
                	  res_txt="비밀번호를 입력하세요.";
               	  	}
                  %>
                  <p class="text-sm mt-0 mb-0" style="color:#ea0606;"><%=res_txt %></p>
                  
                  <div class="text-center">
                    <button type="submit" class="btn bg-gradient-dark w-100 my-4 mb-2">Sign up</button>
                  </div>
                  <p class="text-sm mt-3 mb-0"><a href="javascript:;" class="text-dark font-weight-bolder">회원가입</a></p>
                </form>
              </div>
            </div>
          </div>
        </div>
     
    </div>
  </main>
  
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
