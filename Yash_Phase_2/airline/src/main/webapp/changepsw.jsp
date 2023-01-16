<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="changepsw">
<div id="container">
  
  <div id="header">
    <center><h1>Change Password</h1></center>
    
  </div> 
  <div id="form">
    <input type="password" placeholder="New Password" id="passOne" name="passOne" minlength=1 required/>
    <input type="password" placeholder="Confirm Password" id="passTwo" minlength=1 required/>
  </div>
 
  <div id="footer" class="incorrect">
    <center><h1 id="footerText">
    <% if(session.getAttribute("change")!=null){ %>
 			<h4>Successfully password changed</h4>
  <%} %></h1>
    <button class="button button2">Change password </button>
    </center>
   
  </div>
  
  
</div>
</form>
</body>

<style>
	body
{
  background:url("http://myminispot.com/images/prox.png");
  background-size:cover;
}
#container
{
  position:absolute;
  background:#fff;
  height:350px;
  width:300px;
  top:50%;
  left:50%;
  margin-left:-150px;
  margin-top:-175px;
  
  box-shadow: 0px 30px 150px;
  -webkit-box-shadow: 0px 30px 150px;
  -moz-box-shadow: 0px 30px 150px;
  
  border-radius:15px;
  -webkit-border-radius:15px;
  -moz-border-radius:15px;
}
#header
{
  background-color:#F26B6B;
  font-family: 'Francois One', sans-serif;
  height:75px;
  width:300px;
  position:absolute;
  top:0;
  color:white;
  margin-top:-2px;
  
  border-radius: 15px 15px 0px 0px;
  -webkit-border-radius: 15px 15px 0px 0px;
  -moz-border-radius: 15px 15px 0px 0px;
}
#footer.incorrect
{
  background-color:#F26B6B;
  font-family: 'Francois One', sans-serif;
  height:75px;
  width:300px;
  position:absolute;
  bottom:0;
  color:white;
  margin-bottom:-2px;
  
  border-radius: 0px 0px 15px 15px;
  -webkit-border-radius: 0px 0px 15px 15px;
  -moz-border-radius: 0px 0px 15px 15px;
}
#footer.correct
{
  background-color:#84F075;
  font-family: 'Francois One', sans-serif;
  height:75px;
  width:300px;
  position:absolute;
  bottom:0;
  color:white;
  cursor:pointer;
  margin-bottom:-2px;
  
  border-radius: 0px 0px 15px 15px;
  -webkit-border-radius: 0px 0px 15px 15px;
  -moz-border-radius: 0px 0px 15px 15px;
}
#form
{
  height:100px;
  position:absolute;
  top:50%;
  margin-top:-50px;
  width:75%;
  left:50%;
  margin-left:-37.5%;
}
input
{
  width:215px;
  margin:0;
  border:0;
  border-left:1px solid;
  border-right:1px solid;
  outline:none;
  height:50px;
  font-size:20px;
  padding-left:10px;
}
input#passOne
{
  border-top:1px solid;
  border-radius:15px 15px 0px 0px;
  -webkit-border-radius:15px 15px 0px 0px;
  -moz-border-radius:15px 15px 0px 0px;
}
input#passTwo
{
  border-bottom:1px solid;
  border-top:1px solid;
  
  border-radius:0px 0px 15px 15px;
  -webkit-border-radius:0px 0px 15px 15px;
  -moz-border-radius:0px 0px 15px 15px;
}
.button {
  background-color:#F26B6B; 
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
}

}
</style>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'>
</script>
<script src='https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js'></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>

<script>
  $('form').validate();
</script>
<script>
$('#passOne, #passTwo').on('keyup', function() {
	  if ($('#passOne').val() == $('#passTwo').val()) {
	    $('#footerText').html('Matching').css('color', 'green');
	    $('#submit').prop('disabled', false);
	  } else {
	    $('#footerText').html('Not Matching').css('color', 'red');
	    $('#submit').prop('disabled', true);
	  }
	});
</script>


</html>