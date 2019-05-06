<%-- 
    Document   : AccSignUp
    Created on : Apr 11, 2019, 3:22:23 PM
    Author     : Abhinav Thakur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up For A New Account</title>
        <style>
            body{
                margin: 0;
                background-image: url('bank.jpg');
                height: 100vh;
                background-size: cover;
                background-position: center;
                overflow: scroll;
            }
/*            .loginn{
                border-radius: 10px;
                background-color: lightgrey;
                height: 500px;
                width: 300px;
                margin-top: 50px;
                margin-left: 40%;
            }*/
            table, th, td{
       border: 1px solid black;
        margin: auto;
        margin-top: 70px;
        height: 70px;
        width: 300px;
        color: white;
        background: rgb(0, 0, 0, 0.5);
    }
    table{
        border-radius: 10px;
    }
    th, td{
        padding: 10px 20px;
    }
    input{
        border-radius: 10px;
        background-color: lightgrey;
        padding: 5px;
    }
    a:active{
        color: blue;
    }
    a:visited{
        color:blue;
    }
    a:hover{
        color:red;
    }
    button{
        margin-left: 38%;
        font-family:monospace;
        background-color: blue;
        border: 0px;
        border-radius: 10px;
        padding: 7px 14px;
        font-weight: bold;
        font-size: 15px;
    }
    button:hover{
        box-shadow: 0px 0px 15px lightgrey;
    }
        </style>
    </head>
    <body>
        <div class="main">
            <div class="loginn">
                <form name="signform" onsubmit="return validity()" action="SignupServlet" method="post">
                    <table><tr style="padding: 0px;"><th  style="padding: 0px;" colspan="2"><h1 style="font-family:monospace">Account SignUp</h1></th></tr>
                        <tr> <td><h3 style="font-family:monospace">  Name: </h3></td><td><input type="text" placeholder="Enter Name" name="name"></td></tr>
                        <tr> <td><h3 style="font-family:monospace">  Username:</h3> </td><td><input type="text" placeholder="Enter Username" name="uname"></td></tr>
                        <tr> <td><h3 style="font-family:monospace">  Contact:</h3> </td><td><input type="text" placeholder="Enter Contact Number" name="phone"></td></tr>
                        <tr> <td><h3 style="font-family:monospace">  email:</h3> </td><td><input type="email" placeholder="Enter Email Id" name="email"></td></tr>
                        <tr> <td><h3 style="font-family:monospace">  yearly Income:</h3> </td><td><input type="text" placeholder="Enter Yearly Income" name="income"></td></tr>
                        <tr> <td><h3 style="font-family:monospace">  Address:</h3> </td><td><input type="text" placeholder="Enter Address" name="addr"></td></tr>
                        <tr> <td><h3 style="font-family:monospace">  Password:</h3> </td><td><input type="password" placeholder="Enter Password" name="pwd"></td></tr>
                        <tr> <td><h3 style="font-family:monospace">  Confirm Password:</h3> </td><td><input type="password" placeholder="Confirm Password" name="cpwd"></td></tr>                        
                        <tr style="padding: 0px;"><td colspan="2" style="padding: 0px;"><button type="submit">Sign-Up</button></td></tr>
                        <tr style="padding: 0px;"><td style="padding: 0px;" colspan="2"><a style="margin-left: 40%;" href="AccLoginPage.jsp">Already Have Account? Sign In</a></td></tr>
                    </table>
                </form>
            </div>
        </div>
         <script type="text/javascript">
            function validity(){
                var flag = true;
                var val1 = document.forms["signform"]["name"].value;
                if(val1===""){
                    alert('Enter Name!');
                    flag=false;
                }
                var val2 = document.forms["signform"]["uname"].value;
                if(val2===""){
                    alert('Enter Username!');
                    flag=false;
                }
                var val3 = document.forms["signform"]["phone"].value;
                if(val3===""){
                    alert('Enter Contact Number!');
                    flag=false;
                }
                 var val7 = document.forms["signform"]["email"].value;
                if(val7===""){
                    alert('Enter Email Id!');
                    flag=false;
                }
                 var val8 = document.forms["signform"]["income"].value;
                if(val8===""){
                    alert('Enter Yearly Income!');
                    flag=false;
                }
                var val4 = document.forms["signform"]["addr"].value;
                if(val4===""){
                    alert('Enter Address!');
                    flag=false;
                }
                var val5 = document.forms["signform"]["pwd"].value;
                if(val5===""){
                    alert('Password Field Empty!');
                    flag=false;
                }
                var val6 = document.forms["signform"]["cpwd"].value;
                if(val6===""){
                    alert('Confirm Password Field Empty!');
                    flag=false;
                }
                var p1=document.forms["signform"]["pwd"].value;
                var p2=document.forms["signform"]["cpwd"].value;
                if(p1!==p2){
                    alert('Passwords Entered Are Different!');
                    flag=false;
                }
                return flag;
            }
        </script>
    </body>
</html>
