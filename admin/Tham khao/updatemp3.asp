<%@language=JScript%>
<!--#INCLUDE FILE="khaibaocdrom.txt" -->
<%
///Test password
  if(Session("login")!=1)Response.Redirect("admin.asp");
///The end test
  var error="";
  //get data 
  ma=Request("mamp3")+"";
  loaimp3=Request("loaimp3")+"";
  addmp3=Request("addmp3")+"";
  nnmp3=Request("nnmp3")+"";
  addnn=Request("addlanguage")+"";
  tenmp3=Request("tenmp3")+"";
  tencsmp3=Request("tencs")+"";
  tennsmp3=Request("tenns")+"";
  dlmp3=Request("dlmp3")+"";
  diachimp3=Request("diachimp3")+"";
  ghichump3=Request("ghichump3")+"";
  update=Request("update")+"";
  if(loaimp3=='add')loaimp3=addmp3;
  if(nnmp3=='add')nnmp3=addnn;
  if(tencsmp3=="")tencsmp3="Unknow";
  if(tennsmp3=="")tennsmp3="Unknow";
  if(tenmp3=="")error+="<br>Enter name of mp3";
  if(!parseFloat(dlmp3)>0)error+="<br>Size of song is a number >0";
////////Het get data
  sql="select * from mp3 where mamp3='"+ma+"'";
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
   RS.Fields("loaimp3")=loaimp3;
   RS.Fields("nnmp3")=nnmp3;
   RS.Fields("tenmp3")=tenmp3;
   RS.Fields("tennsmp3")=tennsmp3;
   RS.Fields("tencsmp3")=tencsmp3;
   RS.Fields("dlmp3")=parseFloat(dlmp3);
   RS.Fields("diachimp3")=diachimp3;
   RS.Fields("ghichump3")=ghichump3;
   RS.Update();
 }
