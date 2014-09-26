From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 0/5] vf610: Add GPIO support
Date: Fri, 26 Sep 2014 10:52:37 +0200
Message-ID: <CACRpkdaOZ-mN3LrGKWzmtm0+SJaWdaz5LG5H9UYi_e9GQRvaDg@mail.gmail.com>
References: <cover.1411662961.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:50549 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754123AbaIZIwi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Sep 2014 04:52:38 -0400
Received: by mail-ie0-f173.google.com with SMTP id tr6so15107271ieb.4
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2014 01:52:37 -0700 (PDT)
In-Reply-To: <cover.1411662961.git.stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Alexandre Courbot <gnurou@gmail.com>, Shawn Guo <shawn.guo@freescale.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bpringlemeir@nbsps.com, Lucas Stach <l.stach@pengutronix.de>

On Thu, Sep 25, 2014 at 6:37 PM, Stefan Agner <stefan@agner.ch> wrote:

> This 3rd version of the GPIO support for Vybrid now also includes
> the wakeup support which was part of the suspend/resume patchset
> I sent earlier this week.
>
> Changes in v3:

I've already applied patch 1/5.

However I had to fix conflicts against the development branch and
from patch 2/5 and onward there are even more conflicts, the most
obvious is that the driver is moved to drivers/pinctrl/freescale, but
there are other conflicts as well.

Can you please rebase patches 2-5 onto my "devel" branch from
the pin control tree and resend, also collect ACKs.
https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

I saw there was still discussion on 2/5 as well, but I'm ready
to merge anything ACKed by Shawn.

Yours,
Linus Walleij
