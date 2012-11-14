package core.game 
{
	import core.game.events.PlayerEvent;
	import core.game.model.PlayerModel;
	import core.net.ConnectionManager;
	import core.net.model.UserModel;
	import core.pingPong.PlatformRemoteController;
	import core.services.AbstractService;
	import core.services.ServicesLocator;
	/**
	 * ...
	 * @author Nikro
	 */
	public class GameProcessor extends AbstractService
	{
		private var connectionService:ConnectionManager;
		private var usersList:Vector.<PlayerModel> = new Vector.<PlayerModel>;
		private var platformController:PlatformRemoteController;
		private var step:int = 0;
		
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
			//usersList = 
			
			platformController = new PlatformRemoteController();
			
			
		}
		
		public function moveMe(y:Number):void
		{
			if(usersList.length == 0)
				return;
				
			connectionService = ServicesLocator.instance.getService(ConnectionManager) as ConnectionManager;
			
			
			if(usersList[0])
				usersList[0].y = y;
				
			platformController.onMouseMove(y)
			
			//connectionService.send( { event:'PlayerMove', user:usersList[0].userData.ident, x:x, y:y } );
		}
		
		public function gameIteration():void
		{
			step++;
			//Status.instance.addMessage('step', step);
			platformController.sendData();
		}
		
		public function movePlayer(user:String, y:Number):void
		{
			//Status.instance.addMessage('move player');
			for (var i:int = 0; i < usersList.length; i++)
			{
				if (usersList[i].userData.ident == user)
				{
					usersList[i].x = 500;
					usersList[i].y = y;
					break;
				}
			}
			
			gameIteration();
			
		}
		
		public function spawnPlayer(user:UserModel):void
		{
			
			var isAponen:Boolean = usersList.length > 0;
			
			var player:PlayerModel = new PlayerModel(user);
			usersList.push(player);
			
			dispatchEvent(new PlayerEvent(PlayerEvent.PLAYER_SPAWN_EVENT, player));
			
			if (isAponen)
			{
				gameIteration();
			}
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