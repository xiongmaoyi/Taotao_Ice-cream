/**
 * 需要js bootstrap4 依赖
 * 传入分页包装数据
 * 两个方法形成的分页 分别插入到page_info_col 和 page_ul
 * @param result
 */

//---------------------------------------------------------显示分页------------------------------------------------------------
function buid_page_info(result) {
    $("#page_info_col").empty();
    currentPage = result.data.page.pageNum;
    $("#page_info_col").append("当前<span class='badge badge-secondary'> " + result.data.page.pageNum + " </span>页, 共有<span class='badge badge-secondary'> " + result.data.page.pages + " </span> 页,总计 <span class='badge badge-secondary'>" + result.data.page.total + " </span>条记录");
}
function buid_page_nav(result) {
    $("#page_ul").empty();
    var page = result.data.page;
    console.log(page);

    var firstPage_li = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append("首页"));
    var prePage_li = $("<li></li>").addClass("page-item").addClass("page-item").append($("<a></a>").addClass("page-link").append("&laquo;"));
    var nextPage_li = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append("&raquo;"));
    var lastPage_li = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append("末页"));

    if(page.hasPreviousPage==false){
        firstPage_li.addClass("disabled");
        prePage_li.addClass("disabled");
    }else{
        firstPage_li.click(function(){
            toPage(1);
        });
        prePage_li.click(function(){
            toPage(page.pageNum-1);
        });

    }
    if(page.hasNextPage==false){
        nextPage_li.addClass("disabled");
        lastPage_li.addClass("disabled");
    }else{
        nextPage_li.click(function(){
            toPage(page.pageNum+1);
        });
        lastPage_li.click(function(){
            toPage(page.pages);
        });

    }


    $("#page_ul").append(firstPage_li).append(prePage_li);

    $.each(page.navigatepageNums, function(index, item) {
        var pageNum_li = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append(item)).appendTo("#page_ul");
        if(page.pageNum == item){
            pageNum_li.addClass("active");
        }
        pageNum_li.click(function(){
            toPage(item);
        });
    });
    $("#page_ul").append(nextPage_li).append(lastPage_li);

}