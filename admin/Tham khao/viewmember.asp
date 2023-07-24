<%@language=JScript%>
<!--#INCLUDE FILE="khaibaogiaodich.txt" -->
<%
///Test password
if(Session("login")!=1)Response.Redirect("admin.asp");
sql="select * from thanhvien";
RS.Open(sql,conn,1,2);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>View all member</title>
</head>
<body>
<table width="100%" border=0 bgcolor="#ccccff">
<tr>
 <td width="40%" valign="top">
  <font face="verdana" size=2><b>
   [<a href="addmp3.asp">Add mp3</a> | <a href="addmp4.asp">Add mp4</a> | <a href="addsoftware.asp">Add Software</a> 
    |<a href="viewmp3.asp">Update mp3</a>|<a href="viewmp4.asp">Update mp4</a>|<a href="viewsoftware.asp">Update software</a>]
   </b></font>
 </td>
 <td width="40%" valign="top">
  <font face="verdana" size=2><b>
   [ View Member |<a href="burn.asp">CDROM burning</a>|<a href="notburn.asp">CDROM not burn </a>|<a href="guest.asp">Guest</a>| <a href="help.asp">Help</a> ]
  </b></font>
 </td>
 <td width="20%" valign="top">
  <font face="verdana" size=2><b>
   [<a href="changepassword.asp">Change Password</a> | <a href="logout.asp">Logout</a>]
  </b></font>
 </td>
</tr>
</table>
<table width="100%" border=1 >
<tr bgcolor="#7777ff">
  <td><font face=verdana size=2><b>Nr</b></font></td>
  <td><font face=verdana size=2><b>ID</b></font></td>
  <td><font face=verdana size=2><b>Email</b></font></td>
  <td><font face=verdana size=2><b>Pwd</b></font></td>
  <td><font face=verdana size=2><b>Name</b></font></td>
  <td><font face=verdana size=2><b>Member type</b></font></td>
  <td><font face=verdana size=2><b>Address</b></font></td>
  <td><font face=verdana size=2><b>Tel</b></font></td>
  <td><font face=verdana size=2><b>VND</b></font></td>
  <td><font face=verdana size=2><b>USD</b></font></td>
  <td><font face=verdana size=2><b>Del</b></font></td>
</tr>
<%
dem=1;
while(!RS.EOF){
if(dem%2)maunen="#dddddd";
else maunen="#ffffff";
%>
<tr bgcolor=<%=maunen%>>
  <td><font face=verdana size=2><b><%=dem%></b></font></td>
  <td><font face=verdana size=2><b><%=RS("matv")%></b></font></td>
  <td><font face=verdana size=2><b><%=RS("emailtv")%></b></font></td>
  <td><font face=verdana size=2><b><%=RS("pwdtv")%></b></font></td>
  <td><font face=verdana size=2><b><%=RS("tentv")%></b></font></td>
  <td><font face=verdana size=2><b><%=RS("loaitv")%></b></font></td>
  <td><font face=verdana size=2><b><%=RS("dctv")%></b></font></td>
  <td><font face=verdana size=2><b><%=RS("dttv")%></b></font></td>
  <td><font face=verdana size=2><b><%=RS("vndtv")%></b></font></td>
  <td><font face=verdana size=2><b><%=RS("usdtv")%></b></font></td>
  <td><font face=verdana size=2><b><a href="delmember.asp?id=<%=RS("matv")+""%>">Del</a></b></font></td>
</tr>
<%
 dem++;
 RS.MoveNext(); 
}
 RS.close();
%>
</table>
<font face="verdana" size=1 color="#558A8B"><B> 
Copyright @ 2001 by  AZ-CDROM-Nguyen Duc Quy
</B></font>
</body>
</html>
