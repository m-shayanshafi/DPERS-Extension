package AbstractFactoryWithSingleton;

public class UrduThesaurus implements ThesaurusActivate {
	private UrduThesaurus(){}
	public static ThesaurusActivate thesaurus;
	public static ThesaurusActivate getUrduThesaurus()
	{
		if(thesaurus == null){
			thesaurus = new UrduThesaurus();
		System.out.println("Singleton Urdu Thesaurus mode has been initialized.");
			return thesaurus;
		}
		else
		{
			System.out.println("Already created Singleton Urdu Thesaurus mode has been returned.");
			
			return thesaurus;
		}
	}
}
