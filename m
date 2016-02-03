From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: [PATCH v2 2/3] selftest/gpio: add gpio test case
Date: Wed,  3 Feb 2016 20:14:35 +0800
Message-ID: <1454501676-19900-3-git-send-email-bamvor.zhangjian@linaro.org>
References: <1454501676-19900-1-git-send-email-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:36546 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754496AbcBCMPJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2016 07:15:09 -0500
Received: by mail-pa0-f45.google.com with SMTP id yy13so12754365pab.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Feb 2016 04:15:08 -0800 (PST)
In-Reply-To: <1454501676-19900-1-git-send-email-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

This test script try to do whitebox testing for gpio subsystem(
based on gpiolib). It manipulate gpio-mockup device through sysfs
or char device and check the result from debugfs.

Test the following things:
1.  Add single, multi gpiochip with the checking of overlap.
2.  Test direction and output value for valid pin.
3.  Test dynamic allocation of gpio base.

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 tools/testing/selftests/Makefile                  |   1 +
 tools/testing/selftests/gpio/Makefile             |  10 ++
 tools/testing/selftests/gpio/gpio-mockup-sysfs.sh | 117 +++++++++++++
 tools/testing/selftests/gpio/gpio-mockup.sh       | 198 ++++++++++++++++++++++
 4 files changed, 326 insertions(+)
 create mode 100644 tools/testing/selftests/gpio/Makefile
 create mode 100644 tools/testing/selftests/gpio/gpio-mockup-sysfs.sh
 create mode 100755 tools/testing/selftests/gpio/gpio-mockup.sh

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index c8edff6..27eba31 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -5,6 +5,7 @@ TARGETS += exec
 TARGETS += firmware
 TARGETS += ftrace
 TARGETS += futex
+TARGETS += gpio
 TARGETS += kcmp
 TARGETS += lib
 TARGETS += membarrier
diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
new file mode 100644
index 0000000..0689481
--- /dev/null
+++ b/tools/testing/selftests/gpio/Makefile
@@ -0,0 +1,10 @@
+
+all:
+
+TEST_PROGS := gpio-mockup.sh
+TEST_FILES := gpio-mockup-sysfs.sh
+
+include ../lib.mk
+
+clean:
+
diff --git a/tools/testing/selftests/gpio/gpio-mockup-sysfs.sh b/tools/testing/selftests/gpio/gpio-mockup-sysfs.sh
new file mode 100644
index 0000000..06831f8
--- /dev/null
+++ b/tools/testing/selftests/gpio/gpio-mockup-sysfs.sh
@@ -0,0 +1,117 @@
+
+is_consistent()
+{
+	val=
+
+	active_low_sysfs=`cat $GPIO_SYSFS/gpio$nr/active_low`
+	val_sysfs=`cat $GPIO_SYSFS/gpio$nr/value`
+	dir_sysfs=`cat $GPIO_SYSFS/gpio$nr/direction`
+
+	gpio_this_debugfs=`cat $GPIO_DEBUGFS |grep "gpio-$nr" | sed "s/(.*)//g"`
+	dir_debugfs=`echo $gpio_this_debugfs | awk '{print $2}'`
+	val_debugfs=`echo $gpio_this_debugfs | awk '{print $3}'`
+	if [ $val_debugfs = "lo" ]; then
+		val=0
+	elif [ $val_debugfs = "hi" ]; then
+		val=1
+	fi
+
+	if [ $active_low_sysfs = "1" ]; then
+		if [ $val = "0" ]; then
+			val="1"
+		else
+			val="0"
+		fi
+	fi
+
+	if [ $val_sysfs = $val ] && [ $dir_sysfs = $dir_debugfs ]; then
+		echo -n "."
+	else
+		echo "test fail, exit"
+		die
+	fi
+}
+
+test_pin_logic()
+{
+	nr=$1
+	direction=$2
+	active_low=$3
+	value=$4
+
+	echo $direction > $GPIO_SYSFS/gpio$nr/direction
+	echo $active_low > $GPIO_SYSFS/gpio$nr/active_low
+	if [ $direction = "out" ]; then
+		echo $value > $GPIO_SYSFS/gpio$nr/value
+	fi
+	is_consistent $nr
+}
+
+test_one_pin()
+{
+	nr=$1
+
+	echo -n "test pin<$nr>"
+
+	echo $nr > $GPIO_SYSFS/export 2>/dev/null
+
+	if [ X$? != X0 ]; then
+		echo "test GPIO pin $nr failed"
+		die
+	fi
+
+	#"Checking if the sysfs is consistent with debugfs: "
+	is_consistent $nr
+
+	#"Checking the logic of active_low: "
+	test_pin_logic $nr out 1 1
+	test_pin_logic $nr out 1 0
+	test_pin_logic $nr out 0 1
+	test_pin_logic $nr out 0 0
+
+	#"Checking the logic of direction: "
+	test_pin_logic $nr in 1 1
+	test_pin_logic $nr out 1 0
+	test_pin_logic $nr low 0 1
+	test_pin_logic $nr high 0 0
+
+	echo $nr > $GPIO_SYSFS/unexport
+
+	echo "successful"
+}
+
+test_one_pin_fail()
+{
+	nr=$1
+
+	echo $nr > $GPIO_SYSFS/export 2>/dev/null
+
+	if [ X$? != X0 ]; then
+		echo "test invalid pin $nr successful"
+	else
+		echo "test invalid pin $nr failed"
+		echo $nr > $GPIO_SYSFS/unexport 2>/dev/null
+		die
+	fi
+}
+
+list_chip_sysfs()
+{
+	echo `ls -d $GPIO_DRV_SYSFS/gpiochip* 2>/dev/null`
+}
+
+test_chip_sysfs()
+{
+	chip=$1
+	name=`basename $chip`
+	base=`cat $chip/base`
+	ngpio=`cat $chip/ngpio`
+	printf "%-10s %-5s %-5s\n" $name $base $ngpio
+	if [ $ngpio = "0" ]; then
+		echo "number of gpio is zero is not allowed".
+	fi
+	test_one_pin $base
+	test_one_pin $(($base + $ngpio - 1))
+	test_one_pin $((( RANDOM % $ngpio )  + $base ))
+}
+
diff --git a/tools/testing/selftests/gpio/gpio-mockup.sh b/tools/testing/selftests/gpio/gpio-mockup.sh
new file mode 100755
index 0000000..327ca73
--- /dev/null
+++ b/tools/testing/selftests/gpio/gpio-mockup.sh
@@ -0,0 +1,198 @@
+#!/bin/bash
+
+#exit status
+#1: run as non-root user
+#2: sysfs/debugfs not mount
+#3: insert module fail when gpio-mockup is a module.
+#4: other reason.
+
+SYSFS=
+GPIO_SYSFS=
+GPIO_DRV_SYSFS=
+DEBUGFS=
+GPIO_DEBUGFS=
+dev_type=
+module=
+
+usage()
+{
+	echo "Usage:"
+	echo "$0 [-f] [-m name] [-t type]"
+	echo "-f:  full test. It maybe conflict with existence gpio device."
+	echo "-m:  module name, default name is gpio-mockup. It could alse test"
+	echo "     other gpio device."
+	echo "-t:  interface type: sysfs or char device. The latter one is not"
+	echo "     upstreamed."
+	echo ""
+	echo "$0 -h"
+	echo "This usage"
+}
+
+prerequisite()
+{
+	msg="skip all tests:"
+	if [ $UID != 0 ]; then
+		echo $msg must be run as root >&2
+		exit 1
+	fi
+	SYSFS=`mount -t sysfs | head -1 | awk '{ print $3 }'`
+	if [ ! -d "$SYSFS" ]; then
+		echo $msg sysfs is not mounted >&2
+		exit 2
+	fi
+	GPIO_SYSFS=`echo $SYSFS/class/gpio`
+	GPIO_DRV_SYSFS=`echo $SYSFS/devices/platform/$module/gpio`
+	DEBUGFS=`mount -t debugfs | head -1 | awk '{ print $3 }'`
+	if [ ! -d "$DEBUGFS" ]; then
+		echo $msg debugfs is not mounted >&2
+		exit 2
+	fi
+	GPIO_DEBUGFS=`echo $DEBUGFS/gpio`
+	source gpio-mockup-sysfs.sh
+}
+
+try_insert_module()
+{
+	if [ -d "$GPIO_DRV_SYSFS" ]; then
+		echo "$GPIO_DRV_SYSFS exist. Skip insert module"
+	else
+		modprobe -q $module $1
+		if [ X$? != X0 ]; then
+			echo $msg insmod $module failed >&2
+			exit 3
+		fi
+	fi
+}
+
+remove_module()
+{
+	modprobe -r -q $module
+}
+
+die()
+{
+	remove_module
+	exit 4
+}
+
+list_chip()
+{
+	name=$1
+	if [ X$dev_type = Xsysfs ]; then
+		gc=`list_chip_sysfs $name`
+	else
+		#FIXME: gpio chardev could not check for specific gpio driver.
+		gc=`lsgpio 2>/dev/null`
+	fi
+	echo $gc
+}
+
+test_chip()
+{
+	if [ X$dev_type = Xsysfs ]; then
+		test_chip_sysfs $*
+	fi
+}
+
+gpio_test()
+{
+	param=$1
+	valid=$2
+
+	if [ X"$param" = X ]; then
+		die
+	fi
+	try_insert_module "gpio_mockup_ranges=$param"
+	echo -n "GPIO $module test with ranges: <"
+	echo "$param>: "
+	printf "%-10s %s\n" $param
+	gpiochip=`list_chip $module`
+	if [ X"$gpiochip" = X ]; then
+		if [ X"$valid" = Xfalse ]; then
+			echo "successful"
+		else
+			echo "fail"
+			die
+		fi
+	else
+		for chip in $gpiochip; do
+			test_chip $chip
+		done
+	fi
+	remove_module
+}
+
+while getopts fhm:t: opt; do
+	case $opt in
+	f)
+		full_test=true
+		;;
+	h)
+		usage
+		exit
+		;;
+	m)
+		module=$OPTARG
+		;;
+	t)
+		dev_type=$OPTARG
+		;;
+	esac done
+
+if [ X"$module" = X ]; then
+	module="gpio-mockup"
+fi
+
+#TODO: force to chardev after it upstream
+if [ X"$dev_type" = X ] || [ X"$dev_type" != Xsysfs ] \
+	   || [ X"$dev_type" = Xchardev ]; then
+	dev_type="sysfs"
+fi
+
+prerequisite
+
+echo "1.  Test dynamic allocation of gpio successful means insert gpiochip and"
+echo "    manipulate gpio pin successful"
+gpio_test "-1,32" true
+gpio_test "-1,32,-1,32" true
+gpio_test "-1,32,-1,32,-1,32" true
+if [ X$full_test = Xtrue ]; then
+	gpio_test "-1,32,32,64" true
+	gpio_test "-1,32,40,64,-1,5" true
+	gpio_test "-1,32,32,64,-1,32" true
+	gpio_test "0,32,32,64,-1,32,-1,32" true
+	echo "2.  Do basic test: successful means insert gpiochip and manipulate"
+	echo "    gpio pin successful"
+	gpio_test "0,32" true
+	gpio_test "0,32,32,64" true
+	gpio_test "0,32,40,64,64,96" true
+fi
+echo "3.  Error test: successful means insert gpiochip failed"
+echo "3.1 Test number of gpio overflow"
+#Currently: The max number of gpio(1024) is defined in arm architecture.
+gpio_test "-1,32,-1,1024" false
+if [ X$full_test = Xtrue ]; then
+	echo "3.2 Test zero line of gpio"
+	gpio_test "0,0" false
+	echo "3.3 Test range overlap"
+	echo "3.3.1 Test corner case"
+	gpio_test "0,32,0,1" false
+	gpio_test "0,32,32,64,32,40" false
+	gpio_test "0,32,35,64,35,45" false
+	gpio_test "0,32,31,32" false
+	gpio_test "0,32,32,64,36,37" false
+	gpio_test "0,32,35,64,34,36" false
+	echo "3.3.2 Test inserting invalid second gpiochip"
+	gpio_test "0,32,30,35" false
+	gpio_test "0,32,1,5" false
+	gpio_test "10,32,9,14" false
+	gpio_test "10,32,30,35" false
+	echo "3.3.3 Test others"
+	gpio_test "0,32,40,56,39,45" false
+	gpio_test "0,32,40,56,30,33" false
+	gpio_test "0,32,40,56,30,41" false
+	gpio_test "0,32,40,56,20,21" false
+fi
+
+echo GPIO test PASS
+
-- 
2.1.4

