package core.net.commands 
{
	import core.game.GameProcessor;
	import core.net.model.UserStatusCommandModel;
	import core.services.ServicesLocator;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class ConnectionCommand extends AbstractNetCommand 
	{
		
		private var gameProcessor:GameProcessor = ServicesLocator.instance.getService(GameProcessor) as GameProcessor;
		
		public function ConnectionCommand() 
		{
			super();
			
		}
		
		public function execute(data:UserStatusCommandModel):void
		{
			Status.instance.addMessage('---Вход выполнен---');
			
			gameProcessor.spawnPlayer(data.sender);
		}
		
	}

}