package trinket

import (
    "android/soong/android"
)

func init() {
    android.RegisterModuleType("motorola_trinket_init_library_static", initLibraryFactory)
}
