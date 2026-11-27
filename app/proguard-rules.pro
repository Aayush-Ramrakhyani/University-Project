# Default ProGuard rules.
# Keep Firebase model classes (Member, Member3, Member4, Member5) so that
# Realtime Database reflection-based (de)serialization keeps working if minify is enabled.
-keep class com.example.nat.Member { *; }
-keep class com.example.nat.Member3 { *; }
-keep class com.example.nat.Member4 { *; }
-keep class com.example.nat.Member5 { *; }
-keepattributes Signature
-keepattributes *Annotation*
