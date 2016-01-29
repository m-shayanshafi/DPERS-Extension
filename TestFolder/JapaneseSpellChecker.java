package AbstractFactoryWithSingleton;

public class JapaneseSpellChecker implements SpellCheckerUtility {
	private JapaneseSpellChecker(){}
	public static SpellCheckerUtility spellCheck;
	public static SpellCheckerUtility getJapaneseSpellChecker()
	{
		if(spellCheck == null){
			spellCheck = new JapaneseSpellChecker();
		System.out.println("Singleton Japanese SpellChecker mode has been initialized.");
			return spellCheck;
		}
		else
		{
			System.out.println("Already created Singleton Japanese Spell checker mode has been returned.");
			
			return spellCheck;
		}
	}
}
