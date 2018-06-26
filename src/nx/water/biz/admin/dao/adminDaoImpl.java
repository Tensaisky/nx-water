package nx.water.biz.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import nx.water.entity.user;
import nx.water.util.DataSourceUtils;
import nx.water.util.MD5Util;


public class adminDaoImpl implements adminDao {
	MD5Util md5pass = new MD5Util();
	
	//用于测试
		public static void main(String[] args) {
			adminDaoImpl dao=new adminDaoImpl();
			user c = new user();			
			c.setUSER_PSW("12");
			c.setPGROUP_ID("134");
			c.setUSER_DESC("231");
			c.setUSER_NAME("sh23");
			c.setUSER_ROLE("管理员");
			//System.out.println(c.toString());
			int cc=dao.add(c);
			//System.out.println(cc);
			
		}
	// 查询出所有的数据
	@Override
	public List<user> findAll() {
		String sql = "select *from user";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		List<user> obj;
		try {
			obj = runner.query(sql, new BeanListHandler<user>(user.class));
			return obj;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	//增加用户
	@Override
	public int add(user c) {
		 //System.out.println("业务逻辑"+c.getPGROUP_ID());
		 String id = UUID.randomUUID().toString().replaceAll("-", "");
		 String digestPassworld = md5pass.md5(c.getUSER_PSW());
	     if(c.getUSER_ROLE()=="用户") {
	    	 c.setUSER_ROLE("1");
	     }else {
	    	 c.setUSER_ROLE("0");
	     }
		String sql = "insert into user(USER_ID,USER_NAME,USER_PSW,USER_ROLE,USER_DESC,PGROUP_ID) values(?,?,?,?,?,?)";
		int res;
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		try {
			res=  runner.update(sql, id,c.getUSER_NAME(),digestPassworld,c.getUSER_ROLE(),c.getUSER_DESC(),c.getPGROUP_ID());			
			return res;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
		
		
	}
	//根据USER_ID删除用户
	@Override
	public int delById(String USER_NAME) {
		String sql = "delete from user where USER_NAME=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		int obj ;
		try {
			obj=runner.update(sql, USER_NAME);
			
			return obj;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
		
		
	}
	//修改用户
	@Override
	public int updateUser(user c) {
		 String digestPassworld = md5pass.md5(c.getUSER_PSW());
		
		String sql = "update user set USER_NAME=?,USER_DESC=?,USER_PSW=?,USER_ROLE=?,PGROUP_ID=? where USER_ID=?";

		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		int obj ;
		try {
			obj=runner.update(sql,c.getUSER_NAME(),c.getUSER_DESC(),digestPassworld,c.getUSER_ROLE(),c.getPGROUP_ID(),c.getUSER_ID());
			return obj;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
		
	}
	//分页查询
	@Override
	public List<user> findAllP(int currentPage,int pageSize) {
		String sql = "select *from user limit ?,?";
		//int startNo = (currentPage-1)*pageSize;
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		List<user> obj;
		try {
			obj = runner.query(sql, new BeanListHandler<user>(user.class),new Object[]{currentPage,pageSize});
			return obj;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	//查询总记录数
	@Override
	public int queryCount() {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql ="select count(*) from user";	
		try {
			Long count = (Long) runner.query(sql, new ScalarHandler());			
			return count.intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
	}



}
