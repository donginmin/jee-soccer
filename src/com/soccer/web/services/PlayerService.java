package com.soccer.web.services;
import java.util.List;
import com.soccer.web.domains.PlayerBean;

public interface PlayerService {
	public PlayerBean login(PlayerBean param);
	public List<String> findPositions();
	public List<PlayerBean> findByTeamIdPosition(PlayerBean param);
	public List<PlayerBean> findByTeamIdHeightPosition(PlayerBean param);

}
	