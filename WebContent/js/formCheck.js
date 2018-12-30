$().ready(function() {

	$("#studentScore").validate({
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		rules : {
			SNO : {
				required : true,
				minlength : 5,
				number : true
			},
			sname : {
				required : true,
				minlength : 2
			},
			grade : {
				required : true,
				number : true,
				min : 0,
				max : 100
			}
		},
		messages : {
			sname : "请输入姓名",
			SNO : {
				required : "请输入学号",
				minlength : jQuery.format("学号不能小于{0}个字 符")
			},
			grade : {
				required : "请输入成绩",
				number : "成绩必须为数字",
				min : "成绩不小于0",
				max : "成绩不大于100"
			}
		}
	});

});
