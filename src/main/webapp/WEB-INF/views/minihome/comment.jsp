<%@ page contentType="text/html; charset=UTF-8" %>
    <div class="comment-box">
        <form action="/comment/add" method="post" class="form">
            <textarea name="comment" class="comment-input" placeholder="댓글을 입력하세요..."></textarea>
            <button type="submit">댓글 달기</button>
        </form>
        <div id="likeSection">
            <div class="like-button" id="likeButton">
                <span class="like-icon">♥</span>
                <span class="like-count" id="likeCount">${likeCount}</span>
            </div>
        </div>
    </div>
    <div class="comments">
        <ul>
            <c:forEach var="comment" items="${comments}" varStatus="status">
                <li>
                    <span>${comment}</span>
                    <c:if test="${status.last}">
                        <a href="return false" class="edit-button">수정</a>
                        <a href="return false" class="delete-button">삭제</a>
                    </c:if>
                </li>
            </c:forEach>
        </ul>
    </div>
    
