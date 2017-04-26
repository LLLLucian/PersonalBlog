package com.blog.Object;



public class Comment {

	private int CommentId;
	private int ArticleId;
	private String CommentDetail;
	private String CommentUser;
	
	public int getCommentId() {
		return CommentId;
	}
	public void setCommentId(int commentId) {
		CommentId = commentId;
	}
	public int getArticleId() {
		return ArticleId;
	}
	public void setArticleId(int articleId) {
		ArticleId = articleId;
	}
	public String getCommentDetail() {
		return CommentDetail;
	}
	public void setCommentDetail(String commentDetail) {
		CommentDetail = commentDetail;
	}
	public String getCommentUser() {
		return CommentUser;
	}
	public void setCommentUser(String commentUser) {
		CommentUser = commentUser;
	}

}
