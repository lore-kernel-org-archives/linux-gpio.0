From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/7] gpio: omap: protect regs access in omap_gpio_irq_handler
Date: Wed, 26 Aug 2015 09:50:31 +0200
Message-ID: <CACRpkdYoy+hMjAZgFthpQAggDzXY71uQaCZbER_uBUT+suNdQg@mail.gmail.com>
References: <1439896258-26449-1-git-send-email-grygorii.strashko@ti.com>
	<1439896258-26449-5-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:34937 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751951AbbHZHuc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Aug 2015 03:50:32 -0400
Received: by oiew67 with SMTP id w67so116835929oie.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2015 00:50:31 -0700 (PDT)
In-Reply-To: <1439896258-26449-5-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>, Tony Lindgren <tony@atomide.com>, Javier Martinez Canillas <javier@dowhile0.org>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Aug 18, 2015 at 1:10 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> The access to HW registers has to be be protected in
> omap_gpio_irq_handler(), as it may race with code executed on
> another CPUs.
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
