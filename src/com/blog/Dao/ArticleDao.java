package com.blog.Dao;

import java.util.List;

import javax.persistence.AttributeOverride;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.blog.Object.Article;
import com.blog.Object.User;

public class ArticleDao {
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	//查询所有文章
	public List<Article> getArticle() {  
    	
        String sql = "select * from article";  
        return (List<Article>) jdbcTemplate.query(sql, 
        		new BeanPropertyRowMapper(Article.class));
                    
    }
	
	//按id查询文章
	public Article getArticleById(int id) {  
    	
        String sql = "select * from article where ArticleId = ?";  
        return jdbcTemplate.queryForObject(sql, 
        		new Object[] {id}, new BeanPropertyRowMapper(Article.class));
                    
    } 
	
	//添加文章
	public boolean addArticle(String title, String detail) {
		String sql = "insert into article set ArticleId=?, ArticleTitle=?, ArticleDetail=?";
		int ResultInt = jdbcTemplate.update(sql, new Object[] {null, title, detail});
		if(ResultInt > 0){
			return true;
		}
		else{
			return false;
		}
		
	}
	
	//删除文章
	public boolean deleteArticle(int id) {
		
	   String sql = "delete from article where Articleid=?";  
	   int resultInt = jdbcTemplate.update(sql, new Object[] { id });  
	   if (resultInt > 0) {  
	       return true;  
	   }  
	   else {
		   return false;
	   }
		
	}
	
	//修改文章
	public boolean ModifyArticle(int id, String title, String detail) {  
    	
        String sql = "update article set ArticleTitle=?, ArticleDetail=? where ArticleId= ?";  
        int ResultInt = jdbcTemplate.update(sql, new Object[] {title, detail, id});
        if(ResultInt>0){
        	return true;
        }
        else{
        	return false;
        }
                    
    } 
	
}
