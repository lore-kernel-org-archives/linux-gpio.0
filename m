From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: mcp23s08: Fix clearing of interrupt.
Date: Wed, 16 Mar 2016 13:51:48 +0100
Message-ID: <CACRpkdY5UVdWtFTBkkipbqPOV-zd3jsozgLS90+4X13=Z4W8CQ@mail.gmail.com>
References: <1458027990-128142-1-git-send-email-preid@electromag.com.au>
	<1458027990-128142-2-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:35278 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932069AbcCPMvt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2016 08:51:49 -0400
Received: by mail-oi0-f48.google.com with SMTP id c203so37457485oia.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2016 05:51:49 -0700 (PDT)
In-Reply-To: <1458027990-128142-2-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 15, 2016 at 8:46 AM, Phil Reid <preid@electromag.com.au> wrote:

> The mcp23s18 is configurable on clearing the interrupt on either reading
> INTCAP or GPIO. Since driver reads INTCAP in IRQ and not the GPIO reg need
> to set control byte for this mode.
>
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Patch applied.

Is there some way I could convince you to try to convert this driver
to use GPIOLIB_IRQCHIP in the same manner as other nested
GPIO irqchips, e.g. drivers/gpio/gpio-stmpe.c (see commit
fe44e70db0544e24cd1d00fc594b6e5b0afd333b)?

Yours,
Linus Walleij
