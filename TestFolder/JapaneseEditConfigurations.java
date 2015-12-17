package AbstractFactoryWithSingleton;

public class JapaneseEditConfigurations implements EditConfigurations{
	public EditMode edit() {
		return JapaneseEdit.getJapaneseEdit();
	}

	public FontSelect font() {
		return JapaneseFont.getJapaneseFont();
	}

	public SpellCheckerUtility spellChecker() {
		return JapaneseSpellChecker.getJapaneseSpellChecker();
	}

	public ThesaurusActivate thesaurus() {
		return JapaneseThesaurus.getJapaneseThesaurus();
	}
}
