<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Custom Stylesheet -->
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <!-- /Custom Stylesheet -->
    
    <!-- Font Awesome -->
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <!-- /Font Awesome -->
    
    <script type="text/javascript" src="js/jquery-1.11.3.min.js" ></script>
	<script type="text/javascript" src="js/jquery-ui.js" ></script>
    
</head>
<body>
<form action="GenrateBill" method="post">
<div class="billTable">
							 <table id="billTable" class="responstable1" >
								 <thead>
                                    <tr>
                                        <th colspan="4"><INPUT type="button" value="Delete Service" onclick="deleteRow('billTable')" class="btn_look" style="float:none;background-color:#38546B;width:25%;padding:0.3em 0;"/></th>
                                        <th colspan="1"><input type="checkbox" name="selectAll" onchange="checkAll(this)"/>Select All</th>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <th>Service Name</th>
                                        <th>Per Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                               <tbody>
							 	<tr>
							 		<td><input type="checkbox" name="chkbox"></td>
							 		<td><input type="text" name="serviceName" value="Service One"></td>
							 		<td colspan="3"><input type="text" name="price" class="price" value="500" /><i class="fa fa-minus"></i><input type="text" name="qty[]" class="qty" value="1" /><i class="fa fa-plus"></i><input type="text" name="total[]" class="total" value="500" /></td>
							 		<td><input type="checkbox" name="chkbox"></td>
							 		<td><input type="text" name="serviceName" value="Service One"></td>
							 		<td colspan="3"><input type="text" name="price" class="price" value="500" /><i class="fa fa-minus"></i><input type="text" name="qty[]" class="qty" value="1" /><i class="fa fa-plus"></i><input type="text" name="total[]" class="total" value="500" /></td>
							 		<td><input type="checkbox" name="chkbox"></td>
							 		<td><input type="text" name="serviceName" value="Service One"></td>
							 		<td colspan="3"><input type="text" name="price" class="price" value="500" /><i class="fa fa-minus"></i><input type="text" name="qty[]" class="qty" value="1" /><i class="fa fa-plus"></i><input type="text" name="total[]" class="total" value="500" /></td>
								</tr>
								<tr>
									<td><input type="submit" value="OK" /></td>
								</tr>
							</tbody>
                            </table>  
                            <input type="button" value="PRINT" onclick="javascript:window.print();"/>                                         
						</div>	
						
						<a href="test1.jsp">Go</a>
</form>						     
</body>
</html>