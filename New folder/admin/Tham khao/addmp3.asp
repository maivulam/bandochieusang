<%@language=JScript%>
<!--#INCLUDE FILE="khaibaocdrom.txt" -->
<%
///Test password
 if(Session("login")!=1)Response.Redirect("admin.asp");
///The end test  
  var error="";
  var samemp3=new Array();
  sql="select * from mp3";
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
  addnew=Request("addnew")+"";
  if(loaimp3=='add')loaimp3=addmp3;
  if(nnmp3=='add')nnmp3=addnn;
  if(tencsmp3=="")tencsmp3="Unknow";
  if(tennsmp3=="")tennsmp3="Unknow";
  if(diachimp3=="")diachimp3="Unknow";
  if(tenmp3=="")error+="<br>Enter name of mp3";
  if(!parseFloat(dlmp3)>0)error+="<br>Size of song is a number >0";
//them  ==============================
  function adnews() {
   RS.Addnew(); 
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
function mamp3() {
 sql2="UPDATE mp3 SET mamp3=[stt]&'MP3'";
 conn.Execute(sql2);}
function them(){
  RS.MoveFirst();
 j=0;
 while (!RS.EOF) {
  if (check2strings(tenmp3,RS('tenmp3')+"")){
   if(j==0)error+="<br>Name of mp3 is exist";
   samemp3[j]=RS("mamp3")+"";  
   j++
   }
  RS(������� ����( �`�@�P��t��==""�c��qt�0�7�();?�hamp3_t�v
  }*f�RS.c�?#\();�H6�if(l�g��p3!="undefined"&&tenmp3!="T�&add%-�="yeT'K�hem();
if(addnew=="yes"){
��a�W2�<r��	�ִw6�?  J�~#p3()� o�}
/�1��lect loaw�<�3
f{��ion l�Xctmp��|�
va<@em=""D<�~�+RSta��]rver4HateO,)�t("A�i�.Recﮆ�et");
 ��sqlt�,��sele�lm froM�T�3 wh0��7loai]����j8l OR��*BY l,�6�p3";���   R��SY.Ope�,:Cltam,con��W~2);��spon�N�~�B��l��2��q�z)�@�z��c{c�2��oaim�c\n")��H�  while(H<�am.E ��f
  5�̿(tam&��Stam�
��aimpV���j�i�&(RS[^m('loag��')+"}0wloaic���Resp0��d.write("��=ion �J�e='"����am('\7��mp3'T�v>"+R�_�('loaimp3')+"</option>\n");
    if(tam!=(RStam('loaimp3')+"")&&(RStam('loaimp3')+"")==loaimp3)Response.write("<option vM-�='"+�?��m('l����p3')+"' SELECTED>"+RStam('loai�O<��ծZ�Z�����d
��
    tam=RStam('loaimp3')+""�/fu   R�{#�.Mov�{B[�{
 }j3Resp�׭.write("<option value='add'>Add �/opt~c\n")!O��qQ]onse�^<te("��F�lect>\n");
 RStam.close();
}
���tion���ectlS4>age(){
var tam=""; 
var RStam=Server.CreateObjS���"ADO��ecor�7�");�<8  sq��="sedzfw * from }�wher�Kmp3<�A���r�{h-�Ck:��>�����!�Q�vam.O��(5sqlt���onn,1,2)���RespHܟ.wri$���<selq+��sizeg�Xame=b�p3'>\n");
   while(!RSt)��COF){���   i8[�m!=(RStam('nnmp3')+"")&&(RStam('Λ23')+� t=nnm�Eiesponse.write("<option v{%��='"+���m('n-΢$')+"M�RSta���Wnmp3`ʧ�</optionL-ȑ);
JH=� if(�[6=(RSD��'nnme@m�+"")�	�Stam('nnmp3')+"")==nnmp3)Response.write("<option value='"+RStam('nnmp3')+"' SELECTED>"+RStam('nnmp3')+"</option>\n");
     tam=(RStam('nnmp3')+"");
     RStam.MoveNex6�L�
 }��ZxResp���.wri���.<opt�%valu��*�dd'>Add �8��/opt�UB\n")a �.Resp}�Y�.wri��)</se_Yڃ�H��);
�]/3am.c#��();!�
///�qmx thi��l+
functiy�f�ientC�s>t){/健pn ma�w�
 va�bm=""!�|� var RStam=Server.CreateObject("ADODB.Recordset"�C�    �eItam=��HQect * from mp3 where mamp3='"+st�^�;
 ��5�RSta�-T��!qltai=��nn,1�G
 it��Stam�U��){
��� sponse.w��yU("<t�ҏ\>\n".WX�
  R�'ponse.b�+�e("<n�����>CatC�V�y</t�сH"); 
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
  Response.write("<td>"+RStam("diachimp3")+"</td>\n</tr>");
  Response.write("<tr>\n<td>Note</td>\n"); 
  Response.write("<td>"+RStam("ghichump3")+"</td>\n</tr>");
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
<title>Add Mp3</title>
</head>
<body>
<table width="100%" border=0 bgcolor="#ccccff">
<tr>
 <td width="40%" valign="top">
  <font face="verdana" size=2><b>
   [Add mp3 | <a href="addmp4.asp">Add mp4</a> | <a href="addsoftware.asp">Add Software</a> 
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
Add mp3 to <br>
<%=path%><br>
 </b>
</font>
<font face="verdana" color="red" size=2><b><%if(error!=""&&loaimp3!="undefined")Response.write(error);%><br>
<form method="POST" action="addmp3.asp">
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
    <td ><input type="text" name="tenmp3"></td>
  </tr>
  <tr>
    <td >Name of singer</td>
    <td ><input type="text" name="tencs"></td>
  </tr>
  <tr>
    <td >Name of Musican</td>
    <td ><input type="text" name="tenns"></td>
  </tr>
  <tr>
    <td >Size of song&lt;Mb&gt;*</td>
    <td ><input type="text" name="dlmp3"></td>
  </tr>
  <tr>
    <td >Url of Mp3 file</td>
    <td ><input type="text" name="diachimp3" value='<%=diachimp3%>'></td>
  </tr>
  <tr>
    <td >Note</td>
    <td ><textarea name="ghichump3" rows="4" cols="20" ></textarea></td>
  </tr>
</table>
<input type="Submit" value="Submit">
</form>
<%if(samemp3!=""&& parseFloat(dlmp3)>0){%>
<b>New mp3</b><br>
<table>
 <tr>
  <td>Category</td>
  <td><%=loaimp3%></td>
 </tr>
 <tr>
  <td>Language</td>
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
<form method="POST" action="addmp3.asp">
 <input type="hidden" name="loaimp3" value="<%=loaimp3%>"> 
 <input type="hidden" name="nnmp3" value="<%=nnmp3%>"> 
 <input type="hidden" name="tenmp3" value="<%=tenmp3%>"> 
 <input type="hidden" name="tencs" value="<%=tencsmp3%>"> 
 <input type="hidden" name="tenns" value="<%=tennsmp3%>"> 
 <input type="hidden" name="dlmp3" value="<%=dlmp3%>"> 
 <input type="hidden" name="diachimp3" value="<%=diachimp3%>"> 
 <input type="hidden" name="ghichump3" value="<%=ghichump3%>"> 
 <input type="hidden" name="addnew" value="yes"> 
 <input type="submit"  value="Addnew"> 
</form>
<b>Same Mp3</b><br>
<%for(i=0;i<samemp3.length;i++)hienthi(samemp3[i]);}%>
</font>
<Br>
<font face="verdana" size=1 color="#558A8B"><B> 
Copyright @ 2001 by  AZ-CDROM-Nguyen Duc Quy
</B></font>
</body>
</html>
