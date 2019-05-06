
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
        <style>
              body{
                padding: 5px;
                background-color:white;
                  margin-top:0;
                margin-left: 70px;
                margin-right: 70px;
        }
.header{
                display: flex;
                flex-wrap: wrap;
                height: 100px;
                background-color:#232f3e; 
                padding:3px;
            }
            .header a{
                text-decoration: none;
                color:white;
                font-size:40px;
                margin-left:20px;
                font-family: cursive;
            }
             .navbar{
                 margin-top: 2px;
                 display: flex;
                 background:skyblue;
             }
             .navbar a{
                 font-family: monospace;
                 font-size:20px;
                 color:white;
                 padding:15px;
                 text-decoration: none;
                 text-align: center;
                 border-right:2px solid black;
                 border-left:2px solid black;
             }
        .navbar a:hover{
            background-color:lightcyan;
            color:black;
             border-right:2px solid white;
                 border-left:2px solid white;
        }
        
        .active{
            background-color: red;
            
        }
            .container{
                padding:5px;
                 margin-top: 2px;
                 border:1px solid black;
                 height: 500px;
                display: flex;
                flex-direction: row;
                flex-wrap: wrap
                
            }
        </style>
    </head>
    <body>
        <div class="header">
            <a href="Homepage.jsp">MeraPaisa</a>
            
        </div>
        <div class="navbar">
            <a href="Homepage.jsp" class="active">Home</a>
            <a href="DashboardServlet">My Account</a>
            <a href="BillPayDisplay">Bill Payments</a>
<!--        <a href="FixedDeposit.jsp">Fixed Deposits</a>-->
            <a href="HouseHoldsDisplay">Households</a>
                 
            <a href="LogOutServlet">Logout</a>
        </div>
        <div class="container">
           welcome,<%= session.getAttribute("username").toString() %>
            </div>
       
    </body>
</html>
