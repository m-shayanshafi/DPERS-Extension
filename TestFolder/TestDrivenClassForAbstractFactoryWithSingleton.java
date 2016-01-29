package AbstractFactoryWithSingleton;


public class TestDrivenClassForAbstractFactoryWithSingleton {
	String fontLang;
	String editLang;
	String spellCheckerLang;
	String thesaurusLang;
	
	public static void main (String args[]) throws InterruptedException, ClassNotFoundException, InstantiationException, IllegalAccessException
	{
		
		EditorConfigFacadeForSingleton("Urdu","Urdu","Urdu","Urdu");
	}
	
	public static void EditorConfigFacadeForSingleton(String fontLang, String thesaurusLang, String editLang, String spellCheckerLang) throws ClassNotFoundException, InstantiationException, IllegalAccessException, InterruptedException{
		configureEditor(fontLang, "font");
		Thread.sleep(2000);
		configureEditor(editLang, "edit");
		Thread.sleep(2000);
		configureEditor(spellCheckerLang, "spellchecker");
		Thread.sleep(2000);
		configureEditor(thesaurusLang, "thesaurus");
		Thread.sleep(2000);
	}
	public void setFontLang(String lang){
		this.fontLang = lang;
	}
	public void setEditLang(String lang){
		this.editLang = lang;
	}
	public void setthesaurusLang(String lang){
		this.thesaurusLang = lang;
	}
	public void setspellCheckerLang(String lang){
		this.spellCheckerLang = lang;
	}
	
	public static void configureEditor(String language, String configuration) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		EditorLanguages lang = setLanguage(language);
		lang.editingEnvironment(configuration);
	}
	
	private static EditorLanguages setLanguage(String language) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		System.out.println("\nUser has selected " +language+ " language.");
		String className = "AbstractFactoryWithSingleton."+language+"Language";
		Class theClass = Class.forName(className);
		EditorLanguages lang = (EditorLanguages) theClass.newInstance();
		return lang;
	}
}
