package com.blog.Dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.blog.Object.Recommend;


public class RecommendDao {
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	//获取数据数量
//	public int getcount() {
//		
//		String sql = "select count(*) from recommend";
//		return jdbcTemplate.queryForInt(sql);
//		
//	}
	
	
	//查询所有推荐
	public List<Recommend> getRecommend() {  
    	
        String sql = "select * from recommend";  
        return (List<Recommend>) jdbcTemplate.query(sql, 
        		new BeanPropertyRowMapper(Recommend.class));
                    
    } 	
	
	//添加推荐
	public boolean addRecommend(String title, String intro, String location) {
		String sql = "insert into recommend set RecommendId=?, RecommendTitle=?, RecommendIntro=?, RecommendLocation=?";
		int ResultInt = jdbcTemplate.update(sql, new Object[] {null, title, intro, location});
		if(ResultInt > 0){
			return true;
		}
		else{
			return false;
		}
		
	}
	
	//删除推荐
	public boolean deleteRecommend(int id) {
		
	   String sql = "delete from recommend where Recommendid=?";  
	   int resultInt = jdbcTemplate.update(sql, new Object[] { id });  
	   if (resultInt > 0) {  
	       return true;  
	   }  
	   else {
		   return false;
	   }
		
	}
	
}
