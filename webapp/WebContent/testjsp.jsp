<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script language="javascript" type="text/javascript">
            function printImage() {
                
                    var html  = "<html><head>" +
                        "</head>" +
                        "<body  style ='-webkit-print-color-adjust:exact;'>"+
                        "<img src=\"okmarhosplogo.jpg\" onload=\"javascript:window.print();\"/>" +
                        "</body>";
                    var win = window.open('', 'my div', 'height=400,width=600');
                    win.document.write(html);
                  
            }
			printImage();
			
			self.location='http://localhost:8080/omkarkhalanehospital/dashboard.jsp';
       </script>
</body>
</html>