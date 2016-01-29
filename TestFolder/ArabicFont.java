package AbstractFactoryWithSingleton;

public class ArabicFont implements FontSelect {
	private ArabicFont(){}
	public static FontSelect font;
	public static FontSelect getArabicFont()
	{
		if(font == null){
			font = new ArabicFont();
		System.out.println("Singleton Arabic Font mode has been initialized.");
			return font;
		}
		else
		{
			System.out.println("Already created Singleton Arabic font mode has been returned.");
			return font;
		}
	}
}
