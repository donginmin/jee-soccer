package com.soccer.web.daos;

import java.util.List;

import com.soccer.web.domains.PlayerBean;

public interface PlayerDAO {
	
	public PlayerBean selectByPalyerIdSolar(PlayerBean param);		

	public List<String> selectPositions();

	public List<PlayerBean> selectByTeamIdPosition(PlayerBean param);

	public List<PlayerBean> selectByTeamIdHeightPosition(PlayerBean param);

}
