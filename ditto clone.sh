#!/bin/bash
echo "enter the SN of target device"
read serial
echo "your target device is $serial"
echo "how many restaurants do you need?"
read i
export ANDROID_SERIAL=$serial
adb uninstall com.toasttab.pos.test
cd C:\\toast/toastmobile
echo $i
while [ $i -gt 0 ]
do
    ./gradlew -PusingLeakCanary=false -PusingEspressoMocks=false -PinstrumentationRunner=com.toasttab.pos.ToastAndroidJUnitRunner connectedPreproductionDebugAndroidTest -Pandroid.testInstrumentationRunnerArguments.class=com.toasttab.pos.performance.CreateRestaurantWithDitto 
    adb uninstall com.toasttab.post.test
    echo $i
    let "i-=1"
done
echo "press any key to exit"
read end