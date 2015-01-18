From: =?UTF-8?Q?Antonio_Fiol_Bonn=C3=ADn?= <antonio@fiol.es>
Subject: Re: gpio-mcp23sxx driver stopped working
Date: Sun, 18 Jan 2015 12:31:48 +0100
Message-ID: <CAEmm_Tb80QtZuPEzZ6mJ-Yzzjydqxik3qmvpi5v_daZu_TxW6g@mail.gmail.com>
References: <CAEmm_TYh-B7dfGtaKTFcqDK-xAdp5XdGLJt7YE9fzu66u-yWGg@mail.gmail.com>
	<CAAVeFuLJJKrcPSXCf8H5_rU530bsUF6WvS18xqg14NHDUoNgSA@mail.gmail.com>
	<CAEmm_Tb5wRYCHxYtdHiLoL-SQAcf8WsvKKJTkJASZXoL=qT_Aw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:47969 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751235AbbARLbt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Jan 2015 06:31:49 -0500
Received: by mail-ob0-f179.google.com with SMTP id nt9so25170598obb.10
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2015 03:31:48 -0800 (PST)
In-Reply-To: <CAEmm_Tb5wRYCHxYtdHiLoL-SQAcf8WsvKKJTkJASZXoL=qT_Aw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, Sonic Zhang <sonic.zhang@analog.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

And I have some more news...

On Sun, Jan 18, 2015 at 9:34 AM, Antonio Fiol Bonn=C3=ADn <antonio@fiol=
=2Ees> wrote:
> On Sun, Jan 18, 2015 at 7:04 AM, Alexandre Courbot <gnurou@gmail.com>=
 wrote:
>> On Sat, Jan 17, 2015 at 3:28 AM, Antonio Fiol Bonn=C3=ADn <antonio@f=
iol.es>
>> wrote:
>> > I am writing to you as the maintainers for the gpio-mcp23sxx drive=
r (and
>> > open firmware maintainers) according to the kernel documentation, =
before
>> > writing to the linux-kernel, linux-gpio or devicetree mailing list=
, as
>> > recommeded by the FAQ.  If you believe I should proceed otherwise,=
 I
>> > will be
>> > pleased to do so.
>>
>> Thanks for reporting that issue and your detailed report. AFAICT you
>> did everything well - you could maybe also have included the
>> linux-gpio ML to reach a wider audience.

OK, Adding the list now that I have some more info.

