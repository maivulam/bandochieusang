<%@language=JScript%>
<!--#INCLUDE FILE="khaibaocdrom.txt" -->
<%
///Test password
  if(Session("login")!=1)Response.Redirect("admin.asp");
///The end test
  var error="";
  var samemp4=new Array();
//get data 
  ma=Request("mamp4")+"";
  loaimp4=Request("loaimp4")+"";
  addmp4=Request("addmp4")+"";
  nnmp4=Request("nnmp4")+"";
  addnn=Request("addlanguage")+"";
  tenmp4=Request("tenmp4")+"";
  tencsmp4=Request("tencs")+"";
  tennsmp4=Request("tenns")+"";
  dlmp4=Request("dlmp4")+"";
  diachimp4=Request("diachimp4")+"";
  ghichump4=Request("ghichump4")+"";
  update=Request("update")+"";
  if(loaimp4=='add')loaimp4=addmp4;
  if(nnmp4=='add')nnmp4=addnn;
  if(tencsmp4=="")tencsmp4="Unknow";
  if(tennsmp4=="")tennsmp4="Unknow";
  if(diachimp4=="")diachimp4="Unknow";
  if(tenmp4=="")error+="<br>Enter name of mp4";
  if(!parseFloat(dlmp4)>0)error+="<br>Size of song is a number >0";
////////Het get data
  sql="select * from mp4 where mamp4='"+ma+"'";
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
   RS.Fields("loaimp4")=loaimp4;
   RS.Fields("nnmp4")=nnmp4;
   RS.Fields("tenmp4")=tenmp4;
   RS.Fields("tennsmp4")=tennsmp4;
   RS.Fields("tencsmp4")=tencsmp4;
   RS.Fields("dlmp4")=parseFloat(dlmp4);
   RS.Fields("diachimp4")=diachimp4;
   RS.Fields("ghichump4")=ghichump4;
   RS.Update();
 }
function them(){
var tam="";tam1=""; 
var j=0;  
var RStam=Server.CreateObject("ADODB.Recordset");
     sqltam="select * from mp4 ";
     RStam.Open(sqltam,conn,1,2);  
     while(!RStam.EOF) {
      tam1=RStam("mamp4")+""; 
      if(check2strings(tenmp4,RStam('tenmp4')+"")&&!check2strings(ma,tam1)){
       if(j==0)error+="<br>Name of mp4 is exist";
       samemp4[j]=RStam("mamp4")+"";  
       j++; 
     }
    RStam.MoveNext();
  }
 if(error==""){
  adnews();
  }
  RStam.close();
}
if(loaimp4!="undefined"&&tenmp4!=""&&update!="yes")them();
if(update=="yes"){
    adnews();
}
///select loai mp4
function selectmp4(){
var tam="";tam1="";tam2=""; 
var RStam=Server.CreateObject("ADODB.Recordset");
     sqltam="select * from mp4 where loaimp4<>null ORDER BY loaimp4";
     RStam.Open(sqltam,conn,1,2);
   Response.write("<select size=1 name='loaimp4'>\n");
   while(!RStam.EOF){
    tam1=RStam("loaimp4")+""; 
    tam2=RS("loaimp4")+"";
     if(tam!=tam1&&tam1!=tam2)Response.write("<option value='"+RStam('loaimp4')+"'>"+RStam('loaimp4')+"</option>\n");
     if(tam!=tam1&&tam1==tam2)Response.write("<option value='"+RStam('loaimp4')+"'selected>"+RStam('loaimp4')+"</option>\n");
    tam=tam1;
    RStam.MoveNext();
 } 
 Response.write("<option value='add'>Add new</option>\n");
 Response.write("</select>\n");
 RStam.close();
}
///-----------------------------------
function selectlanguage(){
var tam="";tam1="";tam2=""; 
var RStam=Server.CreateObject("ADODB.Recordset");
     sqltam="select * from mp4 where nnmp4<>null ORDER BY nnmp4";
     RStam.Open(sqltam,conn,1,2);
 Response.write("<select size=1 name='nnmp4'>\n");
   while(!RStam.EOF){
    tam1=RStam("nnmp4")+"";  
    tam2=RS("nnmp4")+"";
    if(tam!=tam1&&tam1!=tam2)Response.write("<option value='"+RStam('nnmp4')+"'>"+RStam('nnmp4')+"</option>\n");
    if(tam!=tam1&&tam1==tam2)Response.write("<option value='"+RStam('nnmp4')+"' selected>"+RStam('nnmp4')+"</option>\n");
    tam=tam1;  
    RStam.MoveNext();
 } 
 Response.write("<option value='add'>Add new</option>\n");
 Response.write("</select>\n");
 RStam.close();
 }
