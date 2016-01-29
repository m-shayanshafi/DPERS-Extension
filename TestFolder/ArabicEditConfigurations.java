package AbstractFactoryWithSingleton;

public class ArabicEditConfigurations implements EditConfigurations{

	public EditMode edit() {
		return ArabicEdit.getArabicEdit();
	}

	public FontSelect font() {
		return ArabicFont.getArabicFont();
	}

	public SpellCheckerUtility spellChecker() {
		return ArabicSpellChecker.getArabicSpellChecker();
	}

	public ThesaurusActivate thesaurus() {
		return ArabicThesaurus.getArabicThesaurus();
	}

}
