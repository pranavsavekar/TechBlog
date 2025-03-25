<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.Userdao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<% 
 User user=(User)session.getAttribute("currentUser");
 if(user == null){
     response.sendRedirect("login-page.jsp");
 }
%>
<%

 int postId=Integer.parseInt(request.getParameter("post_id"));
 PostDao d=new PostDao(ConnectionProvider.getConnection());
 Post p = d.getPostByPostId(postId);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %> | TechBlog </title>
        
        <!--bootstrap-css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 100%, 88% 84%, 62% 100%, 32% 87%, 15% 100%, 0 89%, 0 0);
            }
            
            .post-title{
                font-weight: 400;
                font-size: 30px;
            }
            
            .post-content{
                font-weight: 300;
                font-size: 20px;
            }
            
            .post-date{
                font-weight: bold;
                font-style: italic;
            }
            
            .post-user-info{
                font-weight: 400;
                font-size: 20px;
            }
            
            .post-user-info a{
                text-decoration: none;
            }
            
            body{
                background: url("img/blue-bg.jpg");
                background-size: cover;
                background-attachment: fixed;
            }
            
        </style>
        
        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v21.0"></script>
    </head>
    <body>
        
        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
          <div class="container-fluid">
              <a class="navbar-brand" href="index.jsp"><span class="fa fa-cogs"></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="profile.jsp"><span class="fa fa-home"></span> Home</a>
                </li>

                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      <span class="fa fa-cubes"></span>
                     Categories
                  </a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Programming Language</a></li>
                    <li><a class="dropdown-item" href="#">Project Implementation</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Data Structure</a></li>
                  </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-phone"></span> Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"><span class="fa fa-plus-square-o"></span> Post</a>
                </li>

              </ul>
              
                <ul class="navbar-nav mr-right">
                        <li class="nav-item">
                            <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName() %></a>
                        </li>

                        <li class="nav-item">
                             <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> LogOut</a>
                        </li>
                </ul>
                
            </div>
          </div>
        </nav>
        
        <!--end of navbar-->
        
        <!--main content of body-->
        
        <div class="container my-4">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header">
                            
                            <h4 class="post-title"><%= p.getpTitle() %></h4>
                            
                        </div>
                            
                            <div class="card-body">
                                
                                <div class="row">
                                    <div class="col-md-8">
                                        <% Userdao ud=new Userdao(ConnectionProvider.getConnection()); %>
                                        
                                        <p class="post-user-info"><a href="#!"><%= ud.getUserByUserId(p.getUserId()).getName() %></a> has posted-</p>
                                    </div>
                                    
                                    <div class="col-md-4">
                                        <p class="post-date"><%= p.getpDate().toLocaleString() %></p>
                                    </div>
                                    <hr>
                                </div>
                                
                                
                                <p class="post-content"><%= p.getpContent() %></p>
                            <br>
                            
                            <div class="post-code">
                                <pre><%= p.getpCode() %></pre>
                            </div>
                            </div>
                            
                            <!--<div class="card-footer">
                                
                                <%
                                    LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                                %>
                                
                                <%--<a href="#!" onclick="doLike(<%= p.getpId() %>,<%= user.getId() %>)" class="btn btn-outline-primary btn-sm mx-1"><i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getpId()) %></span></a>--%>
                                <a href="#!" class="btn btn-outline-primary btn-sm mx-1"><i class="fa fa-commenting-o"></i> <span>5</span></a>
                                
                            </div>-->
                                
                            <!--<div class="card-footer">
                                <div class="fb-comments" data-href="http://localhost:9494/TechBlog/show_blog_page.jsp?post_id=<%= p.getpId() %>" data-width="" data-numposts="5"></div>
                            </div>-->
                                
                        
                    </div>
                    
                </div>
                
            </div>
            
        </div>
        
        <!--end of main content of body-->
        
        
         <!-- Profile Modal -->
            <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header primary-background text-white">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">TechBlog</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                      <div class="container text-center">
                          <img class="img-fluid" src="pictures/<%= user.getProfile() %>" style="border-radius: 50%; max-width: 100px">
                          <h1 class="modal-title fs-5" id="exampleModalLabel"><%= user.getName() %></h1>
                          
                          <!--Profile details-->
                          <div id="profile-details">
                            <table class="table">

                                  <tbody>
                                    <tr>
                                      <th scope="row">ID</th>
                                      <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                      <th scope="row">Email</th>
                                      <td><%= user.getEmail()%></td>
                                    </tr>
                                    <tr>
                                      <th scope="row">Gender</th>
                                      <td><%= user.getGender().toUpperCase()%></td>
                                    </tr>
                                    <tr>
                                      <th scope="row">About</th>
                                      <td><%= user.getAbout()%></td>
                                    </tr>
                                    <tr>
                                      <th scope="row">Registered On</th>
                                      <td><%= user.getDateTime().toString()%></td>
                                    </tr>
                                  </tbody>
                            </table>
                          </div>
                          <!--End of Profile details-->          
                          
                          <!--edit details-->          
                          <div id="profile-edit" style="display: none">
                              <h5 class="mt-2 fw-normal">Edit your information</h5>
                              <form action="EditServlet" method="post" enctype="multipart/form-data">
                                  <table class="table">
                                      <tr>
                                          <th>ID</th>
                                          <td><%= user.getId() %></td>
                                      </tr>
                                      <tr>
                                          <th>Name</th>
                                          <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" ></td>
                                      </tr>
                                      <tr>
                                          <th>Email</th>
                                          <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" ></td>
                                      </tr>
                                      <tr>
                                          <th>Password</th>
                                          <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" ></td>
                                      </tr>
                                      <tr>
                                          <th>Gender</th>
                                          <td><%= user.getGender().toUpperCase()%></td>
                                      </tr>
                                      <tr>
                                          <th>About</th>
                                          <td>
                                              <textarea class="form-control" rows="4" name="user_about" ><%= user.getAbout()%></textarea>
                                          </td>
                                      </tr>
                                      <tr>
                                          <th>New Profile Picture</th>
                                          <td>
                                              <input type="file" name="image" class="form-control">
                                          </td>
                                      </tr>
                                  </table>
                                          
                                          <div class="container">
                                              <button type="submit" class="btn btn-outline-primary">Save</button>
                                          </div>
                              </form>
                          </div>
                          <!--End of edit details-->
                      </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                  </div>
                </div>
              </div>
            </div>
        
        <!--end of Profile Modal-->
        
        <!--add post modal-->
       
            <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Provide Post Details</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    
                      <form id="add-post-form" action="PostServlet" method="post">
                          
                          <div class="form-group mb-3">
                              <select class="form-select" name="cid">
                                  <option selected disabled>---Select Category---</option>
                                  
                                    <% 
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        if (list != null && !list.isEmpty()) {
                                            for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid() %>"><%= c.getName() %></option>
                                    <% 
                                            }
                                        } else {
                                    %>
                                    <option disabled>No categories available</option>
                                    <% 
                                        } 
                                    %>
                              </select>
                          </div>

                          
                          <div class="form-group">
                              <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control"/>
                          </div>
                          
                          <div class="form-group my-3">
                              <textarea name="pContent" class="form-control" rows="5" placeholder="Enter Your Content"></textarea>
                          </div>
                          
                          <div class="form-group my-3">
                              <textarea name="pCode" class="form-control" rows="5" placeholder="Enter Your Program (if any)"></textarea>
                          </div>
                          
                          <div class="form-group">
                              <label class="mb-2">Select Image</label>
                              <br>
                              <input name="pic" type="file" />
                          </div>
                              
                              <div class="container text-center mt-3">
                                  <button type="submit" class="btn btn-outline-primary">POST</button>
                              </div>
                          
                          
                      </form>
                      
                  </div>
                </div>
              </div>
            </div>
        
        <!--end of add post modal-->
        
        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="js/myjsfile.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
        <script>
            
            $(document).ready(function (){
                let editStatus=false; 
                $("#edit-profile-button").click(function(){
                    if(editStatus==false){
                        $('#profile-details').hide();
                        $('#profile-edit').show();
                        editStatus=true;
                        $(this).text("Back");
                    }else{
                        $('#profile-details').show();
                        $('#profile-edit').hide();
                        editStatus=false;
                        $(this).text("Edit");
                    }
                })
            })
        </script>
        
        
        <!--now add post js-->
        <script>
            $(document).ready(function(e){
                
                $("#add-post-form").on("submit", function (event){
                    //this form gets called when form is submitted
                    event.preventDefault();
                    console.log("You have clicked on submit")
                    
                    let form =new FormData(this);
                    
                    //now requesting to server
                    $.ajax({
                        url: "PostServlet",
                        type: 'POST',
                        data: form,
                        success:function (data, textStatus, jqXHR){
                            //success
                            console.log(data);
                            
                            if(data.trim()==='done'){
                                swal("Good job!", "Saved Successfully!", "success");
                            }else{
                                swal("Error!!", "Something went wrong, try again...", "error");
                            }
                        },
                        error:function (jqXHR, textStatus, errorThrown){
                            //error
                            swal("Error!!", "Something went wrong, try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
    </body>
</html>
