package core.net.commands 
{
	import com.reyco1.multiuser.events.UserStatusEvent;
	import patterns.strategy.SimpleAlgorithm;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class AbstractNetCommand extends SimpleAlgorithm implements INetCommand
	{
		
		public function AbstractNetCommand() 
		{
			super();
			
		}
		
		/* INTERFACE core.net.commands.INetCommand */
		
		public function execute(e:UserStatusEvent):void 
		{
			
		}
		
	}

}