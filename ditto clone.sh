#!/bin/bash
echo "enter the SN of target device"
read serial
echo "your target device is $serial"
export ANDROID_SERIAL=$serial
adb uninstall com.toasttab.pos.test
cd C:\\toast/toastmobile
i=0
for i in {1 2 3 4 5}; do
    ./gradlew -PusingLeakCanary=false -PusingEspressoMocks=false -PinstrumentationRunner=com.toasttab.pos.ToastAndroidJUnitRunner connectedPreproductionDebugAndroidTest -Pandroid.testInstrumentationRunnerArguments.class=com.toasttab.pos.performance.CreateRestaurantWithDitto
    adb uninstall com.toasttab.post.test
done

echo "press any key to exit"
read end