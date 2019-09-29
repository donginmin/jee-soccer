package com.soccer.web.serviceimps;

import java.util.List;

import com.soccer.web.daoImps.PlayerDAOImpl;
import com.soccer.web.domains.PlayerBean;
import com.soccer.web.services.PlayerService;

public class PlayerServiceImpl implements PlayerService {
	private static PlayerServiceImpl instance = new PlayerServiceImpl();
	

	public static PlayerServiceImpl getInstance() {
		return instance;
	}
	private PlayerServiceImpl() {}
	
	
	
	@Override
	public PlayerBean login(PlayerBean param) {
	
		return PlayerDAOImpl.getInstance().selectByPalyerIdSolar(param);
	}
	@Override
	public List<String> findPositions() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<PlayerBean> findByTeamIdPosition(PlayerBean param) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<PlayerBean> findByTeamIdHeightPosition(PlayerBean param) {
		// TODO Auto-generated method stub
		return null;
	}




}
