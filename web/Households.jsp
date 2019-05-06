<%@page import="Model.HouseHolds"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HouseHolds</title>
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
                 
               
                
            }
            .billtypes {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 50%;
  border:none;
 
}
      .dispdata{
          
          margin-top: 20px;
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 80%;
  border:none;
 
}
            .dispdata td,.dispdata th,.billtypes td,.billtypes th {
/*  border: 1px solid #ddd;*/
  padding: 8px;
  text-align: center;
  
}
           .dispdata tr, .billtypes tr:nth-child(even){background-color: lightblue;}
            
            .dispdata th,.billtypes th {
  padding-top: 12px;
  padding-bottom: 12px;
  
  text-align:center;
  background-color: grey;
  color: white;
  
}  
select, input{
    width:300px;
    height:30px;
    padding:0;
    border-radius:5px;
}
 .button1{
     width:300px;
    height:30px;
                color:white;
                background-color:darkgreen;
                font-family: courier new;
                border:none;
                font-size: 25px;
                cursor:pointer;
                border-radius:5px;
				
            }
            .button1:focus{
                outline:0;
            }
            .button1:hover{
                color:black;
                background-color:red;
            }
            .button1:active {
                background-color: red;
                box-shadow: 0 5px #666;
                transform: translateY(4px);
}
    </style>

    </head>
    <body onload="SetDate();">
        
        <div class="header">
            <a href="DashboardServlet">Personal Accounting</a>
        </div>
        <div class="navbar">
<!--            <a href="Homepage.jsp" >Home</a>-->
            <a href="DashboardServlet">My Account</a>
            <a href="BillPayDisplay">Bill Payments</a>
<!--            <a href="FixedDeposit.jsp">Fixed Deposits</a>-->
            <a href="HouseHoldsDisplay" class="active">Households</a>
               
             <a href="LogOutServlet">Logout</a>
        </div>
        <div class="container">
            <form action="HouseHoldsServlet" method="post">
                <table align="center" class="billtypes">
                    <tr><th style="font-size:30px;" colspan="3">HouseHolds</th></tr>
                    <tr><td>Name</td><td>:</td><td>
                            <input type="text" name="name">
                            <input type="hidden" name="uname" value="<%= session.getAttribute("username").toString()%>" >
                            <input type="hidden" id="myDate" name="date"></td>
                   <script type="text/javascript">
                       function SetDate()
                       {
                           var date = new Date();
                           var day = date.getDate();
                           var month = date.getMonth() + 1;
                           var year = date.getFullYear();
                           if (month < 10) month = "0" + month;
                           if (day < 10) day = "0" + day;
                           var today = year + "-" + month + "-" + day;
                           document.getElementById('myDate').value = today;
                       }
                                          </script>
                </tr>
                        <tr><td>Payment Type</td><td>:</td><td>
                                <select name="paytype" >
                                    <option value="">------------------------------------------------------</option>
                                    <option value="Rent">Rent</option>
                                    <option value="Groceries">Groceries</option>
                                    <option value="Maintainance">Maintainance</option>
                                    <option value="meds">Meds</option>
                                    <option value="cargas">Car Gas</option>
                                </select>
                    </td></tr>
                         <tr><td>Mode Of Payment</td><td>:</td><td>
                                <select name="mop" >
                                    <option value="">------------------------------------------------------</option>
                                    <option value="cash">Cash</option>
                                    <option value="paytm">Paytm</option>
                                    <option value="card">Card</option>
                                    <option value="udhar">Udhar</option>
                                 
                                </select>
                    </td></tr>
                        <tr><td>Ammount</td><td>:</td><td><input type="text" name="amount"></td></tr>
                        <tr><td>Place</td><td>:</td><td><input type="text" name="place"></td></tr>
                    <tr><td></td><td></td><td><button type="submit" class="button1">Submit Bill</button></td></tr>
                </table>
            </form>
            <hr><hr><hr><hr>
            <table class="dispdata" align="center">
                <tr><th>Sr No.</th><th>Name</th><th>Date</th><th>Payment Type</th><th>MOP</th><th>Ammount</th><th>Place</th></tr>
              
                 <%
                List <HouseHolds> list = (List<HouseHolds>)request.getSession().getAttribute("list");
                int count=1;
                 
                            for(HouseHolds disp : list)
                {
                      %>
                <tr><td><%=count++%></td><td>
                     <%=disp.getName()%>
                    </td><td>
                        <%=disp.getDate()%>
                    </td><td>
                        <%=disp.getPaytype()%>
                    </td><td>
                        <%=disp.getMop()%>
                    </td><td>
                        <%=disp.getAmount()%>
                    </td><td>
                         <%=disp.getPlace()%>
                    </td></tr>
                    <%                  
                    
                }
                     
                
                      %>
            </table>
            </div>
       
    </body>
</html>
