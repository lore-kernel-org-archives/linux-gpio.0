From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PULL gpio-for-next] gpio: make flags mandatory for gpiod_get functions
Date: Mon, 20 Jul 2015 10:28:51 +0200
Message-ID: <CACRpkdbyJSeV6NjeieGOUP6Sqw1unT-gAztrKECmD987zn3v1g@mail.gmail.com>
References: <1434404169-4639-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<20150706090759.GS11824@pengutronix.de>
	<20150708105138.GD1426@pengutronix.de>
	<20150715062825.GC1426@pengutronix.de>
	<CAAVeFuKTwuO6O106oq0=f6eWAaa1NTiOJZ8Pw-VRG_i0E+4g+w@mail.gmail.com>
	<CACRpkdbDtg=Ssod4K881juitv4fu3iPO8TkE+ZqEALKMqeTwDA@mail.gmail.com>
	<20150720065605.GP7013@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:34140 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756359AbbGTI2w convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2015 04:28:52 -0400
Received: by obre1 with SMTP id e1so97654103obr.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2015 01:28:51 -0700 (PDT)
In-Reply-To: <20150720065605.GP7013@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>

On Mon, Jul 20, 2015 at 8:56 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

>> I finally found this message in my messy inbox. I'm a bit up over my
>> ears in patches...
>
> This somehow failed.  My tag is merged in your devel branch, but this
> contains several commits missing in your for-next. Is this intended?

Ah wait I see.

I pushed it to devel for testing, but the 0day build was not completing
so I did not get green light to push it to next.

I'll push to linux-next now.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