>> > I was using that module on a raspberry pi on kernel 3.15.2,
>> > successfully.
>> > When I upgraded to 3.18.2, the module stopped working. Specificall=
y, the
>> > probes for a MCP23017 device fail with -EINVAL (-22).
>> >
>> > Some background:
>> > The setup is as follows:
>> > Some RPi GPIO pins drive leds. These continue working. Unrelated t=
o the
>> > failing module.
>> > RPi GPIO port 4 is used as the master for a w1 bus holding a coupl=
e
>> > temperature sensors. Still working properly. This is relevant beca=
use I
>> > am
>> > upgrading after observing some kernel oops related to the w1_therm
>> > module,
>> > but still unrelated to the failing module.
>> >
>> > The issue:
>> > RPI I2C port connected to a MCP23017 which, in turn, has 16 I/O pi=
ns
>> > configured to drive some more leds. This is still working at the I=
2C
>> > level,
>> > but the gpio-mcp23sxx module fails to probe the chip, and this mea=
ns it
>> > fails to create the /sys/bus/gpio/gpiochip240 so I can't export th=
e pins
>> > which I later use to change the led state, all this using sysfs.
>> >
>> > Some debugging:
>> > I checked that the driver is rejecting the probe because of "inval=
id
>> > platform data". I tracked it down to be "inexistent" platform data=
, as
>> > pdata
>> > is null when the test is performed.
>> > That code path is reached both when the kernel is configured with
>> > CONFIG_OF
>> > and when it is configured without it.
>> > Without it, I can understand, but with, I can't.
>> > The OF matching does not succeed because dev.of_node is null too.
>> >
>> > A bit more debugging:
>> > I2C itself seems functioning properly:
>> > - i2cdetect -y 1 =3D=3D> shows me the chip on 0x27, where it used =
to be
>> > - i2cset -y 1 0x27 0x00 0x00 =3D=3D> effectively sets all pins in =
the first
>> > bank
>> > for output, which I can know because...
>> > - i2cset -y 1 0x27 0x14 0xff =3D=3D> really sets all outputs in th=
e first
>> > bank
>> > to high value, illuminating the connected LEDs
>> >
>> > Some code review:
>> > I am not 100% sure, but there has been a major commit that substan=
tially
>> > changed how the driver works.
>> >
>> > https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/=
linux/+/3af0dbd592fe0a92002f16e341519ba03e92adf7%5E!/#F1
>> > The driver, in 3.15.2, required CONFIG_OF to be enabled, and now i=
t does
>> > not
>> > require it. So there's a good amount of logic that changed. I was =
not
>> > able
>> > to pinpoint a section in the code that is obviously wrong, however=
,
>> > so...
>> >
>> > I'm stuck now.  Can you help?  What do you think are my next steps=
?
>>
>> At this point you have a pretty good understanding of what is going
>> wrong.
>
>
> It finally took me less than expected to recompile with dynamic debug=
ging,
> and to learn using it.
>
> This is what I got by enabling debugging for
> drivers/i2c/* and
> drivers/gpio/*
> except
> i2c_core:i2c_device_uevent:492: i2c 1-0027: uevent:
> which was flooding the output, so I had to remove that specific one.
>
> Maybe the flood of uevent is a symptom, maybe not, I have no clue wha=
t it
> means. What do you think?
>
> [ 1563.536694] i2c_core:i2c_device_probe:636: mcp230xx 1-0027: probe
> [ 1563.536738] gpio_mcp23s08:mcp230xx_probe:789: mcp230xx 1-0027: inv=
alid
> platform data
> [ 1563.536775] mcp230xx: probe of 1-0027 failed with error -22
> [ 1563.536809] i2c_core:i2c_new_device:1090: i2c i2c-1: client [mcp23=
017]
> registered with bus id 1-0027
> [ 1563.536830] i2c i2c-1: new_device: Instantiated device mcp23017 at=
 0x27
>
> so essentially the code flow I roughly described on my previous e-mai=
l
>
> that is with a
> Linux OpenELEC 3.18.2 #1 PREEMPT Fri Jan 16 09:38:51 CET 2015 armv6l
> GNU/Linux
>
> with the related configuration (OF,I2C and GPIO) copied below the sig=
nature.
>
>
>
>>
>> I believe the next step should be to revert the patch (using
>> 'git revert 3af0dbd592fe') you suspect of being the culprit and see =
if
>> things go better.
>
> I will try that first.

I tried reverting the patch, but I had a hard time trying to have
openelec build with the kernel repository downloaded from GIT. I'm
most certainly missing something in their build process.

>> If they don't, and since you have known working and
>> failure points, I'd suggest to run a git bisect to pinpoint the faul=
ty
>> patch. If you are not familiar with git bisect I can help you with
>> that but you sound like you are.
>
>
> I hoped I could avoid bisect, as I understand it means log2(revisions=
)
> compilations and tests, and the range of revisions might be a bit bro=
ad, and
> because of the fact that the kernel compilation is included in the bi=
gger
> openelec build, and I have no idea how I can repack openelec with a c=
ustom
> built kernel. So for the bisect process, I'd have to bisect, create t=
he
> source tarball, substitute it in openelec build scripts and directori=
es,
> cross-build openelec, copy the build ro the RPi and test. But I also
> understand it may be the second easiest way.
>

So I did revert the patch on the downloaded tree, or actually I
reverted the files to the state before that patch and subsequent
patches, and copied the two relevant files (Kconfig and the driver) to
the openelec build tree, built and tested.

[  304.566481] i2c_core:i2c_device_probe:636: mcp230xx 1-0027: probe
[  304.566523] irq:of_irq_parse_one:295: of_irq_parse_one:
dev=3D<no-node>, index=3D0
[  304.581142] gpiolib:gpiochip_find_base:125: gpiochip_find_base:
found new base at 496
[  304.581423] gpiolib:gpiochip_add:287: gpiochip_add: registered
GPIOs 496 to 511 on device: mcp23017
[  304.581492] i2c_core:i2c_new_device:1090: i2c i2c-1: client
[mcp23017] registered with bus id 1-0027
[  304.581518] i2c i2c-1: new_device: Instantiated device mcp23017 at 0=
x27

=3D=3D> WORKING!

Then I deleted the device,
[ 1552.028574] i2c i2c-1: delete_device: Deleting device mcp23017 at 0x=
27
[ 1552.028685] i2c_core:i2c_device_remove:664: mcp230xx 1-0027: remove

Jumped to the revision after the patch, recompiled the module,
replaced it on the running kernel,
[ 1580.482718] i2c_core:i2c_del_driver:1879: i2c-core: driver
[mcp230xx] unregistered
[ 1601.195612] i2c_core:i2c_register_driver:1852: i2c-core: driver
[mcp230xx] registered

Re-enabled the debugging for the module, just in case, and asked the
kernel to add the device
[ 1637.473788] i2c_core:i2c_device_probe:636: mcp230xx 1-0027: probe
[ 1637.473834] gpio_mcp23s08:mcp230xx_probe:789: mcp230xx 1-0027:
invalid platform data
[ 1637.473869] mcp230xx: probe of 1-0027 failed with error -22
[ 1637.473901] i2c_core:i2c_new_device:1090: i2c i2c-1: client
[mcp23017] registered with bus id 1-0027
[ 1637.473925] i2c i2c-1: new_device: Instantiated device mcp23017 at 0=
x27

=3D=3D> FAILED!


>> Once you have identified the patch, please include its author(s) in
>> the discussion so we can get their input as well.

So it seems clear that the patch I was suspecting is the one that
makes the module fail the probe.
Including Sonic Zhang <sonic.zhang@analog.com>  2014-09-01 03:19:52 (GM=
T)

>> And if you can drive
>> this up to completion and come with a fixup patch, that'd be just
>> perfect.

I wish I could. Unfortunately, I don't have enough knowledge to
provide a patch to make this work. I had never heard of "device tree"
before trying to get this module compiled in, much less understand the
details and how to get it working.

As an additional check, I downloaded the latest version of the driver
to try to compile it in. Because gpio_[un]lock_as_irq were renamed to
gpiochip_[un]lock_as_irq, it did not compile in the existing tree, but
undoing the rename on the driver, it compiled, and failed to probe
(same error as the original).

Please let me know how I can test further.

Thank you very much!
--=20
Antonio

> # gzip -dc /proc/config.gz | egrep "CONFIG_(OF|GPIO|I2C)"
> CONFIG_OF=3Dy
> # CONFIG_OF_SELFTEST is not set
> CONFIG_OF_FLATTREE=3Dy
> CONFIG_OF_EARLY_FLATTREE=3Dy
> CONFIG_OF_ADDRESS=3Dy
> CONFIG_OF_IRQ=3Dy
> CONFIG_OF_NET=3Dy
> CONFIG_OF_MDIO=3Dy
> CONFIG_OF_RESERVED_MEM=3Dy
> CONFIG_I2C=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> # CONFIG_I2C_COMPAT is not set
> CONFIG_I2C_CHARDEV=3Dy
> CONFIG_I2C_MUX=3Dm
> # CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
> # CONFIG_I2C_MUX_GPIO is not set
> # CONFIG_I2C_MUX_PCA9541 is not set
> # CONFIG_I2C_MUX_PCA954x is not set
> CONFIG_I2C_HELPER_AUTO=3Dy
> CONFIG_I2C_ALGOBIT=3Dy
> # CONFIG_I2C_BCM2835 is not set
> CONFIG_I2C_BCM2708=3Dy
> CONFIG_I2C_BCM2708_BAUDRATE=3D
> 100000
> # CONFIG_I2C_CBUS_GPIO is not set
> # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> CONFIG_I2C_GPIO=3Dy
> # CONFIG_I2C_NOMADIK is not set
> # CONFIG_I2C_OCORES is not set
> # CONFIG_I2C_PCA_PLATFORM is not set
> # CONFIG_I2C_PXA_PCI is not set
> # CONFIG_I2C_RK3X is not set
> # CONFIG_I2C_SIMTEC is not set
> # CONFIG_I2C_XILINX is not set
> # CONFIG_I2C_DIOLAN_U2C is not set
> # CONFIG_I2C_PARPORT_LIGHT is not set
> # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
> # CONFIG_I2C_TAOS_EVM is not set
> # CONFIG_I2C_TINY_USB is not set
> # CONFIG_I2C_STUB is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIO_DEVRES=3Dy
> CONFIG_OF_GPIO=3Dy
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_MAX730X=3Dm
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> # CONFIG_GPIO_DWAPB is not set
> # CONFIG_GPIO_EM is not set
> # CONFIG_GPIO_ZEVIO is not set
> # CONFIG_GPIO_PL061 is not set
> # CONFIG_GPIO_SCH311X is not set
> # CONFIG_GPIO_GRGPIO is not set
> CONFIG_GPIO_ARIZONA=3Dm
> CONFIG_GPIO_MAX7300=3Dm
> CONFIG_GPIO_MAX732X=3Dm
> CONFIG_GPIO_PCA953X=3Dm
> CONFIG_GPIO_PCF857X=3Dm
> # CONFIG_GPIO_SX150X is not set
> CONFIG_GPIO_ADP5588=3Dm
> # CONFIG_GPIO_ADNP is not set
> CONFIG_GPIO_MAX7301=3Dm
> CONFIG_GPIO_MCP23S08=3Dm
> # CONFIG_GPIO_MC33880 is not set
> # CONFIG_GPIO_74X164 is not set
> # CONFIG_GPIO_WATCHDOG is not set
> # CONFIG_I2C_HID is not set
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
