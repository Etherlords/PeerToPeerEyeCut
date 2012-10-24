package core.net.commands 
{
	import com.reyco1.multiuser.events.UserStatusEvent;
	import patterns.strategy.SimpleAlgorithm;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class UserAddCommand extends AbstractNetCommand 
	{
		
		public function UserAddCommand() 
		{
			super();
			
		}
		
		public function execute(e:UserStatusEvent):void
		{
			Status.instance.addMessage('---Пользователь вошел: ' + e.user.name+'---');
		}
		
	}

}