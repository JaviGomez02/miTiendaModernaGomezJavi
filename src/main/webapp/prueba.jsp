<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.temporal.ChronoField"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%LocalDate birthDate= LocalDate.of(2004, 11, 30);

 LocalDate esMayor;
 out.print(ChronoUnit.YEARS.between(birthDate, LocalDate.now()));




%>
<h1>hola</h1>
</body>
</html>