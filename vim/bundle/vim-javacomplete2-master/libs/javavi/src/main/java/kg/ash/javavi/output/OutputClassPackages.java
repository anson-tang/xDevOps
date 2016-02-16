package kg.ash.javavi.output;

import java.lang.reflect.Modifier;
import java.util.HashMap;
import kg.ash.javavi.Javavi;
import kg.ash.javavi.cache.Cache;
import kg.ash.javavi.clazz.SourceClass;
import kg.ash.javavi.readers.ClassReader;
import kg.ash.javavi.searchers.JavaClassMap;
import kg.ash.javavi.searchers.ClassSearcher;

public class OutputClassPackages {

    private HashMap<String, JavaClassMap> classPackages;
    private String sources = Javavi.system.get("sources").replace('\\', '/');

    public OutputClassPackages(HashMap<String, JavaClassMap> classPackages) {
        this.classPackages = classPackages;
    }

    public String get(String targetClass) {
        if (classPackages == null || classPackages.isEmpty()) {
            return Cache.PACKAGES_EMPTY_ERROR;
        }

        StringBuilder builder = new StringBuilder("");
        if (classPackages.containsKey(targetClass)) {
            JavaClassMap cm = classPackages.get(targetClass);
            if (cm.getType() == JavaClassMap.TYPE_CLASS) {
                cm.getSubpackages().forEach((String scope) -> {
                    if (scope.endsWith("$")) {
                        String target = scope + targetClass;
                        ClassSearcher seacher = new ClassSearcher();
                        if (seacher.find(target, sources)) {
                            ClassReader reader = seacher.getReader();
                            SourceClass clazz = reader.read(target);
                            if (clazz != null && Modifier.isStatic(clazz.getModifiers())) {
                                scope = "static " + scope;
                            }
                        }
                    }
                    builder
                        .append("'")
                        .append(scope).append(scope.endsWith("$") ? "" : ".").append(targetClass)
                        .append("',")
                        .append(Javavi.NEWLINE);
                });
            }
        }

        return String.format("[%s]", builder);
    }
    
}