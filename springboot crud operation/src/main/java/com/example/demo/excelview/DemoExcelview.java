package com.example.demo.excelview;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.example.demo.Model.DemoModel;


@SuppressWarnings("deprecation")
public class DemoExcelview extends AbstractExcelView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception  {
		
		@SuppressWarnings("unchecked")
		List<DemoModel> listobj = (List<DemoModel>)model.get("demolist");
		//System.out.println("listobj "+listobj);
		response.setHeader("Content-Disposition", "attachment; filename=\"DemoDetailList.xls\"");
		HSSFSheet sheet = workbook.createSheet("clist");
		sheet.setDefaultColumnWidth(20);
		HSSFRow hrow= sheet.createRow(0);
		hrow.createCell(0).setCellValue("Sno");
		hrow.createCell(1).setCellValue("Name");
		hrow.createCell(2).setCellValue("Date");
		hrow.createCell(3).setCellValue("Gender");
		hrow.createCell(4).setCellValue("Address");
		hrow.createCell(5).setCellValue("Hobbies");
		hrow.createCell(6).setCellValue("Status");
		
		int rowcount=1;
		int sno=1;
		for(DemoModel dm : listobj)
		{
			HSSFRow brow=sheet.createRow(rowcount++);
			brow.createCell(0).setCellValue(sno++);
			brow.createCell(1).setCellValue(dm.getName());
			SimpleDateFormat sm= new SimpleDateFormat("dd/MM/yyyy");
			
			String df=sm.format(dm.getDate());
			
			brow.createCell(2).setCellValue(df);
			//brow.createCell(2).setCellValue(dm.getDate());
			if(dm.getGender().equals("M"))
			{
				brow.createCell(3).setCellValue("Male");
			}
			if(dm.getGender().equals("F"))
			{
			brow.createCell(3).setCellValue("Female");
			}
			//brow.createCell(3).setCellValue(dm.getGender());
			brow.createCell(4).setCellValue(dm.getAddress());
			brow.createCell(5).setCellValue(dm.getHobbies());
			if(dm.getStatus().equals("Y"))
			{
				brow.createCell(6).setCellValue("Active");
			}
			if(dm.getStatus().equals("N"))
			{
				brow.createCell(6).setCellValue("InActive");
			}
		}
		
	}

}
