<%@page import="Model.BillPay"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Payments</title>
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
            <a href="BillPayDisplay" class="active">Bill Payments</a>
<!--            <a href="FixedDeposit.jsp">Fixed Deposits</a>-->
            <a href="HouseHoldsDisplay">Households</a>
              
             <a href="LogOutServlet">Logout</a>
        </div>
        <div class="container">
            
            <form action="BillPayServlet" method="post">
                <table class="billtypes" align="center">
                    <tr><th colspan="3" style="font-size:30px;">Bill Payments</th></tr>
                    <tr><td>Name</td><td> : </td><td>
                                <input type="hidden" name="uname" value="<%= session.getAttribute("username").toString()%>" >
                            <input type="text" name="name" >
                            <input type="hidden" id="myDate" name="date"></td>
                  
                </tr>
                <tr><td>Bill Type</td><td>:</td><td>
                        <select name="billtype" id="bill" onchange="myfunc(this)">
                            <option value="0">-----------------------------------------------------------------</option>
                            <option value="1">Prepaid</option>
                            <option value="2">Electricity</option>
                            <option value="3">Water</option>
                            <option value="4" >DTH</option>
                            <option value="5">Gas</option>
                        </select>
                    </td>
                <script>
                                var c1 =["AIRTEL","JIO","VODAFONE","BSNL"];
                                var c2 =["Reliance","HPSEB","PSPCL"];
                                var c3 =["DJB","BMC","IMC","MCJ"];
                                var c4 =["AIRTEL","TATASKY","DISHTV","FASTWAY"];
                                var c5 =["HP","Indane","BP","AGL","GGL"];
                                var x  =[c1,c2,c3,c4,c5];
                                 function myfunc(s) {
                        var bills = document.getElementById("company");
                        if (s.value > 0) {
                            var v = "";
                            for (var i = 0; i < x[s.value - 1].length; i++) {
                                v += "<option  value='" + x[s.value - 1][i] + "'>" + x[s.value - 1][i] + "</option>";
                            }
                            bills.innerHTML = v;
                        } 
                        else {
                            bills.innerHTML = "";
                        }
                    }
                                      </script>
                                      
                                      </tr>
                    <tr><td>Company</td><td>:</td><td>
                            <select id="company" name="company"></select>
                        </td></tr> 
                    <tr><td><p>Account/Mobile Number</p></td><td>:</td><td><input name="accnumber" maxlength="10" type="text"></td></tr>
                    <tr><td>Amount/Plan</td><td>:</td><td><input name="amount" type="text"></td></tr>                    
                     
                     <tr><td></td><td></td><td><button type="submit" class="button1">Submit Bill</button></td></tr>
                </table>
            </form>
            <hr><hr><hr><hr>
             <table class="dispdata" align="center">
                <tr><th>Sr No.</th><th>Name</th><th>Date</th><th>Bill Type</th><th>Company</th><th>Account/Mob Number</th><th>Ammount</th></tr>
               <%
                List <BillPay> list = (List<BillPay>)request.getSession().getAttribute("list");
                int count=1;
               
                            for(BillPay disp : list)
                {
                    %>
                   <tr><td><%=count++%></td><td>
                    <%=disp.getName()%>
                    </td><td>
                        <%=disp.getDate()%>
                    </td><td>
                        <%=disp.getBilltype()%>
                    </td><td>
                         <%=disp.getCompany()%>
                    </td><td>
                        <%=disp.getAccnumber()%>
                    </td><td>
                       <%=disp.getAmount()%>
                    </td></tr>
                   <%
                    
                    
                }
        
                      %>
               
                    
            </table>
            
            </div>

    </body>
</html>
