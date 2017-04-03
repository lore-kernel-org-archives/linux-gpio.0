From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] pinctrl: core: Fix pinctrl_register_and_init() with pinctrl_enable()
Date: Mon, 3 Apr 2017 09:00:20 -0300
Message-ID: <CAOMZO5AFy_UY2KTCZHOHDEZp2tdVqZDWNisnu9sveoBmC-uOXQ@mail.gmail.com>
References: <20170330161639.1855-1-tony@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35398 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751481AbdDCMAW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Apr 2017 08:00:22 -0400
In-Reply-To: <20170330161639.1855-1-tony@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Gary Bisson <gary.bisson@boundarydevices.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, =?UTF-8?Q?Mika_Penttil=C3=A4?= <mika.penttila@nextfour.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Nishanth Menon <nm@ti.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>

Hi Tony,

On Thu, Mar 30, 2017 at 1:16 PM, Tony Lindgren <tony@atomide.com> wrote:
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

Your patch fixes the pinctrl hog issue on a imx53-qsb board, thanks:

Tested-by: Fabio Estevam <fabio.estevam@nxp.com>
