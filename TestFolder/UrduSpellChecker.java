package AbstractFactoryWithSingleton;

public class UrduSpellChecker implements SpellCheckerUtility {
	private UrduSpellChecker(){}
	public static SpellCheckerUtility spellCheck;
	public static SpellCheckerUtility getUrduSpellChecker()
	{
		if(spellCheck == null){
			spellCheck = new UrduSpellChecker();
		System.out.println("Singleton Urdu SpellChecker mode has been initialized.");
			return spellCheck;
		}
		else
		{
			System.out.println("Already created Singleton Urdu Spell checker mode has been returned.");
			
			return spellCheck;
		}
	}
}
