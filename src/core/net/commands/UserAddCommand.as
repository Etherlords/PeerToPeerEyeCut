package core.net.commands 
{
	import core.game.GameProcessor;
	import core.net.model.UserModel;
	import core.net.model.UserStatusCommandModel;
	import core.services.ServicesLocator;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class UserAddCommand extends AbstractNetCommand 
	{
		private var _gameProcessor:GameProcessor;
		private var data:UserStatusCommandModel;
		public function get gameProcessor():GameProcessor 
		{
			if (!_gameProcessor)
				_gameProcessor = ServicesLocator.instance.getService(GameProcessor) as GameProcessor;
			
			return _gameProcessor;
		}
		
		public function UserAddCommand() 
		{
			super();
		}
		
		public function execute(data:UserStatusCommandModel):void
		{
			this.data = data;
			var t:Timer = new Timer(1000, 1);
			t.addEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
			t.start();
			
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			//Status.instance.addMessage('---Пользователь вошел: ' + data.sender.name + '---');
			
			var userModel:UserModel = data.sender;
			gameProcessor.spawnPlayer(userModel);
		}
		
		
		
	}

}