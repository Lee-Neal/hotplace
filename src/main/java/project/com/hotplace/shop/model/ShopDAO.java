package project.com.hotplace.shop.model;

import java.util.List;

public interface ShopDAO {
	public int insert(ShopVO vo);

	public int update(ShopVO vo);

	public int delete(ShopVO vo);
	
	public List<ShopVO> selectAllHome();

	public ShopVO selectOne(ShopVO vo);

	public List<ShopVO> selectAll(String searchKey, String searchWord, int pageNum);
}