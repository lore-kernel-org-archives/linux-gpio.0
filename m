From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: gpio-mcp23sxx driver stopped working
Date: Sun, 18 Jan 2015 15:04:46 +0900
Message-ID: <CAAVeFuLJJKrcPSXCf8H5_rU530bsUF6WvS18xqg14NHDUoNgSA@mail.gmail.com>
References: <CAEmm_TYh-B7dfGtaKTFcqDK-xAdp5XdGLJt7YE9fzu66u-yWGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:60741 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751197AbbARGFI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Jan 2015 01:05:08 -0500
Received: by mail-ig0-f169.google.com with SMTP id hl2so1101391igb.0
        for <linux-gpio@vger.kernel.org>; Sat, 17 Jan 2015 22:05:06 -0800 (PST)
In-Reply-To: <CAEmm_TYh-B7dfGtaKTFcqDK-xAdp5XdGLJt7YE9fzu66u-yWGg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Antonio_Fiol_Bonn=C3=ADn?= <antonio@fiol.es>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Antonio,

On Sat, Jan 17, 2015 at 3:28 AM, Antonio Fiol Bonn=C3=ADn <antonio@fiol=
=2Ees> wrote:
> I am writing to you as the maintainers for the gpio-mcp23sxx driver (=
and
> open firmware maintainers) according to the kernel documentation, bef=
ore
> writing to the linux-kernel, linux-gpio or devicetree mailing list, a=
s
> recommeded by the FAQ.  If you believe I should proceed otherwise, I =
will be
> pleased to do so.

Thanks for reporting that issue and your detailed report. AFAICT you
did everything well - you could maybe also have included the
linux-gpio ML to reach a wider audience.

>
> I was using that module on a raspberry pi on kernel 3.15.2, successfu=
lly.
> When I upgraded to 3.18.2, the module stopped working. Specifically, =
the
> probes for a MCP23017 device fail with -EINVAL (-22).
>
> Some background:
> The setup is as follows:
> Some RPi GPIO pins drive leds. These continue working. Unrelated to t=
he
> failing module.
> RPi GPIO port 4 is used as the master for a w1 bus holding a couple
> temperature sensors. Still working properly. This is relevant because=
 I am
> upgrading after observing some kernel oops related to the w1_therm mo=
dule,
> but still unrelated to the failing module.
>
> The issue:
> RPI I2C port connected to a MCP23017 which, in turn, has 16 I/O pins
> configured to drive some more leds. This is still working at the I2C =
level,
> but the gpio-mcp23sxx module fails to probe the chip, and this means =
it
> fails to create the /sys/bus/gpio/gpiochip240 so I can't export the p=
ins
> which I later use to change the led state, all this using sysfs.
>
> Some debugging:
> I checked that the driver is rejecting the probe because of "invalid
> platform data". I tracked it down to be "inexistent" platform data, a=
s pdata
> is null when the test is performed.
> That code path is reached both when the kernel is configured with CON=
=46IG_OF
> and when it is configured without it.
> Without it, I can understand, but with, I can't.
> The OF matching does not succeed because dev.of_node is null too.
>
> A bit more debugging:
> I2C itself seems functioning properly:
> - i2cdetect -y 1 =3D=3D> shows me the chip on 0x27, where it used to =
be
> - i2cset -y 1 0x27 0x00 0x00 =3D=3D> effectively sets all pins in the=
 first bank
> for output, which I can know because...
> - i2cset -y 1 0x27 0x14 0xff =3D=3D> really sets all outputs in the f=
irst bank
> to high value, illuminating the connected LEDs
>
> Some code review:
> I am not 100% sure, but there has been a major commit that substantia=
lly
> changed how the driver works.
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/lin=
ux/+/3af0dbd592fe0a92002f16e341519ba03e92adf7%5E!/#F1
> The driver, in 3.15.2, required CONFIG_OF to be enabled, and now it d=
oes not
> require it. So there's a good amount of logic that changed. I was not=
 able
> to pinpoint a section in the code that is obviously wrong, however, s=
o...
>
> I'm stuck now.  Can you help?  What do you think are my next steps?

At this point you have a pretty good understanding of what is going
wrong. I believe the next step should be to revert the patch (using
'git revert 3af0dbd592fe') you suspect of being the culprit and see if
things go better. If they don't, and since you have known working and
failure points, I'd suggest to run a git bisect to pinpoint the faulty
patch. If you are not familiar with git bisect I can help you with
that but you sound like you are.

Once you have identified the patch, please include its author(s) in
the discussion so we can get their input as well. And if you can drive
this up to completion and come with a fixup patch, that'd be just
perfect.

Thanks,
Alex.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
