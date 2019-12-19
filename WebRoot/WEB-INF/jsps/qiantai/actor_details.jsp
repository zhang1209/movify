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
        <style type="text/css">
					.navbar{
						color:white;
					}
					#wl{
						display:block;
					}
					#logo{
						display:none;
					}
				</style>



        <!-- =============== START OF MOVIE DETAIL INTRO =============== -->
        <section class="celeb-detail-intro overlay-gradient ptb100" style="background: url(upload/30acf090-13b8-4893-9758-bccc510cf041_469103.jpg);">
        </section>
        <!-- =============== END OF MOVIE DETAIL INTRO =============== -->



        <!-- =============== START OF CELEBRITY DETAIL =============== -->
        <section class="celeb-detail pb100">
            <div class="container">
                <div class="row">

                    <div class="col-md-4 col-12">
                        <div class="celeb-img">
                            <img src="${actor_details[0].get('aphoto')}" alt="">
                        </div>
                    </div>


                    <div class="col-md-8 col-12">
                        <div class="celeb-details">
                            <h3 class="title">${actor_details[0].get("aname")}</h3>
                            <span class="profession">演员</span>

                            <!-- tab links -->
                            <ul class="nav tab-links">
                                <li class="nav-item">
                                    <a class="nav-link active" id="bio-tab" data-toggle="tab" href="#bio" aria-controls="bio" aria-expanded="false">生平记录</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="film-tab" data-toggle="tab" href="#filmography" aria-controls="filmography" aria-expanded="false">参演作品</a>
                                </li>
                            </ul>

                            <!-- Tab Content -->
                            <div class="tab-content mt70">

                                <div class="tab-pane fade active show" id="bio" role="tabpanel" aria-labelledby="bio-tab" aria-expanded="false">
                                    <div class="bio-description">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;${actor_details[0].get("aintroduce")}</p>
										<p>	&nbsp;&nbsp;&nbsp;&nbsp;演员的修养，表演的艺术，用心去表演，用身体诠释艺术
											演员的修养，表演的艺术，用心去表演，用身体诠释艺术
											演员的修养，表演的艺术，用心去表演，用身体诠释艺术
											演员的修养，表演的艺术，用心去表演，用身体诠释艺术
										</p>
                                    </div>

                                    <div class="bio-details">
                                        <ul class="bio-wrapper">
                                            <li><h6>出生日期：</h6> ${actor_details[0].get("abirthday")}</li>
                                            <li><h6>性别：</h6> ${actor_details[0].get("asex")}</li>
                                            <li><h6>身高：</h6> ${actor_details[0].get("atall")}m</li>
                                            <li><h6>国籍：</h6> ${actor_details[0].get("acountry")}</li>
                                        </ul>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>

                                <div class="tab-pane fade" id="filmography" role="tabpanel" aria-labelledby="film-tab" aria-expanded="false">
                                    <ul class="film-list">
                                    	<c:forEach items="${actor_details}" var="ad">
                                        	<li><a href="${ctx}/video_details?vid=${ad.vid}&vtype=${ad.vtype}">${ad.vname}</a><span class="year">${ad.joindate}</span></li>
                                    	</c:forEach>
                                    </ul>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- =============== End OF CELEBRITY DETAIL =============== -->

    </div>
    <!-- =============== END OF WRAPPER =============== -->
	<%@ include file="footer.jsp" %>
</body>

</html>
