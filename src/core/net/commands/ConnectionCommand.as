package core.net.commands 
{
	import com.reyco1.multiuser.events.UserStatusEvent;
	import patterns.strategy.SimpleAlgorithm;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class ConnectionCommand extends AbstractNetCommand 
	{
		
		public function ConnectionCommand() 
		{
			super();
			
		}
		
		public function execute(e:UserStatusEvent):void 
		{
			
			Status.instance.addMessage('---Вход выполнен---');
		}
	}

}