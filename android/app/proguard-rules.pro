# The app uses ML Kit Latin text recognition. The plugin references optional
# script-specific recognizers that are not packaged by the Latin-only model.
-dontwarn com.google.mlkit.vision.text.chinese.**
-dontwarn com.google.mlkit.vision.text.devanagari.**
-dontwarn com.google.mlkit.vision.text.japanese.**
-dontwarn com.google.mlkit.vision.text.korean.**
