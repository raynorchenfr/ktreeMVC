<%-- 
    Document   : index
    Created on : 2014-10-15, 22:09:28
    Author     : Tianyang
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>Book Display</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/Css/reset.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/Css/1024_768.css" />
<link type="text/css" rel="stylesheet" media="screen and (min-width:861px) and (max-width:960px)" href="${pageContext.request.contextPath}/Css/pad_heng.css" />
<link type="text/css" rel="stylesheet" media="screen and (min-width:601px) and (max-width:860px)" href="${pageContext.request.contextPath}/Css/pad.css" />
<link type="text/css" rel="stylesheet" media="screen and (min-width:481px) and (max-width:600px)" href="${pageContext.request.contextPath}/Css/tel_heng.css" />
<link type="text/css" rel="stylesheet" media="screen and (max-width:480px)" href="${pageContext.request.contextPath}/Css/tel.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/Css/tableStyles.css" />
</head>

<body>
<div class="w_100_l top_title">
	<div class="main">
    	<p><a href="#">Buy more than one book and save big! </a><a href="#">Read more</a></p>
    </div>
</div>

<div class="w_100_l">
	<div class="main">
      <div class="top_banner">
            <div class="top_logo"><img src="${pageContext.request.contextPath}/Images/top_logo.jpg" alt="A BOOK APART LOGO" /></div>
            <div class="top_menu">
            	<ul>
                	<li class="sel"><a href="#">HOME</a></li>
                	<li><a href="#">STORE</a></li>
                	<li><a href="#">PRESS</a></li>
                	<li><a href="#">ABOUT</a></li>
                	<li><a href="#">HELP</a></li>
                </ul>
            </div>
            <div class="top_shop_cur"><a href="#"><img src="${pageContext.request.contextPath}/Images/top_shop_cur.jpg" alt="shopping car" /></a></div>
        </div>
        <span class="index_img"><img src="${pageContext.request.contextPath}/Images/banner_img.jpg" alt="Dan Cederholm" border="0" usemap="#Map" />
        <map name="Map" id="Map">
          <area shape="rect" coords="857,230,930,269" href="#" alt="buy now" />
        </map>
        </span>
        <p class="index_hr"></p>
        <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
        <br>
        <table class="mytable">
            <thead>
                <tr>
                    <th>Book ISBN</th>
                    <th>Book Name</th>
                    <th>Update</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.books}" var="book">
                    <tr>
                        <c:url value="/deleteBook/" var="deleteURL">
                            <c:param name="ISBN" value="${book.ISBN}"/>
                        </c:url>
                        <c:url value="/updateBook/" var="updateURL">
                            <c:param name="ISBN" value="${book.ISBN}"/>
                        </c:url>
                        <td><em>${book.ISBN}</em></td>
                        <td>${book.name}</td>
                        <td><a href="${updateURL}">Update Book</a></td>
                        <td><a href="${deleteURL}">Remove Book</a></td>
                    </tr>
                </c:forEach> 
            </tbody>
        </table>
                    <br>
                    
        <p class="index_hr"></p>
        <div class="content_press">
        	<div class="press_porsen_01">
                <h1>Press Room</h1>
            	<dl>
                	<dd><img src="${pageContext.request.contextPath}/Images/img_men.jpg" alt="person" /></dd>
                    <dt>
                    	<p class="date">Apr 03, 2014</p>
                        <p class="book_title"><a href="#" target="_blank">Design Is a Job audiobook</a></p>
                        <p class="book_intro">
                        We’re pleased to announce that <a href="#">Design Is a Job</a> by Mike Monteiro is now available in audiobook format, through <a href="#">Audible.com</a> and <a href="#">Amazon.com</a>. Narrated by the raconteur himself, experience the guidance, real-talk, and humor of our seminal book on design as a job.
                        </p>
                    </dt>
                </dl>
            </div>
            <div class="press_porsen_02">
                <h1><span class="span_2"><a href="#"> More Articles →</a></span><span class="span_1"><a href="#">Press Room RSS</a></span></h1>
            	<dl>
                	<dd><img src="${pageContext.request.contextPath}/Images/img_lives.jpg" alt="book img" /></dd>
                    <dt>
                    	<p class="date">Mar 31, 2014</p>
                        <p class="book_title"><a href="#" target="_blank">A Few of Our Faves: March 31st</a></p>
                        <p class="book_intro">
                        As the madness of March comes to a close, we gathered up a few things that caught our attention during the last half of the month. <a href="#">Read on for more.</a>                        </p>
                    </dt>
                </dl>
            </div>
        </div>
        <p class="index_hr"></p>
        <h1 class="news_title">Newsletter</h1>
        <p class="news_title_1"><span class="span_1">Keep up to date with new book releases and announcements with our newsletter.</span><span class="span_2"><img src="${pageContext.request.contextPath}/Images/img_inp.jpg" /></span></p>
        <p class="index_hr" style="margin-top:20px;"></p>
        <div class="footer">
           <span class="span_1">&copy; Copyright 2014, A Book Apart, LLC</span>&nbsp;&nbsp;
            <a href="#">Help & Contact us</a>
            <a class="a1" href="#">Press Room RSS feed</a>
            <a class="a2" href="#">abookapart on Twitter</a>
            <span class="span_2"><b>Published by</b><img src="${pageContext.request.contextPath}/Images/icon_hg.jpg" align="absmiddle" /></span>
        </div>
    </div>
</div>

</body>
</html>
