package AbstractFactoryWithSingleton;

public class JapaneseEdit implements EditMode {
	private JapaneseEdit(){}
	public static EditMode mode;
	public static EditMode getJapaneseEdit()
	{
		if(mode == null){
			mode = new JapaneseEdit();
		System.out.println("Singleton Japanese Edit mode has been initialized.");
			return mode;
		}
		else
		{
			System.out.println("Already created Singleton Japanese Edit mode has been returned.");
			
			return mode;
		}
	}
}
