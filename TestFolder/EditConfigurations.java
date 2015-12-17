package AbstractFactoryWithSingleton;

public interface EditConfigurations {
	public EditMode edit();
	public FontSelect font();
	public SpellCheckerUtility spellChecker();
	public ThesaurusActivate thesaurus();
}
