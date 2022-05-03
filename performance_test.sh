#!/bin/bash
echo "enter the SN of target device"
read serial
echo "your target device is $serial"
echo "which test would you like to run? (default is GeneralTest)"
read script 
export ANDROID_SERIAL=$serial
adb uninstall com.toasttab.pos.test
cd C:\\toast/toastmobile
./gradlew installPreproductionDebug installPreproductionDebugAndroidTest
adb shell pm grant com.toasttab.pos android.permission.ACCESS_FINE_LOCATION
adb shell pm grant com.toasttab.pos android.permission.ACCESS_COARSE_LOCATION
adb shell pm grant com.toasttab.pos android.permission.READ_PHONE_STATE
./gradlew -PusingLeakCanary=false -PusingEspressoMocks=false -PinstrumentationRunner=com.toasttab.pos.ToastAndroidJUnitRunner connectedPreproductionDebugAndroidTest -Pandroid.testInstrumentationRunnerArguments.class=com.toasttab.pos.performance.$script