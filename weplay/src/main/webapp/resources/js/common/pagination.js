/**
 * 
 */
 
function pagination(pageInfo){ // 페이징 처리
    		
    const pageUl = document.createElement('ul');
    pageUl.setAttribute("class", "pagination justify-content-center");
    		
    const moveLi = document.createElement('li');
    moveLi.setAttribute("class", "page-item");
    
    if(pageInfo.currentPage != 1){
    	moveLi.innerHTML = '<a class="page-link" onclick="selectTeams(' + (pageInfo.currentPage - 1) + ');">이전</a>';
  		pageUl.appendChild(moveLi);
    }
    
    for(let i = 1; i <= pageInfo.endPage; i++){
  		
  	const pageLi = document.createElement('li');
    	if(i == pageInfo.currentPage){
  			pageLi.setAttribute("class", "page-item active");
    	}
    	else{
    		pageLi.setAttribute("class", "page-item");
    	}
  		pageLi.innerHTML = '<a class="page-link" onclick="selectTeams(' + i + ');">' + i + '</a>';
  		pageUl.appendChild(pageLi);
    }
    
    if(pageInfo.maxPage > pageInfo.currentPage){
    	moveLi.innerHTML = '<a class="page-link" onclick="selectTeams(' + (pageInfo.currentPage + 1) + ');">다음</a>';
  		pageUl.appendChild(moveLi);
    }
    
    return pageUl;
}