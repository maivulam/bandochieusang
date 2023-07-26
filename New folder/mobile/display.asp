<%@language="jscript" CODEPAGE="65001"%>
<%
/*
Display.asp
01/12/2011
- Dieu chinh khung hien thi nho lai
- Lien ket hient thi hinh anh minh hoa
26/9/2011
-Tu dong cap nhat vi tri theo chu ky truoc
25/9/2011
-Xac dinh duoc vi tri hien tai
23/9/2011
-Them chuc nang dan duong tu co noi co dinh
18/9/2011
- Hien thi vi tri TDK trong so do luoi 
15/9/2011
- Hien thi chieu dai cap
- Hien thi den va cap den
30/4/2011
- cap nhat hien thi hinh anh + thong tin moi tu diue khien tren ban do
24.4.2011
- Hien thi hinh va hinh anh khi click vao tu da chon
22.4.2011
- Stick TDK tim thay va hien thi cac tu thuoc cung duong
- Nhan maDuong va maTDK
18.4.2011
- Hien thi duoc vi tri tu theo maTDK
- Can xu ly tiep truong hop tu chua co toa do
*/
  //Kiem trapassword
    if(Session("logincs6")!=1)Response.Write("<script>window.parent.location='index.asp';</script>");//Response.Redirect("index.asp");
 //Lay du lieu tu de the hien 	
 	maTDK=Request("maTDK")+"";
 	maDuong=Request("maDuong")+"";
 	sql="123";
if(maDuong!="undefined"){
   var conn=Server.CreateObject("ADODB.Connection");
   var RS=Server.CreateObject("ADODB.Recordset");
///////CHON FILE DATA THEO QUAN HUYEN////////   	
   	//Lay du lieu
   	kv=Request("kv")+"";
   	if(kv=="undefined") kv="quan12";
   	if(kv=="quan12"){
   					path=Server.MapPath("/db/quan12.mdb");   
   					khuvuc="Quận 12";
   					}
	if(kv=="quangovap"){
   					path=Server.MapPath("/db/quangovap.mdb");
   					khuvuc="Quận Gò Vấp";
   					}
	if(kv=="quanbinhthanh"){
   					path=Server.MapPath("/db/quanbinhthanh.mdb");
   					khuvuc="Quận Bình Thạnh";
   					}
	//////////////////XONG PHAN CHON FILE DATA////////////////////////////   
   connStr="DBQ=" + path + ";Driver={Microsoft Access Driver (*.mdb)}";
   conn.Open(connStr); 
   sql="SELECT * FROM tudieukhien WHERE maDuong="+maDuong+"";
   RS.Open(sql,conn,1,2);  
  }
 %>
