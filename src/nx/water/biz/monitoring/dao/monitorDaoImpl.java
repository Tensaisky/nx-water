package nx.water.biz.monitoring.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import nx.water.entity.mapShowInfo;
import nx.water.entity.position;
import nx.water.entity.rmd;
import nx.water.entity.rtu;
import nx.water.entity.test;
import nx.water.util.DataSourceUtils;


public class monitorDaoImpl implements monitorDao {
     public static void main(String[] args) {
    	 monitorDaoImpl dao = new monitorDaoImpl();
    	 List<mapShowInfo>list = dao.mapShow1();
    	 for (mapShowInfo mapShowInfo : list) {
			System.out.println(mapShowInfo);
		}
	}
	@Override
	public void add(position map) {

		String sql = "insert into position(id,jd,wd) values(?,?,?)";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());	
		try {
			runner.update(sql,new Object[]{map.getId(),map.getJd(),map.getWd()});
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public List<position> find() {
		String sql = "SELECT * FROM zyzn_szjc.position";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());		
		@SuppressWarnings("unchecked")
		List<position> obj;
		try {
			obj =(List<position>) runner.query(sql, new BeanListHandler(position.class));
			return obj;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<mapShowInfo> mapShow() {
		List<mapShowInfo> te = new ArrayList<mapShowInfo>();
		try {
		    String sql = "SELECT * FROM zyzn_szjc.rtu";
		    QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());		
		    List<rtu> obj;		
			obj =(List<rtu>) runner.query(sql, new BeanListHandler(rtu.class));
			int rtu_id=obj.get(0).getRTU_ID();
			double jd = obj.get(0).getRTU_LONGITUDE();
			double wd = obj.get(0).getRTU_LATITUDE();
			String sql1 = "SELECT * FROM zyzn_szjc.rmdata where RTU_ID="+rtu_id+" ";
				
			List<rmd> obj1;		
		    obj1 =(List<rmd>) runner.query(sql1, new BeanListHandler(rmd.class));		    
		    mapShowInfo info=new mapShowInfo();
		    
		    info.setId(rtu_id);
		    info.setJd(jd);
		    info.setWd(wd);
		    info.setTime( obj1.get(obj1.size()-1).getRMD_TIME());
		    
		    info.setPO4(obj1.get(obj1.size()-1).getRMD_VALUE());
		    info.setNH4(obj1.get(obj1.size()-2).getRMD_VALUE());
		    info.setCOD(obj1.get(obj1.size()-3).getRMD_VALUE());
		    info.setTEMP(obj1.get(obj1.size()-4).getRMD_VALUE());
		    info.setTUR(obj1.get(obj1.size()-5).getRMD_VALUE());
		    info.setDO(obj1.get(obj1.size()-6).getRMD_VALUE());
		    info.setCON(obj1.get(obj1.size()-7).getRMD_VALUE());
		    info.setPH(obj1.get(obj1.size()-8).getRMD_VALUE());
		    te.add(info);
		    return te;
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
	}
	@Override
	public List<mapShowInfo> mapShow1() {
		List<test> te = new ArrayList<test>();
		try {
		    String sql = "SELECT * FROM zyzn_szjc.rtu";
		    QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());		
		    List<rtu> obj;		
			obj =(List<rtu>) runner.query(sql, new BeanListHandler(rtu.class));
			int rtu_id=obj.get(0).getRTU_ID();
			
			String sql1 = "SELECT * FROM zyzn_szjc.rmdata where RTU_ID="+rtu_id+" ";
				
			List<rmd> list =(List<rmd>) runner.query(sql1, new BeanListHandler(rmd.class));		    
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
			List<mapShowInfo> map = new ArrayList<mapShowInfo>();			
			mapShowInfo info=new mapShowInfo();	
			
			info.setId(rtu_id);
			info.setJd(obj.get(0).getRTU_LONGITUDE());
			info.setWd(obj.get(0).getRTU_LATITUDE());
			info.setTime(te.get(te.size()-1).getTime());
			
			info.setPH(te.get(te.size()-1).getPH());
			info.setCON(te.get(te.size()-1).getCON());
			info.setDO(te.get(te.size()-1).getDO());
			info.setTUR(te.get(te.size()-1).getTUR());
			info.setTEMP(te.get(te.size()-1).getTEMP());
			info.setCOD(te.get(te.size()-1).getCOD());
			info.setNH4(te.get(te.size()-1).getNH4());
			info.setPO4(te.get(te.size()-1).getPO4());
			
			map.add(info);
		    return map;
		    
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
