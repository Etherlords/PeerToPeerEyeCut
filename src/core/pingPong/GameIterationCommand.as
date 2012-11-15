package core.pingPong 
{
	import core.net.model.DataModel;
	import core.net.model.UserModel;
	/**
	 * ...
	 * @author Nikro
	 */
	public class GameIterationCommand extends DataModel
	{

		public var phase:Number = 0;
		public var step:Number = -1;
		
		public function GameIterationCommand(sender:UserModel = null) 
		{
			super(sender);
			
			
		}
		
	
	}

}