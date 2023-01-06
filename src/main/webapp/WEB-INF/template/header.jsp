<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul class="nav justify-content-center">
    <li class="nav-item">
        <a class="nav-link" href="/">Main</a>
    </li>
    <c:forEach var="menu" items="${menus}">
        <li class="nav-item">
            <a class="nav-link" href="/exam2/${menu.examCategoryDetailId}">${menu.examCategoryDetailName}</a>
        </li>
    </c:forEach>
</ul>