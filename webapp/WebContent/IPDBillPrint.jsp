<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title><style>
<style>
.width10
{
width:10%;	
}
</style>
</head>

<body>

<table border="1" style="width:100%; border-collapse: collapse;">
  <tr>
    <td style="width:50%;">1. Registration</td>
    
<td></td>

  </tr>
  </tr>
  <tr>
    <td>2. Room Charges from&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; /&nbsp;&nbsp;&nbsp;  /     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; / &nbsp;&nbsp;&nbsp; /     &nbsp;&nbsp;&nbsp;&nbsp; @rs. </td>
  
<td>${param.perunitroomcharges }</td>

  </tr>
  </tr>
  <tr>
    <td>3. Nursing Charges @Rs.${param.perunitnursingcharges }         for           days.</td>
   
<td></td>

  </tr>
  <tr>
    <td>4. Dr's visit / Consultation Dr. </td>
  
<td>${param.vistingdoctor1 }</td>

  </tr>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;Dr.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${param.vistingdoctor2 }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dr. </td>
  
<td>${param.vistingdoctor3 }</td>

  </tr>
  </tr>
  <tr>
    <td>5. Operating Charges</td>
  
<td>${param.operatingcharges }</td>

  </tr>
  </tr>
  <tr>
    <td>6. Assistant's Charges</td>
  
<td>${param.assistantcharges }</td>

  </tr>
  </tr>
  <tr>
    <td>7. Operation Theater Charges </td>
  
<td>${param.otcharges }</td>

  </tr>
  </tr>
  <tr>
    <td>8. Oxygen Charges  </td>
  
<td>${param.oxygencharges }</td>

  </tr>
  </tr>
  <tr>
    <td>9.  Anaesthesia Drugs, O.T Drugs, Ststure Material etc. Charges</td>
  
<td>${param.drugscharges }</td>

  </tr>
  </tr><tr>
    <td>10. Anaesthetist's Charges Dr. </td>
  
<td>${param.doctorcharges }</td>

  </tr>
  </tr>
  <tr>
    <td>11. Special Instruments / Equipments Charges </td>
  
<td>${param.instrumentcharges }</td>

  </tr>
  </tr>
  <tr>
    <td>12. Implants and/or Other Material(s)</td>
  
<td>${param.implants }</td>

  </tr>
  </tr>
  <tr>
    <td>13. Delivery Charges</td>
  
<td>${param.deliverycharges }</td>

  </tr>
  </tr>
  <tr>
    <td>14. Labour Room Charges </td>
  
<td>${param.labour }</td>

  </tr>
  </tr>
  <tr>
    <td>15. Baby Care Charges</td>
  
<td>${param.babycare }</td>

  </tr>
  </tr>
  <tr>
    <td>16. I.V.Infusion and / or Blood Transfusions</td>
  
<td>${param.ivfusion }</td>

  </tr>
  </tr>
  <tr>
    <td>17. Disposable Material </td>
  
<td>${param.disposable }</td>

  </tr>
  </tr>
  <tr>
    <td>18. Hospital's Drugs, Medicines, etc. abd / or Drug Administration Charges</td>
  
<td>${param.admincharges }</td>

  </tr>
  </tr>
  <tr>
    <td>19. Dressing and /or Plaster Charges</td>
  
<td>${param.dressing }</td>

  </tr>
  </tr>
  <tr>
    <td>20. Laboratory Charges </td>
  
<td>${param.lab }</td>

  </tr>
  </tr>
  <tr>
    <td>21. Special Investigation Charges </td>
  
<td>${param.special }</td>

  </tr>
  </tr>
  <tr>
    <td>22. X-ray Charges </td>
  
<td>${param.xray }</td>

  </tr>
  </tr>
  <tr>
    <td>23. Miscellaneous  </td>
  
<td>${param.misc }</td>

  </tr>
  </tr>
  <tr>
    <td>Rs. in words:</td>
  
<td>${param.totalinwords }</td>

  </tr>
  </tr>
  <tr  style="height:25px;">
    <td></td>
  
<td></td>

  </tr>
  </tr>
  <tr style="height:25px;" >
    <td></td>
  
<td></td>

  </tr>
  </tr>
  </table>
  <table border="1" style="width:52%; border-collapse: collapse; float:left;">
   <tr>
    <td class="width10" style="height:8.2em;">Signature and / or Thumb Impression of Patient</td>
  
<td class="width10" style="height:25px; "> Authorised Signature</td>
  </tr>
</table>

<table border="1" style="border-collapse: collapse; height:8.4em;">
<tr>
<td style="width:20%;">Total</td>
<td>${param.totalinrupees }</td>

</tr>
<tr>
<td>Arrears per Bill No.</td>
<td></td>

</tr>
<tr>
<td>Total</td>
<td>${param.totalpayable }</td>

</tr>
<tr>
<td>Less Adv. R. No.</td>
<td></td>

</tr>
<tr>
<td>Due Rs E. & O.E</td>
<td>${param.balance }</td>

</tr>
</table>



</body>
</html>
