
<%@page import="com.tech.blog.entities.message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <!--bootstrap-css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 100%, 88% 84%, 62% 100%, 32% 87%, 15% 100%, 0 89%, 0 0);
            }
        </style>
    </head>
    <body>
        
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>
        
        <main class="d-flex align-items-center primary-background banner-background" style="height: 70vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header text-center fs-3 fw-light">
                                <span class="fa fa-user-circle"></span> Login
                            </div>
                            
                            <%
                                message m=(message) session.getAttribute("msg");
                                if(m!=null){
                            %>
                            
                            <div class="alert <%= m.getCssClass() %> p-2" role="alert">
                                <span class="fa fa-exclamation-triangle"></span> <%= m.getContent() %>
                            </div>
                            
                            <%
                                session.removeAttribute("msg");
                               }
                            %>
                            
                            
                            <div class="card-body">
                                <form action="LoginServlet" method="post">
                                        <div class="mb-3">
                                          <label for="exampleInputEmail1" class="form-label">Email</label>
                                          <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
                                          <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                        </div>
                                        <div class="mb-3">
                                          <label for="exampleInputPassword1" class="form-label">Password</label>
                                          <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Password">
                                        </div>
                                        <div class="container text-center">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
