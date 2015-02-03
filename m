From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: imx25: fix numbering for pins
Date: Tue, 3 Feb 2015 14:03:56 +0100
Message-ID: <CACRpkdZT64A8ZYyVzSM=S-_xRnge4o5ntBeGi2UiOfXPyaEYAA@mail.gmail.com>
References: <20150127232440.GK29856@pengutronix.de>
	<1422402356-12171-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:62840 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754040AbbBCND5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Feb 2015 08:03:57 -0500
Received: by mail-oi0-f52.google.com with SMTP id h136so48984869oig.11
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2015 05:03:56 -0800 (PST)
In-Reply-To: <1422402356-12171-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Dong Aisheng <b29396@freescale.com>, Denis Carikli <denis@eukrea.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, Jan 28, 2015 at 12:45 AM, Uwe Kleine-K=C3=B6nig
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

Patch applied with Fabio's Test tag.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
