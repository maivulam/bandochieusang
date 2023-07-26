<%@language=JScript%>
<!--#INCLUDE FILE="khaibaocdrom.txt" -->
<%
///Test password
if(Session("login")!=1)Response.Redirect("admin.asp");
var ktloai=0;ktnn=0;ktkey=0;
loaimp3=Request("loaimp3")+"";
nnmp3=Request("nnmp3")+"";
keyword=Request("keyword")+"";
if(loaimp3!="undefined"&&loaimp3!="all")ktloai=1;
if(nnmp3!="undefined"&&nnmp3!="all")ktnn=1;
if(keyword!="undefined"&&keyword!="keyword")ktkey=1;
///Tao sql
if(ktloai==1&&ktnn==0&&ktkey==0)sql="select * from mp3 where loaimp3='"+loaimp3+"'";
if(ktloai==0&&ktnn==1&&ktkey==0)sql="select * from mp3 where nnmp3='"+nnmp3+"'ORDER BY loaimp3";
if(ktloai==0&&ktnn==0&&ktkey==1)sql="select * from mp3 where tenmp3 like '%"+keyword+"%' OR tencsmp3 like '%"+keyword+"%'OR tennsmp3 like '%"+keyword+"%' ORDER BY loaimp3";
if(ktloai==0&&ktnn==1&&ktkey==1)sql="select * from mp3 where nnmp3='"+nnmp3+"' AND (tenmp3 like '%"+keyword+"%'OR tencsmp3 like '%"+keyword+"%'OR tennsnmp3 like '%"+keyword+"%')ORDER BY loaimp3";
if(ktloai==1&&ktnn==0&&ktkey==1)sql="select * from mp3 where loaimp3='"+loaimp3+"' AND (tenmp3 like '%"+keyword+"%'OR tencsmp3 like '%"+keyword+"%'OR tennsmp3 like '%"+keyword+"%')";
if(ktloai==1&&ktnn==1&&ktkey==0)sql="select * from mp3 where loaimp3='"+loaimp3+"'AND nnmp3='"+nnmp3+"'";
if(ktloai==1&&ktnn==1&&ktkey==1)sql="select * from mp3 where loaimp3='"+loaimp3+"' AND nnmp3='"+nnmp3+"' AND (tenmp3 like '%"+keyword+"%'OR tencsmp3 like '%"+keyword+"%'OR tennsmp3 like '%"+keyword+"%')";
if(ktloai+ktnn+ktkey>0)RS.Open(sql,conn,1,2);  
////
function selectmp3(){
 var tam=""; 
 var RStam=Server.CreateObject("ADODB.Recordset");
     sqltam="select * from mp3 where loaimp3<>null ORDER BY loaimp3";
     RStam.Open(sqltam,conn,1,2);
 Response.write("<select size=1 name='loaimp3'>\n");
 Response.write("<option value='all'>Category</option>\n");
  while(!RStam.EOF){
    if(tam!=(RStam('loaimp3')+""))Response.write("<option value='"+RStam('loaimp3')+"'>"+RStam('loaimp3')+"</option>\n");
    tam=RStam('loaimp3')+"";
    RStam.MoveNext();
 } 
 Response.write("</select>\n");
 RStam.close();
}
 function selectlanguage(){
 var tam=""; 
 var RStam=Server.CreateObject("ADODB.Recordset");
     sqltam="select * from mp3 where nnmp3<>null ORDER BY nnmp3";
     RStam.Open(sqltam,conn,1,2);
 Response.write("<select size=1 name='nnmp3'>\n");
 Response.write("<option value='all'>Language</option>\n");
   while(!RStam.EOF){
     if(tam!=(RStam('nnmp3')+""))Response.write("<option value='"+RStam('nnmp3')+"'>"+RStam('nnmp3')+"</option>\n");
     tam=(RStam('nnmp3')+"");
     RStam.MoveNext();
  } 
  
 Response.write("</select>\n");
 RStam.close();
 }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Report mp3</title>
</head>
<body>
<table width="100%" border=0 bgcolor="#ccccff">
<tr>
 <td width="40%" valign="top">
  <font face="verdana" size=2><b>
    [<a href="addmp3.asp">Add mp3</a> | <a href="addmp4.asp">Add mp4</a> | <a href="addsoftware.asp">Add Software</a> 
    | Update mp3 |<a href="viewmp4.asp">Update mp4</a>|<a href="viewsoftware.asp">Update software</a>]
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
<form method="POST" name="search" action="viewmp3.asp">
<table>
 <tr> 
  <td><%selectmp3()%></td>
  <td><%selectlanguage()%></td>  
  <td><input type="text" name="keyword" size="9" value="keyword"></td>  
  <td><input type="submit" value="Search"></td>  
</tr>
</table>
</form>
<%if((ktloai+ktnn+ktkey)>0){%>
<font face="verdana" size="2">
<font color="blue"><b>Result:<%=RS.recordCount%>record(s)</b></font><br>
<table width="750" border=1>
 <tr bgcolor="#dd77dd">
  <td nowrap>Nr</td>
  <td nowrap>Name of mp3</td>
  <td nowrap>Singer </td>
  <td nowrap>Size(Mb)</td>
  <td nowrap>Url </td>
  <td nowrap width="100">Update</td>
 </tr>
<%
 dem=1;tam="";
 while(!RS.EOF){
 if(dem%2)maunen="#ffffff";
 else maunen="#dddddd";
 if(tam!=(RS("loaimp3")+""))Response.write("<tr bgcolor='#ccccff'><td colspan=6><b>"+RS('loaimp3')+"</b></td></tr>\n"); 
 tam=RS("loaimp3")+"";
%>
 <tr bgcolor=<%=maunen%>>
  <td ><%=dem%></td>
  <td ><%=RS("tenmp3")%></td>
  <td ><%=RS("tencsmp3")%></td>
  <td ><%=RS("dlmp3")%></td>
  <td ><%=RS("diachimp3")%></td>
  <td >[<a href="updatemp3.asp?mamp3=<%=RS('mamp3')%>">Upt</a>]</td>
 </tr>
 <%RS.MoveNext();dem++;}%>
</table>
</font>
<%RS.close(); }%>
<Br>
<font face="verdana" size=1 color="#558A8B"><B> 
Copyright @ 2001 by  AZ-CDROM-Nguyen Duc Quy
</B></font>
</body>
</html>