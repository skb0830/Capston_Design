 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <jsp:include page='./inc/header.jsp'/>
</head>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.*,java.util.*" %>
	   <%

       request.setCharacterEncoding("utf-8");
	   
	   //로그인 시 페이지 넘김
	   String sess = (String)session.getAttribute("email");
	   if(sess != null && "null".equals(sess)){
			String search = URLEncoder.encode("배재대학교","utf-8");
			response.sendRedirect("view_document.jsp?search=" + search);
	   }

	   
	   String res_txt="";
	   String check = request.getParameter("check");

	   String email = "";
	   String inputPassword ="";
       boolean email_null = false;
       boolean inputPassword_null = false;
       
	    if( check != null && check!="null" ){

		    // 입력된 이메일과 비밀번호 가져오기
		    email = request.getParameter("email");
		    inputPassword = request.getParameter("password");
		    
	    	
	    	if(email == ""){
	 	  		res_txt="아이디를 입력하세요.";
	 	  		email_null = true;
		   	}else if(inputPassword == "" ){
		 	 	res_txt="비밀번호를 입력하세요.";
		 	 	inputPassword_null = true;
		  	}

	    	if( !email_null && !inputPassword_null ){
		    	// 데이터베이스 연결 정보
			    String url = "jdbc:mysql://localhost:3306/PaichaiwikiDB";
			    String username = "manager";
			    String password = "1234";
			   
			 	// 데이터베이스 연결 및 쿼리 실행
			    Connection conn = null;
			    PreparedStatement stmt = null;
			    ResultSet rs = null;
	
			    try {
			        // 데이터베이스 연결
			        Class.forName("com.mysql.jdbc.Driver");
			        conn = DriverManager.getConnection(url, username, password);
		
			        // 사용자 인증을 위한 쿼리 작성
			        String sql = "SELECT * FROM Users WHERE Email = ? AND Password = ?";
			        stmt = conn.prepareStatement(sql);
			        stmt.setString(1, email);
			        stmt.setString(2, inputPassword);
			        rs = stmt.executeQuery();
					
			        // 결과 확인하여 로그인 처리
			        if (rs.next()) {
			            // 로그인 성공
			            // 세션에 사용자 이메일을 저장합니다.
			            session.setAttribute("email", email);
			            // 로그인 성공 후 페이지로 리다이렉트합니다.
			            String search = URLEncoder.encode("배재대학교","utf-8");
			        	response.sendRedirect("view_document.jsp?search=" + search);
			        } else {
			            // 로그인 실패
					   	res_txt="이메일이 없거나 비밀번호가 틀렸습니다.";
			        }
			    } catch (SQLException ex) {
			        ex.printStackTrace();
			    } catch (ClassNotFoundException ex) {
			        ex.printStackTrace();
			    } finally {
			        // 연결 및 리소스 해제
			        try {
			            if (rs != null) rs.close();
			            if (stmt != null) stmt.close();
			            if (conn != null) conn.close();
			        } catch (SQLException ex) {
			            ex.printStackTrace();
			        }
		    	}
		    	
	    	}
	    }
	   %>
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
                <form action="login.jsp?check=1" method="post" role="form text-left">
                  <div class="mb-3">
	                  <div class="form-group <% if(email_null) out.println("has-danger"); %>">
	                    <input type="email" name="email" class="form-control <% if(email_null) out.println("is-invalid");%>" placeholder="이메일" aria-label="이메일" 
	                    aria-describedby="email-addon" value="<%= email %>">
	                  </div>
                  </div>
                  <div class="mb-3">
	                  <div class="form-group <% if(inputPassword_null) out.println("has-danger"); %>">
	                    <input type="password" name="password" class="form-control <% if(inputPassword_null) out.println("is-invalid");%>" placeholder="비밀번호" aria-label="비밀번호" 
	                    aria-describedby="password-addon" value="">
	                  </div>
                  </div>

                  <p class="text-sm mt-0 mb-0" style="color:#ea0606;"><%= res_txt %></p>
                  
                  <div class="text-center">
                    <button type="submit" class="btn bg-gradient-dark w-100 my-4 mb-2">Sign up</button>
                  </div>
                  <p class="text-sm mt-3 mb-0"><a href="register.jsp" class="text-dark font-weight-bolder">회원가입</a></p>
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
