<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>오늘의집 admin</title>
<c:set var="path" value="${pageContext.request.contextPath }" />

<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet'>
<!-- Syntax Highlighter -->
<link rel="stylesheet" type="text/css" href="${path}/admin/syntax-highlighter/styles/shCore.css" media="all">
<link rel="stylesheet" type="text/css" href="${path}/admin/syntax-highlighter/styles/shThemeDefault.css" media="all">
<!-- Font Awesome CSS-->
<link rel="stylesheet" href="${path}/admin/css/font-awesome.min.css">
<!-- Normalize/Reset CSS-->
<link rel="stylesheet" href="${path}/admin/css/normalize.min.css">
<!-- Main CSS-->
<link rel="stylesheet" href="${path}/admin/css/main.css">
<link rel="stylesheet" href="${path}/admin/css/admin.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>