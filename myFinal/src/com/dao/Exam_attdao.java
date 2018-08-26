package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bean.Student1;
import com.bean.exam_attendance;
import com.bean.exam_master;
import com.util.employeeutil;

public class Exam_attdao {
	public void update_examAttendance(int eid, int sid) {
		
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="update exam_attendance set present = ? where stuid= ? and exa_id = ?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, "present");
			pst.setInt(2, sid);
			pst.setInt(3, eid);

			pst.executeUpdate();
			
		}
		catch (Exception ea) {
			ea.printStackTrace();
		}
		
	}
public void update_exammarks(exam_attendance e) {
		
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="update exam_attendance set ob_marks = ? where stuid= ? and exa_id = ?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, e.getOb_marks());
			pst.setInt(2, e.getStuid());
			pst.setInt(3, e.getExa_id());
			pst.executeUpdate();
			
		}
		catch (Exception ea) {
			ea.printStackTrace();
		}
		
	}

public void remove_examAttendance(int eid, int sid) {
	
	try
	{
		Connection conn=employeeutil.createConnection();
		String sql="update exam_attendance set present = ? , ob_marks= ? where stuid= ? and exa_id = ?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, "absent");
		pst.setString(2, "0");
		pst.setInt(3, sid);
		pst.setInt(4, eid);

		pst.executeUpdate();
		
	}
	catch (Exception ea) {
		ea.printStackTrace();
	}


}
}
