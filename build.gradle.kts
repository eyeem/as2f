plugins {
    base
    kotlin("jvm") version Versions.kotlinVersion apply false
}

allprojects {

    group = "dev.vishna.as2f"
    version = "4ccb8fa"

    repositories {
        mavenCentral()
        maven("https://jitpack.io")
        jcenter()
    }
}

dependencies {
    // Make the root project archives configuration depend on every sub-project
    subprojects.forEach {
        archives(it)
    }
}
