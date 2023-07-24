<%@language=JScript%>
<!--#INCLUDE FILE="khaibaocdrom.txt" -->
<%
///Test password
 if(Session("login")!=1)Response.Redirect("admin.asp");
///The end test  
  var error="";
  var samesw=new Array();
  sql="select * from software";
  RS.Open(sql,conn,1,2);
//test 2 chuoi
function check2strings(s1,s2) {
  var ss1=s1.toUpperCase();
  var ss2=s2.toUpperCase();
  var sss1="",sss2="";
  
  for (i=0;i<=ss1.length;i++) {
   if (ss1.charAt(i)==" ") continue;
   else sss1+=ss1.charAt(i);
  }
 
 for (i=0;i<=ss2.length;i++) {
  if (ss2.charAt(i)==" ") continue;
  else sss2+=ss2.charAt(i);
 }
  if (sss1==sss2) return(true);
 } 
////-----------------------------
//get data 
  loaisw=Request("loaisw")+"";
  addsw=Request("addsw")+"";
  tensw=Request("tensw")+"";
  dlsw=Request("dlsw")+"";
  cdsw=Request("cdsw")+"";
  diachi=Request("diachisw")+"";
  addnew=Request("addnew")+"";
  if(loaisw=='add')loaisw=addsw;
  if(cdsw=="")cdsw="Unknow";
  if(cdsw=="")cdsw="Unknow";
  if(tensw=="")error+="<br>Enter name of software";
  if(!parseFloat(dlsw)>0)error+="<br>Size of software is a number >0";
//them  ==============================
  function adnews() {
   RS.Addnew(); 
   RS.Fields("loaisw")=loaisw;
   RS.Fields("tensw")=tensw;
   RS.Fields("dlsw")=parseFloat(dlsw);
   RS.Fields("cdsw")=cdsw;
   RS.Fields("diachisw")=diachisw;
   RS.Update();
 }
function masw() {
 sql2="UPDATE software SET masw=[stt]&'SW'";
 conn.Execute(sql2);}
function them(){
  RS.MoveFirst();
 j=0;
 while (!RS.EOF) {
  if (check2strings(tensw,RS('tensw')+"")){
   if(j==0)error+="<br>Name of sw is exist";
   samesw[j]=RS("masw")+"";  
   j++
   }
  RS.MoveNext();
  }
 if(error==""){
  adnews();
  masw();
  }
  //RS.close();
}
if(loaisw!="undefined"&&tensw!=""&&addnew!="yes")them();
if(addnew=="yes"){
       adnews();
       masw();
 }
///select loai sw
function selectsw(){
var tam=""; 
var RStam=Server.CreateObject("ADODB.Recordset");
     sqltam="select * from software where loaisw<>null ORDER BY loaisw";
     RStam.Open(sqltam,conn,1,2);
 Response.write("<select size=1 name='loaisw'>\n");
   while(!RStam.EOF){
    if(tam!=(RStam('loaisw')+""))Response.write("<option value='"+RStam('loaisw')+"'>"+RStam('loaisw')+"</option>\n");
    tam=RStam('loaisw')+"";
    RStam.MoveNext();
 } 
 Response.write("<option value='add'>Add new</option>\n");
 Response.write("</select>\n");
 RStam.close();
}
///Hien thi sw
function hienthi(st){//nhan masw
 var tam=""; 
 var RStam=Server.CreateObject("ADODB.Recordset");
     sqltam="select * from software where masw='"+st+"'";
     RStam.Open(sqltam,conn,1,2);
 if(!RStam.EOF){
  Response.write("<table>\n"); 
  Response.write("<tr>\n<td>Category</td>\n"); 
  Response.write("<td>"+RStam("loaisw")+"</td>\n</tr>"); 
  Response.write("<tr>\n<td>Name of software</td>\n"); 
  Response.write("<td>"+RStam("tensw")+"</td>\n</tr>");
  Response.write("<tr>\n<td>Size of software</td>\n"); 
  Response.write("<td>"+RStam("dlsw")+"(Mb)</td>\n</tr>");
  Response.write("<tr>\n<td>Url of software file</td>\n"); 
  Response.write("<td>"+RStam("diachisw")+"</td>\n</tr>");
  Response.write("<tr>\n<td>Use to</td>\n"); 
  Response.write("<td>"+RStam("cdsw")+"</td>\n</tr>");
  Response.write("</table>----------------<br>\n");
}
 RStam.close();
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>>>>Add Software</title>
</head>
<body>
<table width="100%" border=0 bgcolor="#ccccff">
<tr>
 <td width="40%" valign="top">
  <font face="verdana" size=2><b>
    [<a href="addmp3.asp">Add mp3</a> | <a href="addmp4.asp">Add mp4</a> | Add Software 
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
<font face="verdana" color="blue" size=3>
 <b>
Add software to <br>
<%=path%><br>
 </b>
</font>
<font face="verdana" color="red" size=2><b><%if(error!=""&&loaisw!="undefined")Response.write(error);%><br>
<form method="POST" action="addsoftware.asp">
<table >
  <tr>
    <td >Category*</td>
    <td >
      <%selectsw();%><input type="text" name="addsw" size=9><br>
    </td>
  </tr>
  <tr>
    <td >Name of software*</td>
    <td ><input type="text" name="tensw"></td>
  </tr>
  <tr>
    <td >Size of software&lt;Mb&gt;*</td>
    <td ><input type="text" name="dlsw"></td>
  </tr>
  <tr>
    <td >Url of sw file</td>
    <td ><input type="text" name="diachisw"></td>
  </tr>
  <tr>
    <td >Software use to</td>
    <td ><textarea name="cdsw" rows="4" cols="20" ></textarea></td>
  </tr>
</table>
<input type="Submit" value="Submit">
</form>
<%if(samesw!=""&& parseFloat(dlsw)>0){%>
<b>New software</b><br>
<table>
 <tr>
  <td>Category</td>
  <td><%=loaisw%></td>
 </tr>
 <tr>
  <td>Name of sw</td>
  <td><%=tensw%></td>
 </tr>
 <tr>
  <td>Size of software</td>
  <td><%=dlsw%>Mb</td>
 </tr>
 <tr>
  <td>Url of sw file</td>
  <td><%=diachisw%>Mb</td>
 </tr>
 <tr>
  <td>Use to</td>
  <td><%=cdsw%></td>
 </tr>
</table>
<form method="POST" action="addsoftware.asp">
 <input type="hidden" name="loaisw" value="<%=loaisw%>"> 
 <input type="hidden" name="tensw" value="<%=tensw%>"> 
 <input type="hidden" name="dlsw" value="<%=dlsw%>"> 
 <input type="hidden" name="diachisw" value="<%=diachisw%>"> 
 <input type="hidden" name="cdsw" value="<%=cdsw%>"> 
 <input type="hidden" name="addnew" value="yes"> 
 <input type="submit"  value="Addnew"> 
</form>
<b>Same software</b><br>
<%for(i=0;i<samesw.length;i++)hienthi(samesw[i]);}%>
</font>
<Br>
<font face="verdana" size=1 color="#558A8B"><B> 
Copyright @ 2001 by  AZ-CDROM-Nguyen Duc Quy
</B></font>
</body>
</html>







