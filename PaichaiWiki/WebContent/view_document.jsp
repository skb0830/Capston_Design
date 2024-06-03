<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
  <jsp:include page='./inc/header.jsp'/>
</head>

<body class="g-sidenav-show  bg-gray-100">
<jsp:include page='./inc/aside.jsp'/>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <jsp:include page='./inc/nav.jsp'/>
    
    
    <div class="container-fluid py-sm-4">
      <div class="row">
		<div class="col-0 col-lg-2"></div>
        <div class="col-12 col-lg-8">
          <div class="card h-100">
          	<div class="card-header"> 제목</div>
            <div class="card-body p-3">
              <div class="row">
                <div class="col">
				
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>

<%
    // 데이터베이스 연결 정보
    String url = "jdbc:mysql://localhost:3306/PaichaiwikiDB";
    String username = "manager";
    String password = "1234";

    // 데이터베이스 연결 및 문서 조회 처리
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    String search = request.getParameter("search");


    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        // 모든 문서를 조회
        String sql = "SELECT * FROM Pages where title=?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, search);
        rs = stmt.executeQuery();
        // 조회된 문서 출력
        while (rs.next()) {
            out.println("제목: " + rs.getString("Title") + "<br>");
            out.println("내용: " + rs.getString("Content") + "<br><br>");
            //문서 출력하는게 제목 / 내용 ??? 
            		//아니면 게시판 형태 ?? 
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
        out.println("문서 조회 중 오류가 발생했습니다.");
    } catch (ClassNotFoundException ex) {
        ex.printStackTrace();
        out.println("문서 조회 중 오류가 발생했습니다.");
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
%>
				
                </div>
              </div>
            </div>
          </div>
        </div>
        
		<div class="col-0 col-lg-2"></div>
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
