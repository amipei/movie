<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${user.userName}的影评-${appName}</title>
    <%@include file="common/head.jspf" %>
    <link rel="stylesheet" type="text/css" href="/assets/css/pages/user.css"/>
</head>
<body>
<%@include file="common/topNav.jspf" %>
<div id="wrapper">
    <div class="margin-top-40"></div>
    <div id="content">
        <h1>${user.userName}的影评（${commentCount}）</h1>

        <div class="margin-top-20"></div>

        <div class="all">
            <c:choose>
                <c:when test="${commentCount > 0}">
                    <c:forEach items="${pageInfo.resultList}" var="comment">
                        <c:set var="subject" scope="page" value="${appUtils.findSubjectById(comment.subjectId)}"/>
                        <div class="col-md-9 article">
                            <div class="mod-bd" id="coments">
                                <div class="col-sm-3 pic">
                                    <img width="120px" height="170px"
                                         src="http://7xia3v.com1.z0.glb.clouddn.com/10741834">
                                </div>
                                <div class="col-sm-11 content">
                                    <div class="comment-item">
                                        <div class="comment">
                                            <div class="list-title">
                                                <div class="pull-left blue">${user.userName}&nbsp;&nbsp;评论:《${subject.title}》 ${comment.submitDate}</div>
                                                <div class="pull-left allstar10 rating"></div>
                                                <div class="pull-right">
                                                    <div class="delete"><a href="#"><img
                                                            src="../assets/images/display.png"></a>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="margin-top-10"></div>
                                            <div class="list-content" id="wrap">
                                                    ${comment.content}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    暂无评论
                </c:otherwise>
            </c:choose>
            <div class="margin-left-30 margin-top-30">
                <ul id="paginator"></ul>
            </div>


            <div class="col-md-3 aside">
                <div class="margin-top-10"></div>
                <p class="pl">欢迎观看我的评论......</p>

                <div class="margin-top-30"></div>
                <p class="p2">>&nbsp;<a class="blue" name="">${user.userName}的电影首页</a></p>

                <div class="margin-top-30"></div>
                <div class="decri">
                    <p>这是我对所有电影的评论，您也可以发表不同意见哦~~</p>

                    <div class="margin-top-10"></div>
                    <p>欢迎亲多来瞅瞅~~</p>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>


<%@include file="common/footer.jspf" %>


</body>
<script type="text/javascript">
    seajs.use("pages/comments", function (comments) {
        comments.init(${pageInfo.pageNo}, ${pageInfo.totalPages});
    });
</script>
</html>
