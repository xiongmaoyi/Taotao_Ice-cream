package cn.com.g12.service;

import java.util.List;

import cn.com.g12.pojo.Grade;
import cn.com.g12.pojo.GradeCustom;

public interface GradeService  {
	public List<Grade> selectAllGrade() throws Exception;
	public List<GradeCustom> selectAllGradeAndName() throws Exception;
	public Grade selectGradeByGno(int gno) throws Exception;
	public void updateGradeByGno(Grade grade) throws Exception;
	public void deleteGrades(int[] gnos) throws Exception;
	public List<GradeCustom> selectGradeByName(GradeCustom gradeCustom) throws Exception;
}
