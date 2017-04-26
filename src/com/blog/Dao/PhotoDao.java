package com.blog.Dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.blog.Object.Photo;


public class PhotoDao {
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
	//查询所有照片
	public List<Photo> getPhoto() {  
    	
        String sql = "select * from photo";  
        return (List<Photo>) jdbcTemplate.query(sql, 
        		new BeanPropertyRowMapper(Photo.class));
                    
    } 	
	
	//添加照片
	public boolean addPhoto(String name, String location) {
		
		String sql = "insert into photo set PhotoId=?, PhotoName=?, PhotoLocation=?";
		int ResultInt = jdbcTemplate.update(sql, new Object[] {null, name, location});
		if(ResultInt > 0){
			return true;
		}
		else{
			return false;
		}
		
	}
	
	//删除照片
	public boolean deletePhoto(int id) {
		
	   String sql = "delete from photo where PhotoId=?";  
	   int resultInt = jdbcTemplate.update(sql, new Object[] { id });  
	   if (resultInt > 0) {  
	       return true;  
	   }  
	   else {
		   return false;
	   }
		
	}	
	
}
