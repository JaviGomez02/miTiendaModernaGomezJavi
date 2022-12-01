<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.jacaranda.cart.Cart" %>
<%@ page import ="com.jacaranda.cart.CartItem" %>
<%@ page import ="com.jacaranda.model.Article" %>
<%@ page import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comprar artículos</title>
<link rel="stylesheet" href="css/grid.css">
<link rel="stylesheet" href="css/buy-articles_style.css">
</head>
<body>
<% 
HttpSession sessionsa = request.getSession();
String login = (String) sessionsa.getAttribute("login");
String nick = (String) sessionsa.getAttribute("nick");
String admin = (String) sessionsa.getAttribute("admin");
Cart cart = (Cart) sessionsa.getAttribute("cart");
if(login != null && nick !=null && login.equals("true") && cart!=null) {
	if(admin.equals("false")) {
		try {
			ArrayList<CartItem> cartItems = cart.getCartItems();
			if(cartItems.size()==0) {
				%><jsp:forward page="error.jsp?redirect=show-cart&msg=Carrito vacio"></jsp:forward><%
			}else {
			
				%>
				<div class="wrapper">
					<div class="close_session">
						<a href='index.jsp'><img src='img/close-session.png' class='close-button'/></a>
					</div>
					<div class="page_name">
						<img src="img/logo.png"/>
					</div>
					<div class="user_name">
						<div class="usericon">
							<img class="icon" src="img/user.png"/>
							<p> <%=nick %> </p>
						</div>
						<div class="charticon">
							<a href="show-cart.jsp">
								<img class="icon" src="img/trolley.png">
							</a>
							<p> <%=cart.getQuantityArticles() %> </p>
						</div>
					</div>
					<div class="content">
						<div class="page-title">
							<h1>Mi compra</h1>
						</div>
						<div class="grid_container">
							<table>
								<thead>
									<tr>
										<th>Nombre del artículo</th>
										<th>Precio del artículo</th>
										<th>Cantidad</th>
										<th>Precio total</th>
									</tr>
								</thead>
								<tbody>
								<%
								for(CartItem cartItem : cartItems) {
									Article article = cartItem.getArticle();
									%><tr>
										<td><%=article.getName()%></td>
										<td><%=article.getPrice()%> €</td>
										<td><%=cartItem.getQuantity()%></td>
										<td><%=cartItem.getPriceItem()%> €</td>
									<tr><%
								}%>
									<tr>
										<td colspan="4" class="total-price">Total: <%=cart.getTotalPrice()%> €</td>
									</tr>
									</tbody>
								</table>
								<form id="buy-articles" name="buy-articles" action="buy-articles-persist.jsp">
									<input type="button" class="return_button" onclick="location.href='show-cart.jsp';" value="Volver al carrito" />
									<button type="submit" id="loginButton" class="login_button">Confirmar compra</button>
								</form>
							</div>
						</div>
					</div><%
			}
		}catch(Exception e) {
			String message = e.getMessage();
			%><jsp:forward page="error.jsp?redirect=show-cart&msg=<%=message%>"></jsp:forward><%
		}
	}else {
		%><jsp:forward page="error.jsp?redirect=show-articles&msg=No tienes carrito"></jsp:forward><%
	}
}else {%>
	<jsp:forward page="error.jsp?redirect=index&msg=No te has autenticado"></jsp:forward>
<%}%>
<script src="script/buy-articles.js"></script>
</body>
</html>