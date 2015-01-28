From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] pinctrl: imx25: fix numbering for pins
Date: Tue, 27 Jan 2015 22:39:40 -0200
Message-ID: <CAOMZO5BZ=N=kEbLp-pZjMWcTHGaAXLQ612qm-v2qpwDzn_eQNA@mail.gmail.com>
References: <20150127232440.GK29856@pengutronix.de>
	<1422402356-12171-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:39561 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751299AbbA1Ajm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jan 2015 19:39:42 -0500
Received: by mail-lb0-f180.google.com with SMTP id b6so15967791lbj.11
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2015 16:39:40 -0800 (PST)
In-Reply-To: <1422402356-12171-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Dong Aisheng <b29396@freescale.com>, Denis Carikli <denis@eukrea.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Jan 27, 2015 at 9:45 PM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> The pin id for a given tuple listed in a fsl,pins property is calcula=
ted
> by dividing the first entry (which is also a register offset) by 4.
> As the first available register is at offset 0x8 and configures the p=
ad
> MX25_PAD_A10 the right id for this pin is 2. All other pins are off b=
y
> one, too.
>
> This patch drops the definition MX25_PAD_RESERVE1 (together with its
> only use) and decrements all following values by 1.
>
> Fixes: b4a87c9b966f ("pinctrl: pinctrl-imx: add imx25 pinctrl driver"=
)
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Tested-by: Fabio Estevam <fabio.estevam@freescale.com>

Thanks
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
