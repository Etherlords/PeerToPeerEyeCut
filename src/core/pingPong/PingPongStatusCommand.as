package core.pingPong 
{
	import core.game.GameProcessor;
	import core.net.commands.AbstractNetCommand;
	import core.services.ServicesLocator;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class PingPongStatusCommand extends AbstractNetCommand 
	{
		private var gameProcessor:GameProcessor = ServicesLocator.instance.getService(GameProcessor) as GameProcessor;
		
		public function PingPongStatusCommand() 
		{
			super();
			
		}
		
		public function execute(data:PingPongStatusCommandModel):void
		{	
			gameProcessor.movePlayer(data.sender.ident, data.mouseY);
		}
		
	}

}