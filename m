From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V4 RESEND 4/6] pinctrl: imx: remove gpio_request_enable
 and gpio_disable_free
Date: Tue, 1 Aug 2017 13:54:37 +0200
Message-ID: <CACRpkdafhTMsYiY6yxcnXG0T3LeG5jw8_tp64G1a808G_63A9A@mail.gmail.com>
References: <1500990116-3620-1-git-send-email-aisheng.dong@nxp.com> <1500990116-3620-5-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:35830 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751115AbdHALyi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 07:54:38 -0400
Received: by mail-io0-f180.google.com with SMTP id m88so7225580iod.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 04:54:38 -0700 (PDT)
In-Reply-To: <1500990116-3620-5-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Dong Aisheng <dongas86@gmail.com>, Stefan Agner <stefan@agner.ch>, Bai Ping <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Jul 25, 2017 at 3:41 PM, Dong Aisheng <aisheng.dong@nxp.com> wrote:

> gpio_request_enable/disable_free actually are not quite necessary as
> standard IMX pinctrl binding already sets GPIO mux from device tree,
> e.g. VF610_PAD_PTB20__GPIO_42 or MX7D_PAD_SD2_CD_B__GPIO5_IO9
> No need to do it again in gpio_request_enable.
>
> And according to Stefan:
> "For all GPIO I checked in upstream device trees we assign a pinctrl
> to the same node, so in all cases gpio_request_enable/disable is really
> unnecessary."
>
> So it should be safe to simply remove it.
>
> Note that this changes semantics for Vybrid, e.g.
> "The two functions have been introduced for Vybrid (through
> SHARE_MUX_CONF_REG) and mux pins as GPIOs automatically when a GPIO
> gets requested. The automatic mux is optional by the pinmux/gpio
> subsystem semantics, and other NXP devices do not use it, instead an
> explicit pinctrl node is added in the device tree to mux GPIOs where
> required. Hence this change aligns Vybrid to other NXP (i.MX) devices.
>
> Note that all upstream device tree assign proper pinctrl properties
> where GPIOs are used so no change is necessary for device trees."
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Fugang Duan <fugang.duan@nxp.com>
> Cc: Bai Ping <ping.bai@nxp.com>
> Acked-by: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Patch applied.

Yours,
Linus Walleij
