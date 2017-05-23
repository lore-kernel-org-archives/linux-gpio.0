From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mxs: atomically switch mux and drive strength config
Date: Tue, 23 May 2017 11:28:37 +0200
Message-ID: <CACRpkdZ01BNbdNbEqvfaxnOYbS64bgJ=FU_sbf==rJUympSs3w@mail.gmail.com>
References: <20170518092355.6735-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:36695 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933326AbdEWJ2j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2017 05:28:39 -0400
Received: by mail-io0-f181.google.com with SMTP id o12so93687655iod.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2017 02:28:38 -0700 (PDT)
In-Reply-To: <20170518092355.6735-1-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, May 18, 2017 at 11:23 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> To set the mux mode of a pin two bits must be set. Up to now this is
> implemented using the following idiom:
>
>         writel(mask, reg + CLR);
>         writel(value, reg + SET);
>
> . This however results in the mux mode being 0 between the two writes.
>
> On my machine there is an IC's reset pin connected to LCD_D20. The
> bootloader configures this pin as GPIO output-high (i.e. not holding the
> IC in reset). When Linux reconfigures the pin to GPIO the short time
> LCD_D20 is muxed as LCD_D20 instead of GPIO_1_20 is enough to confuse
> the connected IC.
>
> The same problem is present for the pin's drive strength setting which is
> reset to low drive strength before using the right value.
>
> So instead of relying on the hardware to modify the register setting
> using two writes implement the bit toggling using read-modify-write.
>
> Fixes: 17723111e64f ("pinctrl: add pinctrl-mxs support")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied for fixes with Shawn's ACK.

Yours,
Linus Walleij
