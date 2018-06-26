package nx.water.biz.historicalDate.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import nx.water.entity.pgroup;
import nx.water.entity.query;
import nx.water.entity.rmd;
import nx.water.entity.rtu;
import nx.water.entity.test;
import nx.water.util.DataSourceUtils;

public class hisDateDaoImpl implements hisDateDao {
	public static void main(String[] args) {
		hisDateDaoImpl dao =new hisDateDaoImpl();
		query qu= new query();
		List<test> li = dao.queryFind1(qu);
		for (test test : li) {
			System.out.println(test);
		}
	}
	// 查询所有的历史数据
	@Override
	public List<rmd> findAllData() {
		String sql = "select *from rmdata";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		List<rmd> obj;
		try {
			obj = (List<rmd>) runner.query(sql, new BeanListHandler<rmd>(rmd.class));
			return obj;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	//查询所有项目名称
	@Override
	public List<pgroup> findAllGroup() {
		String sql = "select *from pgroup";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		List<pgroup> obj;
		try {
			obj = (List<pgroup>) runner.query(sql, new BeanListHandler<pgroup>(pgroup.class));
			return obj;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
	}
	@Override
	public List<rtu> findAllEquipment() {
		String sql = "select *from rtu";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		List<rtu> obj;
		try {
			obj = (List<rtu>) runner.query(sql, new BeanListHandler<rtu>(rtu.class));
			return obj;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<test> queryFind(query que) {
		List<test> te = new ArrayList<test>();
		try {			
			//根据查询条件拼凑一条sql语句
			StringBuffer sql = new StringBuffer("select * from rmdata where 1=1 ");
			if(que!=null) {
				//项目不为空，则往sql添加条件(trim():去掉两边空格)
				if(que.getPgroup()!=null && !que.getPgroup().trim().equals("")){
					sql.append(" and PGROUP_ID like '%"+que.getPgroup()+"%'");
				}
				//设备
				if(que.getRtu()!=null && !que.getRtu().trim().equals("")){
					sql.append(" and RTU_ID like '%"+que.getRtu()+"%'");
				}
				//时间范围
				if(que.getStartTime()!=null){
					sql.append(" and RMD_TIME>='"+que.getStartTime()+"'");
				}
				if(que.getEndTime()!=null){
					sql.append(" and RMD_TIME<='"+que.getEndTime()+"'");
				}			
			}
			//System.out.println(sql.toString());
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			List<rmd> list=(List<rmd>)runner.query(sql.toString(), new BeanListHandler(rmd.class));				
			for (int i = 0; i < list.size()/8; i++) {
				test t = new test();
				t.setTime(list.get(i*8).getRMD_TIME());	
				
				t.setPH(list.get(i*8+0).getRMD_VALUE());
				t.setCON(list.get(i*8+1).getRMD_VALUE());
				t.setDO(list.get(i*8+2).getRMD_VALUE());
				t.setTUR(list.get(i*8+3).getRMD_VALUE());
				t.setTEMP(list.get(i*8+4).getRMD_VALUE());
				t.setCOD(list.get(i*8+5).getRMD_VALUE());
				t.setNH4(list.get(i*8+6).getRMD_VALUE());
				t.setPO4(list.get(i*8+7).getRMD_VALUE());
				te.add(t);
			}
			return te;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	@Override
	public List<test> find() {
		List<test> te = new ArrayList<test>();
		try {			
			//根据查询条件拼凑一条sql语句
			StringBuffer sql = new StringBuffer("select * from rmdata");			
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			@SuppressWarnings("unchecked")
			List<rmd> list=(List<rmd>)runner.query(sql.toString(), new BeanListHandler(rmd.class));				
			test tee = new test();
			List<Integer> intArray = new ArrayList<Integer>();
			List<Integer> intArray1 = new ArrayList<Integer>();
			List<Integer> intArray2 = new ArrayList<Integer>();
			for (int i = 0; i < list.size(); i++) {					
				if(i==0) {
				   tee.setTime(list.get(i).getRMD_TIME());				   
				   intArray.add(geiv(list, i, tee));				   
				}				
				if(i>0 && list.get(i-1).getRMD_TIME().equals(list.get(i).getRMD_TIME())){
					if(i<list.size()-1) {
						intArray.add(geiv(list, i, tee));	
					}
					if(i==list.size()-1) {
						intArray.add(geiv(list, i, tee));
						findUni(intArray, intArray1);
						addNui(tee, intArray1);	
						te.add(tee);
					}
										
				}
				if(i>0 && list.get(i-1).getRMD_TIME().equals(list.get(i).getRMD_TIME())==false ){
					findUni(intArray, intArray1);
					addNui(tee, intArray1);					
					te.add(tee);
					tee=new test();
					intArray=new ArrayList<Integer>();
					intArray1=new ArrayList<Integer>();
					if(i==list.size()-1) {
						tee.setTime(list.get(i).getRMD_TIME());
						intArray.add(geiv(list, i, tee));
						findUni(intArray, intArray1);
						addNui(tee, intArray1);	
						te.add(tee);
					}
					if(i<list.size()-1) {
						tee.setTime(list.get(i).getRMD_TIME());
						intArray.add(geiv(list, i, tee));						
					}
				} 				
			}
			return te;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	@Override
	public List<test> queryFind1(query que) {
		List<test> te = new ArrayList<test>();
		try {			
			//根据查询条件拼凑一条sql语句
			StringBuffer sql = new StringBuffer("select * from rmdata where 1=1 ");
			if(que!=null) {
				//项目不为空，则往sql添加条件(trim():去掉两边空格)
				if(que.getPgroup()!=null && !que.getPgroup().trim().equals("")){
					sql.append(" and PGROUP_ID like '%"+que.getPgroup()+"%'");
				}
				//设备
				if(que.getRtu()!=null && !que.getRtu().trim().equals("")){
					sql.append(" and RTU_ID like '%"+que.getRtu()+"%'");
				}
				//时间范围
				if(que.getStartTime()!=null){
					sql.append(" and RMD_TIME>='"+que.getStartTime()+"'");
				}
				if(que.getEndTime()!=null){
					sql.append(" and RMD_TIME<='"+que.getEndTime()+"'");
				}			
			}
			System.out.println(sql.toString());
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			@SuppressWarnings("unchecked")
			List<rmd> list=(List<rmd>)runner.query(sql.toString(), new BeanListHandler(rmd.class));	
			test tee = new test();
			List<Integer> intArray = new ArrayList<Integer>();
			List<Integer> intArray1 = new ArrayList<Integer>();
			List<Integer> intArray2 = new ArrayList<Integer>();
			for (int i = 0; i < list.size(); i++) {					
				if(i==0) {
				   tee.setTime(list.get(i).getRMD_TIME());				   
				   intArray.add(geiv(list, i, tee));				   
				}				
				if(i>0 && list.get(i-1).getRMD_TIME().equals(list.get(i).getRMD_TIME())){
					if(i<list.size()-1) {
						intArray.add(geiv(list, i, tee));	
					}
					if(i==list.size()-1) {
						intArray.add(geiv(list, i, tee));
						findUni(intArray, intArray1);
						addNui(tee, intArray1);	
						te.add(tee);
					}
										
				}
				if(i>0 && list.get(i-1).getRMD_TIME().equals(list.get(i).getRMD_TIME())==false ){
					findUni(intArray, intArray1);
					addNui(tee, intArray1);					
					te.add(tee);
					tee=new test();
					intArray=new ArrayList<Integer>();
					intArray1=new ArrayList<Integer>();
					if(i==list.size()-1) {
						tee.setTime(list.get(i).getRMD_TIME());
						intArray.add(geiv(list, i, tee));
						findUni(intArray, intArray1);
						addNui(tee, intArray1);	
						te.add(tee);
					}
					if(i<list.size()-1) {
						tee.setTime(list.get(i).getRMD_TIME());
						intArray.add(geiv(list, i, tee));						
					}
				} 				
			}
			return te;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	private void addNui(test tee, List<Integer> intArray1) {
		for(int aa=0;aa<intArray1.size();aa++) {
			  switch (intArray1.get(aa)) {
		       case 1:
		              tee.setPH(0);
		              break;
		       case 2:
		              tee.setCON(0);
		              break;
		       case 3:
		              tee.setDO(0);
		              break;
		       case 4:
		              tee.setTUR(0);
		              break;
		       case 5:
		              tee.setTEMP(0);
		              break;
		       case 6:
		              tee.setCOD(0);
		              break;
		       case 7:
		              tee.setNH4(0);
		              break;
		       case 8:
		              tee.setPO4(0);
		              break;				                   		                  
		     }
		}
	}
	private void findUni(List<Integer> intArray, List<Integer> intArray1) {
		for (int j = 1; j < 9; j++) {
			intArray1.add(j);
		}
		for(int a1=0;a1<intArray1.size();a1++) {
			for(int a2=0;a2<intArray.size();a2++) {
				if(intArray1.get(a1) ==intArray.get(a2)) {
					intArray1.remove(a1);
				}
			}
		}
	}
	private int geiv(List<rmd> list, int i, test t) {
		int datatype=list.get(i).getDATATYPE_ID();
		   switch (datatype) {
		                   case 1:
			                  t.setPH(list.get(i).getRMD_VALUE());
			                  break;
		                   case 2:
				               t.setCON(list.get(i).getRMD_VALUE());
				               break;
		                   case 3:
				               t.setDO(list.get(i).getRMD_VALUE());
				               break;
		                   case 4:
				               t.setTUR(list.get(i).getRMD_VALUE());
				               break;
		                   case 5:
				               t.setTEMP(list.get(i).getRMD_VALUE());
				               break;
		                   case 6:
				               t.setCOD(list.get(i).getRMD_VALUE());
				               break;
		                   case 7:
				               t.setNH4(list.get(i).getRMD_VALUE());
				               break;
		                   case 8:
				               t.setPO4(list.get(i).getRMD_VALUE());
				               break;				                  
		    }
		return datatype;
	}
    


}
