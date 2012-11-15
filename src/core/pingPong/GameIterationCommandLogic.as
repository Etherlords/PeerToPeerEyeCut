package core.pingPong 
{
	import core.game.GameProcessor;
	import core.net.commands.AbstractNetCommand;
	import core.services.ServicesLocator;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class GameIterationCommandLogic extends AbstractNetCommand 
	{
		private var _gameProcessor:GameProcessor;
		public function get gameProcessor():GameProcessor 
		{
			if (!_gameProcessor)
				_gameProcessor = ServicesLocator.instance.getService(GameProcessor) as GameProcessor;
			
			return _gameProcessor;
		}
		
		public function GameIterationCommandLogic() 
		{
			super();
			
		}
		
		public function execute(data:GameIterationCommand):void
		{	
			data.phase++;
			gameProcessor.catchIteration(data);
		}
		
	}

}