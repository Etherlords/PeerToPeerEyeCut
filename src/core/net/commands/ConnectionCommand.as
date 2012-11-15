package core.net.commands 
{
	import core.game.GameProcessor;
	import core.net.model.UserStatusCommandModel;
	import core.services.ServicesLocator;
	import test.TestUIMain;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class ConnectionCommand extends AbstractNetCommand 
	{
		
		private var _gameProcessor:GameProcessor;
		public function get gameProcessor():GameProcessor 
		{
			if (!_gameProcessor)
				_gameProcessor = ServicesLocator.instance.getService(GameProcessor) as GameProcessor;
			
			return _gameProcessor;
		}
		
		public function ConnectionCommand() 
		{
			super();
			
		}
		
		public function execute(data:UserStatusCommandModel):void
		{
			
			trace('connection done');
			
			//var world:GameProcessor = new GameProcessor();
			//Main.instance.addChild(new TestUIMain());
			//Status.instance.addMessage('---Вход выполнен---');
			
			gameProcessor.spawnPlayer(data.sender);
			
			
		}
		
	}

}