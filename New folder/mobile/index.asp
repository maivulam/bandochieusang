<%@language="jscript" CODEPAGE=65001%>
<%
 var error="";
 flag=Request("flag");
 password=Request("password")+"";
 username=Request("username")+"";
 if(password!="undefined"){
   var conn=Server.CreateObject("ADODB.Connection");
   var RS=Server.CreateObject("ADODB.Recordset");
   path=Server.MapPath("/db/admin.mdb");
   connStr="DBQ=" + path + ";Driver={Microsoft Access Driver (*.mdb)}";
   conn.Open(connStr);    
   sql="select *from admin where username='"+username+"'";
   RS.Open(sql,conn,1,2);
   if (RS.EOF) error="<br><font color='red'> Bạn đã nhập tên đăng nhập không chính xác</font>";
   while (!RS.EOF && error=="")  // while khi cÃ³ nhiá»u username cÃ¹ng tÃªn nhÆ°ng cÃ³ phÃ¢n biá»‡t hoa thÆ°á»ng
       {
           if ((RS("username")==username) && (RS("password")==password))
           {
           	Session("logincs6")=1;
          	Session("name")=RS("name")+"";
          	Session("username")=RS("username")+"";
          	Session("level")=RS("level")+"";
          	Session("count")=1;
           }
           else
           {
            Session("logincs6")=0;
            error="<br><font color='red'>Bạn đã nhập mật khẩu không chính xác</font>";
           }
       RS.MoveNext();
       }
    RS.Close();
 }      
 ////XU LY PHAN THU THAP THONG TIN 
if (Session("logincs6")==1&&Session("count")==1){    
   ip=Request.ServerVariables("REMOTE_ADDR")+"";
   bws=Request.ServerVariables("HTTP_USER_AGENT")+"";
   var hientai=new Date();
   shientai=hientai.toLocaleString();
   //
   var conn=Server.CreateObject("ADODB.Connection");
   var RStam=Server.CreateObject("ADODB.Recordset");
   path=Server.MapPath("/db/guest.mdb");
   connStr="DBQ=" + path + ";Driver={Microsoft Access Driver (*.mdb)}";
   conn.Open(connStr);    
   sql="select * from visited";
   RStam.Open(sql,conn,1,2); 
   RStam.Addnew();
   RStam.Fields("username")=Session("username");
   RStam.Fields("ipaddr")=ip;
   RStam.Fields("bws")=bws;
   RStam.Fields("date")=shientai;
   RStam.Update();
   RStam.close();
   Session("count")=0;
 }
%>
<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ban do chieu sang mobile</title>
</head>
<%if(Session("logincs6")==1) {%>
	<font size="4"><b>BẢN ĐỒ CHIẾU SÁNG CÔNG CỘNG </b></font>
		<table border="0" width="500" id="table1" height="70">
			<tr>
				<td valign="top" align="left" width="310">
				<form action="display.asp" target = "display" method="get">
					<input type="text" name="timkiem"  maxlength="75" size="14" />
						<select name="khuvuc">
							<option value="quan12">Quận 12</option>
							<option value="quangovap">Quận Gò Vấp</option>
							<option value="quanbinhthanh">Quận Bình Thạnh</option>
						
						</select> 
					<input type="submit" value="Tìm" />
					<br>
					<input type="radio"  name="loaitimkiem" checked="checked" value="tentdk" />Tên tủ điều khiển
					<input type="radio"  name="loaitimkiem" value="tentdk" />Tên đường
				</form>
				<td  valign="top" align="right"><b><%=Session("username")%></b> --><a href="logout.asp">Thoát</a><br>
				<a href="/index.asp">Phiên bản PC</a>
				</td>
			</tr>
		</table>
<iframe name="menu" width="25%" height="700" src="menu_list.asp" border="0" frameborder="0" scrolling="yes" align="top">
Your browser does not support inline frames or is currently configured not to display inline frames.
</iframe>
<iframe name="display" width="70%" height="700" src="display.asp" scrolling="no" border="0" frameborder="0" align="top">
Your browser does not support inline frames or is currently configured not to display inline frames.
</iframe>
<%} else {%><br>
<font size="4"><b>BẢN ĐỒ CHIẾU SÁNG CÔNG CỘNG  </b></font>
<font face=verdana size=2><b>
<%if(error!="")Response.write(error);%>
</b></font>
<form method="POST" action="index.asp">
 <table>
 <tr>
  <td><font face=verdana size=2><b>Username:</b></font> </td>
  <td><input type="text" name="username" size="25"></td>
 </tr>
 <tr>
  <td><font face=verdana size=2><b>Password:</b></font></td>
  <td><input type="password" name="password" size="25"></td>
 <tr>
 </table>
<input type="Submit" Value="Đăng nhập"><br>
<%}%>

<p><font color="#FF0000"> <i>
(@) 2015 Online:<%Response.Write(Application("visitors"))%>

</i></font></p>
</body>

</html>