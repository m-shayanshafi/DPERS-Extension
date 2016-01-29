package AbstractFactoryWithSingleton;

public class JapaneseThesaurus implements ThesaurusActivate {
	private JapaneseThesaurus(){}
	public static ThesaurusActivate thesaurus;
	public static ThesaurusActivate getJapaneseThesaurus()
	{
		if(thesaurus == null){
			thesaurus = new JapaneseThesaurus();
		System.out.println("Singleton Japanese Thesaurus mode has been initialized.");
			return thesaurus;
		}
		else
		{
			System.out.println("Already created Singleton Japenese Thesaurus mode has been returned.");
			
			return thesaurus;
		}
	}
}