<html> 
<head> 
 <meta http-equiv="content-type" content="text/html; charset=utf-8" /> 
 <title>Trang display trong ban do chieu sang.com</title> 
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
 /*
<script type="text/javascript" src="http://maps.google.com/maps/api/js?&libraries=geometry"></script> 
*/

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_Se5Y0hUjMpYoffQaVrCZQ-__QixdxIg &libraries=geometry &v=3&amp;sensor=true &callback=initMap">
</script>



 <script type="text/javascript" src="/js/markerwithlabel.js"></script> 
 <script type="text/javascript"> 
	var directionDisplay;
	var directionsService = new google.maps.DirectionsService();
	var directionsDisplay = new google.maps.DirectionsRenderer(); 
	var nguyenthi=new google.maps.LatLng(10.749547, 106.658974);
	var luuhuuphuoc=new google.maps.LatLng(10.733355, 106.640920);
	var chauvanliem=new google.maps.LatLng(10.753721, 106.658470);
	var phamvietchanh=new google.maps.LatLng(10.767324, 106.684688);
	var vpq12=new google.maps.LatLng(10.861585, 106.686124);
	var khu1=new google.maps.LatLng(10.776376, 106.680931);
	var khu2=new google.maps.LatLng(10.831562, 106.764635);
	var khu3=new google.maps.LatLng(10.862283, 106.675221);
	var khu4=new google.maps.LatLng(10.7631, 106.6925);
	var sgtvt=new google.maps.LatLng(10.776840, 106.700090);
	var tdkIconA = new google.maps.MarkerImage('/images/tdk.png',
					new google.maps.Size(22,36)); //bieu thuong tu dieu khien duoc chon
	var tdkIcon = new google.maps.MarkerImage('/images/tdk1.png',
					new google.maps.Size(20,34)); // bieu tuong tu dieu khien binh thuong
    var denIcon = 'images/den2.png';// bieu tuong den
    var capIcon = 'images/blank.png';// bieu tuong cap
    var homeIcon = 'images/home.png';// bieu tuong home
    var companyIcon = 'images/company.png';// bieu tuong cty
	var khuIcon = 'images/khu.png';// bieu tuong khu   
   function initMap() {
	 var map = new google.maps.Map(document.getElementById('map_canvas'), {
       zoom: 17,
       center: vpq12,
       mapTypeId: google.maps.MapTypeId.ROADMAP
     });
     directionsDisplay.setMap(map); // chuc nang renderer cho dan duong
   	//tao mot so dia diem
   	var nguyenthiMarker = new MarkerWithLabel({
    			   position: nguyenthi,
    			   map: map,
    			   labelContent: "55 Nguyễn Thi",
    			   icon: companyIcon,
    			   labelAnchor: new google.maps.Point(60, 5),
    			   labelClass: "labelTDK", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
		google.maps.event.addListener(nguyenthiMarker, 'click', function() {
		window.open("http://www.chieusang.com");
		});

   var chauvanliemMarker = new MarkerWithLabel({
    			   position: chauvanliem,
    			   map: map,
    			   labelContent: "Sapulico",
    			   icon: companyIcon,
    			   labelAnchor: new google.maps.Point(60, 5),
    			   labelClass: "labelTDK", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
		google.maps.event.addListener(chauvanliemMarker, 'click', function() {
		window.open("http://www.chieusang.com");
		});
	var luuhuuphuocMarker = new MarkerWithLabel({
    			   position: luuhuuphuoc,
    			   map: map,
    			   labelContent: "167 Lưu Hữu Phước",
    			   icon: companyIcon,
    			   labelAnchor: new google.maps.Point(60, 5),
    			   labelClass: "labelTDK", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
		google.maps.event.addListener(luuhuuphuocMarker, 'click', function() {
		window.open("http://www.chieusang.com");
		});
	var phamvietchanhMarker = new MarkerWithLabel({
    			   position: phamvietchanh,
    			   map: map,
    			   labelContent: "27 Phạm Viết Chánh",
    			   icon: companyIcon,
    			   labelAnchor: new google.maps.Point(60, 5),
    			   labelClass: "labelTDK", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
	google.maps.event.addListener(phamvietchanhMarker, 'click', function() {
	window.open("http://www.chieusang.com");
		});
	var vpq12Marker = new MarkerWithLabel({
    			   position: vpq12,
    			   map: map,
    			   labelContent: "Văn Phòng Quận 12",
    			   icon: companyIcon,
    			   labelAnchor: new google.maps.Point(60, 5),
    			   labelClass: "labelTDK", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
		google.maps.event.addListener(vpq12Marker, 'click', function() {
		window.open("http://www.chieusang.com");
		});

	var khu1Marker = new MarkerWithLabel({
    			   position: khu1,
    			   map: map,
    			   labelContent: "Khu QLGTĐT số 1",
    			   icon: khuIcon,
    			   labelAnchor: new google.maps.Point(60, 5),
    			   labelClass: "labelTDK", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
	google.maps.event.addListener(khu1Marker, 'click', function() {
	window.open("http://sgtvt.hochiminhcity.gov.vn/web/tintuc/default.aspx?cat_id=546&news_id=226#content");
	});
	var khu2Marker = new MarkerWithLabel({
    			   position: khu2,
    			   map: map,
    			   labelContent: "Khu QLGTĐT số 2",
    			   icon: khuIcon,
    			   labelAnchor: new google.maps.Point(60, 5),
    			   labelClass: "labelTDK", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
	google.maps.event.addListener(khu2Marker, 'click', function() {
	window.open("http://sgtvt.hochiminhcity.gov.vn/web/tintuc/default.aspx?cat_id=546&news_id=365");
	});
	var khu3Marker = new MarkerWithLabel({
    			   position: khu3,
    			   map: map,
    			   labelContent: "Khu QLGTĐT số 3",
    			   icon: khuIcon,
    			   labelAnchor: new google.maps.Point(60, 5),
    			   labelClass: "labelTDK", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
	google.maps.event.addListener(khu3Marker, 'click', function() {
	window.open("http://sgtvt.hochiminhcity.gov.vn/web/tintuc/default.aspx?cat_id=546&news_id=624");
	});
	var khu4Marker = new MarkerWithLabel({
    			   position: khu4,
    			   map: map,
    			   labelContent: "Khu QLGTĐT số 4",
    			   icon: khuIcon,
    			   labelAnchor: new google.maps.Point(60, 5),
    			   labelClass: "labelTDK", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
    	google.maps.event.addListener(khu4Marker, 'click', function() {
		window.open("http://khuqlgtdtso4.com");
		});
	var sgtvtMarker = new MarkerWithLabel({
    			   position: sgtvt,
    			   map: map,
    			   labelContent: "Sở GTVT",
    			   icon: khuIcon,
    			   labelAnchor: new google.maps.Point(60, 5),
    			   labelClass: "labelTDK", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
    	google.maps.event.addListener(sgtvtMarker, 'click', function() {
		window.open("http://sgtvt.hochiminhcity.gov.vn");
		});

////TAO TU DIEU KHIEN TU DATABASE /////////////////////
	<%
	if(maDuong!="undefined" && !RS.EOF){
	RS.MoveFirst();
	latTDK=RS("latTDK");
    longTDK=RS("longTDK");%>
	map.setCenter(new google.maps.LatLng(<%=latTDK%>, <%=longTDK%>));
	<%while(!RS.EOF)
	 {
     latTDK=RS("latTDK"); 
     longTDK=RS("longTDK");
     accTDK=RS("accTDK");
     tenTDK=RS("tenTDK");
     diachiTDK=RS("diachiTDK");
     idmTDK=RS("idmTDK");
     makhTDK=RS("makhTDK");
     dateTDK=RS("dateTDK");
     userUpdateTDK=RS("userUpdateTDK");
     dateUpdateTDK=RS("dateUpdateTDK");
     rccb='Chưa lắp đặt';
     if(RS("rccbTDK")==1)rccb='Đã lắp đặt';  
     if(latTDK>0 && longTDK>0) {
      if (maTDK==RS("maTDK")+""){ 
		tenTDKA=tenTDK+"";
		latTDKA=latTDK+0;
		longTDKA=longTDK+0;
		%>
			var tdkA = new google.maps.LatLng(<%=latTDK%>, <%=longTDK%>);
			var tdkMarkerA = new MarkerWithLabel({
    			   position: tdkA,
    			   map: map,
    			   labelContent: "<%=tenTDK%>",
    			   icon: tdkIconA,
    			   labelAnchor: new google.maps.Point(40, 0),
    			   labelClass: "labelTDK", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
    			map.setCenter(tdkA);
    	//Tao info windows                                                  background="/images/<%=kv%>/tdk/<%=RS("maTDK")%>.jpg"
    		var contentStringA ='<font size="4"><b>Tủ điều khiển <%=tenTDK%></b><br></font>'+
    							'<font size="3">- Địa chỉ: <%=diachiTDK%><br>'+
    							'- Tọa độ: (<%=latTDK%>, <%=longTDK%>) sai số:+/-<%=accTDK%>m<br>'+
    							'- Loại tủ: <%=idmTDK%>A<br>'+
    							'- Ngày lắp đặt: <%=dateTDK%><br>'+
    							'- RCCB: <%=rccb%><br>'+
    							'- Mã khách hàng: <%=makhTDK%><br>'+
    							'- Dữ liệu được cập nhật bởi: <%=userUpdateTDK%>, ngày :<%=dateUpdateTDK%><br>'+
    							'- <a href="hinhanh.asp?kv=<%=kv%>&maTDK=<%=RS("maTDK")%>">Hình ảnh thực tế</a><br>'+
								'<font color="#C0C0C0">======================================</font><br>'+
    							'<a href="admin/updatetdk.asp?kv=<%=kv%>&maTDK=<%=RS("maTDK")%>">Sửa thông tin</a>'+
    							'</font>';   		    		    		
			var infowindow = new google.maps.InfoWindow({
			    content: contentStringA
				});
			google.maps.event.addListener(tdkMarkerA, 'click', function() {
				  infowindow.open(map,tdkMarkerA);
				});
    	<%} else {%>
    		var tdk = new google.maps.LatLng(<%=latTDK%>, <%=longTDK%>);
			var tdkMarker<%=RS("maTDK")%> = new MarkerWithLabel({
    			   position: tdk,
    			   map: map,
    			   labelContent: "<%=tenTDK%>",
    			   icon: tdkIcon,
    			   labelAnchor: new google.maps.Point(40, 0),
    			   labelClass: "labelTDK", // the CSS class for the label
    			   labelStyle: {opacity: 0.75}
    			 });
 			//Tao info windows                                                            background="/images/<%=kv%>/tdk/<%=RS("maTDK")%>.jpg"
    		var contentString<%=RS("maTDK")%> = '<font size="4"><b>Tủ điều khiển <%=tenTDK%></b><br></font>'+
    											'<font size="3">- Địa chỉ: <%=diachiTDK%><br>'+
    											'- Tọa độ: (<%=latTDK%>, <%=longTDK%>) sai số:+/-<%=accTDK%>m<br>'+
    											'- Loại tủ: <%=idmTDK%>A<br>'+
    											'- Ngày lắp đặt: <%=dateTDK%><br>'+
    											'- RCCB: <%=rccb%><br>'+
    											'- Mã khách hàng: <%=makhTDK%><br>'+
    											'- Dữ liệu được cập nhật bởi: <%=userUpdateTDK%>, ngày :<%=dateUpdateTDK%><br>'+
    											'- <a href="hinhanh.asp?kv=<%=kv%>&maTDK=<%=RS("maTDK")%>">Hình ảnh thực tế</a><br>'+
    											'<font color="#C0C0C0">======================================</font><br>'+
    											'<a href="admin/updatetdk.asp?kv=<%=kv%>&maTDK=<%=RS("maTDK")%>">Sửa thông tin</a>'+
    											'&nbsp;&nbsp;&nbsp;<a href="display.asp?kv=<%=kv%>&maDuong=<%=RS("maDuong")%>&maTDK=<%=RS("maTDK")%>">Chọn tủ điều khiển</a>'+
    											'</font>'; 
    		var infowindow<%=RS("maTDK")%> = new google.maps.InfoWindow({
			    content: contentString<%=RS("maTDK")%>
				});
			google.maps.event.addListener(tdkMarker<%=RS("maTDK")%>, 'click', function() {
				  infowindow<%=RS("maTDK")%>.open(map,tdkMarker<%=RS("maTDK")%>);
				});

 			<%}// end of  if (maTDK==RS("maTDK")+"")
 	 } // end of if(latTDK>0 && longTDK>0)	
    RS.MoveNext();
	}// end of while(!RS.EOF)
    RS.Close();
    }%> 
 
////////*********TAO DEN TU DATABASE****************///////
<%
if(maTDK!="undefined"){
	sql="SELECT * FROM den WHERE maTDK="+maTDK+"" ;
	RS.Open(sql,conn,1,2); 
	soluongDEN=0;
	while(!RS.EOF){
     maDEN=RS("maDEN");
     latDEN=RS("latDEN"); 
     longDEN=RS("longDEN");
     accDEN=RS("accDEN");
     tenDEN=RS("tenDEN");        
	 soluongDEN++;
%>
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
 //Tao click se chuyen den trang updateden.asp
    google.maps.event.addListener(denMarker<%=maDEN%>, 'click', function() {
		window.location.assign("admin/updateden.asp?kv=<%=kv%>&maDEN=<%=maDEN%>");
	});
 <%RS.MoveNext();
	}
if (soluongDEN){
/////TAO CAP NGUON TU DATABASE/////////////    
	//tao bang tam
	var maDENs = new Array();
	var latDENs = new Array();
	var longDENs= new Array();
	soluongCAP=0;
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
     maDEN=RS("maDEN")+0;
     latDEN=RS("latDEN")+0; 
     longDEN=RS("longDEN")+0;
     maDEN0=RS("maDEN0")+0;
     j=vitri(maDEN0);
     latDEN0=latDENs[j];
     longDEN0=longDENs[j];
%>
	var den = new google.maps.LatLng(<%=latDEN%>, <%=longDEN%>);
	if (<%=maDEN0%>==0) {
		var den0=tdkA; // theo quy dinh neu den duoc cap nguon boi ma den=0, la cap nguon tu tu dieu khien
	} else{
		var den0 = new google.maps.LatLng(<%=latDEN0%>, <%=longDEN0%>);
	}
	var cap<%=maDEN%> = new google.maps.Polyline({
	path: [den,den0],
	strokeColor: '#ff0000',
	strokeOpacity: 1.0,
	strokeWeight: 2
  	});
	cap<%=maDEN%>.setMap(map);
	soluongCAP = + google.maps.geometry.spherical.computeDistanceBetween (den, den0).toFixed(2);
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
	conn.Close();
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

  }// end of soluongDEN	
}// end of if(maDuong!="undefined" && !RS.EOF)

%> 
 } //end of function initMap() 
//// DAN DUONG TU NHA DEN TU DUOC CHON /////////////////
<%if(maTDK!="undefined"){
%>
///PHAN DAN DUONG
//ham tinh lo trinh tong the
function calcRoute() {
	var batdau = document.getElementById("start").value;
	if (batdau=="nguyenthi")xuatphat=nguyenthi;
	if (batdau=="luuhuuphuoc")xuatphat=luuhuuphuoc;
	if (batdau=="chauvanliem")xuatphat=chauvanliem;
	if (batdau=="phamvietchanh")xuatphat=phamvietchanh;
	if (batdau=="vpq12")xuatphat=vpq12;
	if (batdau=="khu1")xuatphat=khu1;
	if (batdau=="khu2")xuatphat=khu2;
	if (batdau=="khu3")xuatphat=khu3;
	if (batdau=="khu4")xuatphat=khu4;
	if (batdau=="sgtvt")xuatphat=sgtvt;
	if (batdau=="vitrihientai"){
		myLocation();
		document.getElementById("cycle").style.display = "inline";
		//alert("Xac dinh vi tri the ham: " +xuatphat);
	} else {
		lotrinh();
		document.getElementById("cycle").style.display = "none";
	}
  }// end of calcRoute()
//ham tinh toan lo trinh tu vi tri hien tai den tu dieu khien duoc chon
var browserSupportFlag =  new Boolean();




function myLocation(){
   // Try W3C Geolocation (Preferred)
  	if(navigator.geolocation) {
    //browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {   //function(position),function() (showmap(), error())
      xuatphat = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      //alert("Xác định vị trí hiện tại bằng HTML5: " +xuatphat);
      // hien thi lo trinh
      lotrinh();
   }, function() {
      handleNoGeolocation(browserSupportFlag);
    });
   // Browser doesn't support Geolocation
   } else {
    browserSupportFlag = false;
    handleNoGeolocation(browserSupportFlag);
  }
	
} // end of function myLocation()
//ham hien thi lo tirnh tu diem xuatphat den tu dieu khien duoc chon
function lotrinh(){  
	tdkA=new google.maps.LatLng(<%=latTDKA%>, <%=longTDKA%>);
	var request = {
        origin:xuatphat, 
        destination:tdkA,
        travelMode: google.maps.DirectionsTravelMode.DRIVING//DRIVING//WALKING//BICYCLING //
    };
    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
      }
    });
 } // end of function lotrinh()   
function handleNoGeolocation(errorFlag) {
    if (errorFlag == true) {
      alert("Geolocation service failed.");
    } else {
      alert("Your browser doesn't support geolocation.");
    }
}	
//function tu dong cap nhat vi tri
function AutoLocation(){
	var cycle=parseInt(document.getElementById("cycle").value);
	var start=document.getElementById("start").value;
	if (start=="vitrihientai" && cycle) {
		myLocation();
		setTimeout("AutoLocation()",cycle);
	} 
}
//////// HET PHAN DAN DUONG
<%}%>
///HET PHAN DAN DUONG
  </script> 
</head> 
<body onload="initMap()" > 
<div id="map_canvas" style="height: 97%; width: 100%;"></div>
<%if(maTDK!="undefined"){
%>
<div>
<b>Dẫn đường từ: </b>
<select id="start" onchange="calcRoute();">
  <option value="noshow">----------</option>
  <option value="nguyenthi">55 Nguyễn Thi</option>
  <option value="luuhuuphuoc">167 Lưu Hữu Phước</option>
  <option value="chauvanliem">121 Châu Văn Liêm</option>
  <option value="phamvietchanh">27 Phạm Viết Chánh</option>
  <option value="vpq12">VP Quận 12</option>
  <option value="sgtvt">Sở GTVT</option>
  <option value="khu1">Khu QLGTĐT 1</option>
  <option value="khu2">Khu QLGTĐT 2</option>
  <option value="khu3">Khu QLGTĐT 3</option>
  <option value="khu4">Khu QLGTĐT 4</option>
  <option value="vitrihientai">Vị trí hiện tại</option>
</select>
<select id="cycle" style="display:none;" hidde onchange="AutoLocation();">
  <option value="0">Cập nhật vị trí</option>
  <option value="3000">Chu kỳ 3 giây</option>
  <option value="5000">Chu kỳ 5 giây</option>
  <option value="10000">Chu kỳ 10 giây</option>
</select>
<b>Đến tđk: </b>
<select id="end" onchange="calcRoute();">
   	<option value="chicago, il"><%=tenTDKA%></option>
</select>
</div>
<%} //if(maDuong!="undefined")
%>
</body> 
</html>