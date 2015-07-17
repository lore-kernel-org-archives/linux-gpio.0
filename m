From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Subject: pinctrl: imx1-core: Fix debug output in
 .pin_config_set callback
Date: Fri, 17 Jul 2015 09:58:01 +0200
Message-ID: <CACRpkdbzZDLVLgRnj9n3zKNCzYT+pdNDGEfYPN0p5ZA7bO0uUA@mail.gmail.com>
References: <55A85B59.5060906@gtsys.com.hk>
	<1437118723-19217-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:36674 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757059AbbGQH6C convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 03:58:02 -0400
Received: by oibn4 with SMTP id n4so66213242oib.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2015 00:58:01 -0700 (PDT)
In-Reply-To: <1437118723-19217-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Markus Pargmann <mpa@pengutronix.de>, Chris Ruehl <chris.ruehl@gtsys.com.hk>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, stable <stable@vger.kernel.org>

On Fri, Jul 17, 2015 at 9:38 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> imx1_pinconf_set assumes that the array of pins in struct
> imx1_pinctrl_soc_info can be indexed by pin id to get the
> pinctrl_pin_desc for a pin. This used to be correct up to commit
> 607af165c047 which removed some entries from the array and so made it
> wrong to access the array by pin id.
>
> The result of this bug is a wrong pin name in the output for small pi=
n
> ids and an oops for the bigger ones.
>
> This patch is the result of a discussion that includes patches by Mar=
kus
> Pargmann and Chris Ruehl.
>
> Fixes: 607af165c047 ("pinctrl: i.MX27: Remove nonexistent pad definit=
ions")
> Cc: stable@vger.kernel.org
> Reported-by: Chris Ruehl <chris.ruehl@gtsys.com.hk>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied for fixes with Markus' review tag.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
