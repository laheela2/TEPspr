<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="<c:url value="/admin"/>">TEP Admin</a>
    </div>
    <!-- /.navbar-header -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li class="sidebar-search">
                    <div class="input-group custom-search-form">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                    </div>
                    <!-- /input-group -->
                </li>
                <li>
				    <a href="<c:url value="/admin/dashboard"/>"><i class="fa fa-dashboard fa-fw"></i> 대시보드</a>
				</li>
                <li>
                    <a href="<c:url value="/admin/members/list"/>"><i class="fa fa-users fa-fw"></i> 회원관리</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/qna/list"/>"><i class="fa fa-comments fa-fw"></i> 고객문의</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-institution fa-fw"></i> 장소관리<span class="fa arrow"></span></a>
                	<ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
                	<li>
                    <a href="<c:url value="/admin/lendplace/list"/>"><i class="fa fa-institution fa-fw"></i> 장소목록</a>
               		</li>
                	<li>
                    <a href="<c:url value="/admin/lendplace/form"/>"><i class="fa fa-institution fa-fw"></i> 장소등록</a>
                	</li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-institution fa-fw"></i> 영상관리<span class="fa arrow"></span></a>
                	<ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
                	<li>
                    <a href="<c:url value="/admin/videolec/list"/>"><i class="fa fa-youtube-play fa-fw"></i> 영상목록</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/videolec/write"/>"><i class="fa fa-youtube-play fa-fw"></i> 영상등록</a>
                </li>
                    </ul>
                </li>
                
				<li>
                    <a href="<c:url value="/admin/meetings/list"/>"><i class="fa fa-users fa-fw"></i> 모임관리</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/board/list"/>"><i class="fa fa-comments fa-fw"></i> 게시판관리</a>
                </li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>