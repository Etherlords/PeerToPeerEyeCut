package core.game.model 
{
	import core.net.model.UserModel;
	/**
	 * ...
	 * @author Nikro
	 */
	public class PlayerModel extends InteractiveObjectModel 
	{
		private var _userData:UserModel;
		
		public function PlayerModel(userData:UserModel) 
		{
			super();
			_userData = userData;	
		}
		
		public function get userData():UserModel 
		{
			return _userData;
		}
		
	}

}