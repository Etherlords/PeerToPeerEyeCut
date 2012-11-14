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
		private var gameProcessor:GameProcessor = ServicesLocator.instance.getService(GameProcessor) as GameProcessor;
		
		public function PingPongPlatformCommand() 
		{
			super();
			
		}
		
		public function execute(data:PlatformCommandModel):void
		{
			trace('platform command', data.mouseY, data.turnState);
			
			gameProcessor.movePlayer(data.sender.ident, data.mouseY);
		}
		
	}

}