From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: configuration for nc pins without pull
Date: Fri, 27 Mar 2015 10:15:13 +0100
Message-ID: <CACRpkda2UHv5oe1z-48SDiYUH1BzVsJS-V4CRKcmjTfn=o=O7A@mail.gmail.com>
References: <20150322100059.GH5664@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36119 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752655AbbC0JPO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2015 05:15:14 -0400
Received: by oicf142 with SMTP id f142so61831367oic.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2015 02:15:13 -0700 (PDT)
In-Reply-To: <20150322100059.GH5664@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sun, Mar 22, 2015 at 11:00 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> for a machine I want to configure a pin that is actually not connecte=
d
> to minimize floating. (I think this is sensible, isn't it?)

Yup, and Russell gave an excellent summary of why.

> For the pinctrl I can use a hog group of the pinctrl device. At least
> one of the pins doesn't have a pullup/pulldown configuration though, =
so
> I want to mux it to its gpio function and set the gpio to output and =
the
> desired value.
>
> Is there something nicer than defining an always-on regulator with gp=
ios
> =3D <&gpio4 3 0> to accomplish that without additional code?

As explained in
Documentation/pinctrl.txt, section "GPIO mode pitfalls" like 788
this is not really "GPIO", it is a way of controlling the electric stat=
e
of the pin using software, it's just the hardware designers idea of the
use case that it is "GPIO", it is not what a software engineer would ca=
ll
GPIO.

If the controller support GENERIC_PINCONF I suggest implementing
PIN_CONFIG_OUTPUT from include/linux/pinctrl/pinconf-generic.h
which is more or less for exactly this purpose.

It will bring the pin into "GPIO mode" by poking the right registers bu=
t
what is really happening is a non-GPIO usecase on the pin control
side of things.

This should be done using a hog on the device tree and
output-low; or output-high; using the generic pinctrl bindings.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
