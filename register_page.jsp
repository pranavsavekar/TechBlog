
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
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
        <main class="d-flex align-items-center primary-background banner-background" style="padding-bottom: 100px">
            <div class="container">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-header text-center fs-3 fw-light">
                            <span class="fa fa-user-plus"></span> Register
                        </div>
                        
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlets" method="POST">
                                <div class="mb-3">
                                  <label for="user_name" class="form-label">User Name</label>
                                  <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
                                 </div>
                                
                                <div class="mb-3">
                                  <label for="exampleInputEmail1" class="form-label">Email address</label>
                                  <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
                                  <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                
                                <div class="mb-3">
                                  <label for="exampleInputPassword1" class="form-label">Password</label>
                                  <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Password">
                                </div>
                                
                                <div class="mb-3">
                                  <label for="gender" class="form-label">Select Gender</label>
                                  <br>
                                  <input type="radio" id="gender_male" name="gender" value="male"> Male
                                  <input type="radio" id="gender_female" name="gender" value="female"> Female
                                </div>
                                
                                <div class="form-group">
                                    <textarea name="about" class="form-control" id="" rows="5" placeholder="Enter Something About yourself"></textarea>
                                </div>
                                
                                <div class="mb-3 form-check my-3">
                                  <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1" style="border: solid black 1px">
                                  <label class="form-check-label" for="exampleCheck1">Agree Terms & Conditions</label>
                                </div>
                                
                                <div class="container text-center" id="loader" style="display:none">
                                    <span class="fa fa-circle-o-notch fa-spin fa-2x"></span>
                                    <br>
                                    Please Wait...
                                </div>
                                <div class="container text-center">
                                    <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </main>
        
        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function(){
                console.log("Loaded...")
                
                $('#reg-form').on('submit',function(event){
                    event.preventDefault();
                    
                    let form=new FormData(this);
                    
                    $("#submit-btn").hide();
                    $("#loader").show();
                    
                    //send register servlet:                   
                    $.ajax({
                       url:"RegisterServlets",
                       type:"POST",
                       data:form,
                       success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#submit-btn").show();
                        $("#loader").hide();
                        
                        if(data.trim()==='Done..'){
                       
                        swal("Registered Successfully... We are going to redirect to login page!")
                                .then((value) => {
                                  window.location="login-page.jsp"
                                });
                        }else{
                            swal(data);
                        }        
                        
                       },
                       error: function (jqXHR, textStatus, errorThrown) {
                        $("#submit-btn").show();
                        $("#loader").hide();
                        
                        swal("Something went wrong! please try again...");
                                
                       },
                       processData: false,
                       contentType: false
                    });
                    
                });
                
            });
            
        </script>
    </body>
</html>
