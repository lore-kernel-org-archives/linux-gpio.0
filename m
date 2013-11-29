From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC v1 4/9] gpio: davinci: make IRQ initialization soc specific
Date: Fri, 29 Nov 2013 10:21:55 +0100
Message-ID: <CACRpkda+Gdp75Kw=n4y=yeZAdWxjpsdP8egtLNaQV0vDCXOkWQ@mail.gmail.com>
References: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com>
	<1385494815-15740-5-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:50188 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752047Ab3K2JV4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 04:21:56 -0500
Received: by mail-ob0-f180.google.com with SMTP id wo20so9714778obc.39
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 01:21:55 -0800 (PST)
In-Reply-To: <1385494815-15740-5-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Nori, Sekhar" <nsekhar@ti.com>, Prabhakar Lad <prabhakar.csengg@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>

On Tue, Nov 26, 2013 at 8:40 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> The Davinci GPIO IRQs initialization may need to be performed in a
> different way depending on SoC which use it. For example:
> - Davinci dm365 has AINTC irq controller, implemented using Generic IRQ
> chip, SPARSE_IRQ off;
> - Davinci da850 has cp-intc controller, implemented using IRQ chip;
> SPARSE_IRQ off;
> - Kestone has arm-gic controller, implemented using IRQ chip;
> SPARSE_IRQ on;

Now this is a pretty big patch ...

The big question that enters my mind is *why* is the da850 and
dm365 not using SPARSE_IRQ?

As it happens I'm on an ARM32 crusade to get everyone and its
dog to use, among other things, SPARSE_IRQ.

I would feel *much* *much* better if there was first a patch
to the DaVinci tree to turn on SPARSE_IRQ for this subarch,
and then this patch may look a bit different, maybe smaller
I take it?

Is this totally unattainable?

Yours,
Linus Walleij
