package nx.water.biz.dataRep.dao;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import net.sf.json.JSONArray;
import nx.water.entity.query;
import nx.water.entity.queryTest;
import nx.water.entity.rmd;
import nx.water.entity.test;
import nx.water.util.DataSourceUtils;

public class dataRepDaoImpl implements dataRepDao {
	// 用于测试


	// 查询所有的历史数据
	@Override
	public List<test> findAllData() {
		String sql = "select *from test";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		List<test> obj;
		try {
			obj = runner.query(sql, new BeanListHandler<test>(test.class));
			return obj;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	

	// 分页查询所有数据
	@Override
	public List<test> findAllDataP(int currentPage, int pageSize) {
		String sql = "select *from test limit ?,?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		List<test> obj;
		try {
			obj = runner.query(sql, new BeanListHandler<test>(test.class), new Object[] { currentPage, pageSize });
			return obj;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	// 数据总个数
	@Override
	public int queryCount() {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select count(*) from test";
		try {
			Long count = (Long) runner.query(sql, new ScalarHandler());
			return count.intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	// 分页+条件 查询
	@Override
	public List<test> findDataP(int currentPage, int pageSize, queryTest query) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		StringBuffer sql = new StringBuffer("select * from test where 1=1");
		if (query != null) {
			if (query.getStarttime() != 0) {
				sql.append(" and id>='" + query.getStarttime() + "'");
			}
			if (query.getEndtime() != 0) {
				sql.append(" and id<='" + query.getEndtime() + "'");
			}
			sql.append(" limit ?,?");
		}
		//System.out.println(sql.toString());

		int startNo = (currentPage - 1) * pageSize;

		List<test> obj;
		try {
			obj = runner.query(sql.toString(), new BeanListHandler<test>(test.class),
					new Object[] { startNo, pageSize });
			return obj;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	// 条件 得到总数目
	@Override
	public int count(queryTest query) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		StringBuffer sql = new StringBuffer("select count(*) from test where 1=1");
		if (query != null) {
			if (query.getStarttime() != 0) {
				sql.append(" and id>='" + query.getStarttime() + "'");
			}
			if (query.getEndtime() != 0) {
				sql.append(" and id<='" + query.getEndtime() + "'");
			}
			// sql.append("limit ?,?");
		}
		try {
			Long count = (Long) runner.query(sql.toString(), new ScalarHandler());
			return count.intValue();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	// 导出excel;
	@Override
	public void Export(List<test> employ, queryTest query) {
		//根据条件查询
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		StringBuffer sql = new StringBuffer("select * from test where 1=1");
		if (query != null) {
			if (query.getStarttime() != 0) {
				sql.append(" and id>='" + query.getStarttime() + "'");
			}
			if (query.getEndtime() != 0) {
				sql.append(" and id<='" + query.getEndtime() + "'");
			}
			
		}
		System.out.println(sql.toString());
		
		try {
			employ = runner.query(sql.toString(), new BeanListHandler<test>(test.class));			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		test userInfo;
		Workbook wbook = new HSSFWorkbook();
		Sheet sheet = wbook.createSheet("历史数据");
		Row row0 = sheet.createRow(0);
		row0.createCell(0).setCellValue("PH值");
		row0.createCell(1).setCellValue("电导率");
		row0.createCell(2).setCellValue("溶解氧");
		row0.createCell(3).setCellValue("浊度");
		row0.createCell(4).setCellValue("温度");
		row0.createCell(5).setCellValue("化学耗氧量");
		row0.createCell(6).setCellValue("氨氮");

		for (int i = 0; i < employ.size(); i++) {
			userInfo = employ.get(i);
			Row row = sheet.createRow(i + 1);
			row.createCell(0).setCellValue(userInfo.getPH());
			row.createCell(1).setCellValue(userInfo.getCON());
			row.createCell(2).setCellValue(userInfo.getDO());
			row.createCell(3).setCellValue(userInfo.getTUR());
			row.createCell(4).setCellValue(userInfo.getTEMP());
			row.createCell(5).setCellValue(userInfo.getNH4());
			row.createCell(5).setCellValue(userInfo.getPO4());

		}

		String uuid = UUID.randomUUID().toString();
		FileOutputStream fos;
		try {
			fos = new FileOutputStream(new File("e:\\" + uuid + ".xls"));
			wbook.write(fos);
			fos.flush();
			fos.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("导出成功");

	}



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
	public List<test> hispage(int pageNumber, int pageSize, List<test> list,int total) {
		List<test> array1=new ArrayList<test>();
		if(total %pageSize==0) {
			for (int i = pageNumber; i < pageSize+pageNumber; i++) {
				test t = new test();
				t.setTime(list.get(i).getTime());
				t.setPH(list.get(i).getPH());
				t.setDO(list.get(i).getDO());
				t.setTUR(list.get(i).getTUR());
				t.setTEMP(list.get(i).getTEMP());
				t.setCOD(list.get(i).getCOD());
				t.setNH4(list.get(i).getNH4());
				t.setPO4(list.get(i).getPO4());
				t.setCON(list.get(i).getCON());
				array1.add(t);
			}
		}else if(pageNumber/pageSize<=(total/pageSize-1)) {
			for (int i = pageNumber; i < pageSize+pageNumber; i++) {
				test t = new test();
				t.setTime(list.get(i).getTime());
				t.setPH(list.get(i).getPH());
				t.setDO(list.get(i).getDO());
				t.setTUR(list.get(i).getTUR());
				t.setTEMP(list.get(i).getTEMP());
				t.setCOD(list.get(i).getCOD());
				t.setNH4(list.get(i).getNH4());
				t.setPO4(list.get(i).getPO4());
				t.setCON(list.get(i).getCON());
				array1.add(t);
			}
		}else {
			for (int i = (total/pageSize)*pageSize; i <total ; i++) {
				test t = new test();
				t.setTime(list.get(i).getTime());
				t.setPH(list.get(i).getPH());
				t.setDO(list.get(i).getDO());
				t.setTUR(list.get(i).getTUR());
				t.setTEMP(list.get(i).getTEMP());
				t.setCOD(list.get(i).getCOD());
				t.setNH4(list.get(i).getNH4());
				t.setPO4(list.get(i).getPO4());
				t.setCON(list.get(i).getCON());
				array1.add(t);
			}
		}
		return array1;
	}
	
	
	public static void main(String[] args) {
		dataRepDaoImpl dao = new dataRepDaoImpl();
		query que =new query();
		
		List<test> list= dao.queryFind(que);
		List<test> li=dao.hispage(9, 3, list, 10);
		for (test test : li) {
			System.out.println(test);
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
			//System.out.println(sql.toString());
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
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
