<%@language=JScript%>
<!--#INCLUDE FILE="khaibaocdrom.txt" -->
<%
///Test password
if(Session("login")!=1)Response.Redirect("admin.asp");
var ktloai=0;ktnn=0;ktkey=0;
loaisw=Request("loaisw")+"";
nnsw=Request("nnsw")+"";
keyword=Request("keyword")+"";
if(loaisw!="undefined"&&loaisw!="all")ktloai=1;
if(keyword!="undefined"&&keyword!="keyword")ktkey=1;
///Tao sql
if(ktloai==1&&ktkey==0)sql="select * from software where loaisw='"+loaisw+"'";
if(ktloai==0&&ktkey==1)sql="select * from software where tensw like '%"+keyword+"%' ORDER BY loaisw";
if(ktloai==1&&ktkey==1)sql="select * from software where loaisw='"+loaisw+"' AND (tensw like '%"+keyword+"%')";
if(ktloai+ktkey>0)RS.Open(sql,conn,1,2);  
////
function selectsw(){
 var tam=""; 
 var RStam=Server.CreateObject("ADODB.Recordset");
     sqltam="select * from software where loaisw<>null ORDER BY loaisw";
     RStam.Open(sqltam,conn,1,2);
 Response.write("<select size=1 name='loaisw'>\n");
 Response.write("<option value='all'>Category</option>\n");
  while(!RStam.EOF){
    if(tam!=(RStam('loaisw')+""))Response.write("<option value='"+RStam('loaisw')+"'>"+RStam('loaisw')+"</option>\n");
    tam=RStam('loaisw')+"";
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
<title>Report sw</title>
</head>
<body>
<table width="100%" border=0 bgcolor="#ccccff">
<tr>
 <td width="40%" valign="top">
  <font face="verdana" size=2><b>
    [<a href="addmp3.asp">Add mp3</a> | <a href="addmp4.asp">Add mp4</a> | <a href="addsoftware.asp">Add Software</a> 
    |<a href="viewmp3.asp">Update mp3</a>|<a href="viewmp4.asp">Update mp4</a>| Update software]
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
<form method="POST" name="search" action="viewsoftware.asp">
<table>
 <tr> 
  <td><%selectsw()%></td>
  <td><input type="text" name="keyword" size="9" value="keyword"></td>  
  <td><input type="submit" value="Search"></td>  
</tr>
</table>
</form>
<%if((ktloai+ktkey)>0){%>
<font face="verdana" size="2">
<font color="blue"><b>Result:<%=RS.recordCount%>record(s)</b></font><br>
<table  border=1>
 <tr bgcolor="#dd77dd">
  <td nowrap>Nr</td>
  <td nowrap>Name of software</td>
  <td nowrap>Use to </td>
  <td nowrap>Size(Mb)</td>
  <td nowrap>Url</td>
  <td nowrap width="100">Update</td>
 </tr>
<%
 dem=1;tam="";
 while(!RS.EOF){
 if(dem%2)maunen="#dddddd";
 else maunen="#ffffff";
 if(tam!=(RS("loaisw")+""))Response.write("<tr bgcolor='#ccccff'><td colspan=7><b>"+RS('loaisw')+"</b></td></tr>\n"); 
 tam=RS("loaisw")+"";
%>
 <tr bgcolor=<%=maunen%>>
  <td ><%=dem%></td>
  <td ><%=RS("tensw")%></td>
  <td ><%=RS("cdsw")%></td>
  <td ><%=RS("dlsw")%></td>
  <td ><%=RS("diachisw")%></td>
  <td >[<a href="updatesoftware.asp?masw=<%=RS('masw')%>">Upt</a>]</td>
 </tr>
 <%RS.MoveNext();dem++;}%>
</table>
</font>
<%RS.close(); }%>
<Br><font face="verdana" size=1 color="#558A8B"><B> 
Copyright @ 2001 by  AZ-CDROM-Nguyen Duc Quy
</B></font>

</body>
</html>