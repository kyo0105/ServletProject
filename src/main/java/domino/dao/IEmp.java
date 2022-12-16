package domino.dao;

import java.sql.Connection;
import java.sql.SQLException;

import domino.dto.EmpDTO;

public interface IEmp {
	
	// 관리자 로그인 정보
	EmpDTO loginAction(Connection con, String emp_id) throws SQLException;
	
	// 관리자 ID 중복 체크
	int empIdChk(Connection con, String emp_id) throws SQLException;
	
}
