package patterns.events 
{
	import flash.events.Event;
	import patterns.strategy.StrategyController;
	/**
	 * Solve event handle and redirect it to specifig strategy with a event type as token
	 * @author Nikro
	 */
	public class StrategyControllerEventSolver extends AbstractEventSolver 
	{
		
		
		public function StrategyControllerEventSolver(strategyController:StrategyController) 
		{
			super(strategyController);
			
			initilize();
		}	
		
		private function initilize():void 
		{
			solver = solveFunction
		}
		
		private function solveFunction(e:Event):void
		{
			var key:String = /*getQualifiedClassName(e) + */e.type;
			strategyController.execute(key, e);
		}
		
	}

}