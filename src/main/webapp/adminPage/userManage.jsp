<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" import="java.util.*,com.cy.bean.*" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>
        后台用户管理
    </title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="./css/x-admin.css" media="all">
    <link rel="stylesheet" href="css/pag.css" media="all">
</head>
<script type="text/javascript">

 /*   function check(){
        var searchname =document.getElementById("searchname").value;
        var searchtitle =document.getElementById("searchtitle").value;
        var state =document.getElementById("state").value;
        var yourId =document.getElementById("yourId").value;
        if(searchname==""&&searchtitle==""&&state==""&&yourId==""){
            alert("查询内容不能为空");
        }

    }*/

</script>
<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>用户管理</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>


<div class="tools">

</div>
<form class="layui-form x-center" action="search?action=search" method="post" style="width:85%">
    <div class="layui-form-pane">
        <div class="layui-form-item">               <ul class="toolbar">
            <li onclick="user_management_add('添加用户','huser_management_add.jsp','600','500')"><span><img src="images/t01.png" /></span>添加</li>
        </ul>

            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline" style="width:80px">
                <input type="text" name="searchname" id="searchname"  placeholder="姓名" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline" style="width:85px">
                <select name="searchstate" id="state">
                    <option value=""></option>
                    <option value="2">启用</option>
                    <option value="3">锁定</option>
                </select>
            </div>
            <label class="layui-form-label">职称</label>
            <div class="layui-input-inline" style="width:100px">
                <input type="text" name="searchtitle" id="searchtitle"  placeholder="职称" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">擅长领域</label>
            <div class="layui-input-inline" style="width:100px">
                <select name="searchfile" id="yourId">
                    <option value=""> </option>
                    <option value="1">焦虑</option>
                    <option value="2">亲子关系</option>
                    <option value="3">抑郁</option>
                    <option value="4">婚姻情感</option>
                    <option value="5">失眠</option>
                </select>
            </div>
            <div class="layui-input-inline" style="width:80px">
                <button class="layui-btn"  lay-submit="" lay-filter="*" onclick="check()">搜索</button>
            </div>
        </div>
    </div>
</form>
</div>
<form method="post">
    <table class="tablelist">
        <thead>
        <tr>

            <th>ID</th>
            <th>账号</th>
            <th>用户名称</th>
            <th>密码</th>
            <th>性别</th>
            <th>电话</th>
            <th>角色</th>
            <th>毕业院校</th>
            <th>职称</th>
            <th>擅长领域</th>

            <th>
                状态
            </th>
            <th>
                操作
            </th>
        </tr>
        </thead>
        <tbody>


        <tr>

            <td name ="adstate"> </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>

            <td class="td-status">
                <button class="sp"></button>
            </td>
            <td class="td-manage">
                <a style="text-decoration:none"  href="adminusere?action=statestop&stopid=" title="修改状态" >
                    <i class="layui-icon">&#xe601;</i>
                </a>
                <a title="修改信息" href="show?action=show&uid="  class="ml-5" style="text-decoration:none">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a style="text-decoration:none" href="hpassword?action=hpassword&pwduid=" title="重置密码" >
                    <i class="layui-icon">&#xe631;</i>
                </a>
                <a title="删除" href="del?action=del&uid=%>" onclick="detele()"
                   style="text-decoration:none">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>

        </tr>

        </tbody>
    </table>
</form>
<div class="page"  v-show="show">
    <div class="pagelist"> <span class="jump"><a href="lastpage?action=lastpage">上一页</a></span> <span class="jump"><a href="nextpage?action=nextpage">下一页</a></span>
    </div>
</div>
</div>
<br />
<br />
<br />
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script src="./js/x-layui.js" charset="utf-8"></script>
<script src="js/jquery2.js" charset="utf-8"></script>
<script src="js/js.js" charset="utf-8"></script>
<script>

    /*
           function detele(){

               var t=confirm("确定要删除？");
               var uid=document.getElementById("uid").value;
               if(t==true){
                   location.href="del?action=del&uid="+uid;
               }else{
                   location.href="ss?action=ss";
               }
           } */




    layui.use(['laydate','element','laypage','layer'], function(){
        $ = layui.jquery;//jquery
        lement = layui.element();//面包导航
        laypage = layui.laypage;//分页
        layer = layui.layer;//弹出层

    });

    /*用户-添加*/
    function user_management_add(title,url,w,h){
        x_admin_show(title,url,w,h);
    }


    $('.tablelist tbody tr:odd').addClass('odd');
</script>
<script>
    layui.use('form',function(){});
</script>
</body>

</html>