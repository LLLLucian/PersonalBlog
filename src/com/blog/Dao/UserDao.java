package com.blog.Dao;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.blog.Object.User;


public class UserDao {
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
	//按用户名查找用户
    @SuppressWarnings({ "unchecked", "rawtypes" })
	public User getUser(String username) {  
    	
        String sql = "select * from user where Username = ?";  
        return jdbcTemplate.queryForObject(sql, 
        		new Object[] {username}, new BeanPropertyRowMapper(User.class));
                    
    } 	
    
    //按id查找用户
	public User getUserById(int id) {  
    	
        String sql = "select * from user where Id = ?";  
        return jdbcTemplate.queryForObject(sql, 
        		new Object[] {id}, new BeanPropertyRowMapper(User.class));
                    
    }   
	
    
	//验证密码
	public boolean getPasswordByUser(String username, String password) {  
    	try{

        if(getUser(username).getUsername().equals(username) 
        		&& getUser(username).getPassword().equals(password)) {
        	return true;
        }
        else{
        	return false;
        }
        
    	}catch(Exception ex){
    		System.out.print("异常");
    		return false;
    	}
        
    } 
	
	//修改资料
	public boolean ModifyUser(int id, String username, String password, int age,
			String sex, String qq, String phone) {  
    	
        String sql = "update user set Username=?, Password=?, Age=?, Sex=?, QQ=?, Phone=? where Id= ?";  
        int ResultInt = jdbcTemplate.update(sql, new Object[] {username, password, age, sex, qq, phone,id});
        if(ResultInt>0){
        	return true;
        }
        else{
        	return false;
        }
                    
    } 
	
	//修改资料
//	public boolean Modify(String username, int age,
//			String sex, int qq, String phone) {  
//    	
//        String sql = "update user set Age=?, Sex=?, QQ=?, Phone=? where Username=?";  
//        int ResultInt = jdbcTemplate.update(sql, new Object[] {age, sex, qq, phone,username});
//        if(ResultInt>0){
//        	return true;
//        }
//        else{
//        	return false;
//        }
//                    
//    } 
    
}
