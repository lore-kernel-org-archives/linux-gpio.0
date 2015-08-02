From: Evgeniy Polyakov <zbr@ioremap.net>
Subject: Re: [PATCH v2 10/11] w1: Allow compile test of GPIO consumers if !GPIOLIB
Date: Sun, 02 Aug 2015 16:55:23 +0300
Message-ID: <1480181438523723@web3j.yandex.ru>
References: <1438506475-31012-1-git-send-email-geert@linux-m68k.org>
	<1438506594-31888-1-git-send-email-geert@linux-m68k.org>
	<1214241438507507@web3j.yandex.ru> <CAMuHMdVWeK0chrG_NZ6diHyBxa13WnesgNZ7gh6dTAENw2bg_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from forward12.mail.yandex.net ([95.108.130.94]:60960 "EHLO
	forward12.mail.yandex.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751729AbbHBOCp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Aug 2015 10:02:45 -0400
In-Reply-To: <CAMuHMdVWeK0chrG_NZ6diHyBxa13WnesgNZ7gh6dTAENw2bg_A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Geert

02.08.2015, 15:11, "Geert Uytterhoeven" <geert@linux-m68k.org>:
>>> =9A- depends on GPIOLIB
>>> =9A+ depends on GPIOLIB || COMPILE_TEST
>>
>> =9ADoes that mean GPIO subsystem is always available and no addition=
al dependency needed
>> =9Awhen COMPILE_TEST is enabled?
>
> The GPIO subsystem is not always available, but it provides dummy GPI=
O consumer
> functions if GPIOLIB is not enabled.

Ok, I see.
Thanks for clarification

Acked-by: Evgeniy Polyakov <zbr@ioremap.net>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
