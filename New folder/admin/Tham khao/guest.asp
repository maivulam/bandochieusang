<%@language=JScript%>
<%
if(Session("login")!=1)Response.Redirect("admin.asp");
var conn=Server.CreateObject("ADODB.Connection");
var RS=Server.CreateObject("ADODB.Recordset");
path=Server.MapPath("/azcdrom/db/guest.mdb");
connStr="DBQ=" + path + ";Driver={Microsoft Access Driver (*.mdb)};DriverId=25;Fil=MS Access";
conn.Open(connStr); 
sql="select * from visited";
RS.Open(sql,conn,1,2); 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>All Guest Visited Website</title>
</head>
<body >
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
   [ <a href="viewmember.asp">View Member</a> |<a href="burn.asp"> CDROM burning</a>|<a href="notburn.asp">CDROM not burn </a>| Guest | <a href=""help.asp"">Help</a> ]
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
  <td><font face=verdana size=2><b>IP ADDR</b></font></td>
  <td><font face=verdana size=2><b>Browser&OS</b></font></td>
  <td><font face=verdana size=2><b>Date</b></font></td>
</tr>
<%
dem=1;
while(!RS.EOF){
if(dem%2)maunen="#dddddd";
else maunen="#ffffff";
%>
<tr bgcolor=<%=maunen%>>
  <td><font face=verdana size=2><b><%=dem%></b></font></td>
  <td><font face=verdana size=2><b><%=RS("ipaddr")%></b></font></td>
  <td><font face=verdana size=2><b><%=RS("browser")%></b></font></td>
  <td><font face=verdana size=2><b><%=RS("date")%></b></font></td>
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
