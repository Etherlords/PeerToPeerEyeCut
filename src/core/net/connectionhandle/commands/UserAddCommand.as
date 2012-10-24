package core.net.connectionhandle.commands 
{
	import com.reyco1.multiuser.events.UserStatusEvent;
	import patterns.strategy.SimpleAlgorithm;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class UserAddCommand extends SimpleAlgorithm 
	{
		
		public function UserAddCommand() 
		{
			super();
			
		}
		
		public function execute(e:UserStatusEvent):void
		{
			Status.instance.addMessage('---user added command---');
			Status.instance.addMessage('User id: ' + e.user.id, 'User address: ' + e.user.address, 'User name: ' + e.user.name);
			
		}
		
	}

}