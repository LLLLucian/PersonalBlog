package com.blog.Dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.blog.Object.Comment;
import com.blog.Object.Message;

public class CommentDao {
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
	//根据评论id查询文章id
	public int getArticleIdByComment(int commentid) {  
    	
        String sql = "select ArticleId from comment where CommentId=?";  
        return  jdbcTemplate.queryForInt(sql, new Object[] {commentid});
                    
    } 	
	
	//根据文章名查询所有评论
	public List<Comment> getComment(int articleid) {  
    	
        String sql = "select * from comment where ArticleId=?";  
        return (List<Comment>) jdbcTemplate.query(sql, new Object[] {articleid},
        		new BeanPropertyRowMapper(Comment.class));
                    
    } 	
	
	//添加评论
	public boolean addComment(int articleid, String detail, String userid) {
		
		String sql = "insert into comment set CommentId=?, ArticleId=?, CommentDetail=?, CommentUser=?";
		int ResultInt = jdbcTemplate.update(sql, new Object[] {null, articleid, detail, userid});
		if(ResultInt > 0){
			return true;
		}
		else{
			return false;
		}
		
	}
	
	//删除评论
	public boolean deleteComment(int id) {
		
	   String sql = "delete from comment where CommentId=?";  
	   int resultInt = jdbcTemplate.update(sql, new Object[] { id });  
	   if (resultInt > 0) {  
	       return true;  
	   }  
	   else {
		   return false;
	   }
		
	}	
	
	//删除某篇文章的所有评论
	public boolean deleteAllComment(int articleid) {
		
	   String sql = "delete from comment where ArticleId=?";  
	   int resultInt = jdbcTemplate.update(sql, new Object[] { articleid });  
	   if (resultInt > 0) {  
	       return true;  
	   }  
	   else {
		   return false;
	   }
		
	}
	
}
