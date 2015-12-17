package AbstractFactoryWithSingleton;

public class UrduEditConfigurations implements EditConfigurations{
	public EditMode edit() {
		return UrduEdit.getUrduEdit();
	}

	public FontSelect font() {
		return UrduFont.getUrduFont();
	}

	public SpellCheckerUtility spellChecker() {
		return UrduSpellChecker.getUrduSpellChecker();
	}

	public ThesaurusActivate thesaurus() {
		return UrduThesaurus.getUrduThesaurus();
	}
}