function them(){
var tam="";tam1=""; 
var j=0;  
var RStam=Server.CreateObject("ADODB.Recordset");
     sqltam="select * from mp3 ";
     RStam.Open(sqltam,conn,1,2);  
     while(!RStam.EOF) {
      tam1=RStam("mamp3")+""; 
      if(check2strings(tenmp3,RStam('tenmp3')+"")&&!check2strings(ma,tam1)){
       if(j==0)error+="<br>Name of mp3 is exist";
       samemp3[j]=RStam("mamp3")+"";  
       j++; 
     }
    RStam.MoveNext();
  }
 if(error==""){
  adnews();
  }
  RStam.close();
}
if(loaimp3!="undefined"&&tenmp3!=""&&update!="yes")them();
if(update=="yes"){
    adnews();
}
///select loai mp3
function selectmp3(){
var tam="";tam1="";tam2=""; 
var RStam=Server.CreateObject("ADODB.Recordset");
     sqltam="select * from mp3 where loaimp3<>null ORDER BY loaimp3";
     RStam.Open(sqltam,conn,1,2);
   Response.write("<select size=1 name='loaimp3'>\n");
   while(!RStam.EOF){
    tam1=RStam("loaimp3")+""; 
    tam2=RS("loaimp3")+"";
     if(tam!=tam1&&tam1!=tam2)Response.write("<option value='"+RStam('loaimp3')+"'>"+RStam('loaimp3')+"</option>\n");
     if(tam!=tam1&&tam1==tam2)Response.write("<option value='"+RStam('loaimp3')+"'selected>"+RStam('loaimp3')+"</option>\n");
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
     sqltam="select * from mp3 where nnmp3<>null ORDER BY nnmp3";
     RStam.Open(sqltam,conn,1,2);
 Response.write("<select size=1 name='nnmp3'>\n");
   while(!RStam.EOF){
    tam1=RStam("nnmp3")+"";  
    tam2=RS("nnmp3")+"";
    if(tam!=tam1&&tam1!=tam2)Response.write("<option value='"+RStam('nnmp3')+"'>"+RStam('nnmp3')+"</option>\n");
    if(tam!=tam1&&tam1==tam2)Response.write("<option value='"+RStam('nnmp3')+"' selected>"+RStam('nnmp3')+"</option>\n");
    tam=tam1;  
    RStam.MoveNext();
 } 
 Response.write("<option value='add'>Add new</option>\n");
 Response.write("</select>\n");
 RStam.close();
 }
///Hien thi mp3
function hienthi(st){//nhan mamp3
 var tam=""; 
 var RStam=Server.CreateObject("ADODB.Recordset");
     sqltam="select * from mp3 where mamp3='"+st+"'";
     RStam.Open(sqltam,conn,1,2);
 if(!RStam.EOF){
  Response.write("<table>\n"); 
  Response.write("<tr>\n<td>Mamp3</td>\n"); 
  Response.write("<td>"+RStam("mamp3")+"</td>\n</tr>");
  Response.write("<tr>\n<td>Category</td>\n"); 
  Response.write("<td>"+RStam("loaimp3")+"</td>\n</tr>"); 
  Response.write("<tr>\n<td>Language</td>\n"); 
  Response.write("<td>"+RStam("nnmp3")+"</td>\n</tr>");
  Response.write("<tr>\n<td>Name of mp3</td>\n"); 
  Response.write("<td>"+RStam("tenmp3")+"</td>\n</tr>");
  Response.write("<tr>\n<td>Name of singer</td>\n"); 
  Response.write("<td>"+RStam("tencsmp3")+"</td>\n</tr>");
  Response.write("<tr>\n<td>Name of musican</td>\n"); 
  Response.write("<td>"+RStam("tennsmp3")+"</td>\n</tr>");
  Response.write("<tr>\n<td>Size of song</td>\n"); 
  Response.write("<td>"+RStam("dlmp3")+"(Mb)</td>\n</tr>");
  Response.write("<tr>\n<td>Url of mp3 file</td>\n"); 
  Response.write("<td>"+RStam("diachimp3")+"(Mb)</td>\n</tr>");
  Response.write("<tr>\n<td>Note</td>\n"); 
  Response.write("<td>"+RStam("ghichump3")+"</td>\n</tr>");
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
<title>Up date mp3</title>
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
 Update mp3:<%=ma%> <br>
 <%=path%><br>
</font>
<font face="verdana" color="red"><b><%if(error!=""&&loaimp3!="undefined")Response.write(error);%></font><br>
<form method="POST" action="updatemp3.asp">
<table >
  <tr>
    <td >Category*</td>
    <td >
      <%selectmp3();%><input type="text" name="addmp3" size=9><br>
    </td>
  </tr>
  <tr>
    <td >Language*</td>
    <td >
      <%selectlanguage();%><input type="text" name="addlanguage" size=9><br>
    </td>
  </tr>
  <tr>
    <td >Name of mp3*</td>
    <td ><input type="text" name="tenmp3" value="<%=RS("tenmp3")%>"></td>
  </tr>
  <tr>
    <td >Name of singer</td>
    <td ><input type="text" name="tencs" value="<%=RS("tencsmp3")%>"></td>
  </tr>
  <tr>
    <td >Name of Musican</td>
    <td ><input type="text" name="tenns" value="<%=RS("tennsmp3")%>"></td>
  </tr>
  <tr>
    <td >Size of song&lt;Mb&gt;*</td>
    <td ><input type="text" name="dlmp3" value="<%=RS("dlmp3")%>"></td>
  </tr>
  <tr>
    <td >Url of mp3 file</td>
    <td ><input type="text" name="diachimp3" value="<%=RS("diachimp3")%>"></td>
  </tr>
  <tr>
    <td >Note</td>
    <td ><textarea name="ghichump3" rows="4" cols="20" ><%=RS("ghichump3")%></textarea></td>
  </tr>
</table>
<input type="Submit" value="Submit">
<input type="hidden"  name="mamp3" value='<%=ma%>'>
</form>
<%if(samemp3.length>0&& parseFloat(dlmp3)>0){%>
<b>Update mp3</b><br>
<table>
 <tr>
  <td>Category</td>
  <td><%=loaimp3%></td>
 </tr>
 <tr>
  <td>anguage</td>
  <td><%=nnmp3%></td>
 </tr>
 <tr>
  <td>Name of mp3</td>
  <td><%=tenmp3%></td>
 </tr>
 <tr>
  <td>Name of singer</td>
  <td><%=tencsmp3%></td>
 </tr>
 <tr>
  <td>Name of musican</td>
  <td><%=tennsmp3%></td>
 </tr>
 <tr>
  <td>Size of song</td>
  <td><%=dlmp3%>Mb</td>
 </tr>
 <tr>
  <td>Url of mp3 file</td>
  <td><%=diachimp3%></td>
 </tr>
 <tr>
  <td>Note</td>
  <td><%=ghichump3%></td>
 </tr>
</table>
<form method="POST" action="updatemp3.asp">
 <input type="hidden" name="loaimp3" value="<%=loaimp3%>"> 
 <input type="hidden" name="nnmp3" value="<%=nnmp3%>"> 
 <input type="hidden" name="tenmp3" value="<%=tenmp3%>"> 
 <input type="hidden" name="tencs" value="<%=tencsmp3%>"> 
 <input type="hidden" name="tenns" value="<%=tennsmp3%>"> 
 <input type="hidden" name="dlmp3" value="<%=dlmp3%>"> 
 <input type="hidden" name="diachimp3" value="<%=diachimp3%>"> 
 <input type="hidden" name="ghichump3" value="<%=ghichump3%>"> 
 <input type="hidden" name="update" value="yes"> 
 <input type="hidden" name="mamp3" value="<%=ma%>"> 
 <input type="submit"  value="Update"> 
</form>
<b>Same Mp3</b><br>
<%for(i=0;i<samemp3.length;i++)hienthi(samemp3[i]);}%>
<Br>
<font face="verdana" size=1 color="#558A8B"><B> 
Copyright @ 2001 by  AZ-CDROM-Nguyen Duc Quy
</B></font>
</body>
</html>
