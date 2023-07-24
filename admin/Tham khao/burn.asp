<%@language=JScript%>
<!--#INCLUDE FILE="khaibaogiaodich.txt" -->
<%
///Test password
if(Session("login")!=1)Response.Redirect("admin.asp");
sql="select * from cdrom where xongcdr=1";
RS.Open(sql,conn,1,2);
%>
<html>
<head>
<SCRIPT LANGUAGE="JAVASCRIPT">
<!--
  function viewcdrom(ma){
  window.open("viewcdrom.asp?id="+ma+"",'winpopup','height=400,width=700,menubar=yes,scrollbars=yes,status=no,toolbar=no,screenX=100,screenY=0,left100,top=0');
 }  
//-->
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>All CDROM burn now</title>
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
   [ <a href="viewmember.asp">View Member</a> | CDROM burning|<a href="notburn.asp">CDROM not burn </a>|<a href="guest.asp">Guest</a>| <a href="help.asp">Help</a> ]
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
  <td><font face=verdana size=2><b>Name</b></font></td>
  <td><font face=verdana size=2><b>ID member</b></font></td>
  <td><font face=verdana size=2><b>Sum</b></font></td>
  <td><font face=verdana size=2><b>Comments</b></font></td>
  <td><font face=verdana size=2><b>Date Select</b></font></td>
  <td><font face=verdana size=2><b>Finish</b></font></td>
</tr>
<%
dem=1;
while(!RS.EOF){
if(dem%2)maunen="#dddddd";
else maunen="#ffffff";
%>
<tr bgcolor=<%=maunen%>>
  <td><font face=verdana size=2><b><%=dem%></b></font></td>
  <td><font face=verdana size=2><b><a href="javascript:viewcdrom('<%=RS('macdr')+''%>')"><%=RS("tencdr")%></b></font></td>
  <td><font face=verdana size=2><b><%=RS("matv")%></b></font></td>
  <td><font face=verdana size=2><b><%=RS("slcdr")%></b></font></td>
  <td><font face=verdana size=2><b><%=RS("ghichucdr")%></b></font></td>
  <td><font face=verdana size=2><b><%=RS("tgghicdr")%></b></font></td>
  <td><font face=verdana size=2><b><a href="finish.asp?id=<%=RS("macdr")+""%>">Finish</a></b></font></td>

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
