<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.BillPay"%>
<%@page import="java.util.List"%>
<%@page import="Model.DataBaseData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
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
           
                display: flex;
                flex-direction: row;
                flex-wrap: wrap
                
            }
      
        div.container-left{
            padding: 5px;
            flex:1;
          
            
            
        }.container-right{
            
           flex:3; 
          
        }
         .account{
            height: 350px;
            width:100%;
 border:1px solid black;
        
            
        }
        .balance{
           
            width:100%;
           border:1px solid black;
            
        }
        .transaction{
            height: 350px;
            width:100%;
             border:1px solid black;
        }
        .btn-group button{
                background-color:#E6E6FA; 
                border: 1px white;
                color: black;
                font-size:20px;
                font-family:monospace;
                padding: 20px 30px;
                cursor: pointer;
                width: 100%;
                display: block;
                transition: 0.5s;
               
                
               
            }
            .btn-group button:not(:last-child) {
                border-bottom:5px solid white; /* Prevent double borders */
            }
            .btn-group button:hover {
                background-color: #FFDEAD;
                border-bottom: 3px solid black;
                
               
                font-size:20px;
                transition: 0.5s;
            }
            *:focus {
                outline: 0 !important;
            }
            .trans {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  border:none;
}
            .trans td,.trans th {
  
  padding: 8px;
  
}
            .trans tr:nth-child(even){background-color: lightblue;}
            
            .trans th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align:center;
  background-color: grey;
  color: white;
  
}  
   
            </style>

    </head>
    <body>
        
          <%
    List <DataBaseData> list = (List<DataBaseData>) request.getSession().getAttribute("list");
    try
    {
        if(list==null)
        {
            System.out.println(list);
        }
        else
        { 
            for(DataBaseData Disp :list)
            {
                
            %>
        
        <div class="header" >
            <a href="DashboardServlet">Personal Accounting</a>
        </div>
        <div class="navbar" >
<!--            <a href="Homepage.jsp" >Home</a>-->
            <a href="DashboardServlet" class="active">My Account</a>
            <a href="BillPayDisplay">Bill Payments</a>
<!--            <a href="FixedDeposit.jsp">Fixed Deposits</a>-->
            <a href="HouseHoldsDisplay">Households</a>
                    
           <a href="LogOutServlet">Logout</a>
        </div>
        <div class="container">
            <div class="container-left">
                <div class="btn-group" style="position: -webkit-sticky;position: sticky;top: 0;"> 
                     <button  onclick="location.href='#accountdiv'">Account</button>
                     <button  onclick="location.href='#balancediv'">Balance</button>
                     
                     
                 </div>
            </div>
            <div class="container-right">
                <div class="account" id="accountdiv">
                    <table class="trans" align="center">
                    <tr><th colspan="3" style="font-size:30px;">Account</th></tr>
                    <tr><td>Name</td><td>:</td><td><%out.println(Disp.getName());%></td></tr>
                    <tr><td>Number</td><td>:</td><td><%out.println(Disp.getNumber());%></td></tr>
                    <tr><td>E-mail</td><td>:</td><td><%out.println(Disp.getEmail());%></td></tr>
                    <tr><td>Address</td><td>:</td><td><%out.println(Disp.getAddress());%></td></tr>
                    <tr><td>Yearly Incomes</td><td>:</td><td><%out.println(Disp.getIncome());%></td></tr>
                   
                </table> 
            </div>
                   <%  }    }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>

<%
     HttpSession sessioni = request.getSession();
     String usr= sessioni.getAttribute("username").toString();
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/account?useSSL=false";
String userId = "root";
String password = "qwerty@";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
                <div class="balance" id="balancediv">
                    <table class="trans" align="center">
                        <tr><th colspan="5" style="font-size:30px;">Amounts</th></tr>
                        <tr style="border: 1px solid #ddd;"><th>Name</th><th></th><th></th><th>Total Amounts</th></tr>
                        <%
                          try {
                              
                            connection = DriverManager.getConnection(
                            connectionUrl, userId, password);
                            statement = connection.createStatement();
                            String sql = "SELECT SUM(amount) as total FROM billpay where uname='" + usr +"'";
                            
                            resultSet = statement.executeQuery(sql);
                             while (resultSet.next()) {
                            %>
                        <tr><td>Bill Payments</td><td></td><td>:</td><td><%=resultSet.getString("total")%></td></tr>
                        <%
}

} catch (Exception e) {
e.printStackTrace();
}
%>
<%
                          try {
                              
                            connection = DriverManager.getConnection(
                            connectionUrl, userId, password);
                            statement = connection.createStatement();
                            String sql = "SELECT SUM(amount) as total FROM households where uname='" + usr +"'";
                            
                            resultSet = statement.executeQuery(sql);
                             while (resultSet.next()) {
                            %>
                          <tr><td>HouseHolds</td><td></td><td>:</td><td><%=resultSet.getString("total")%></td></tr>
                          <%
}

} catch (Exception e) {
e.printStackTrace();
}
%>
                            
                    </table>
                </div>
                 

            </div>
            </div>
       
    </body>
</html>
