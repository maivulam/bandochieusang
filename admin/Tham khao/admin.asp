<%@Language="Jscript"%>
<%
 var error="";
 flag=Request("flag");
 password=Request("password")+"";
 username=Request("username")+"";
 if(password!="undefined"){
   var conn=Server.CreateObject("ADODB.Connection");
   var RS=Server.CreateObject("ADODB.Recordset");
   path=Server.MapPath("/azcdrom/db/admin.mdb");
   connStr="DBQ=" + path + ";Driver={Microsoft Access Driver (*.mdb)};DriverId=25;Fil=MS Access";
   conn.Open(connStr); 
   sql="select *from admin where password='"+password+"' AND username='"+username+"'";
   RS.Open(sql,conn,1,2);
   if(RS.EOF) {Session("login")=0;error="<font color='red'>Password or username error</font>";}
   else {  
          Session("login")=1;
         } 
   RS.close();
  }   
 
%>
<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>AZ-CDROM ADMIN </title>
</head>
<body>

<p>
<%if(Session("login")==1) {%>
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
   [<a href="viewmember.asp">View Member</a>|<a href="burn.asp">CDROM burning</a>|<a href="notburn.asp">CDROM not burn </a>|<a href="guest.asp">Guest</a>| <a href="help.asp">Help</a> ]
  </b></font>
 </td>
 <td width="20%" valign="top">
  <font face="verdana" size=2><b>
   [<a href="changepassword.asp">Change Password</a> | <a href="logout.asp">Logout</a>]
  </b></font>
 </td>
</tr>
</table>
<%} else {%>
<font face=verdana size=2><b>
<%if(error!="")Response.write(error);%>
</b></font>
<form method="POST" action="admin.asp">
 <table>
 <tr>
  <td><font face=verdana size=2><b>Username:</b></font> </td>
  <td><input type="text" name="username"></td>
 </tr>
 <tr>
  <td><font face=verdana size=2><b>Password:</b></font></td>
  <td><input type="password" name="password"></td>
 <tr>
 </table>
<input type="Submit" Value="Sign in"><br>
<%}%>
<Br>
<font face="verdana" size=1 color="#558A8B"><B> 
Copyright @ 2001 by  AZ-CDROM-Nguyen Duc Quy
</B></font>
</body>
</html>


