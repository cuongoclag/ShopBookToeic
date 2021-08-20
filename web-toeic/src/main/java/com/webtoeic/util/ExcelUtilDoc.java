package com.webtoeic.util;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.webtoeic.entities.ReadingExercisesQuestions;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;

@Component
public class ExcelUtilDoc {
	
	public List<ReadingExercisesQuestions> getListQuestionsFromFileExcel(InputStream excelFile) {

		try {
			List<ReadingExercisesQuestions> listQuestios = new ArrayList<>();
			Workbook workbook = new XSSFWorkbook(excelFile);

			Sheet datatypeSheet = workbook.getSheetAt(0);

			DataFormatter fmt = new DataFormatter();

			Iterator<Row> iterator = datatypeSheet.iterator();
			Row firstRow = iterator.next();
			Cell firstCell = firstRow.getCell(0);
			System.out.println(firstCell.getStringCellValue());


			while (iterator.hasNext()) {
				Row currentRow = iterator.next();
				ReadingExercisesQuestions readingExercisesQuestions = new ReadingExercisesQuestions();
				readingExercisesQuestions.setNumericalOrder(fmt.formatCellValue(currentRow.getCell(0)));
				readingExercisesQuestions.setQuestions((fmt.formatCellValue(currentRow.getCell(1))));
				readingExercisesQuestions.setAnswer_1(fmt.formatCellValue(currentRow.getCell(2)));
				readingExercisesQuestions.setAnswer_2(fmt.formatCellValue(currentRow.getCell(3)));
				readingExercisesQuestions.setAnswer_3(fmt.formatCellValue(currentRow.getCell(4)));
				readingExercisesQuestions.setAnswer_4(fmt.formatCellValue(currentRow.getCell(5)));
				readingExercisesQuestions.setCorrectAnswer(fmt.formatCellValue(currentRow.getCell(6)));
				readingExercisesQuestions.setExplains(fmt.formatCellValue(currentRow.getCell(7)));
				readingExercisesQuestions.setParagraph(fmt.formatCellValue(currentRow.getCell(8)));

				System.out.println(readingExercisesQuestions.toString());
				listQuestios.add(readingExercisesQuestions);
			}
			workbook.close();
			return listQuestios;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
