var controller = (function() {
	var doDelete = function(){
		$(".delete-item").on('click', function(e) {
			if(!confirm("Bạn có chắc chắn muốn xóa dòng này?")) return false;
			
			var link = $(e.target);
			
			$.ajax({
				url: link.data("url") + "?id=" + link.data("id"),
				type: "post",
				success: function(res) {
					link.parents("tr").fadeIn(1000, function(){
						$(this).remove();
					});
				},
				error: function(){
					alert("Đã xảy ra lỗi trong khi xóa.");
				}
			});
		});
	}
	return {
		init: function () {
			doDelete();
		}
	}
})();

controller.init();