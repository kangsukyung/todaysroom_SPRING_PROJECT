package kosta.todayroom.service;

import java.util.List;

import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.One_inquiryVO;

public interface OneInquiryService {
	public int register(One_inquiryVO vo);
	public List<One_inquiryVO> read(int pageNum, int amount , int seq);
	public int total(int seq);
}
