package AbstractFactoryWithSingleton;

public class EnglishEdit implements EditMode {
	private EnglishEdit(){}
	public static EditMode mode;
	public static EditMode getEnglishEdit()
	{
		if(mode == null){
			mode = new EnglishEdit();
		System.out.println("Singleton English Edit mode has been initialized.");
			return mode;
		}
		else
		{
			System.out.println("Already created Singleton English Edit mode has been returned.");
			
			return mode;
		}
	}
}
