package core.game.events 
{
	import core.game.model.PlayerModel;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class PlayerEvent extends Event 
	{
		private var _playerModel:PlayerModel;
		public static const PLAYER_SPAWN_EVENT:String = 'PLAYER_SPAWN_EVENT';
		
		public function PlayerEvent(type:String, playerModel:PlayerModel, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			_playerModel = playerModel;
			
		}
		
		override public function clone():Event 
		{
			return new PlayerEvent(type, _playerModel, bubbles, cancelable);
		}
		
		public function get playerModel():PlayerModel 
		{
			return _playerModel;
		}
		
	}

}