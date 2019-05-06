

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login To Your Account</title>
        <style>
            body{
                margin: 0;
                background-image: url('bank.jpg');
                height: 100vh;
                background-size: cover;
                background-position: center;
                overflow: hidden;
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
        padding: 7px;
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
                <form action="LoginServlet" method="post">
                    <table><tr style="padding: 0px;"><th  style="padding: 0px;" colspan="2"><h1 style="font-family:monospace">Account Login</h1></th></tr>
                        <tr> <td><h3 style="font-family:monospace">  Username: </h3></td><td><input type="text" placeholder="Enter Username" name="uname"></td></tr>
                        <tr> <td><h3 style="font-family:monospace">  Password:</h3> </td><td><input type="password" placeholder="Enter Password" name="pwd"></td></tr>
                        <tr style="padding: 0px;"><td colspan="2" style="padding: 0px;"><button type="submit">Sign-In</button></td></tr>
                        <tr style="padding: 0px;"><td style="padding: 0px;" colspan="2"><a style="margin-left: 60%;" href="AccSignUp.jsp">New? Register Now</a></td></tr>
                    </table>
                </form>
                <form>
                <table>
                    <tr style="padding: 0px;"><th  style="padding: 0px;"><h1 style="font-family:monospace">Language: </h1></th><th><select name="lang" onchange="location = this.value;"><option value="AccLoginPage.jsp" selected>English</option><option value="AccLoginPagePunjabi.jsp">ਪੰਜਾਬੀ</option><option value="AccLoginPageHindi.jsp">हिंदी</option></select></th></tr>
                </table>
                </form>
            </div>
        </div>
    </body>
</html>
