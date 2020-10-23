package com.springriders.perfume.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.springriders.perfume.CommonUtils;
import com.springriders.perfume.Const;
import com.springriders.perfume.FileUtils;
import com.springriders.perfume.SecurityUtils;
import com.springriders.perfume.common.CommonMapper;
import com.springriders.perfume.common.model.BrandCodeVO;
import com.springriders.perfume.common.model.NoteCodeVO;
import com.springriders.perfume.common.model.PerfumeVO;
import com.springriders.perfume.common.model.PerfumeDMI;
import com.springriders.perfume.user.model.UserPARAM;
import com.springriders.perfume.user.model.UserVO;

@Service
public class UserService {
	
	@Autowired
	private CommonMapper cMapper;
	
	@Autowired
	private UserMapper mapper;

	public int join(MultipartHttpServletRequest mReq, UserPARAM param) {
		
		MultipartFile mf = mReq.getFile("file");
		
		String path = "/resources/img/profileImg/";
		String realPath = mReq.getServletContext().getRealPath(path);
		String saveFileNm = FileUtils.saveFile(realPath, mf);
		
		System.out.println(saveFileNm);
	
		if(saveFileNm == null) {
			saveFileNm = "default_img.jpg";
			param.setProfile_img(saveFileNm);
		} else {
			param.setProfile_img(saveFileNm);			
		}
		
		String pw = param.getUser_pw();
		String salt = SecurityUtils.generateSalt();
		String cryptPw = SecurityUtils.getEncrypt(pw, salt);
		
		param.setSalt(salt);
		param.setUser_pw(cryptPw);
		
		String[] strUserNote = mReq.getParameterValues("nt_m_c");
	
		mapper.insUser(param);
		
		param = mapper.selUserPk(param);
		param.setI_user(param.getI_user());
		System.out.println("i_user : " + param.getI_user());
		
		if(mReq.getParameter("nt_m_c") != null) {
			
			for(String strUserNotes : strUserNote) {
				int nt_m_c = CommonUtils.parseStringToInt(strUserNotes);
				param.setNt_m_c(nt_m_c);
				
				mapper.insUserNote(param);	
			}
		}
		return Const.SUCCESS;
	}

	public int login(UserVO param) {
		if(param.getUser_id().equals("")) { return Const.EMPTY_ID; }
		if(param.getUser_id().equals("")) { return Const.NO_ID; }
		
		UserVO dbUser = mapper.selUser(param);
		if(dbUser == null) {
			return Const.NO_ID;
		}
		
		String cryptPw = SecurityUtils.getEncrypt(param.getUser_pw(), dbUser.getSalt());
		
		if(!cryptPw.equals(dbUser.getUser_pw())) {
			return Const.NO_PW;
		}
			param.setUser_type(dbUser.getUser_type());
			param.setI_user(dbUser.getI_user());
			param.setUser_pw(null);
			param.setNm(dbUser.getNm());
			param.setProfile_img(dbUser.getProfile_img());
			param.setBd(dbUser.getBd());
			return Const.SUCCESS;
	}
	
	public int changeAuth(UserPARAM param) {
		mapper.changeAuth(param);
		
		return Const.SUCCESS;
	}
	
	public List<UserVO> selUserList() {
		UserVO p = new UserVO();
		return mapper.selUserList(p);
	}
	
	public List<UserVO> selAdminList() {
		UserVO p = new UserVO();
		return mapper.selAdminList(p);
	}
	
	public List<BrandCodeVO> selBrandList() {
		BrandCodeVO p = new BrandCodeVO();
		return cMapper.selBrandCodeList(p);
	}
	
	public List<NoteCodeVO> selNoteList() {
		NoteCodeVO p = new NoteCodeVO();
		return cMapper.selNoteCodeList(p);
	}
	
	public int insPerfume(MultipartHttpServletRequest mReq) {
		int p_price = Integer.parseInt(mReq.getParameter("p_price"));	
		int p_size = Integer.parseInt(mReq.getParameter("p_size"));
		int p_brand = CommonUtils.parseStringToInt(mReq.getParameter("p_brand"));
		String p_nm = mReq.getParameter("p_nm");
		
		//사진 추가하기
		MultipartFile mf = mReq.getFile("p_pic");
		
		String path = "/resources/img/perfume/";
		String realPath = mReq.getServletContext().getRealPath(path);
		String saveFileNm = FileUtils.saveFile(realPath, mf);

		PerfumeVO vo = new PerfumeVO();
		vo.setP_price(p_price);
		vo.setP_size(p_size);
		vo.setP_brand(p_brand);
		vo.setP_nm(p_nm);
		vo.setP_pic(saveFileNm);

		cMapper.insPerfume(vo);
		vo = cMapper.selPerfumePk(vo);
		int i_p = vo.getI_p();
		
		String[] strP_notes = mReq.getParameterValues("p_note");

		for(String strP_note : strP_notes) {
			NoteCodeVO noteVo = new NoteCodeVO();
			int p_note = CommonUtils.parseStringToInt(strP_note);
			
			noteVo.setI_p(i_p);
			noteVo.setNt_d_c(p_note);
			
			cMapper.insPerfumeNote(noteVo);
		}
		return Const.SUCCESS;
	}
	
	public int uptUser(MultipartHttpServletRequest mReq, HttpSession hs) {
		int i_user = SecurityUtils.getLoginUserPk(hs);
		String user_pw = mReq.getParameter("user_pw");
		System.out.println("user_pw : " + user_pw);
		String salt = SecurityUtils.generateSalt();
		String nm = mReq.getParameter("nm");
		System.out.println("nm : " + nm);
		String cryptPw = SecurityUtils.getEncrypt(user_pw, salt);
		
		MultipartFile mf = mReq.getFile("profile_pic");
		
		String path = "/resources/img/profileImg/";
		String realPath = mReq.getServletContext().getRealPath(path);
		String saveFileNm = FileUtils.saveFile(realPath, mf);
		System.out.println("saveFileNm : " + saveFileNm);
		
		UserVO vo = new UserVO();
		vo.setI_user(i_user);
		if(!user_pw.equals("")) {
			vo.setUser_pw(cryptPw);
			vo.setSalt(salt);			
		}
		if(!nm.equals("")) {
			vo.setNm(nm);			
		}
		if(saveFileNm != null) {
			vo.setProfile_img(saveFileNm);			
		}
		
		mapper.uptUser(vo);
		vo = mapper.selUser(vo);
		hs.setAttribute(Const.LOGIN_USER, vo);
		
		return Const.SUCCESS;
	}
	
	public List<PerfumeDMI> selFavoriteList(UserPARAM param) {	
		List<PerfumeDMI> list = mapper.selFavoriteList(param);
	
		return list;
	}
	
	
//	나중에 auth기능 구현해보기
	
//	private boolean _authFail(int i_rest, int i_user) {
//		RestPARAM param = new RestPARAM();
//		param.setI_rest(i_rest);		
//		int dbI_user = mapper.selRestChkUser(i_rest);
//		if(i_user != dbI_user) {
//			return true;
//		}		
//		return false;
//	}

}