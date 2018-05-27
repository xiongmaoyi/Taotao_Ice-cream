package cn.com.g12.controller;

import java.io.Reader;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.com.g12.pojo.Grade;
import cn.com.g12.pojo.GradeCustom;
import cn.com.g12.service.GradeService;
import cn.com.g12.service.GradeServiceImpl;


@RequestMapping("/Grade")
@Controller("gradeController")
public class GradeController{
	
	
	@Autowired
	private GradeService gradeServiceImpl;
	 
	@RequestMapping("showGrade.action")
	public ModelAndView showGrade() throws Exception {

//		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext-dao.xml");
//		GradeServiceImpl gradeServiceImpl = (GradeServiceImpl) applicationContext.getBean("gradeServiceImpl");
		
		List<Grade> gradeList = gradeServiceImpl.selectAllGrade();
		
		if (gradeList != null) {
			System.out.println(gradeList.size());

		} else {

			System.out.println("no found!");
		}

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("gradeList",gradeList);
		modelAndView.setViewName("/ShowGrade.jsp");
		
		return modelAndView;
	}
	@RequestMapping("showGradeAndName.action")
	public ModelAndView showGradeAndName() throws Exception {

		List<GradeCustom> gradeCustomList = gradeServiceImpl.selectAllGradeAndName();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("gradeCustomList",gradeCustomList);
		modelAndView.setViewName("/ShowGradeAndName.jsp");
		
		return modelAndView;
	}
	
	
	@RequestMapping("selectGradeByName.action")
	public ModelAndView selectGradeByName() throws Exception {

		List<Grade> gradeList = gradeServiceImpl.selectAllGrade();
		
		if (gradeList != null) {
			System.out.println(gradeList.size());

		} else {

			System.out.println("no found!");
		}

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("gradeList",gradeList);
		modelAndView.setViewName("/ShowGrade.jsp");
		
		return modelAndView;
	}
	
	
	
	//鏄剧ず淇敼椤甸潰
	//@RequestParam 涓殑required涓烘槸鍚﹀繀椤讳紶鍏ュ弬鏁�,requestParam 閫傚悎浼犺緭绠�鍗曠被鍨嬶紝濡俰nt String float double 甯冨皵
	@RequestMapping("showUpdateGrade.action")
	public ModelAndView showUpdateGrade(@RequestParam(value="gno",required=true) int gno) throws Exception {
		
		Grade grade = gradeServiceImpl.selectGradeByGno(gno);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("Grade",grade);
		modelAndView.setViewName("/UpdateGrade.jsp");
		
		return modelAndView;
	}
	
	//@Validated 和BindingResult bingResult是配对出现的，顺序是固定的
	@RequestMapping(value="updateGradeById.action",method={RequestMethod.POST})
	public String updateGradeById(HttpServletRequest req,HttpServletResponse rsp,@Validated Grade grade,BindingResult bindingResult) throws Exception {
			
		
		if (bindingResult.hasErrors()) {
			// 输出错误信息
			List<ObjectError> allErrors = bindingResult.getAllErrors();
			for (ObjectError objectError : allErrors) {
				System.out.println(objectError.getDefaultMessage());
			}
			req.setAttribute("allErrors", allErrors);
			System.out.println("youcuo");
			return "forward:showUpdateGrade.action";
		}

		gradeServiceImpl.updateGradeByGno(grade);
			
		return "redirect:showGrade.action";
	}
	
	@RequestMapping("deleteGrades.action")
	public String deleteGrades(int[] gnos) throws Exception {
			
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext-dao.xml");
		GradeServiceImpl gradeServiceImpl = (GradeServiceImpl) applicationContext.getBean("gradeServiceImpl");
		
		gradeServiceImpl.deleteGrades(gnos);
			
		return "redirect:showGrade.action";
	}
	
	@RequestMapping("showGradeByName.action")
	public ModelAndView showGradeByName(GradeCustom gradeCustom) throws Exception {
				
		List<GradeCustom> gradeCustomsList = gradeServiceImpl.selectGradeByName(gradeCustom);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("gradeCustomList",gradeCustomsList);
		modelAndView.setViewName("/ShowGradeAndName.jsp");	
		return modelAndView;
	}
	

}
