package core.pingPong 
{
	import core.game.GameProcessor;
	import core.net.commands.AbstractNetCommand;
	import core.services.ServicesLocator;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class PingPongPlatformCommand extends AbstractNetCommand 
	{
		private var _gameProcessor:GameProcessor;
		public function get gameProcessor():GameProcessor 
		{
			if (!_gameProcessor)
				_gameProcessor = ServicesLocator.instance.getService(GameProcessor) as GameProcessor;
			
			return _gameProcessor;
		}
		
		public function PingPongPlatformCommand() 
		{
			super();
			
		}
		
		public function execute(data:PlatformCommandModel):void
		{
			//Status.instance.addMessage('platform command', data.mouseY, data.turnState);
			
			gameProcessor.movePlayer(data.sender.ident, data.mouseY);
		}
		
	}

}