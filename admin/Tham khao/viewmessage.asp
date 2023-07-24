<%@language=JScript%>
<%
stt=Request("stt")+"";
if(Session("login")!=1)Response.Redirect("admin.asp");
var conn=Server.CreateObject("ADODB.Connection");
var RS=Server.CreateObject("ADODB.Recordset");
path=Server.MapPath("/azcdrom/db/help.mdb");
connStr="DBQ=" + path + ";Driver={Microsoft Access Driver (*.mdb)};DriverId=25;Fil=MS Access";
conn.Open(connStr); 
sql="select * from question where stt="+stt+"";
RS.Open(sql,conn,1,2); 
RS("traloi")=1;
RS.Update();
%>
<html>
<head>
<title>View Message</title>
</head>
<body bgcolor="#C0C0C0">
From:<%=RS("email")+""%><BR>
Date:<%=RS("ngayhoi")+""%><BR>
Body:<%=RS("noidung")+""%><BR>
<form method="POST" action="http://user.7host.com/nguyenquy/interface/sendmail.asp">
    <table border="0" width="100%">
    <tr>
      <td width="15%">From:</td>
      <td width="85%"><input type="text" name="from" size="20" value="nguyennquy@yahoo.com"></td>
    </tr>
    <tr>
      <td width="15%">To:</td>
      <td width="85%"><input type="text" name="to" size="20" value=<%=RS("email")%>></td>
    </tr>
    <tr>
      <td width="15%">CC:</td>
      <td width="85%"><input type="text" name="cc" size="20"></td>
    </tr>
    <tr>
      <td width="15%">Subject:</td>
      <td width="85%"><input type="text" name="subject" size="20" value="AZCDROM tra loi"></td>
    </tr>
  </table>
  <p><textarea rows="9" name="body" cols="20"></textarea></p>
  <p><input type="submit" value="Send" name="B1"><input type="reset" value="Clear" name="B2"></p>
  <input type="hidden"  name="homepage" value="http://go.to/azcdrom"><!--You can insert  url of your homepage-->   
</form>
<!--End insert-->
<%RS.close();%>
<font face="verdana" size=1>
 <b><a href="javascript:self.close();">Close this window</a></b>
</font>
<br>
  <font face="verdana" size=1 color="#558A8B"><B>                                                                                         
  Copyright @ 2001 by  <a href="mailto:nguyennquy@yahoo.com">AZ-CDROM</a>                                                                                        
  </B></font>    
</body>
</html>
