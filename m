From: Markus Mayer <markus.mayer@linaro.org>
Subject: Re: [PATCH] gpio: only enable kona driver on BCM_MOBILE or for
 compile testing
Date: Thu, 27 Feb 2014 14:20:17 -0800
Message-ID: <CAPdLdqkq06AuLr8a8x9aY8BmHHbcNsL5tmQrH4j8bEom_HS-kA@mail.gmail.com>
References: <1392990146-18916-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f181.google.com ([209.85.128.181]:45615 "EHLO
	mail-ve0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750999AbaB0WUS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Feb 2014 17:20:18 -0500
Received: by mail-ve0-f181.google.com with SMTP id jw12so4500295veb.26
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2014 14:20:17 -0800 (PST)
In-Reply-To: <1392990146-18916-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?ISO-8859-1?Q?Uwe_Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Markus Mayer <mmayer@broadcom.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>, kernel@pengutronix.de

On 21 February 2014 05:42, Uwe Kleine-K=F6nig
<u.kleine-koenig@pengutronix.de> wrote:
> Hello,
>
> I'm not sure if and how "Kona" fits into the bcm281xx namespace, but
> reading through the commit logs of the changes touching
> drivers/gpio/gpio-bcm-kona.c so far suggests it does. In this case I'=
d
> consider it a good idea to mention "bcm281xx" in the help text of
> GPIO_BCM_KONA.

Naming these components has been quite a challenge for our upstreaming
effort. Some things are not very obvious unless you know he chip or
were involved in those discussions.

"Kona" can be thought of as an architecture or a family of chips.
bcm281xx is one member of that family. There are others. I submitted
bcm21664 to arm-linux just a few minutes ago. bcm21664 also uses
gpio-bcm-kona.c.

Mentioning the SoCs in the help text is a good idea, but we'll likely
have to come up with a central location where all supported members of
the Kona family are listed, so they aren't scattered all over
different sub-systems (Kona watchdog, Kona GPIO, Kona timer, etc.) If
we don't have a central location, we'll be certain to forget updating
one of the help texts eventually, and it would become inconsistent.

Regards,
-Markus

--=20
Markus Mayer
Broadcom Landing Team
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
