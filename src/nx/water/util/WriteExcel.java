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
	 * @param path �ļ�·������D:/TEMP/123.XLS
	 * @return WritableWorkbook �ļ�����
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
	 * @param workbook �ļ�����
	 * @param sheetName ������
	 * @param index �����
	 * @param tableHead ��ͷ
	 * @return WritableSheet �����
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
	 * @���ñ�ͷ
	 * @param sheet �����
	 * @param tableHead str[] ��ͷ
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
	 * @param sheet �����
	 * @param row ��
	 * @param str[] ��ֵ(��������) 
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
	 * @param sheet �����
	 * @param row ��
	 * @param column ��
	 * @param value ֵ(String����)
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
	 * @param workbook �ļ�����
	 * @д��ر���Դ
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
	 * @�±��0��ʼ
	 * @param sheet ���������
	 * @param startColumn ��ʼ��
	 * @param startRow ��ʼ��
	 * @param endColumn ��ֹ��
	 * @param endRow ��ֹ��
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
	 * @�����и�
	 * @param sheet ���������
	 * @param row ��
	 * @param size �и�ֵ
	 */
	public void setRowHigh(WritableSheet sheet,int row,int size) {
		try {
			sheet.setRowView(row, size);
		} catch (RowsExceededException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @�����п�
	 * @param sheet ���������
	 * @param column �����
	 * @param size ���ֵ
	 */
	public void setColumnSize(WritableSheet sheet,int column,int size) {
		sheet.setColumnView(column, size);
	}
}
