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
    
    
    <div class="container-fluid py-sm-4 p-0">
      <div class="row">
		<div class="col-2"></div>
        <div class="col-8">
          <div class="card h-100">
          	<div class="card-header"> 제목</div>
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
				
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

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        // 모든 문서를 조회
        String sql = "SELECT * FROM Pages";
        stmt = conn.prepareStatement(sql);
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
        
		<div class="col-2"></div>
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
