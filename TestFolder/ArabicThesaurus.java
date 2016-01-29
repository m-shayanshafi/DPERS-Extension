package AbstractFactoryWithSingleton;

public class ArabicThesaurus implements ThesaurusActivate {
	private ArabicThesaurus(){}
	public static ThesaurusActivate thesaurus;
	public static ThesaurusActivate getArabicThesaurus()
	{
		if(thesaurus == null){
			thesaurus = new ArabicThesaurus();
		System.out.println("Singleton Arabic Thesaurus mode has been initialized.");
			return thesaurus;
		}
		else
		{
			System.out.println("Already created Singleton Arabic Thesaurus mode has been returned.");
			
			return thesaurus;
		}
	}
}
