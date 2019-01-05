<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>教师端个人信息</title>
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Pragma" content="no-cache">
    <meta name="" content="" charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1">

    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css">
    <script>

        function submitForm() {
        var userNames = $('#userNames').val();
        var passwords = $('#passwords').val();
        var Emails = $('#Emails').val();
        var sex = $('input[name="sex"]:checked').val();
        var file = $('#uploadFile')[0].files;
        var title = $("#titles").val();

        var formData = new FormData(document.getElementById("updateForm"));
        formData.append('uploadFile',file);
        $.ajax({
            type : 'post',
            url : 'uploadfile',
            async : false,
            data : formData,
            cache : false,
            contentType : false,
            processData : false,
            success : function(result) {
               alert(result);

            },
            error : function() {
                alert('ERROR!');
            }
            });

    }
    </script>
</head>

<body>

    <div style="text-align: right;">
        <button class="btn btn-primary" style="text-align: right;" data-toggle="modal" data-target="#myModal">修改个人信息</button>
    </div>

    

   <!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
    aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                    aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改个人信息</h4>
            </div>
            <div class="container">
                <div class="col-sm-2">
                    <img
                        src="<%=request.getContextPath()%>/resources/images/userPhoto/person.jpg"
                        class="img-responsive img-circle img-thumbnail "
                        id="headerPicture" alt="Me">
                </div>

                <div id="" class=" col-sm-4">
                    <form id="updateForm" enctype="multipart/form-data">
                        <div class="rows">
                            <label>姓名:</label> <input type="text" placeholder="姓名"
                                class="form-control" name="userNames" id="userNames" value=" ">
                        </div>
                        <div class="rows">
                            <label>密码:</label> <input type="password" placeholder="密码"
                                class="form-control" name="passwords" id="passwords" value="">
                        </div>
                        <div class="rows">
                            <label>专业:</label> <input type="text" placeholder="研究方向"
                                class="form-control" name="ResearchDirections"
                                id="ResearchDirections" value="">
                        </div>
                        <div class="rows">
                            <label>职称:</label> <input type="text" placeholder="职称"
                                class="form-control" name="titles" id="titles" value="">
                        </div>
                        <div class="rows">
                            <label>性别:</label> <input type="radio" name="sex" value="男"
                                checked id="male">男 <input type="radio" name="sex"
                                value="女" id="female">女
                        </div>
                        <div class="rows ">
                            <label for="uploadFile" class="btn btn-default">更换头像</label> <input
                                type="file" accept="image/gif, image/jpeg,image/jpg,image/png"
                                class="btn btn-default" style="display: none;"
                                onchange="headerPic(this)" id="uploadFile" name='uploadFile' value="" />
                        </div>
                    </form>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    取消</button>
                <button type="type" onclick="submitForm();" class="btn btn-primary">提交更改</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>
<!-- end 模态层 -->
    

</body>

</html>