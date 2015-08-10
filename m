From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 00/11] gpio: Allow compile test of GPIO consumers if !GPIOLIB
Date: Mon, 10 Aug 2015 18:23:52 +0200
Message-ID: <CAMuHMdVOeXCoYN_99bqN_MkmXuXL1nhcmK3Zf4kAi01F8WeHPw@mail.gmail.com>
References: <1438506475-31012-1-git-send-email-geert@linux-m68k.org>
	<1439222512.2605.12.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f193.google.com ([209.85.214.193]:35596 "EHLO
	mail-ob0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754041AbbHJQXx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2015 12:23:53 -0400
In-Reply-To: <1439222512.2605.12.camel@sipsolutions.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Evgeniy Polyakov <zbr@ioremap.net>, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Marcel Selhorst <tpmdd@selhorst.net>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Peter Huewe <peterhuewe@gmx.de>, Sebastian Reichel <sre@kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Johannes,

On Mon, Aug 10, 2015 at 6:01 PM, Johannes Berg
<johannes@sipsolutions.net> wrote:
> On Sun, 2015-08-02 at 11:07 +0200, Geert Uytterhoeven wrote:
>> Thanks for applying!
>
> Did you expect the series to get applied somewhere (GPIO tree, if
> there's such a thing?), or the single patches to go through the
> relevant other trees?
>
> Fine with me either way, but it'd be good to know so we don't have the
> patches twice :)

I'd like the individual subsystem maintainers to apply the respective
patches. Sorry for being unclear.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
