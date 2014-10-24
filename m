From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 4/4] Documentation: dts: add bindings for Vybrid
 GPIO/PORT module
Date: Fri, 24 Oct 2014 14:23:34 +0200
Message-ID: <CACRpkdZwtexz_85CPfhMWXj0=Xmo=7kuOh8BA9H8zBGdmshwEg@mail.gmail.com>
References: <cover.1413488264.git.stefan@agner.ch>
	<12bd7950696ad30aa05348270df2e024ba113e63.1413488264.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yh0-f41.google.com ([209.85.213.41]:61277 "EHLO
	mail-yh0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756212AbaJXMXe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Oct 2014 08:23:34 -0400
Received: by mail-yh0-f41.google.com with SMTP id i57so690795yha.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2014 05:23:34 -0700 (PDT)
In-Reply-To: <12bd7950696ad30aa05348270df2e024ba113e63.1413488264.git.stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Alexandre Courbot <gnurou@gmail.com>, Shawn Guo <shawn.guo@freescale.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bpringlemeir@nbsps.com, Lucas Stach <l.stach@pengutronix.de>

On Thu, Oct 16, 2014 at 9:48 PM, Stefan Agner <stefan@agner.ch> wrote:

> The Vybrid SoC device tree (vf610.dtsi) used this bindings since
> its initial commit in May 2013. However, a proper gpiolib driver
> was missing so far. With the addition of the gpiolib driver,
> the bindings proved to be useful and complete, hence a good time
> to add the documentation.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Acked-by: Shawn Guo <shawn.guo@freescale.com>

Patch applied to the GPIO tree.

Yours,
Linus Walleij
