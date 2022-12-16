package domino.dao;

import java.sql.Connection;
import java.sql.SQLException;

import domino.dto.ReportDTO;

public interface IReport {

	//2.report 글쓰기
	int insert(Connection con, ReportDTO dto ) throws SQLException;
	
}
