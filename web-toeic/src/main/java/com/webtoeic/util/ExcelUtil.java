package com.webtoeic.util;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.webtoeic.entities.ListeningExercisesQuestions;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.PictureData;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFPicture;
import org.apache.poi.xssf.usermodel.XSSFShape;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;


@Component
public class ExcelUtil {

	public List<ListeningExercisesQuestions> getListQuestionsFromFileExcel(InputStream excelFile) {

		try {
			List<ListeningExercisesQuestions> listCauHoi = new ArrayList<>();
			Workbook workbook = new XSSFWorkbook(excelFile);

			Sheet datatypeSheet = workbook.getSheetAt(0);

			DataFormatter fmt = new DataFormatter();

			Iterator<Row> iterator = datatypeSheet.iterator();
			Row firstRow = iterator.next();
			Cell firstCell = firstRow.getCell(0);
			System.out.println(firstCell.getStringCellValue());
			XSSFDrawing dp = (XSSFDrawing) datatypeSheet.createDrawingPatriarch();
			List<XSSFShape> pics = dp.getShapes();

			while (iterator.hasNext()) {
				Row currentRow = iterator.next();
				ListeningExercisesQuestions questions = new ListeningExercisesQuestions();
				questions.setNumericalOrder(fmt.formatCellValue(currentRow.getCell(0)));
				questions.setQuestion((fmt.formatCellValue(currentRow.getCell(1))));
				questions.setAnswer_1(fmt.formatCellValue(currentRow.getCell(2)));
				questions.setAnswer_2(fmt.formatCellValue(currentRow.getCell(3)));
				questions.setAnswer_3(fmt.formatCellValue(currentRow.getCell(4)));
				questions.setAnswer_4(fmt.formatCellValue(currentRow.getCell(5)));
				questions.setCorrectAnswer(fmt.formatCellValue(currentRow.getCell(6)));
				questions.setExplains(fmt.formatCellValue(currentRow.getCell(7)));

				for (Iterator<? extends XSSFShape> it = pics.iterator(); it.hasNext();) {
					XSSFPicture inpPic = (XSSFPicture) it.next();

					XSSFClientAnchor clientAnchor = inpPic.getClientAnchor();
					PictureData pict = inpPic.getPictureData();
					byte[] data = pict.getData();
					if( clientAnchor.getCol1() == 8 && clientAnchor.getRow1() == currentRow.getRowNum()) {
						byte[] pictureData = data;
						questions.setPhotoData(pictureData);
					}
				}
				System.out.println(questions.toString());
				questions.setScript(fmt.formatCellValue(currentRow.getCell(9)));
				listCauHoi.add(questions);
			}
			workbook.close();
			return listCauHoi;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
