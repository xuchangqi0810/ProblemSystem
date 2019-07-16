package com.xcq.util;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;

import static org.apache.poi.ss.usermodel.VerticalAlignment.CENTER;

public class ExcelUtils {
    /**
     * 导出Excel
     * @param sheetName sheet名称
     * @param title 标题
     * @param values 内容
     * @param wb HSSFWorkbook对象
     * @return
     */
    public static HSSFWorkbook getHSSFWorkbook(String sheetName, String []title, String [][]values, HSSFWorkbook wb){

        // 第一步，创建一个HSSFWorkbook，对应一个Excel文件
        if(wb == null){
            wb = new HSSFWorkbook();
        }

        HSSFCellStyle titleStyle = wb.createCellStyle(); //标题
        //设置单元格样式
        HSSFFont titleFont = wb.createFont(); //标题字体
        titleFont.setFontHeight(HSSFFont.BOLDWEIGHT_BOLD); //宽度
        titleFont.setFontHeightInPoints((short)16); //字号
        titleStyle.setFont(titleFont);
        titleStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        titleStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
        titleStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
        titleStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);
        sheet.setColumnWidth(0,20*256);
        sheet.setColumnWidth(1,30*256);
        sheet.setColumnWidth(2,15*256);
        sheet.setColumnWidth(3,15*256);
        sheet.setColumnWidth(4,18*256);
        sheet.setColumnWidth(5,35*256);
        sheet.setColumnWidth(6,20*256);
        sheet.setColumnWidth(7,15*256);
        sheet.setColumnWidth(8,20*256);
        sheet.setColumnWidth(9,20*256);
        sheet.setColumnWidth(10,35*256);
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制
        HSSFRow row = sheet.createRow(0);
        row.setHeightInPoints(20);

        //第一行标题
        HSSFCell titleCell = row.createCell(0);
        titleCell.setCellValue(sheetName);
        titleCell.setCellStyle(titleStyle);
        //合并第一行所有列
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, title.length-1));

        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style =(HSSFCellStyle) wb.createCellStyle();
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); //水平居中
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //垂直居中
        HSSFFont font = wb.createFont();
        font.setFontName("宋体");
        font.setFontHeightInPoints((short) 14);
        style.setFont(font);
        style.setWrapText(true);

        //声明列对象
        HSSFCell cell = null;

        //创建标题
        row = sheet.createRow(1);
        for(int i=0;i<title.length;i++){
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(style);
        }

        int s = 2;
        //创建内容
        for(int i=0;i<values.length;i++){
            row = sheet.createRow(s++);
            for(int j=0;j<values[i].length;j++){
                //将内容按顺序赋给对应的列对象
                cell = row.createCell(j);
                cell.setCellValue(values[i][j]);
                cell.setCellStyle(style);
            }
        }

        return wb;
    }
}
