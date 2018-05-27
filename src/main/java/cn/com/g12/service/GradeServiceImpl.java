package cn.com.g12.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.g12.mapper.GradeMapper;
import cn.com.g12.pojo.Grade;
import cn.com.g12.pojo.GradeCustom;
import cn.com.g12.pojo.GradeExample;

@Service("gradeService")
public class GradeServiceImpl implements GradeService {

	@Autowired
	private GradeMapper gradeMapper;

	public List<Grade> selectAllGrade() throws Exception {
		GradeExample example =new GradeExample();
		List<Grade> gradeList = gradeMapper.selectByExample(example);

		if (gradeList != null) {
			System.out.println(gradeList.size());

		} else {

			System.out.println("no found!");
		}

		return gradeList;
	}
	public Grade selectGradeByGno(int gno) throws Exception {
		Grade grade = gradeMapper.selectByPrimaryKey(gno);
		
		if (grade != null) {
			System.out.println(grade.getGno());

		} else {

			System.out.println("no found!");
		}

		return grade;
	}
	@Override
	public void updateGradeByGno(Grade grade) throws Exception {
		gradeMapper.updateByPrimaryKeySelective(grade);
		
	}
	@Override
	public List<GradeCustom> selectAllGradeAndName() throws Exception {
		return gradeMapper.selectAllGradeAndStuName();
	}
	@Override
	public void deleteGrades(int[] gnos) throws Exception {
		// TODO Auto-generated method stub
		gradeMapper.deleteGrades(gnos);
	}
	@Override
	public List<GradeCustom> selectGradeByName(GradeCustom gradeCustom) throws Exception {
		return gradeMapper.selectGradeByName(gradeCustom);
		
	}

}
