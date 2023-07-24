<%@language=JScript%>
<!--#INCLUDE FILE="khaibaocdrom.txt" -->
<%
///Test password
  if(Session("login")!=1)Response.Redirect("admin.asp");
///The end test
  var error="";
  var samesw=new Array();
//get data 
  ma=Request("masw")+"";
  loaisw=Request("loaisw")+"";
  addsw=Request("addsw")+"";
  tensw=Request("tensw")+"";
  dlsw=Request("dlsw")+"";
  diachisw=Request("diachisw")+"";
  cdsw=Request("cdsw")+"";
  update=Request("update")+"";
  if(loaisw=='add')loaisw=addsw;
  if(cdsw=="")cdsw="Unknow";
  if(tensw=="")error+="<br>Enter name of sw";
  if(!parseFloat(dlsw)>0)error+="<br>Size of song is a number >0";
////////Het get data
  sql="select * from software where masw='"+ma+"'";
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
//cap nhat  ==============================
  function adnews() {
   RS.Fields("loaisw")=loaisw;
   RS.Fields("tensw")=tensw;
   RS.Fields("dlsw")=parseFloat(dlsw);
   RS.Fields("diachisw")=diachisw;
   RS.Fields("cdsw")=cdsw;
   RS.Update();
 }
function them(){
var tam="";tam1=""; 
var j=0;  
var RStam=Server.CreateObject("ADODB.Recordset");
     sqltam="select * from software ";
     RStam.Open(sqltam,conn,1,2);  
     while(!RStam.EOF) {
      tam1=RStam("masw")+""; 
      if(check2strings(tensw,RStam('tensw')+"")&&!check2strings(ma,tam1)){
       if(j==0)error+="<br>Name of sw is exist";
       samesw[j]=RStam("masw")+"";  
       j++; 
     }
    RStam.MoveNext();
  }
 if(error==""){
  adnews();
  }
  RStam.close();
}
if(loaisw!="undefined"&&tensw!=""&&update!="yes")them();
if(update=="yes"){
    adnews();
}
///select loai sw
function selectsw(){
var tam="";tam1="";tam2=""; 
var RStam=Server.CreateObject("ADODB.Recordset");
     sqltam="select * from software where loaisw<>null ORDER BY loaisw";
     RStam.Open(sqltam,conn,1,2);
   Response.write("<select size=1 name='loaisw'>\n");
   while(!RStam.EOF){
    tam1=RStam("loaisw")+""; 
    tam2=RS("loaisw")+"";
     if(tam!=tam1&&tam1!=tam2)Response.write("<option value='"+RStam('loaisw')+"'>"+RStam('loaisw')+"</option>\n");
     if(tam!=tam1&&tam1==tam2)Response.write("<option value='"+RStam('loaisw')+"'selected>"+RStam('loaisw')+"</option>\n");
    tam=tam1;
    RStam.MoveNext();
 } 
 Response.write("<option value='add'>Add new</option>\n");
 Response.write("</select>\n");
 RStam.close();
}
///-----------------------------------
///Hien thi sw
function hienthi(st){//nhan masw
 var tam=""; 
 var RStam=Server.CreateObject("ADODB.Recordset");
     sqltam="select * from software where masw='"+st+"'";
     RStam.Open(sqltam,conn,1,2);
 if(!RStam.EOF){
  Response.write("<table>\n"); 
  Response.write("<tr>\n<td>Masw</td>\n"); 
  Response.write("<td>"+RStam("masw")+"</td>\n</tr>");
  Response.write("<tr>\n<td>Category</td>\n"); 
  Response.write("<td>"+RStam("loaisw")+"</td>\n</tr>"); 
  Response.write("<tr>\n<td>Name of sw</td>\n"); 
  Response.write("<td>"+RStam("tensw")+"</td>\n</tr>");
  Response.write("<tr>\n<td>Size of song</td>\n"); 
  Response.write("<td>"+RStam("dlsw")+"(Mb)</td>\n</tr>");
  Response.write("<tr>\n<td>Url of sw file</td>\n"); 
  Response.write("<td>"+RStam("diachisw")+"</td>\n</tr>");
  Response.write("<tr>\n<td>Use to</td>\n"); 
  Response.write("<td>"+RStam("cdsw")+"</td>\n</tr>");
 Response.write("</table>-------<br>\n");
}
 RStam.close();
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Up date software</title>
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
 Update sw:<%=ma%> <br>
 <%=path%><br>
</font>
<font face="verdana" color="red"><b><%if(error!=""&&loaisw!="undefined")Response.write(error);%></font><br>
<form method="POST" action="updatesoftware.asp">
<table >
  <tr>
    <td >Category*</td>
    <td >
      <%selectsw();%><input type="text" name="addsw" size=9><br>
    </td>
  </tr>
  <tr>
    <td >Name of sw*</td>
    <td ><input type="text" name="tensw" value="<%=RS("tensw")%>"></td>
  </tr>
  <tr>
    <td >Size of song&lt;Mb&gt;*</td>
    <td ><input type="text" name="dlsw" value="<%=RS("dlsw")%>"></td>
  </tr>
  <tr>
    <td >Url of sw file</td>
    <td ><input type="text" name="diachisw" value="<%=RS("diachisw")%>"></td>
  </tr>
  <tr>
    <td >Use to</td>
    <td ><textarea name="cdsw" rows="4" cols="20" ><%=RS("cdsw")%></textarea></td>
  </tr>
</table>
<input type="Submit" value="Submit">
<input type="hidden"  name="masw" value='<%=ma%>'>
</form>
<%if(samesw.length>0&& parseFloat(dlsw)>0){%>
<b>Update sw</b><br>
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
  <td>Size of song</td>
  <td><%=dlsw%>Mb</td>
 </tr>
 <tr>
  <td>Url of sw file</td>
  <td><%=diachisw%></td>
 </tr>
 <tr>
  <td>Note</td>
  <td><%=cdsw%></td>
 </tr>
</table>
<form method="POST" action="updatesoftware.asp">
 <input type="hidden" name="loaisw" value="<%=loaisw%>"> 
 <input type="hidden" name="tensw" value="<%=tensw%>"> 
 <input type="hidden" name="dlsw" value="<%=dlsw%>"> 
 <input type="hidden" name="diachisw" value="<%=diachisw%>"> 
 <input type="hidden" name="cdsw" value="<%=cdsw%>"> 
 <input type="hidden" name="update" value="yes"> 
 <input type="hidden" name="masw" value="<%=ma%>"> 
 <input type="submit"  value="Update"> 
</form>
<b>Same sw</b><br>
<%for(i=0;i<samesw.length;i++)hienthi(samesw[i]);}%>
<Br>
<font face="verdana" size=1 color="#558A8B"><B> 
Copyright @ 2001 by  AZ-CDROM-Nguyen Duc Quy
</B></font>
</body>
</html>
