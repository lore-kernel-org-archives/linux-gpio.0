From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: core: Fix pinctrl_register_and_init() with pinctrl_enable()
Date: Fri, 7 Apr 2017 01:10:28 +0200
Message-ID: <CACRpkdaA9OtLn1RARF4-e5xhFGbXOnw=dNA0P=em0ApW47O0iA@mail.gmail.com>
References: <20170330161639.1855-1-tony@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:33295 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754883AbdDFXKb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Apr 2017 19:10:31 -0400
Received: by mail-io0-f177.google.com with SMTP id t68so6111213iof.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Apr 2017 16:10:30 -0700 (PDT)
In-Reply-To: <20170330161639.1855-1-tony@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Gary Bisson <gary.bisson@boundarydevices.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, =?UTF-8?Q?Mika_Penttil=C3=A4?= <mika.penttila@nextfour.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Nishanth Menon <nm@ti.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>

On Thu, Mar 30, 2017 at 6:16 PM, Tony Lindgren <tony@atomide.com> wrote:

> Recent pinctrl changes to allow dynamic allocation of pins exposed one
> more issue with the pinctrl pins claimed early by the controller itself.
> This caused a regression for IMX6 pinctrl hogs.
>
> Before enabling the pin controller driver we need to wait until it has
> been properly initialized, then claim the hogs, and only then enable it.
>
> To fix the regression, split the code into pinctrl_claim_hogs() and
> pinctrl_enable(). And then let's require that pinctrl_enable() is always
> called by the pin controller driver when ready after calling
> pinctrl_register_and_init().
>
> Depends-on: 950b0d91dc10 ("pinctrl: core: Fix regression caused by delaye=
d
> work for hogs")
> Fixes: df61b366af26 ("pinctrl: core: Use delayed work for hogs")
> Fixes: e566fc11ea76 ("pinctrl: imx: use generic pinctrl helpers for
> managing groups")
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Gary Bisson <gary.bisson@boundarydevices.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Mika Penttil=C3=A4 <mika.penttila@nextfour.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Patch applied for fixes with the test tags,
sorry for slowness.

Yours,
Linus Walleij
