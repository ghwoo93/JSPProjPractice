package eltag;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.utility.CommonUtilities;
import model.BBSDao;
import model.BBSDto;
import model.MemberDTO;

public class MyTagLib {
	public static boolean isNumber(String value) {
		return CommonUtilities.isNumber(value);
	}
	
	/*
	 * 주민번호 예]123456-1234567 
	   
		0 : 1800 ~ 1899년에 태어난 여성
		1 : 1900 ~ 1999년에 태어난 남성
		2 : 1900 ~ 1999년에 태어난 여성
		3 : 2000 ~ 2099년에 태어난 남성
		4 : 2000 ~ 2099년에 태어난 여성
		5 : 1900 ~ 1999년에 태어난 외국인 남성
		6 : 1900 ~ 1999년에 태어난 외국인 여성
		7 : 2000 ~ 2099년에 태어난 외국인 남성
		8 : 2000 ~ 2099년에 태어난 외국인 여성	
	 */
	public static String getGender(String str) {
		int flag =Integer.parseInt(str.split("-")[1].substring(0, 1));
		switch (flag) {
			case 0:
			case 2:
			case 4: return "여성입니다";
			case 1:
			case 3:
			case 9: return "남성입니다";
			case 5:
			case 7: return "외국인 남성입니다";
			case 6:
			case 8: return "외국인 여성입니다";
			default: return "유효하지 않은 주민번호입니다.";
		}
	}
	
	public static List<BBSDto> selectList(
			ServletContext context,String start,String end){
		BBSDao dao = new BBSDao(context, "JSP", "JSP");
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", start);
		map.put("end", end);
		return dao.selectBBSList(map);
	}
}
