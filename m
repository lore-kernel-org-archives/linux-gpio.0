From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFD 2/3] selftest/gpio: add gpio test case
Date: Thu, 26 Nov 2015 10:50:58 +0100
Message-ID: <CACRpkdbSkmhm=Q=vxydQa=-zAmmxBqhSGpXUjpW-jv3YQHJuzA@mail.gmail.com>
References: <1447491097-14799-1-git-send-email-bamvor.zhangjian@linaro.org>
	<1447491097-14799-3-git-send-email-bamvor.zhangjian@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:36705 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752335AbbKZJu7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Nov 2015 04:50:59 -0500
Received: by obdgf3 with SMTP id gf3so59790833obd.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2015 01:50:59 -0800 (PST)
In-Reply-To: <1447491097-14799-3-git-send-email-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>

On Sat, Nov 14, 2015 at 9:51 AM, Bamvor Jian Zhang
<bamvor.zhangjian@linaro.org> wrote:

> This test script try to do whitebox testing for gpio subsystem(
> based on gpiolib). It manipulate gpio-mockup device through sysfs
> provided and check the result from debugfs.
>
> Test the following things:
> 1.  Add single, multi gpiochip with the checking of overlap.
> 2.  Test direction and output value for valid pin.
> 3.  Test dynamic allocation of gpio base.
>
> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

I like what this test is doing, but at some point we will need tests
written in C.

The reason is that we are working on a character device for gpio,
and once we have that, we want to be able to run these tests using
the same program.

But maybe this suffice for the sysfs tests of the current ABI.

> +++ b/tools/testing/selftests/gpio/gpio.sh

Rename it gpio-mockup-sysfs.sh please.

> +#!/bin/bash
> +
> +module="gpio-mockup"

This is ABI so not changing, you can just encode it into the
program, but OK.

> +
> +SYSFS=
> +GPIO_SYSFS=
> +GPIO_DRV_SYSFS=
> +DEBUGFS=
> +GPIO_DEBUGFS=
> +
> +prerequisite()
> +{
> +       msg="skip all tests:"
> +
> +       if [ $UID != 0 ]; then
> +               echo $msg must be run as root >&2
> +               exit 0
> +       fi
> +
> +       SYSFS=`mount -t sysfs | head -1 | awk '{ print $3 }'`
> +       if [ ! -d "$SYSFS" ]; then
> +               echo $msg sysfs is not mounted >&2
> +               exit 0
> +       fi
> +       GPIO_SYSFS=`echo $SYSFS/class/gpio`
> +       GPIO_DRV_SYSFS=`echo $SYSFS/devices/platform/$module/gpio`
> +
> +       DEBUGFS=`mount -t debugfs | head -1 | awk '{ print $3 }'`
> +       if [ ! -d "$DEBUGFS" ]; then
> +               echo $msg debugfs is not mounted >&2
> +               exit 0
> +       fi
> +       GPIO_DEBUGFS=`echo $DEBUGFS/gpio`
> +
> +}

Looks good.

> +insert_module()
> +{
> +       if modprobe -q $module $1; then
> +               echo -n ""
> +       else
> +               echo $msg insmod $module failed >&2
> +               exit 0
> +       fi
> +}
> +
> +remove_module()
> +{
> +       modprobe -r -q $module
> +}
> +
> +die()
> +{
> +       remove_module
> +       exit 1
> +}

So this inserting/removing modules work fine unless you want to
run the tests with the module compiled-in. We should support that
usecase too. So these functions must bail out silently if the module
is already loaded (compiled in).

> +gpio_test()
> +{
> +       param=$1
> +       if [ X$2 != X ]; then
> +               invalid_pin=$2
> +       fi
> +       if [ X$param = X ]; then
> +               insert_module
> +       else
> +               insert_module "conf=$param"
> +       fi

As mentioned in the previous patch I'm suspicious about the parameters.
Let's just have one or two mock chips and cut down on the
parameterization.

> +       echo -n "GPIO $module test with base,ngpio configure<"
> +       if [ X$param = X ]; then
> +               echo "(default)>: ";
> +       else
> +               echo "$param>: "
> +       fi
> +       printf "%-10s %-5s %-5s\n" name base ngpio
> +       gpiochip=`ls -d $GPIO_DRV_SYSFS/gpiochip* 2>/dev/null`
> +       if [ X"$gpiochip" = X ]; then
> +               echo "no gpiochip"
> +       else
> +               for chip in $gpiochip; do
> +                       name=`basename $chip`
> +                       base=`cat $chip/base`
> +                       ngpio=`cat $chip/ngpio`

This is nice, because it relies on the chip informing us about the
base and ngpio, meaning we can use a dynamic base, as pointed
out in the previous patch.

> +#test dynamic allocation of gpio
> +gpio_test "-1,32"
> +gpio_test "-1,32,32,16" 31
> +gpio_test "-1,32,40,16,-1,5" 38

I think these are the only tests we should have, really.

Using base 0 as some tests are doing is not going to work on
any system that already has a built-in GPIO (SoC) controller.
I think it is better to just use and test dynamic allocations.

Yours,
Linus Walleij
