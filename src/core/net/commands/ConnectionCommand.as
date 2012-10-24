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
		
		override public function execute(e:UserStatusEvent):void 
		{
			Status.instance.addMessage('---user connected command---');
			Status.instance.addMessage('User id: ' + e.user.id, 'User address: ' + e.user.address, 'User name: ' + e.user.name);
		}
	}

}