package AbstractFactoryWithSingleton;

public class EnglishFont implements FontSelect {
	private EnglishFont(){}
	public static FontSelect font;
	public static FontSelect getEnglishFont()
	{
		if(font == null){
			font = new EnglishFont();
		System.out.println("Singleton English Font mode has been initialized.");
			return font;
		}
		else
		{
			System.out.println("Already created Singleton English font mode has been returned.");
			
			return font;
		}
	}
}
