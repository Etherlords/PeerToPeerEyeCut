package core.game 
{
	import core.game.events.PlayerEvent;
	import core.game.model.PlayerModel;
	import core.net.ConnectionManager;
	import core.net.model.UserModel;
	import core.services.AbstractService;
	import core.services.ServicesLocator;
	/**
	 * ...
	 * @author Nikro
	 */
	public class GameProcessor extends AbstractService
	{
		private var connectionService:ConnectionManager;
		private var usersList:Vector.<PlayerModel>
		
		public function GameProcessor() 
		{
			initilize();
		}
		
		override public function registred(serviceLocator:ServicesLocator):void 
		{
			super.registred(serviceLocator);
		}
		
		private function initilize():void 
		{
			usersList = new Vector.<PlayerModel>;
		}
		
		public function moveMe(x:Number, y:Number):void
		{
			
			connectionService = ServicesLocator.instance.getService(ConnectionManager) as ConnectionManager;
			
			usersList[0].x = x;
			usersList[0].y = y;
			
			connectionService.send( { event:'PlayerMove', user:usersList[0].userData.ident, x:x, y:y } );
		}
		
		public function movePlayer(user:String, x:Number, y:Number):void
		{
			for (var i:int = 0; i < usersList.length; i++)
			{
				if (usersList[i].userData.ident == user)
				{
					usersList[i].x = x;
					usersList[i].y = y;
					break;
				}
			}
			
		}
		
		public function spawnPlayer(user:UserModel):void
		{
			var player:PlayerModel = new PlayerModel(user);
			usersList.push(player);
			
			dispatchEvent(new PlayerEvent(PlayerEvent.PLAYER_SPAWN_EVENT, player));
		}
		
		public function removePlayer(user:UserModel):void
		{
			for (var i:int = 0; i < usersList.length; i++)
			{
				if (usersList[i].userData.ident == user.ident)
				{
					usersList.splice(i, 1);
					break;
				}
			}
		}
		
	}

}