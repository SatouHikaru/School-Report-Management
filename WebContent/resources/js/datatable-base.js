$(document).ready(function() {
	const options = {
		"lengthMenu" : [ [ 15, 25, 35, 50, 100 ], [ 15, 25, 35, 50, 100 ] ],
		"paging" : true,
		"searching" : $("#dataTable").attr("isSearching") == null ? false : true,
		"ordering" : false,
		"info" : false,
		"autoWidth" : false,
		"language" : {
			sProcessing : "Đang xử lý...",
			sLengthMenu : "Xem _MENU_ mục",
			sZeroRecords : "Không có dữ liệu...",
			sSearch: "Tìm kiếm:",
			oPaginate : {
				sFirst : "«",
				sPrevious : "‹",
				sNext : "›",
				sLast : "»"
			}
		},
		"sPaginationType" : "full_numbers"
	};

	$("#dataTable").DataTable(options);
})