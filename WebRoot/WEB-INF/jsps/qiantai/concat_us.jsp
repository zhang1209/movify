<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>

<html lang="en">

<head>
</head>

<body>




    <!-- =============== START OF WRAPPER =============== -->
    <div class="wrapper">

	<%@ include file="header.jsp" %>
       


        <!-- =============== START OF PAGE HEADER =============== -->
        <section class="page-header overlay-gradient" style="background: url(/movify/static/assets/images/posters/movie-collection.jpg); 
          margin-top:65px;">
            <div class="container">
                <div class="inner">
                    <h2 class="title">联系我们</h2>
                    <ol class="breadcrumb">
                        <li><a href="${ctx}/indexShow">主页</a></li>
                        <li>联系我们</li>
                    </ol>
                </div>
            </div>
        </section>
        <!-- =============== END OF PAGE HEADER =============== -->



        <!-- =============== START OF MAIN =============== -->
        <main class="contact-page ptb100">
            <div class="container">
                <div class="row">


                    <!-- Start of Contact Details -->
                    <div class="col-md-4 col-sm-12">
                        <h3 class="title">名言警句</h3>

                        <div class="details-wrapper">
                            <p>
                            	&nbsp;&nbsp;&nbsp;&nbsp;
                            	&nbsp;&nbsp;&nbsp;&nbsp;
                            	文字，似静幽的莲花，清丽而芬芳，若轻轻碰触，暗香便由指间漾溢上心头。静静徜徉于文字天地，可以领略到远离尘嚣、远离名利纷争的世外桃源的极美风光，可以聆听到来自云水深处的曼妙梵音，聆听到来自旷远、来自尘世外的袅袅天籁。
                            </p>
							<ul class="contact-details">
                                <li>
                                    <i class="icon-phone"></i>
                                    <strong>Phone:</strong>
                                    <span>(123) 123-456 </span>
                                </li>
                                <li>
                                    <i class="icon-printer"></i>
                                    <strong>Fax:</strong>
                                    <span>(123) 123-456 </span>
                                </li>
                                <li>
                                    <i class="icon-globe"></i>
                                    <strong>Web:</strong>
                                    <span><a href="#">www.movify.com</a></span>
                                </li>
                                <li>
                                    <i class="icon-paper-plane"></i>
                                    <strong>E-Mail:</strong>
                                    <span><a href="#">info@movify.com</a></span>
                                </li>
                            </ul>
							
                        </div>
                    </div>
                    <!-- Start of Contact Details -->


                     <div class="col-md-8 col-sm-12">
                        <h3 class="title">联系我们</h3>

                        <!-- Start of Contact Form -->
                        <form id="contact-form">

                            <!-- contact result -->
                            <div id="contact-result"></div>
                            <!-- end of contact result -->

                            <!-- Form Group -->
                            <div class="form-group">
                                <input class="form-control input-box" type="text" name="name" placeholder="Your Name" autocomplete="off">
                            </div>

                            <!-- Form Group -->
                            <div class="form-group">
                                <input class="form-control input-box" type="email" name="email" placeholder="your-email@movify.com" autocomplete="off">
                            </div>


                            <!-- Form Group -->
                            <div class="form-group">
                                <input class="form-control input-box" type="text" name="subject" placeholder="Subject" autocomplete="off">
                            </div>

                            <!-- Form Group -->
                            <div class="form-group mb20">
                                <textarea class="form-control textarea-box" rows="8" name="message" placeholder="Type your message..."></textarea>
                            </div>

                            <!-- Form Group -->
                            <div class="form-group text-center">
                                <button class="btn btn-main btn-effect" type="submit">Send message</button>
                            </div>
                        </form>
                        <!-- End of Contact Form -->
                    </div>
                    <!-- Start of Contact Form -->

                </div>
            </div>
        </main>
        <!-- =============== END OF MAIN =============== -->
     
    </div>
    <!-- =============== END OF WRAPPER =============== -->
    <%@ include file="footer.jsp" %>
</body>

</html>
