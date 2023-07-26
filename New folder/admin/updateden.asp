<%@language="jscript" CODEPAGE="65001"%>
<%
/*
updateden.asp
22/9/2011
- Cap nhat duoc thong tin den va hien thi cap, den
*/
 /////KHAI BAO KET NOI DATABASE//////
 var conn=Server.CreateObject("ADODB.Connection");
   var RS=Server.CreateObject("ADODB.Recordset");
///////CHON FILE DATA THEO QUAN HUYEN////////   	
   	//Lay du lieu
   	kv=Request("kv")+"";
   	if(kv=="undefined") kv="binhchanh";
   	if(kv=="binhchanh"){
   					path=Server.MapPath("/cs4/db/binhchanh.mdb");
   					khuvuc="Huyện Bình Chánh";
   					}
	if(kv=="quan7"){
   					path=Server.MapPath("/cs4/db/quan7.mdb");
   					khuvuc="Quận 7";
   					}
	if(kv=="nhabe"){
   					path=Server.MapPath("/cs4/db/nhabe.mdb");
   					khuvuc="Huyện Nhà Bè";
   					}
	if(kv=="cangio"){
   					path=Server.MapPath("/cs4/db/cangio.mdb");
   					khuvuc="Huyện Cần Giờ";
   					}
//////////////////XONG PHAN CHON FILE DATA////////////////////////////    
	connStr="DBQ=" + path + ";Driver={Microsoft Access Driver (*.mdb)}";
    conn.Open(connStr); 
 //Lay du lieu  	
 maDEN=Request("maDEN")+"";//hidden
 update=Request("update")+"";//hidden
 tenDEN=Request("tenDEN")+"";//1
 latDEN=Request("latDEN")+"";//2
 longDEN=Request("longDEN")+"";//3
 accDEN=Request("accDEN")+"";//4
 maDEN0=Request("maDEN0")+"";//5
 maTDK=Request("maTDK")+"";//6
 noteDEN=Request("noteDEN")+"";//7
 ////
 var tenDENs = new Array();
 var maDENs =new Array();
 d = new Date();
 sql="123";
 queryError="";
 //Kiem trapassword
 if(Session("logincs4")!=1)Response.Write("<script>window.parent.location='/index.asp';</script>");//Response.Redirect("index.asp");
 if (Session("level")<1) queryError=queryError+"Bạn không có quyền cập nhật thông tin</br>";
//////////THUC HIEN CAP NHAT KHI CO YEU CAU//////////////
function Homnay(){
	var d, s = "";
	d = new Date();
	s += (d.getMonth() + 1) + "/";
	s += d.getDate() + "/";
	s += d.getYear();
	return(s);
}
 ///Bo dau tieng viet
function locdau(str) {  
	str= str.toLowerCase();  
	str= str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g,"a");  
	str= str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g,"e");  
	str= str.replace(/ì|í|ị|ỉ|ĩ/g,"i");  
	str= str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g,"o");  
	str= str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g,"u");  
	str= str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g,"y");  
	str= str.replace(/đ/g,"d");
	str= str.replace(/"|'/g,"");
	return (str);  
}   
///KIEM TRA DU LIEU CAP NHAT
updateError="";
if(parseFloat(latDEN)>0&&parseFloat(longDEN)>0&&parseFloat(accDEN)>0) {updateError="";} else {updateError+="Kinh độ, vĩ độ, độ chính xác phải là <b>số >0<b><br>";}

/////***CÂP NHAT DU LIEU**********////////
if(update=="yes" && updateError==""){
 	sql="SELECT * FROM den WHERE maDEN="+maDEN+"";
	RS.Open(sql,conn,1,2); 
	RS("tenDEN")=tenDEN;//1
	RS("latDEN")=parseFloat(latDEN);///2
	RS("longDEN")=parseFloat(longDEN);//3
	RS("accDEN")=parseInt(accDEN);//4
	RS("maDEN0")=maDEN0;//5
	RS("noteDEN")=noteDEN;//7
	RS("userUpdateDEN")=Session("username");//8
	RS("dateUpdateDEN")=Homnay();//9
	RS.Update();
	RS.Close();
}

////******HIEN THI THONG TIN DE CAP NHAT**********///////////
if(maDEN!="undefined"){ 
   //Lay du lieu ve ten den va ma den
   sql="SELECT * FROM den ORDER BY maDEN ASC"; 
   RS.Open(sql,conn,1,2); 
   //Luu ten den va ma den
   i=0;
   RS.MoveFirst();
   while(!RS.EOF)
    {
       maDENs[i]=RS("maDEN")+"";
       tenDENs[i]=RS("tenDEN")+"";
       i++;
       RS.MoveNext();
     }
    RS.Close(); 
//Lay du lieu den
   sql="SELECT * FROM den WHERE maDEN="+maDEN+"";
   RS.Open(sql,conn,1,2); 
   if(!RS.EOF)
	{
		RS.MoveFirst();
		maDEN=RS("maDEN")+0; //0
		tenDEN=RS("tenDEN")+"";//1
		latDEN=RS("latDEN")+0; //2
    	longDEN=RS("longDEN")+0;//3
    	accDEN=RS("accDEN")+0;//4
    	maDEN0=RS("maDEN0")+0;//5
    	maTDK=RS("maTDK")+0;//6
    	noteDEN=RS("noteDEN")+"";//7
   }
  else queryError+="Mã đèn không có trong database </br>";
  RS.Close(); 
} // end of if(maDEN!="undefined")
else queryError+="Không có thông tin mã đèn</br>";  
 %>
