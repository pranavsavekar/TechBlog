
<%@page import="java.sql.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        
        <!--banner-->
        <div class="container-fluid p-0 m-0 banner-background">
            
            <div class="jumbotron primary-background text-white pb-5">
                <div class="container">
                    <h3 class="display-3 text-center">Welcome to Tech Blog</h3>
                    <br>
                    <h4 class="text-center">Welcome to Technical Blog, world of technolgy </h4>
                    <br>
                    <p>A programming language is a system of notation for writing computer programs.[1] Programming languages are described in terms of their syntax (form) and semantics (meaning), usually defined by a formal language. Languages usually provide features such as a type system, variables, and mechanisms for error handling.</p>
                    <p>Computer architecture has strongly influenced the design of programming languages, with the most common type (imperative languages—which implement operations in a specified order) developed to perform well on the popular von Neumann architecture. While early programming languages were closely tied to the hardware, over time they have developed more abstraction to hide implementation details for greater simplicity.</p>
                    <a href="register_page.jsp" class="btn btn-outline-light"><span class='fa fa-user-plus'></span> New User</a>
                    <a href="login-page.jsp" class="btn btn-outline-light"><span class='fa fa-arrow-circle-right'></span> Login</a>
                </div>
            </div>
            
        </div>
        
                
        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
