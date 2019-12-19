package com.movify.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movify.dao.IReplayDao;
import com.movify.service.IReplayService;
@Service
public class ReplayServiceImpl implements IReplayService {
	
	@Autowired
	private IReplayDao ird;
	
	@Override
	public List<Map<String, Object>> getReplay(int bid) {
		// TODO Auto-generated method stub
		return ird.getReplay(bid);
	}

	@Override
	public Map<String,Object> getReplayCount(int bid) {
		// TODO Auto-generated method stub
		return ird.getReplayCount(bid);
	}

	@Override
	public int addReplay(int uid, int bid, String content) {
		// TODO Auto-generated method stub
		return ird.addReplay(uid,bid,content);
	}

	@Override
	public List<Map<String, Object>> getSonReplay(int bid, int rpfid) {
		// TODO Auto-generated method stub
		return ird.getSonReplay(bid,rpfid);
	}

	@Override
	public int addSonReplay(int bid, int rpfid, String rpcontent, int uid) {
		// TODO Auto-generated method stub
		return ird.addSonReplay(bid,rpfid,rpcontent,uid);
	}

}
