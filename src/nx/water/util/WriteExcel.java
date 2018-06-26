package nx.water.util;

import java.io.File;
import java.io.IOException;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

public class WriteExcel {
	/**
	 * 
	 * @param path 文件路径例：D:/TEMP/123.XLS
	 * @return WritableWorkbook 文件对象
	 */
	public WritableWorkbook createExcel(String path) {
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(path));
			return workbook;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 
	 * @param workbook 文件对象
	 * @param sheetName 表名称
	 * @param index 表序号
	 * @param tableHead 表头
	 * @return WritableSheet 表对象
	 */
	public WritableSheet create_sheet(WritableWorkbook workbook,String sheetName,int index) {
		try {
			WritableSheet sheet = workbook.createSheet(sheetName, index); 
			return sheet;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @设置表头
	 * @param sheet 表对象
	 * @param tableHead str[] 表头
	 */
	public void setTableHead(WritableSheet sheet,String[] tableHead) {
		for(int i=0;i<tableHead.length;i++) {
			try {
				Label label = new Label(i, 0, tableHead[i]);
				sheet.addCell(label);
			} catch (RowsExceededException e) {
				e.printStackTrace();
			} catch (WriteException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 
	 * @param sheet 表对象
	 * @param row 行
	 * @param str[] 行值(数组类型) 
	 */
	public void addLine(WritableSheet sheet,int row,String[] str) {
		try {
			int Columns = sheet.getColumns();
			for(int i=0;i<Columns;i++) {
				Label label = new Label(i, row, str[i]);
				sheet.addCell(label);
			}
		} catch (RowsExceededException e) {
			e.printStackTrace();
		} catch (WriteException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @param sheet 表对象
	 * @param row 行
	 * @param column 列
	 * @param value 值(String类型)
	 */
	public void setValue(WritableSheet sheet,int row,int column,String value) {
		try {
			Label label = new Label(column, row, value);
			sheet.addCell(label);
		} catch (RowsExceededException e) {
			e.printStackTrace();
		} catch (WriteException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @param workbook 文件对象
	 * @写入关闭资源
	 */
	public void writeAndClose(WritableWorkbook workbook) {
		try {
			if(workbook != null) {
				workbook.write();
				workbook.close();
				workbook = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @下标从0开始
	 * @param sheet 工作表对象
	 * @param startColumn 开始列
	 * @param startRow 开始行
	 * @param endColumn 截止列
	 * @param endRow 截止行
	 */
	public void toMergeCells(WritableSheet sheet,int startColumn,int startRow,int endColumn,int endRow) {
		try {
			sheet.mergeCells(startColumn, startRow, endColumn, endRow);
		} catch (RowsExceededException e) {
			e.printStackTrace();
		} catch (WriteException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @设置行高
	 * @param sheet 工作表对象
	 * @param row 行
	 * @param size 行高值
	 */
	public void setRowHigh(WritableSheet sheet,int row,int size) {
		try {
			sheet.setRowView(row, size);
		} catch (RowsExceededException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @设置列宽
	 * @param sheet 工作表对象
	 * @param column 列序号
	 * @param size 宽度值
	 */
	public void setColumnSize(WritableSheet sheet,int column,int size) {
		sheet.setColumnView(column, size);
	}
}
