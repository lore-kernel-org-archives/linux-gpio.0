From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH 1/2] pinctrl: at91-pio4: Use irq_set_handler_locked()
Date: Sun, 4 Oct 2015 23:31:06 +0200
Message-ID: <56119A9A.3070507@atmel.com>
References: <abf74f93ec58e3b321dce23af3fa5af1ffa2e070.1443793711.git.nicolas.ferre@atmel.com>
 <560E8D4C.1000400@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.243]:26378 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751809AbbJDVbw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Oct 2015 17:31:52 -0400
In-Reply-To: <560E8D4C.1000400@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-gpio@vger.kernel.org, s.hauer@pengutronix.de, alexandre.belloni@free-electrons.com, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

Le 02/10/2015 15:57, Nicolas Ferre a =E9crit :
> Hi all,
>=20
> Well it seems my cover letter is missing. So, here it is:
>=20
> ---8<----
> pinctrl: at91-pio4: fixes for current linux-next (irq)
>=20
> While testing the sama5d2 on today's linux-next I discovered that som=
e
> adaptations were missing. So, I don't know if you were aware but here
> are my fixes in case you don't have them already.
>=20
> +Cc: Thomas and Stephen in case these errors happen while building
> linux-next...

After seeing that Linus applied 2 patches by Ludovic, I realized that a=
s
I had foreseen correctly: it was known and corrected.

Sorry for the noise. Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
