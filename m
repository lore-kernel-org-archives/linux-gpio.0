From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Resend][PATCH] Pinctrl: imx1: fix wrong pin-name resolving
Date: Thu, 16 Jul 2015 16:00:23 +0200
Message-ID: <CACRpkdawo3048Kt-_Jio0kgSkUU5mkKkZ4gAJRZom3uKisEF0A@mail.gmail.com>
References: <558C9C49.7090600@gtsys.com.hk>
	<CACRpkdZ4h59v6i6_htLGj2K9n_-qidd2wtZFW21N2J1p=OK=Cw@mail.gmail.com>
	<20150716113458.GM1426@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:35418 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752552AbbGPOAX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 10:00:23 -0400
Received: by oihq81 with SMTP id q81so50758305oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 07:00:23 -0700 (PDT)
In-Reply-To: <20150716113458.GM1426@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chris Ruehl <chris.ruehl@gtsys.com.hk>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Markus Pargmann <mpa@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Jul 16, 2015 at 1:34 PM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Thu, Jul 16, 2015 at 10:52:58AM +0200, Linus Walleij wrote:
>> On Fri, Jun 26, 2015 at 2:26 AM, Chris Ruehl <chris.ruehl@gtsys.com.=
hk> wrote:
>>
>> > Bug in function imx1_pinconf_set() cause crash when
>> > princtrl debug is enabled and the pin_id becomes larger
>> > then the info->pins[] contains data.
>> >
>> > imx27-pinctrl 10015000.iomuxc: request pin 134 (MX27_PAD_UART2_TXD=
) for
>> > 1000b000.serial
>> > imx27-pinctrl 10015000.iomuxc: request pin 135 (MX27_PAD_UART2_RXD=
) for
>> > 1000b000.serial
>> > imx27-pinctrl 10015000.iomuxc: request pin 131 (MX27_PAD_UART2_CTS=
) for
>> > 1000b000.serial
>> > imx27-pinctrl 10015000.iomuxc: request pin 132 (MX27_PAD_UART2_RTS=
) for
>> > 1000b000.serial
>> > imx27-pinctrl 10015000.iomuxc: enable function uart group uart2-1
>> > imx27-pinctrl 10015000.iomuxc: imx1_pmx_set, pin 0x86, function 0,=
 gpio 0,
>> > direction 1, oconf 0, iconfa 0, iconfb 0
>> > imx27-pinctrl 10015000.iomuxc: imx1_pmx_set, pin 0x87, function 0,=
 gpio 0,
>> > direction 0, oconf 0, iconfa 0, iconfb 0
>> > imx27-pinctrl 10015000.iomuxc: imx1_pmx_set, pin 0x83, function 0,=
 gpio 0,
>> > direction 1, oconf 0, iconfa 0, iconfb 0
>> > imx27-pinctrl 10015000.iomuxc: imx1_pmx_set, pin 0x84, function 0,=
 gpio 0,
>> > direction 0, oconf 0, iconfa 0, iconfb 0
>> > imx27-pinctrl 10015000.iomuxc: num_configs=3D1 PinID=3D134
>> > imx27-pinctrl 10015000.iomuxc: pinconf set pullup pin MX27_PAD_UAR=
T1_RTS
>> > imx27-pinctrl 10015000.iomuxc: num_configs=3D1 PinID=3D135
>> > imx27-pinctrl 10015000.iomuxc: pinconf set pullup pin MX27_PAD_RTC=
K
>> > imx27-pinctrl 10015000.iomuxc: num_configs=3D1 PinID=3D131
>> > imx27-pinctrl 10015000.iomuxc: pinconf set pullup pin MX27_PAD_UAR=
T1_TXD
>> > imx27-pinctrl 10015000.iomuxc: num_configs=3D1 PinID=3D132
>> > imx27-pinctrl 10015000.iomuxc: pinconf set pullup pin MX27_PAD_UAR=
T1_RXD
>> > ...
>> > imx27-pinctrl 10015000.iomuxc: write: register 0xf4415508 offset 4=
 value 0x3
>> > imx27-pinctrl 10015000.iomuxc: write: register 0xf4415510 offset 4=
 value 0x0
>> > imx27-pinctrl 10015000.iomuxc: write: register 0xf4415518 offset 4=
 value 0x0
>> > imx27-pinctrl 10015000.iomuxc: imx1_pmx_set, pin 0xb5, function 0,=
 gpio 0,
>> > direction 1, oconf 0, iconfa 0, iconfb 0
>> > imx27-pinctrl 10015000.iomuxc: num_configs=3D1 PinID=3D171
>> > Unable to handle kernel paging request at virtual address 6c61765f
>> > pgd =3D c0004000
>> > 6c61765f] *pgd=3D00000000
>> > Internal error: Oops: 5 [#1] ARM
>> > Modules linked in:
>> > CPU: 0 PID: 1 Comm: swapper Not tainted 4.1.0-rc4-next-20150522-di=
rty #8
>> > Hardware name: GTSYS i.MX27GTSIR (Device Tree Support)
>> > task: ce832000 ti: ce848000 task.ti: ce848000
>> > PC is at strnlen+0x28/0x3c
>> > LR is at string.isra.4+0x34/0xcc
>> > pc : [<c01ae188>]    lr : [<c01af9a4>]    psr: 20000093
>> > sp : ce849a88  ip : ce849a98  fp : ce849a94
>> > r10: c05d7e3a  r9 : c05d81e4  r8 : 00000000
>> > r7 : 6c61765f  r6 : c05d81e4  r5 : ffffffff  r4 : c05d7e3a
>> > r3 : 6c61765f  r2 : 6c61765f  r1 : 6c61765e  r0 : 6c61765f
>> > Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment kern=
el
>> >
>> >
>> > Signed-off-by: Chris Ruehl <chris.ruehl@gtsys.com.hk>
>>
>> Patch applied. Can't seem so see anyone who's safeguarding this
>> driver recently, putting some people on To:
>
> I commented in that thread and the outcome from my POV was that the f=
ix
> needs a better changelog and it could be optimised to not lookup the =
pin
> if debug is off. (I don't know the patch content, as it was stripped =
in
> the reply.)

OK Chris will you send a new version of this patch?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
