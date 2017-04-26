package CatchDaoTest;


import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.blog.Dao.ArticleDao;
import com.blog.Dao.CommentDao;
import com.blog.Dao.MessageDao;
import com.blog.Dao.PhotoDao;
import com.blog.Dao.RecommendDao;
import com.blog.Dao.UserDao;
import com.blog.Object.Article;
import com.blog.Object.Comment;
import com.blog.Object.Message;
import com.blog.Object.Photo;
import com.blog.Object.Recommend;
import com.blog.Object.User;
public class TestDao {

	public static void main(String[] args){
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("/applicationContext.xml");
		ArticleDao articledao = applicationContext.getBean("ArticleDao",ArticleDao.class);
		CommentDao commentdao = applicationContext.getBean("CommentDao",CommentDao.class);
		MessageDao messagedao = applicationContext.getBean("MessageDao",MessageDao.class);
		PhotoDao photodao = applicationContext.getBean("PhotoDao",PhotoDao.class);
		RecommendDao recommenddao = applicationContext.getBean("RecommendDao",RecommendDao.class);
		UserDao userdao = applicationContext.getBean("UserDao",UserDao.class);
		
		System.out.println(userdao.getPasswordByUser("J2EE大作业", "abc1230"));
		
//		List<Comment> comment = commentdao.getComment(2);
		
//		boolean temp1 = false;
//		String temp2 = null;
//		
//		System.out.print(commentdao.getArticleIdByComment(6));
		
//		temp1 = commentdao.addComment(1, "不错", "游客26749");
//		temp1 = commentdao.deleteComment(8);
//		temp1 = commentdao.deleteAllComment(1);
//		temp2 = articledao.getArticleById(1).getArticleDetail();
		
//		for(int i = 0; i < comment.size(); i++){
//			
//			temp2 = comment.get(i).getCommentDetail();	
//			System.out.println(temp2);
//			
//		}
		
//		temp1 = userdao.ModifyUser(1, "L", "123", 19, "男", "2909315228", "13263979386" );
//		temp1 = userdao.getPasswordByUser("L", "123");
//		temp2 = userdao.getUser("L").getPassword();
		
//		temp2 = article.get(2).getArticalTitle();
//		System.out.println(article.get(2).getArticleDetail());
//		temp1 = articledao.addArticle("a", "b");
//		temp1 = articledao.deleteArticle(7);
//		temp1 = articledao.ModifyArticle(8, "软件工程", "b");
		
//		temp1 = messagedao.addMessage("ddd", "游客12345");
//		temp1 = messagedao.deleteMessage(5);
		
//		temp1 = photodao.addPhoto("人物", "images/2.jpg");
//		temp1 = photodao.deletePhoto(7);
		
//		boolean temp1 = recommenddao.deleteRecommend(6);
	
//		int temp1 = recommenddao.getcount();
//		String temp1 = recommenddao.getcount();
		
				
//		System.out.println(temp1);
//		System.out.println(temp2);
		
		
//		System.out.println(recommenddao.getRecommend());
		
//		System.out.println(userdao.getPasswordByUser(username, password));
		
//		boolean temp1 = userdao.Modify("LX", 11, "c", 15, "a" );
//		System.out.println(temp1);
		
//		for(int i = 0; i< photo.size(); i++){
//			System.out.println(temp1);
//		}		
		
//			System.out.println(dao.getUser("LX").getAge());
		
//		System.out.println(userdao.ModifyUser("LX", "123", 19, "男", 504866487, "15279102572", 1));
//		System.out.println(userdao.getUser("LX").getAge());
//		System.out.println(userdao.ModifyUser("LX", "1234", 12, "男", 504866487, "15279102572", 1));

		
	}

}
