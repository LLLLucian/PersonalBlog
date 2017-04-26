package com.blog.Dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.blog.Object.Message;

public class MessageDao {
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
	//查询所有留言
	public List<Message> getMessage() {  
    	
        String sql = "select * from message";  
        return (List<Message>) jdbcTemplate.query(sql, 
        		new BeanPropertyRowMapper(Message.class));
                    
    } 	
	
	//添加留言
	public boolean addMessage(String detail, String userid) {
		
		String sql = "insert into message set MessageId=?, MessageDetail=?, MessageUser=?";
		int ResultInt = jdbcTemplate.update(sql, new Object[] {null, detail, userid});
		if(ResultInt > 0){
			return true;
		}
		else{
			return false;
		}
		
	}
	
	//删除留言
	public boolean deleteMessage(int id) {
		
	   String sql = "delete from message where MessageId=?";  
	   int resultInt = jdbcTemplate.update(sql, new Object[] { id });  
	   if (resultInt > 0) {  
	       return true;  
	   }  
	   else {
		   return false;
	   }
		
	}	
	
}
