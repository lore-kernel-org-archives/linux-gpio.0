From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: imx25: ensure that a pin with id i is at
 position i in the info array
Date: Fri, 2 Oct 2015 04:01:50 -0700
Message-ID: <CACRpkdZZ9EndoSmBo33_6aMqHzppQRgL6-XtHj_E_XZb5-_KjA@mail.gmail.com>
References: <1443018584-12186-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<1443018909-20871-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:34275 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752083AbbJBLBv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2015 07:01:51 -0400
Received: by oiev17 with SMTP id v17so55762498oie.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2015 04:01:50 -0700 (PDT)
In-Reply-To: <1443018909-20871-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@freescale.com>

On Wed, Sep 23, 2015 at 7:35 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The code in pinctrl-imx.c only works correctly if in the
> imx_pinctrl_soc_info passed to imx_pinctrl_probe we have:
>
>         info->pins[i].number =3D i
>         conf_reg(info->pins[i]) =3D 4 * i
>
> (which conf_reg(pin) being the offset of the pin's configuration
> register).
>
> When the imx25 specific part was introduced in b4a87c9b966f ("pinctrl=
:
> pinctrl-imx: add imx25 pinctrl driver") we had:
>
>         info->pins[i].number =3D i + 1
>         conf_reg(info->pins[i]) =3D 4 * i
>
> . Commit 34027ca2bbc6 ("pinctrl: imx25: fix numbering for pins") trie=
d
> to fix that but made the situation:
>
>         info->pins[i-1].number =3D i
>         conf_reg(info->pins[i-1]) =3D 4 * i
>
> which is hardly better but fixed the error seen back then.
>
> So insert another reserved entry in the array to finally yield:
>
>         info->pins[i].number =3D i
>         conf_reg(info->pins[i]) =3D 4 * i
>
> Fixes: 34027ca2bbc6 ("pinctrl: imx25: fix numbering for pins")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Changes since (implicit) v1 sent with Message-Id:
> 1443018584-12186-1-git-send-email-u.kleine-koenig@pengutronix.de :

Patch applied for fixes.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
