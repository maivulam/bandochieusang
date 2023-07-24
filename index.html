<%@language="jscript" CODEPAGE="65001"%>
<%
 var error="";
 password=Request("password")+"";
 username=Request("username")+"";
 if(password!="undefined"){
   var conn=Server.CreateObject("ADODB.Connection");
   var RS=Server.CreateObject("ADODB.Recordset");
   path=Server.MapPath("/db/admin.mdb");  //bo "/db" vi dia website vao thu muc CS4, co quan ly nguoi dung rieng
   connStr="DBQ=" + path + ";Driver={Microsoft Access Driver (*.mdb)}";
   conn.Open(connStr);    
   sql="select *from admin where username='"+username+"'"; //AND  password='"+password+"'
   RS.Open(sql,conn,1,2);
   if (RS.EOF) error="<br><font color='red'>Bạn đã nhập tên đăng nhập không chính xác</font>";
   while (!RS.EOF && error=="")  // while khi có nhiều username cùng tên nhưng có phân biệt hoa thường
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ban do chieu sang cong cong</title>
    <style type="text/css">
        .auto-style1 {
            height: 52px;
        }
        #table1 {
            height: 52px;
        }
    </style>
</head>
<body>
<%if(Session("logincs6")==1) {%>
	<font size="5"><b>BẢN ĐỒ HỆ THỐNG CHIẾU SÁNG CÔNG CỘNG </b></font>
		<table border="0" width="100%" id="table1">
			<tr>
				<td valign="top" align="left" width="310" class="auto-style1">
				<form action="menu_search.asp" target = "menu" method="get" style="width: 425px">
					<input type="text" name="timkiem"  maxlength="75" size="20" />
						<select name="kv">
							<option value="quan12">Quận 12</option>
							<option value="quangovap">Quận Gò Vấp</option>
							<option value="quantanbinh">Quận Tân Bình</option>
							<option value="quantanphu">Quận Tân Phú</option>
						</select> 
					<input type="submit" value="Tìm" style="width: 83px" />
					<br>
					<input type="radio"  name="loaitimkiem" checked="checked" value="tentdk" />Tên tủ điều khiển
					<input type="radio"  name="loaitimkiem" value="tenduong" />Tên đường&nbsp;
					<input type="radio"  name="loaitimkiem" value="tenduong1" /> Người vận hành</form>
				</td>
				<td valign="top" align="left" class="auto-style1">
				<font size="3">Liệt kêt theo Quận <a href="menu_list.asp?kv=quan12" target="menu">Quận 12</a>, <a href="menu_list.asp?kv=quangovap" target="menu">Quận GV</a>, <a href="menu_list.asp?kv=quantânphu" target="menu">Quận Tân Phú</a>, <a href="menu_list.asp?kv=quantanbinh" target="menu">Quận Tân Bình</a></font><br> 
				    <br />
				</td>
				<td  valign="top" align="right" class="auto-style1">Người đăng nhập <b><a href="admin/userman.asp"><%=Session("username")%></a></b> --<a href="logout.asp">Thoát</a><br>
				<a href="mobile/index.asp">Phiên bản mobile</a>
				</td>
			</tr>
		</table>
		
<iframe name="menu" src="menu_list.asp" border="0" frameborder="0" scrolling="yes" align="top" style="width: 22%; height: 84%">
Your browser does not support inline frames or is currently configured not to display inline frames.
</iframe>
<iframe name="display" height="90%" src="display.asp" scrolling="no" border="0" frameborder="0" align="top" style="width: 77%">
Your browser does not support inline frames or is currently configured not to display inline frames.
</iframe>
<%} else {%>
<br>
<font size="5"><b>BẢN ĐỒ CHIẾU SÁNG CÔNG CỘNG </b></font>
<font face=verdana size=2><b><%if(error!="")Response.write(error);%>
</b></font>
<form method="POST" action="index.asp">
 <table>
 <tr>
  <td><font face=verdana size=2><b>Tên đăng nhập:</b></font> </td>
  <td><input type="text" name="username" size="25"></td>
 </tr>
 <tr>
  <td><font face=verdana size=2><b>Mật khẩu:</b></font></td>
  <td><input type="password" name="password" size="25"></td>
 <tr>
 </table>
<input type="Submit" Value="Đăng nhập"><br>
<strong>I/ Chức năng chính <br></strong>
+ Xác định vị trí tủ điều khiển, đèn trên bản đồ.<br>
+ Dẫn đường đến tủ điều khiển từ các vị trí đặc biệt và từ vị trí hiện tại. <br>
+ Cập nhật thông tin cơ bản về tủ điều khiển, đèn.<br>

<%}%>
<p><font color="#FF0000"><i>@ Chiếu sáng khu vực Bắc - Công ty cổ phần Chiếu sáng công cộng TpHCM<br>
Mọi ý kiến đóng góp xin vui lòng gửi tới : <a href="mvulam@gmail.com"></a>mvulam@gmail.com</i></font></p>
</body>

</html>