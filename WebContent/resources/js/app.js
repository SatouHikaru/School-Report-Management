// Your code here
var uiController = (function() {
	var addTooltip = function(el) {
		el.prop('data-toggle', 'tooltip');
		el.prop('data-placement', 'top');
		el.tooltip();
	}

	var iconCustomize = function() {
		var addIcon = $('.fa-plus');
		var editIcon = $('.fa-edit');
		var eyeIcon = $('.fa-eye');
		var deleteIcon = $('.fa-trash');

		if (addIcon) {
			addIcon.prop('title', 'Thêm');
			addTooltip(addIcon);
		}

		if (editIcon) {
			editIcon.prop('title', 'Sửa');
			addTooltip(editIcon);
		}

		if (eyeIcon) {
			if (!$(eyeIcon).attr("force"))
				eyeIcon.prop('title', 'Chi tiết');
			addTooltip(eyeIcon);
		}

		if (deleteIcon) {
			deleteIcon.prop('title', 'Xóa');
			deleteIcon.addClass('text-danger');
			addTooltip(deleteIcon);
		}
	}

	var domStrings = {
		iconEditMark : ".editMark",
		markInput : ".markInput",
		markText : '.markText',
		btnUpdate : "#btn-update"
	}

	return {
		datePicker : function() {
			var dateInput = $('#datepicker');
			if (dateInput) {
				dateInput.datepicker({
					autoclose : true,
					format : "dd/mm/yyyy"
				});
			}
		},
		iconCustomize : iconCustomize,
		domStrings : domStrings
	}
})();

var controller = (function(uiCtrl) {
	
	var dom = uiCtrl.domStrings;
	
	var formatMark = function(input) {
		return input.replace(/;/g, " | ");
	}

	$(dom.btnUpdate).on(
			'click',
			function(e) {
				e.preventDefault();
				var alertable = false;
				$.each($("tbody tr"), function(i, e) {
					var tr = $(this);
					if (!tr.is("[changed]")) {
						return;
					}
					var data = {
						maHS : $(e).data("mahs"),
						maMH : $("select[name='maMH']").val(),
						maHK : $("select[name='maHK']").val(),
						maGV : 1,
						maNH : $("select[name='maNH']").val(),
						maLop : $("select[name='maLop']").val(),
						diemMieng : $(e).find('.diemMieng').val(),
						diem15Phut : $(e).find('.diem15').val(),
						diem1Tiet : $(e).find('.diem45').val(),
						diemThi : $(e).find('.diemThi').val()
					}
					
					$.ajax({
						url : "CapNhatDiemServlet",
						type : 'post',
						data : {
							"data" : JSON.stringify(data)
						},
						success : function(res) {
							
							$(tr).find(".diemMieng").text(
									formatMark(data.diemMieng));
							$(tr).find(".diem15").text(
									formatMark(data.diem15Phut));
							$(tr).find(".diem45").text(
									formatMark(data.diem1Tiet));
							$(tr).find(".diemThi").text(
									formatMark(data.diemThi));
							
							$.ajax({
								url : "LayDiemTongServlet",
								type : 'post',
								data : {
									"data" : JSON.stringify(data)
								},
								success : function(res) {
									tr.find("td:last-child").text(res);
								},
								error : function(error) {
								}
							});
						},
						error : function(error) {
							console.log(error);
						}
					});
				});
			});

	$(document).keyup(function(e) {
		if (e.keyCode === 27) {
			$(dom.markText).removeClass("hide");
			$(dom.markInput).removeClass("fade-in");
		}
	})

	$(dom.markText).on('click', function(e) {

		var parent = $(e.target).parent();
		var tr = parent.parent().parent();
		$(tr).attr("changed", "true");

		var input = parent[0].lastElementChild;
		var markText = parent[0].firstElementChild;
		$(markText).addClass("hide");
		$(input).focus();
		$(input).toggleClass("fade-in");
		$(input).on("blur", function() {
			$(this).val() == "" ? $(this).val(0) : $(this).val($(this).val());
			$(markText).text(formatMark($(this).val()));
			$(markText).removeClass("hide");
			$(this).removeClass('fade-in');
		});
	});

	return {
		init : function() {
			$('.select2').select2({
				language : "vi"
			});
			uiCtrl.datePicker();
			uiCtrl.iconCustomize();

			$.each($('.treeview'), function(i, e){
				if($(e).find('li.active').length > 0 ) {
					$(e).toggleClass('menu-open');
					$(e).find('ul').show();
				}
			})
			

		}
	}
})(uiController);

controller.init();