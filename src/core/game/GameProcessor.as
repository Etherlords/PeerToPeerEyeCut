package core.game 
{
	import core.game.events.PlayerEvent;
	import core.game.model.PlayerModel;
	import core.locators.PhysicWorldLocator;
	import core.net.ConnectionManager;
	import core.net.model.UserModel;
	import core.pingPong.GameIterationCommand;
	import core.pingPong.PlatformCommandModel;
	import core.pingPong.PlatformRemoteController;
	import core.services.AbstractService;
	import core.services.ServicesLocator;
	import pingPong.logic.PingPong;
	import pingPong.logic.RemotePlatformController;
	/**
	 * ...
	 * @author Nikro
	 */
	public class GameProcessor extends AbstractService
	{
		private var _connectionService:ConnectionManager;
		private var usersList:Vector.<PlayerModel> = new Vector.<PlayerModel>;
		public var platformController:PlatformRemoteController;
		private var step:int = 0;
		private var platform:RemotePlatformController;
		public var isAponen:Boolean;
		public var pingPongController:PingPong;
		
		public function GameProcessor() 
		{
			initilize();
		}
		
		override public function registred(serviceLocator:ServicesLocator):void 
		{
			super.registred(serviceLocator);
			
			
		}
		
		public function startRaund():void
		{
			pingPongController.startRaund(false);
		}
		
		public function setPlatformView(platform:RemotePlatformController):void
		{
			this.platform = platform;
		}
		
		private function initilize():void 
		{
			platformController = new PlatformRemoteController()
		}
		
		public function moveMe(y:Number):void
		{
			if(usersList.length == 0)
				return;
				
			
			
			
			if(usersList[0])
				usersList[0].y = y;
				
			platformController.onMouseMove(y)
		}
		
		public function gameIteration(otherStep:Number):void
		{
			//for (var i:int = step; i < otherStep; i++)
			//{
				
			//}
			
			var step:Number = pingPongController.step;
			
			if (step == otherStep)
			{
				//pingPongController.gameStep(1)
				//step++;
			}
			else if(otherStep > step)
			{
				pingPongController.gameStep(otherStep - step + 1)
				//step = otherStep;
			}
			
			platformController.sendData();
			sendIterationEvent();
		}
		
		public function movePlayer(data:PlatformCommandModel):void
		{
			/*//Status.instance.addMessage('move player');
			for (var i:int = 0; i < usersList.length; i++)
			{
				if (usersList[i].userData.ident == user)
				{
					usersList[i].x = 500;
					usersList[i].y = y;
					break;
				}
			}*/
			//trace('move platform', platform, y);
			if (platform)
			{
				if (data.turnState == 0)
					platform.turnToNormal()
					
				if (data.turnState == 1)
					platform.turnPlatformRight()
					
				if (data.turnState == 2)
					platform.turnPlatformLeft()
					
				platform.setPlatformPosition(data.mouseY);
			}
				
			//gameIteration();
			
		}
		
		public function spawnPlayer(user:UserModel):void
		{
			
			isAponen = usersList.length > 0;
			
			var player:PlayerModel = new PlayerModel(user);
			usersList.push(player);
			
			dispatchEvent(new PlayerEvent(PlayerEvent.PLAYER_SPAWN_EVENT, player));
			
			if (isAponen)
			{
				sendIterationEvent();
			}
		}
		
		private var isWiatIteration:Boolean = false;
		
		private function sendIterationEvent():void 
		{
		
			//if (!isWiatIteration)
			//{
				var iterationModel:GameIterationCommand = new GameIterationCommand();
				iterationModel.step = pingPongController.step;
				connectionService.send(iterationModel);
				isWiatIteration = true;
			//}
		}
		
		public function catchIteration(iterationModel:GameIterationCommand ):void
		{
			
			
			//return
			
			//if (iterationModel.phase == 2)
			//{
			//	isWiatIteration = false;
			//	sendIterationEvent();
			//}
			//else
			//{
			//	isWiatIteration = false;
			//	sendIterationEvent();
				gameIteration(iterationModel.step);
			//}
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
		
		public function get connectionService():ConnectionManager 
		{
			if (!_connectionService)
				_connectionService = ServicesLocator.instance.getService(ConnectionManager) as ConnectionManager;
			
			return _connectionService;
		}
		
	}

}