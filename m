From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: gpio-mcp23sxx driver stopped working
Date: Mon, 19 Jan 2015 15:08:50 +0900
Message-ID: <CAAVeFuJtx6wV3ij-93Vk97ftZBU3ZYmneF+sNrM4CRnX+q=peg@mail.gmail.com>
References: <CAEmm_TYh-B7dfGtaKTFcqDK-xAdp5XdGLJt7YE9fzu66u-yWGg@mail.gmail.com>
 <CAAVeFuLJJKrcPSXCf8H5_rU530bsUF6WvS18xqg14NHDUoNgSA@mail.gmail.com>
 <CAEmm_Tb5wRYCHxYtdHiLoL-SQAcf8WsvKKJTkJASZXoL=qT_Aw@mail.gmail.com>
 <CAEmm_Tb80QtZuPEzZ6mJ-Yzzjydqxik3qmvpi5v_daZu_TxW6g@mail.gmail.com> <B168F8A49F4BCF4C84FD23DA5F6363EE61231F37@NWD2MBX7.ad.analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:56409 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752001AbbASGJL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jan 2015 01:09:11 -0500
Received: by mail-ig0-f170.google.com with SMTP id l13so11580144iga.1
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2015 22:09:10 -0800 (PST)
In-Reply-To: <B168F8A49F4BCF4C84FD23DA5F6363EE61231F37@NWD2MBX7.ad.analog.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Zhang, Sonic" <Sonic.Zhang@analog.com>
Cc: =?UTF-8?Q?Antonio_Fiol_Bonn=C3=ADn?= <antonio@fiol.es>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jan 19, 2015 at 1:01 PM, Zhang, Sonic <Sonic.Zhang@analog.com> =
wrote:
> Hi Antonio,
>
>>-----Original Message-----
>>From: Antonio Fiol Bonn=C3=ADn [mailto:antonio@fiol.es]
>>Sent: Sunday, January 18, 2015 7:32 PM
>>To: Alexandre Courbot; Zhang, Sonic
>>Cc: Linus Walleij; Grant Likely; Rob Herring; linux-gpio@vger.kernel.=
org
>>Subject: Re: gpio-mcp23sxx driver stopped working
>>
>>And I have some more news...
>>
>>On Sun, Jan 18, 2015 at 9:34 AM, Antonio Fiol Bonn=C3=ADn <antonio@fi=
ol.es> wrote:
>>> On Sun, Jan 18, 2015 at 7:04 AM, Alexandre Courbot <gnurou@gmail.co=
m> wrote:
>>>> On Sat, Jan 17, 2015 at 3:28 AM, Antonio Fiol Bonn=C3=ADn
>>>> <antonio@fiol.es>
>>>> wrote:
>>>> > I am writing to you as the maintainers for the gpio-mcp23sxx dri=
ver
>>>> > (and open firmware maintainers) according to the kernel
>>>> > documentation, before writing to the linux-kernel, linux-gpio or
>>>> > devicetree mailing list, as recommeded by the FAQ.  If you belie=
ve
>>>> > I should proceed otherwise, I will be pleased to do so.
>>>>
>>>> Thanks for reporting that issue and your detailed report. AFAICT y=
ou
>>>> did everything well - you could maybe also have included the
>>>> linux-gpio ML to reach a wider audience.
>>
>>OK, Adding the list now that I have some more info.
>>
>>>> > I was using that module on a raspberry pi on kernel 3.15.2,
>>>> > successfully.
>>>> > When I upgraded to 3.18.2, the module stopped working.
>>>> > Specifically, the probes for a MCP23017 device fail with -EINVAL=
 (-22).
>>>> >
>>>> > Some background:
>>>> > The setup is as follows:
>>>> > Some RPi GPIO pins drive leds. These continue working. Unrelated=
 to
>>>> > the failing module.
>>>> > RPi GPIO port 4 is used as the master for a w1 bus holding a cou=
ple
>>>> > temperature sensors. Still working properly. This is relevant
>>>> > because I am upgrading after observing some kernel oops related =
to
>>>> > the w1_therm module, but still unrelated to the failing module.
>>>> >
>>>> > The issue:
>>>> > RPI I2C port connected to a MCP23017 which, in turn, has 16 I/O
>>>> > pins configured to drive some more leds. This is still working a=
t
>>>> > the I2C level, but the gpio-mcp23sxx module fails to probe the
>>>> > chip, and this means it fails to create the
>>>> > /sys/bus/gpio/gpiochip240 so I can't export the pins which I lat=
er
>>>> > use to change the led state, all this using sysfs.
>>>> >
>>>> > Some debugging:
>>>> > I checked that the driver is rejecting the probe because of
>>>> > "invalid platform data". I tracked it down to be "inexistent"
>>>> > platform data, as pdata is null when the test is performed.
>>>> > That code path is reached both when the kernel is configured wit=
h
>>>> > CONFIG_OF and when it is configured without it.
>>>> > Without it, I can understand, but with, I can't.
>>>> > The OF matching does not succeed because dev.of_node is null too=
=2E
>>>> >
> Have you added the gpio node for mcp23sxx in the device tree file of =
your raspberry pi board? And have you rebuilt your dtb file?

It seems like Antonio's device is using platform data (Antonio, can
you confirm?), so is DT relevant at all here?

By the look of it this patch might have broken platform support for
this driver. According to the trace given by Antonio, the following
condition in probe() is met:

        if (!pdata || !gpio_is_valid(pdata->base)) {

Antonio, could you display both pdata and pdata->base right before
this test so we understand why this is happening? Does the platform
data in your board file specify a base GPIO for your chip?
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
