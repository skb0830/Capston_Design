
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<aside
	class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 "
	id="sidenav-main">
	<div class="sidenav-header">
		<i
			class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
			aria-hidden="true" id="iconSidenav"></i> <a class="navbar-brand m-0"
			href="/view_document.jsp?search=배재대학교" target=""> <img
			src="/src/logo_32.png" class="navbar-brand-img h-100" alt="main_logo">
			<span class="ms-1 font-weight-bold">배 재 위 키</span>
		</a>
	</div>
	<hr class="horizontal dark mt-0">
	<div class="collapse navbar-collapse  w-auto "
		id="sidenav-collapse-main" style="height: calc(100vh - 200px);">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link  active"
				href="../pages/dashboard.html">
					<div
						class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
						<i class="fas fa-exclamation"></i>
						<title>공지사항</title>
					</div> <span class="nav-link-text ms-1">공지사항</span>
			</a></li>
			<!--  
			<li class="nav-item"><a class="nav-link  "
				href="../pages/tables.html">
					<div
						class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
						<i class="fas fa-comment-dots"></i>
						<title>문의사항</title>
					</div> <span class="nav-link-text ms-1">문의사항</span>
			</a></li>
        <li class="nav-item">
          <a class="nav-link  " href="../pages/virtual-reality.html">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>신고 게시판</title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-2319.000000, -291.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g transform="translate(603.000000, 0.000000)">
                        <path class="color-background" d="M22.7597136,19.3090182 L38.8987031,11.2395234 C39.3926816,10.9925342 39.592906,10.3918611 39.3459167,9.89788265 C39.249157,9.70436312 39.0922432,9.5474453 38.8987261,9.45068056 L20.2741875,0.1378125 L20.2741875,0.1378125 C19.905375,-0.04725 19.469625,-0.04725 19.0995,0.1378125 L3.1011696,8.13815822 C2.60720568,8.38517662 2.40701679,8.98586148 2.6540352,9.4798254 C2.75080129,9.67332903 2.90771305,9.83023153 3.10122239,9.9269862 L21.8652864,19.3090182 C22.1468139,19.4497819 22.4781861,19.4497819 22.7597136,19.3090182 Z"></path>
                        <path class="color-background opacity-6" d="M23.625,22.429159 L23.625,39.8805372 C23.625,40.4328219 24.0727153,40.8805372 24.625,40.8805372 C24.7802551,40.8805372 24.9333778,40.8443874 25.0722402,40.7749511 L41.2741875,32.673375 L41.2741875,32.673375 C41.719125,32.4515625 42,31.9974375 42,31.5 L42,14.241659 C42,13.6893742 41.5522847,13.241659 41,13.241659 C40.8447549,13.241659 40.6916418,13.2778041 40.5527864,13.3472318 L24.1777864,21.5347318 C23.8390024,21.7041238 23.625,22.0503869 23.625,22.429159 Z"></path>
                        <path class="color-background opacity-6" d="M20.4472136,21.5347318 L1.4472136,12.0347318 C0.953235098,11.7877425 0.352562058,11.9879669 0.105572809,12.4819454 C0.0361450918,12.6208008 6.47121774e-16,12.7739139 0,12.929159 L0,30.1875 L0,30.1875 C0,30.6849375 0.280875,31.1390625 0.7258125,31.3621875 L19.5528096,40.7750766 C20.0467945,41.0220531 20.6474623,40.8218132 20.8944388,40.3278283 C20.963859,40.1889789 21,40.0358742 21,39.8806379 L21,22.429159 C21,22.0503869 20.7859976,21.7041238 20.4472136,21.5347318 Z"></path>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>
            </div>
            <span class="nav-link-text ms-1">신고 게시판</span>
          </a>
        </li>
		 -->
			<li class="nav-item mt-3">
				<h6
					class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">Page
					Links</h6>
			</li>
			<li class="nav-item"><a class="nav-link  "
				href="https://www.pcu.ac.kr/kor" target='_blank'>
					<div
						class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
						<img
							src="https://www.pcu.ac.kr/images/site/kor/content/8_ui_A01.png"
							class="navbar-brand-img h-100" alt="main_logo">
						<title>배재대학교 홈페이지</title>
					</div> <span class="nav-link-text ms-1">배재대학교 홈페이지</span>
			</a></li>
			<li class="nav-item"><a class="nav-link  "
				href="http://www.paichai.news/" target='_blank'>
					<div
						class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
						<i class="fa fa-newspaper"></i>
						<title>배재신문</title>
					</div> <span class="nav-link-text ms-1">배재신문</span>
			</a></li>
			<li class="nav-item"><a class="nav-link  "
				href="https://nasum.pcu.ac.kr/" target='_blank'>
					<div
						class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
						<i class="fa fa-newspaper"></i>
						<title>배재대학교 나섬</title>
					</div> <span class="nav-link-text ms-1">배재대학교 나섬</span>
			</a></li>
		</ul>
	</div>
	<div class="sidenav-footer mx-3 ">
		<div
			class="card card-background shadow-none card-background-mask-secondary"
			id="sidenavCard">
			<div class="full-background"
				style="background-image: url('../assets/img/curved-images/white-curved.jpg')"></div>
			<div class="card-body text-start p-3 w-100">
				<div class="docs-info">
					<p class="text-xs font-weight-bold m-0">
						문의사항 : <a
							style="font-weight: 600 !important; font-size: 0.75rem !important; color: #fff;"
							href="mailto:" test@test.com">test@test.com</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</aside>
