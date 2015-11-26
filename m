From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: Re: [PATCH RFD 2/3] selftest/gpio: add gpio test case
Date: Fri, 27 Nov 2015 00:18:24 +0800
Message-ID: <565730D0.70308@linaro.org>
References: <1447491097-14799-1-git-send-email-bamvor.zhangjian@linaro.org>
 <1447491097-14799-3-git-send-email-bamvor.zhangjian@linaro.org>
 <CACRpkdbSkmhm=Q=vxydQa=-zAmmxBqhSGpXUjpW-jv3YQHJuzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:33541 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751165AbbKZQS3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Nov 2015 11:18:29 -0500
Received: by igcmv3 with SMTP id mv3so17177771igc.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2015 08:18:28 -0800 (PST)
In-Reply-To: <CACRpkdbSkmhm=Q=vxydQa=-zAmmxBqhSGpXUjpW-jv3YQHJuzA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>

Hi, Linus

On 11/26/2015 05:50 PM, Linus Walleij wrote:
> On Sat, Nov 14, 2015 at 9:51 AM, Bamvor Jian Zhang
> <bamvor.zhangjian@linaro.org> wrote:
> 
>> This test script try to do whitebox testing for gpio subsystem(
>> based on gpiolib). It manipulate gpio-mockup device through sysfs
>> provided and check the result from debugfs.
>>
>> Test the following things:
>> 1.  Add single, multi gpiochip with the checking of overlap.
>> 2.  Test direction and output value for valid pin.
>> 3.  Test dynamic allocation of gpio base.
>>
>> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
> 
> I like what this test is doing, but at some point we will need tests
> written in C.
> 
> The reason is that we are working on a character device for gpio,
> and once we have that, we want to be able to run these tests using
> the same program.
Understand, Written in c is easy to support both of them.
> But maybe this suffice for the sysfs tests of the current ABI.
Yeap.
> 
>> +++ b/tools/testing/selftests/gpio/gpio.sh
> 
> Rename it gpio-mockup-sysfs.sh please.
> 
>> +#!/bin/bash
>> +
>> +module="gpio-mockup"
> 
> This is ABI so not changing, you can just encode it into the
> program, but OK.
I was thinking if we could use this script to test gpio hardware
which support the 'standard' debugfs interface in gpiolib. It
rely on the feature that gpio could read back the output value.
I assume that lots of hw support this feature, if so, we could
use this script this gpio framework and gpio hw at the same
time.
> 
>> +
>> +SYSFS=
>> +GPIO_SYSFS=
>> +GPIO_DRV_SYSFS=
>> +DEBUGFS=
>> +GPIO_DEBUGFS=
>> +
>> +prerequisite()
>> +{
>> +       msg="skip all tests:"
>> +
>> +       if [ $UID != 0 ]; then
>> +               echo $msg must be run as root >&2
>> +               exit 0
>> +       fi
>> +
>> +       SYSFS=`mount -t sysfs | head -1 | awk '{ print $3 }'`
>> +       if [ ! -d "$SYSFS" ]; then
>> +               echo $msg sysfs is not mounted >&2
>> +               exit 0
>> +       fi
>> +       GPIO_SYSFS=`echo $SYSFS/class/gpio`
>> +       GPIO_DRV_SYSFS=`echo $SYSFS/devices/platform/$module/gpio`
>> +
>> +       DEBUGFS=`mount -t debugfs | head -1 | awk '{ print $3 }'`
>> +       if [ ! -d "$DEBUGFS" ]; then
>> +               echo $msg debugfs is not mounted >&2
>> +               exit 0
>> +       fi
>> +       GPIO_DEBUGFS=`echo $DEBUGFS/gpio`
>> +
>> +}
> 
> Looks good.
> 
>> +insert_module()
>> +{
>> +       if modprobe -q $module $1; then
>> +               echo -n ""
>> +       else
>> +               echo $msg insmod $module failed >&2
>> +               exit 0
>> +       fi
>> +}
>> +
>> +remove_module()
>> +{
>> +       modprobe -r -q $module
>> +}
>> +
>> +die()
>> +{
>> +       remove_module
>> +       exit 1
>> +}
> 
> So this inserting/removing modules work fine unless you want to
> run the tests with the module compiled-in. We should support that
> usecase too. So these functions must bail out silently if the module
> is already loaded (compiled in).
Yeap, understand. I try to do this by passing the '-q' to modprobe.
"With this flag, modprobe won't print an error message if you try to
remove or insert a module it can't find (and isn't an alias or
install/remove command).".
> 
>> +gpio_test()
>> +{
>> +       param=$1
>> +       if [ X$2 != X ]; then
>> +               invalid_pin=$2
>> +       fi
>> +       if [ X$param = X ]; then
>> +               insert_module
>> +       else
>> +               insert_module "conf=$param"
>> +       fi
> 
> As mentioned in the previous patch I'm suspicious about the parameters.
> Let's just have one or two mock chips and cut down on the
> parameterization.
Maybe we could discuss it in the previous patch?
> 
>> +       echo -n "GPIO $module test with base,ngpio configure<"
>> +       if [ X$param = X ]; then
>> +               echo "(default)>: ";
>> +       else
>> +               echo "$param>: "
>> +       fi
>> +       printf "%-10s %-5s %-5s\n" name base ngpio
>> +       gpiochip=`ls -d $GPIO_DRV_SYSFS/gpiochip* 2>/dev/null`
>> +       if [ X"$gpiochip" = X ]; then
>> +               echo "no gpiochip"
>> +       else
>> +               for chip in $gpiochip; do
>> +                       name=`basename $chip`
>> +                       base=`cat $chip/base`
>> +                       ngpio=`cat $chip/ngpio`
> 
> This is nice, because it relies on the chip informing us about the
> base and ngpio, meaning we can use a dynamic base, as pointed
> out in the previous patch.
yes.
>> +#test dynamic allocation of gpio
>> +gpio_test "-1,32"
>> +gpio_test "-1,32,32,16" 31
>> +gpio_test "-1,32,40,16,-1,5" 38
> 
> I think these are the only tests we should have, really.
Nope. If we only use the dynamic base, we could not test the corner
case in gpiochip_add_to_list. How about we mix the dynamic and
static base: insert a dynamic gpiochip and read back the base
allocated, then insert a static base to do the overlap test.
Is it make sense to you?
> 
> Using base 0 as some tests are doing is not going to work on
> any system that already has a built-in GPIO (SoC) controller.
> I think it is better to just use and test dynamic allocations.
Oh, yes. Insert base 0 without condition may fail in above case.
How about read back the current gpio range. And find out the
empty range to test? I could default to test the range in the
middle of the [0, MAX].

Regards

Bamvor
> 
> Yours,
> Linus Walleij
> 