<html> 
<head> 
 <meta http-equiv="Content-Language" content="en-us">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
 <title>Cap nhat thong tin den</title> 
 <style type="text/css"> 
    .labelTDK {
 	color: red;
 	background-color: none;
 	font-family: "Times New Roman";
 	font-size: 13px;
 	font-weight: bold;
 	text-align: center;
 	width: 120px;
 	border: 0px;
 	white-space: nowrap;
 	}
   .labelDEN {
     color: blue;
     background-color: none;
     font-family: "Times New Roman";
     font-size: 11px;
     font-weight: normal;
     text-align: center;
     width: 80px;
     border: 0px;
     white-space: nowrap;
   	}
.labelCAP {
     color: red;
     background-color: none;
     font-family: "Times New Roman";
     font-size: 12px;
     font-weight: normal;
     text-align: left;
     width: 80px;
     border: 0px;
     white-space: nowrap;
   	}
 </style> 
 <script type="text/javascript" src="http://maps.google.com/maps/api/js?v=3&amp;sensor=true&v=3&libraries=geometry"></script> 
 <script type="text/javascript" src="/js/markerwithlabel.js"></script> 
 <script type="text/javascript"> 
   function initMap() {
	var home = new google.maps.LatLng(10.726315, 106.645145);
	var tdkIconA = new google.maps.MarkerImage('/images/tdk.png',
					new google.maps.Size(22,36)); //bieu thuong tu dieu khien duoc chon
	var tdkIcon = new google.maps.MarkerImage('/images/tdk1.png',
					new google.maps.Size(20,34)); // bieu tuong tu dieu khien binh thuong
    var denIcon = '/images/den2.png';// bieu tuong den
    var capIcon = '/images/blank.png';// bieu tuong cap
    var homeIcon = '/images/home.png';// bieu tuong home
    var map = new google.maps.Map(document.getElementById('map_canvas'), {
       zoom: 17,
       center: home,
       mapTypeId: google.maps.MapTypeId.ROADMAP
     });
	var quyhome = new MarkerWithLabel({
    			   position: home,
    			   map: map,
    			   labelContent: "Nhà Quý",
    			   icon: homeIcon,
    			   labelAnchor: new google.maps.Point(60, 5),
    			   labelClass: "labelTDK", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
<%if(queryError=="")
	{
///***HIEN THI TU DIEU KHIEN
	sql="SELECT * FROM tudieukhien WHERE maTDK="+maTDK+"" ;
	RS.Open(sql,conn,1,2); 
	if(!RS.EOF){
%>
	var tdk = new google.maps.LatLng(<%=RS("latTDK")%>, <%=RS("longTDK")%>);
	var tdkMarker = new MarkerWithLabel({
    			   position: tdk,
    			   map: map,
    			   labelContent: "<%=RS("tenTDK")%>",
    			   icon: tdkIconA,
    			   labelAnchor: new google.maps.Point(40, 0),
    			   labelClass: "labelTDK", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
    			map.setCenter(tdk);
<%
	tenTDK=RS("tenTDK")+"";
	RS.Close();
 }%> // enf of if(!RS.EOF){

///****HIEN THI DEN 
<%
	sql="SELECT * FROM den WHERE maTDK="+maTDK+"" ;
	RS.Open(sql,conn,1,2); 
	while(!RS.EOF){
%>
  	var den = new google.maps.LatLng(<%=RS("latDEN")%>, <%=RS("longDEN")%>);
	var denMarker<%=RS("maDEN")%> = new MarkerWithLabel({
    			   position: den,
    			   map: map,
    			   labelContent: "<%=RS("tenDEN")%>",
    			   icon: denIcon,
    			   labelAnchor: new google.maps.Point(40, 0),
    			   labelClass: "labelDEN", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
 //Tao click se chuyen den trang updateden.asp
    google.maps.event.addListener(denMarker<%=RS("maDEN")%>, 'click', function() {
		window.location.assign("/admin/updateden.asp?kv=<%=kv%>&maDEN=<%=RS("maDEN")%>");
	});
 <%RS.MoveNext();
	}
%>
<%
///***HIEN THI CAP		
//tao bang tam
	var maDENs = new Array();
	var latDENs = new Array();
	var longDENs= new Array();
	RS.MoveFirst();
	i=0;
	while(!RS.EOF){
		maDENs[i]=RS("maDEN")+0;
		latDENs[i]=RS("latDEN")+0;
    	longDENs[i]=RS("longDEN")+0;
     	i++;
		RS.MoveNext();
		}

//hien thi cap
RS.MoveFirst();
while(!RS.EOF){
     j=vitri(RS("maDEN0"));
     latDEN0=latDENs[j];
     longDEN0=longDENs[j];
%>
	var den = new google.maps.LatLng(<%=RS("latDEN")%>, <%=RS("longDEN")%>);
	if (<%=RS("maDEN0")%>==0) {
		var den0=tdk; // theo quy dinh neu den duoc cap nguon boi ma den=0, la cap nguon tu tu dieu khien
	} else{
		var den0 = new google.maps.LatLng(<%=latDEN0%>, <%=longDEN0%>);
	}
	var cap<%=RS("maDEN")%> = new google.maps.Polyline({
	path: [den,den0],
	strokeColor: '#ff0000',
	strokeOpacity: 1.0,
	strokeWeight: 2
  	});
	cap<%=RS("maDEN")%>.setMap(map);
	
	var cap = new MarkerWithLabel({
    			   position: new google.maps.LatLng((den.lat()+den0.lat())/2, (den.lng()+den0.lng())/2), //
    			   map: map,
    			   labelContent:google.maps.geometry.spherical.computeDistanceBetween (den, den0).toFixed(2)+"m",
    			   icon: capIcon,
    			   labelAnchor: new google.maps.Point(40, 10),
    			   labelClass: "labelCAP", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
				
 <%RS.MoveNext();
	}
  
 RS.Close();
//Ham tra ve thu tu cua trong mang cua maDEN
function vitri(maDEN) {  
	i=0;
	j=0;
	while (i<maDENs.length)
	{
	if (maDENs[i]==maDEN) j=i;
	i++;
	}
	return (j);  
	}   
		
%>
///**TAO CAP XONG
		var den = new google.maps.LatLng(<%=latDEN%>, <%=longDEN%>);
		var denMarker<%=maDEN%> = new MarkerWithLabel({
    			   position: den,
    			   map: map,
    			   labelContent: "<%=tenDEN%>",
    			   icon: denIcon,
    			   labelAnchor: new google.maps.Point(40, 0),
    			   labelClass: "labelDEN", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
    			map.setCenter(den);
    	//Tao click se chuyen den trang updateden.asp
    	google.maps.event.addListener(denMarker<%=maDEN%>, 'click', function() {
			window.location.assign("/admin/updateden.asp?kv=<%=kv%>&maDEN=<%=maDEN%>");
		});
	<%}%> // end of if(queryError=="")
    } // end of initMap() 
 </script> 
</head> 
<body onload="initMap()"> 
<%if (queryError=="") {%>
<form method="GET" action="updateden.asp">
<input type="hidden" name="update" value="yes">
<input type="hidden" name="maDEN" value="<%=maDEN%>">
<table border="0" width="100%" id="table1">
	<tr>
		<td colspan="2"><font size="4">Cập nhật thông tin đèn</font> <font color="#0000FF"><b><%=tenDEN%></b></font> bởi <%=Session("name")%> [ <a href="admin/userman.asp"><%=Session("username")%></a> ]
		</td>
	</tr>
	<tr>
		<td width="15%">1.Tên đèn</td>
		<td width="35%"><input type="text" name="tenDEN" size="20" value="<%=tenDEN%>"></td>
		
	</tr>
	<tr>
		<td>2.Vĩ độ(lat)</td>
		<td><input type="text" name="latDEN" size="20" value="<%=latDEN%>"></td>
	</tr>
	<tr>
		<td >3.Kinh độ (long)</td>
		<td ><input type="text" name="longDEN" size="20" value="<%=longDEN%>"></td>
	</tr>
	<tr>
		<td >4.Độ chính xác</td>
		<td ><input type="text" name="accDEN" size="20" value="<%=accDEN%>"></td>
	</tr>
	<tr>
		<td >6.Thuộc tủ điều khiển</td>
		<td ><%=maTDK%>-<%=tenTDK%></td>
	</tr>
	<tr>
		<td >6.Cấp nguồn từ đèn</td>
		<td ><select size="1" name="maDEN0">
			 <% 
       		j=0;
       		while(j<maDENs.length)
       		 { 
       		  if(maDENs[j]==maDEN0){%> 	
				<option value="<%=maDENs[j]%>" selected><%=tenDENs[j]%></option>
			  <%} else {%>
				<option value="<%=maDENs[j]%>"><%=tenDENs[j]%></option>
				<%}
			j++;
			}
			%>	
		</select></td>
	</tr>
	<tr>
		<td >7.Ghi chú</td>
		<td ><input type="text" name="noteDEN" size="20" value="<%=noteDEN%>"></td>
	</tr>

	<tr>
		<td colspan="2"><input type="submit" value="Cập nhật thông tin" />
		  <%if(update=="yes") {
		  	if (updateError==""){%> <font color="#0000FF" ><b>Thông tin đã được cập nhật !</b></font>
			 <%} else {%><font color="#FF0000" ><b>Cập nhật không thành công vì:</b> <%=updateError%> </font>
			 <%}
			} %>
		</td>
	</tr>
</table>
</form>	
<div id="map_canvas" style="height: 500; width: 100%;"></div>
<%}else { //else of <%if (queryError=="")
%>
<font color="#FF0000"><b><%=queryError%></b></font>
<%}%>
</body> 
</html>