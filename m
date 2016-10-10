From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: freescale: avoid overwriting pin config when
 freeing GPIO
Date: Mon, 10 Oct 2016 10:33:49 +0200
Message-ID: <CACRpkdb5A7MTciL3NvD9-=FoTa7tBzy+Ac0nacTyr0eGtduMvQ@mail.gmail.com>
References: <20160927002650.4316-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:35380 "EHLO
        mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752173AbcJJIkq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2016 04:40:46 -0400
Received: by mail-oi0-f44.google.com with SMTP id d132so119943811oib.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2016 01:39:13 -0700 (PDT)
In-Reply-To: <20160927002650.4316-1-stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Adrian Alonso <aalonso@freescale.com>, Robin Gong <b38343@freescale.com>, Laxman Dewangan <ldewangan@nvidia.com>, Peng Fan <van.freenix@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 27, 2016 at 2:26 AM, Stefan Agner <stefan@agner.ch> wrote:

> +       /* Only change pad configuration if pad is still a GPIO */
> +       if (reg & (0x7 << 20))
> +               return;
> +
> +       /* Clear IBE/OBE/PUE to disable the pin (Hi-Z) */
>         reg &= ~0x7;
>         writel(reg, ipctl->base + pin_reg->mux_reg);

Please #define the magic 7 and 20 above so we see what is going
on if you choose this approach.

Yours,
Linus Walleij
