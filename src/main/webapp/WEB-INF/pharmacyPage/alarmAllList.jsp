<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/26 0026
  Time: 下午 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<html xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
<meta charset="utf-8">
<title>警报消息显示</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/x-admin.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pag.css" media="all">
  <script type="text/javascript" src="../js/jquery.min.js"></script>
  <script type="text/javascript" src="../js/public.js"></script>
  <script type="text/javascript" src="../js/external.js"></script>
</head>
<style>
  .ctybtn{
    background-color:#1ab7ea;
    border: none;
    color: white;
    padding: 5px 20px;
    align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
  }
</style>
<body>
<div class="x-nav"> <span class="layui-breadcrumb"> <a><cite>首页</cite></a> <a><cite>警报消息显示</cite></a> </span> <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a> </div>
<div class="x-body">

<table>

  警报类型：<select  name="AlarmStyleShowList" id="styleShowListId" onchange="changeStyle()">
    <option value="">请选择</option>
    <c:forEach items="${requestScope.alarmStyleShowList}" var="styleShowList">
      <option value="${styleShowList.alarmStyleId}" id="styleShowListId" name="styleShowListId">${styleShowList.alarmStyleName}</option>
    </c:forEach>
    </select >
  <td class="ctybtn">
   <%-- <input  class="ctybtn" type="button" id="clickAll" onclick="clickAll()" value="查看全部报警"/>
    --%><a style="color: white"  href="/alarm/alarmAllList.action?alarmRole=${requestScope.alarmRole}" target="main" >查看全部警报</a>
  </td>
</table>
  <form class="layui-form x-center" action="${pageContext.request.contextPath}/phamacy/phamacyAllDrugs.action" style="width:85%">
    <div class="layui-form-pane">
    </div>
  </form>
  <table class="tablelist">
    <thead>
      <tr>
        <th> 报警类型 </th>
        <th> 报警来源 </th>
        <th> 报警详情</th>
        <th> 报警日期</th>
        <th> 处理状态</th>
        <th> 操作</th>
      </tr>
    </thead>
    <tbody id="alarmStyleClick">
    <c:choose>
      <c:when test="${not empty sessionScope.alarmPageList.list}">
        <c:forEach items="${sessionScope.alarmPageList.list}" var="alramList">
          <input type="hidden" value="${alramList.alarmRole}" id="alarmRole">
            <tr>

              <td>
                <c:if test="${alramList.alarmStyleId==1}">
                  药品低限警报
                </c:if>
                <c:if test="${alramList.alarmStyleId==2}">
                  药品滞销警报
                </c:if>
                <c:if test="${alramList.alarmStyleId==3}">
                  药品过期警报
                </c:if>
               <%-- ${alramList.alarmStyleName}</td>--%>
              <td>
              药房
              </td>
              <td>${alramList.alarmDetails}</td>
              <td>${alramList.alarmDate}</td>
              <td>
                <c:if test="${alramList.alarmState==0}">
                  <span style="color: red">未处理</span>
                </c:if>
              </td>

              <td class="ctybtn"  style=" align: center">
                <a style="color: white"  href="/alarm/alarmManage.action?alarmId=${alramList.alarmId}&&alarmStyleId=${alramList.alarmStyleId}&&alarmRole=${alramList.alarmRole}" target="main" >查看详情</a>
              </td>
            </tr>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <tr>
          <td rowspan="6" >查无数据！</td>
        </tr>
      </c:otherwise>
    </c:choose>
    <tr>
      <td colspan="3" align="left">共有${alarmPageList.total}条记录，当前第${alarmPageList.pageNum}页，共${alarmPageList.pages}页</td>
      <td colspan="9" align="right">
        <a href="/alarm/alarmAllList.action?pageNum=1&&alarmRole=${requestScope.alarmRole}"    target="main">首页</a>
        <a href="/alarm/alarmAllList.action?pageNum=${alarmPageList.prePage}&&alarmRole=${requestScope.alarmRole}"  target="main">上一页</a>
        <a href="/alarm/alarmAllList.action?pageNum=${alarmPageList.nextPage}&&alarmRole=${requestScope.alarmRole}"  target="main">下一页</a>
        <a href="/alarm/alarmAllList.action?pageNum=${alarmPageList.navigateLastPage}&&alarmRole=${requestScope.alarmRole}"  target="main">尾页</a>
      </td>
    </tr>

    </tbody>
  </table>

<br />
<br />
<br />
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script> 
<script src="${pageContext.request.contextPath}/js/x-layui.js" charset="utf-8"></script> 
<script src="${pageContext.request.contextPath}/js/jquery2.js" charset="utf-8"></script> 
<script src="${pageContext.request.contextPath}/js/js.js" charset="utf-8"></script>
<script>
            layui.use(['laydate','element','laypage','layer'], function(){
                $ = layui.jquery;
              lement = layui.element();//面包导航
              laypage = layui.laypage;//分页
              layer = layui.layer;//弹出层

            });
             /*用户-添加*/
            function user_management_add(title,url,w,h){
                x_admin_show(title,url,w,h);
            }
            /*用户-查看*/
            function user_management_show(title,url,w,h){
                x_admin_show(title,url,w,h);
            }
            // 用户-编辑
            function user_management_edit (title,url,w,h) {
                x_admin_show(title,url,w,h); 
            }
            </script> 
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>
  <script>
      function  changeStyle(){
          var id = document.getElementById('styleShowListId').value;
          var alarmRole = document.getElementById('alarmRole').value;
        window.location.href="<%=request.getContextPath()%>/alarm/alarmStyleShowList.action?alarmStyleId="+id+"&&alarmRole="+alarmRole;
      }
      function  clickAll(){
          var id = document.getElementById('alarmRole').value;
          // var id = $('#styleShowListId').val();
          alert(id);
          window.location.href="<%=request.getContextPath()%>/alarm/alarmAllList.action?alarmRole="+id;
      }

  </script>
</body>
</html>