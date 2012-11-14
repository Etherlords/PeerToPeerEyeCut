package core.pingPong 
{
	import core.net.model.DataModel;
	import core.net.model.UserModel;
	/**
	 * ...
	 * @author Nikro
	 */
	public class PingPongStatusCommandModel extends DataModel
	{
		
		public static const RAUND_OVER:uint = 1;
		public static const RAUND_WAIT_FOR_START:uint = 0;
		public static const RAUND_IN_PROGRESS:uint = 2;
		
		public var status:uint = 0;
		
		public function PingPongStatusCommandModel(sender:UserModel = null) 
		{
			super(sender);
			
			
		}
		
	}

}