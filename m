From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] pinctrl: imx: add gpio pinmux support for vf610
Date: Tue, 23 Sep 2014 11:48:05 +0200
Message-ID: <CACRpkdYk0zW12qNXgOstTLmdVDYacu0Un+8quTN+J_azOic7AA@mail.gmail.com>
References: <cover.1410020458.git.stefan@agner.ch>
	<4cf96e22ce2c7646513b64260c7bb1a2279e232d.1410020459.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:41630 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754920AbaIWJsH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Sep 2014 05:48:07 -0400
Received: by mail-ie0-f174.google.com with SMTP id rd18so3644199iec.5
        for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2014 02:48:06 -0700 (PDT)
In-Reply-To: <4cf96e22ce2c7646513b64260c7bb1a2279e232d.1410020459.git.stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Alexandre Courbot <gnurou@gmail.com>, Shawn Guo <shawn.guo@freescale.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Sep 6, 2014 at 6:25 PM, Stefan Agner <stefan@agner.ch> wrote:

> Add pinmux support for GPIO for Vybrid (vf610) IOMUX controller.
> This is needed since direction configuration is not part of the
> GPIO module in Vybrid.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
(...)

> -arch_initcall(vf610_pinctrl_init);
> +postcore_initcall(vf610_pinctrl_init);

Why is this necessary? You should be able to rely on deferred
probing to do its work here. I think this should be module_init()
or driver_initcall() really.

Yours,
Linus Walleij
