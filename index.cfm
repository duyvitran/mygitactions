<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ColdFusion QR Code Examples</title>
</head>
<body>
<cfparam name="form.url" default="http://cflove.org">

<div style="padding:10px">
<form action="" method="post">
	<cfoutput>
	<input type="text" name="url" size="50" value="#form.url#" />
	<input type="submit" value="Give Me a QR Code" />
	</cfoutput>
</form>
</div>

<cfset paths 			= arrayNew(1)>
<cfset paths[1] 		= expandPath("zxing_qr.jar")>
<cfset loader 			= createObject("component", "javaloader.JavaLoader").init(paths)>

<cfset BarcodeFormat 			= loader.create('com.google.zxing.BarcodeFormat')>
<cfset QRCodeWriter 			= loader.create('com.google.zxing.qrcode.QRCodeWriter').init()>
<cfset MatrixToImageWriter 		= loader.create('com.google.zxing.client.j2se.MatrixToImageWriter')>
<cfset QRcode	 				= QRCodeWriter.encode( form.url , BarcodeFormat.QR_CODE, 100, 100 )>
<cfset image	 				= ImageNew( MatrixToImageWriter.toBufferedImage( QRcode ) )>
<cfimage action="writeToBrowser" source="#image#" format="png">
</body>
</html>