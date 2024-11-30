<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>選單</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/home">幸福人壽 - 保單查詢系統</a><a style="color: white;display: ${userCert.role == null ? 'none' : 'block'};">(登入身分):${userCert.role}</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel">功能選單</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                	<li class="nav-item"><a class="nav-link" aria-current="page" href="/home">首頁</a></li>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="/login" style="display: ${userCert.role == null ? 'block' : 'none'};">註冊/登入</a></li>
                    <li class="nav-item"><a class="nav-link" href="/user/info?cardNumber=${ userCert.cardNumber }" style="display: ${userCert.role == 'CUSTOMER' ? 'block' : 'none'};">我的保單</a></li>
                    <li class="nav-item"><a class="nav-link" href="/order" style="display: ${userCert.role == 'EMPLOYEE' || userCert.role == 'ADMIN' ? 'block' : 'none'};">所有保單</a></li>
                    <li class="nav-item"><a class="nav-link" href="/user/update/password" style="display: ${userCert.role == null ? 'none' : 'block'};">更改密碼</a></li>
                    <li class="nav-item"><a class="nav-link" href="/user" style="display: ${userCert.role == 'ADMIN' ? 'block' : 'none'};">使用者表單</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            查看更多
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark">
                            <li><a class="dropdown-item" href="/product">保險商品</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="/product/list" style="display: ${userCert.role == 'CUSTOMER' || userCert.role == null ? 'none' : 'block'};">保單銷售詳情</a></li>
                            <!-- <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li> -->
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="/logout" style="display: ${userCert.role == null ? 'none' : 'block'};">登出</a></li>
                </ul>
					<form class="d-flex mt-3" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-success" type="submit">Search</button>
					</form>
				</div>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>