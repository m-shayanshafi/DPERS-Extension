package AbstractFactoryWithSingleton;

public class EnglishThesaurus implements ThesaurusActivate {
	private EnglishThesaurus(){}
	public static ThesaurusActivate thesaurus;
	public static ThesaurusActivate getEnglishThesaurus()
	{
		if(thesaurus == null){
			thesaurus = new EnglishThesaurus();
		System.out.println("Singleton English Thesaurus mode has been initialized.");
			return thesaurus;
		}
		else
		{
			System.out.println("Already created Singleton English Thesaurus mode has been returned.");
		
			return thesaurus;
		}
	}
}
