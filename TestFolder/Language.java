package AbstractFactoryWithSingleton;

public abstract class Language {
	String configuration;
	
	public void setConfiguration(String configuration) {
		this.configuration = configuration;
		System.out.println("Setting " + this.configuration);
	}
	
}
