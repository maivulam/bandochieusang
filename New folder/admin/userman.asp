<%@language="jscript" CODEPAGE="65001"%>
<%
 var message="";
 username=Request("username")+"";
 oldpw=Request("oldpw")+"";
 newpw1=Request("newpw1")+"";
 newpw2=Request("newpw2")+"";
 //Compare data
if(username!=""&&username!="undefined"){ 
  var conn=Server.CreateObject("ADODB.Connection");
  var RS=Server.CreateObject("ADODB.Recordset");
  path=Server.MapPath("/cs6/db/admin.mdb");
  connStr="DBQ=" + path + ";Driver={Microsoft Access Driver (*.mdb)};DriverId=25;Fil=MS Access";
  conn.Open(connStr); 
  sql="select * from admin where username='"+username+"'";
  RS.Open(sql,conn,1,2);
  if(!RS.EOF){
   if(newpw1==newpw2&&newpw1!=""){
    RS("password")=newpw1; 
    RS.Update();
    message+="<br>Mật khẩu đã được thay đổi"; 
   }
   else message+="<br>Mật khẩu mới không hợp lệ"; 
  }
  else message+="<br>Mật khẩu cũ không đúng";
  RS.close();
 }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="GENERATOR" content="Microsoft FrontPage 12.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Change password</title>
</head>
<body>
<form  method="POST" action="userman.asp">
	<table>
		<tr>
		 <td>Tên đăng nhập</td> 
		 <td><input type="hidden" name="username" size="10" value="<%=Session("username")%>"><b><%=Session("username")%></b></td>
		</tr>
		<tr>
		 <td>Mật khẩu cũ</td> 
		 <td><input type="password" name="oldpw" size="10"></td>
		</tr>
		<tr>
		 <td>Mật khẩu mới</td> 
		 <td><input type="password" name="newpw1" size="10"></td>
		</tr>
		<tr>
		 <td>Nhập lại mật khẩu mới</td> 
		 <td><input type="password" name="newpw2" size="10"></td>
		</tr>
		<tr>
		 <td colspan="4"><input type="submit" value="Đổi mật khẩu"></td> 
		</tr>
	</table>
<font face="vedana" size=2 color="red"><b><%=message%></b></font>
<br>
<p><font color="#FF0000"><i>@29.3.2011 http://www.bandochieusang.com. Bản đồ nền 
được cung cấp bởi Google<br>
Trang web được thiết kế và phát triển bởi Nguyễn Đức Quý, ĐT : 0903.11.89.11
</i></font></p>
</B></font>
</body>
</html>