///Hien thi mp4
function hienthi(st){//nhan mamp4
 var tam=""; 
 var RStam=Server.CreateObject("ADODB.Recordset");
     sqltam="select * from mp4 where mamp4='"+st+"'";
     RStam.Open(sqltam,conn,1,2);
 if(!RStam.EOF){
  Response.write("<table>\n"); 
  Response.write("<tr>\n<td>Mamp4</td>\n"); 
  Response.write("<td>"+RStam("mamp4")+"</td>\n</tr>");
  Response.write("<tr>\n<td>Category</td>\n"); 
  Response.write("<td>"+RStam("loaimp4")+"</td>\n</tr>"); 
  Response.write("<tr>\n<td>Language</td>\n"); 
  Response.write("<td>"+RStam("nnmp4")+"</td>\n</tr>");
  Response.write("<tr>\n<td>Name of mp4</td>\n"); 
  Response.write("<td>"+RStam("tenmp4")+"</td>\n</tr>");
  Response.write("<tr>\n<td>Name of actor</td>\n"); 
  Response.write("<td>"+RStam("tencsmp4")+"</td>\n</tr>");
  Response.write("<tr>\n<td>Name of creator</td>\n"); 
  Response.write("<td>"+RStam("tennsmp4")+"</td>\n</tr>");
  Response.write("<tr>\n<td>Size of song</td>\n"); 
  Response.write("<td>"+RStam("dlmp4")+"(Mb)</td>\n</tr>");
  Response.write("<tr>\n<td>Url of mp4 file</td>\n"); 
  Response.write("<td>"+RStam("diachimp4")+"(Mb)</td>\n</tr>");
  Response.write("<tr>\n<td>Note</td>\n"); 
  Response.write("<td>"+RStam("ghichump4")+"</td>\n</tr>");
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
<title>Update mp4</title>
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
</table><font face="verdana" color="blue" size=3>
 Update mp4:<%=ma%> <br>
 <%=path%><br>
</font>
<font face="verdana" color="red"><b><%if(error!=""&&loaimp4!="undefined")Response.write(error);%></font><br>
<form method="POST" action="updatemp4.asp">
<table >
  <tr>
    <td >Category*</td>
    <td >
      <%selectmp4();%><input type="text" name="addmp4" size=9><br>
    </td>
  </tr>
  <tr>
    <td >Language*</td>
    <td >
      <%selectlanguage();%><input type="text" name="addlanguage" size=9><br>
    </td>
  </tr>
  <tr>
    <td >Name of mp4*</td>
    <td ><input type="text" name="tenmp4" value="<%=RS("tenmp4")%>"></td>
  </tr>
  <tr>
    <td >Name of actor</td>
    <td ><input type="text" name="tencs" value="<%=RS("tencsmp4")%>"></td>
  </tr>
  <tr>
    <td >Name of creator</td>
    <td ><input type="text" name="tenns" value="<%=RS("tennsmp4")%>"></td>
  </tr>
  <tr>
    <td >Size of song&lt;Mb&gt;*</td>
    <td ><input type="text" name="dlmp4" value="<%=RS("dlmp4")%>"></td>
  </tr>
  <tr>
    <td >Url of mp4 file</td>
    <td ><input type="text" name="diachimp4" value="<%=RS("diachimp4")%>"></td>
  </tr>
  <tr>
    <td >Note</td>
    <td ><textarea name="ghichump4" rows="4" cols="20" ><%=RS("ghichump4")%></textarea></td>
  </tr>
</table>
<input type="Submit" value="Submit">
<input type="hidden"  name="mamp4" value='<%=ma%>'>
</form>
<%if(samemp4.length>0&& parseFloat(dlmp4)>0){%>
<b>Update mp4</b><br>
<table>
 <tr>
  <td>Category</td>
  <td><%=loaimp4%></td>
 </tr>
 <tr>
  <td>Language</td>
  <td><%=nnmp4%></td>
 </tr>
 <tr>
  <td>Name of mp4</td>
  <td><%=tenmp4%></td>
 </tr>
 <tr>
  <td>Name of actor</td>
  <td><%=tencsmp4%></td>
 </tr>
 <tr>
  <td>Name of creatro</td>
  <td><%=tennsmp4%></td>
 </tr>
 <tr>
  <td>Size of song</td>
  <td><%=dlmp4%>Mb</td>
 </tr>
 <tr>
  <td>Url of mp4 file</td>
  <td><%=diachimp4%></td>
 </tr>
 <tr>
  <td>Note</td>
  <td><%=ghichump4%></td>
 </tr>
</table>
<form method="POST" action="updatemp4.asp">
 <input type="hidden" name="loaimp4" value="<%=loaimp4%>"> 
 <input type="hidden" name="nnmp4" value="<%=nnmp4%>"> 
 <input type="hidden" name="tenmp4" value="<%=tenmp4%>"> 
 <input type="hidden" name="tencs" value="<%=tencsmp4%>"> 
 <input type="hidden" name="tenns" value="<%=tennsmp4%>"> 
 <input type="hidden" name="dlmp4" value="<%=dlmp4%>"> 
 <input type="hidden" name="diachimp4" value="<%=diachimp4%>"> 
 <input type="hidden" name="ghichump4" value="<%=ghichump4%>"> 
 <input type="hidden" name="update" value="yes"> 
 <input type="hidden" name="mamp4" value="<%=ma%>"> 
 <input type="submit"  value="Update"> 
</form>
<b>Same mp4</b><br>
<%for(i=0;i<samemp4.length;i++)hienthi(samemp4[i]);}%>
<Br>
<font face="verdana" size=1 color="#558A8B"><B> 
Copyright @ 2001 by  AZ-CDROM-Nguyen Duc Quy
</B></font>
</body>
</html>
