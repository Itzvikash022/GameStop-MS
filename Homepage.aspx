<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="GameStop_MS.Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="~/Bootstrap/js/bootstrap.bundle.min.js"></script>
    <link href="~/Bootstrap/css/style_home.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="header">
        <header>
            <nav class="navbar navbar-expand-lg fixed-top">
                <div class="container-fluid">
                    <a class="navbar-brand me-auto" href="#">GameStop</a>

                    <div
                        class="offcanvas offcanvas-end"
                        tabindex="-1"
                        id="offcanvasNavbar"
                        aria-labelledby="offcanvasNavbarLabel">
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title" id="offcanvasNavbarLabel">GameStop</h5>
                            <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="offcanvas"
                                aria-label="Close">
                            </button>
                        </div>
                        <div class="offcanvas-body">
                            <ul class="navbar-nav justify-content-center flex-grow-1 pe-3">
                                <li class="nav-item">
                                    <a class="nav-link mx-lg-2 active" aria-current="page" href="#">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link mx-lg-2" href="#">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link mx-lg-2" href="/user/userGames.aspx">Games</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link mx-lg-2" href="/admin/adminLogin.aspx">Admin Login</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <a href="user/userLogin.aspx" class="login-button">Login</a>
                    <button
                        class="navbar-toggler pe-0"
                        type="button"
                        data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasNavbar"
                        aria-controls="offcanvasNavbar"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
            </nav>
        </header>
    </div>
        .0
    <section class="hero-section">
        <div class="hero-overlay">
            <div class="container">
        <div class="main">
            <asp:Image ID="img" CssClass="image-home" runat="server" ImageUrl="../../Imgs/Controller_Image.png" AlternateText="Image Not Found!!"/>
            <div class="content2">
                <h2>Gaming Zone</h2>
                <p>If you want to spend your time in games. <br /> Visit Our Store, Buy, Download and Enjoy.</p>
        </div>
            </div>
    </div>
        </div>
    </section>
    
</form>
</body>
</html>
