From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib:change to use irq_alloc_descs_from to alloc virqs
Date: Thu, 25 Sep 2014 09:39:07 +0200
Message-ID: <CACRpkdaM-1btosNFGMJy_U4F6rQfiG7sQXyyM0gyQ6OhC=_c8Q@mail.gmail.com>
References: <35FD53F367049845BC99AC72306C23D103CDBFBFB017@CNBJMBX05.corpusers.net>
	<CACRpkdbmnPcDFHu6oLhXQERyFzXD2K1QHH1hRUtci41KuEDdtQ@mail.gmail.com>
	<35FD53F367049845BC99AC72306C23D103D6DB4D6F29@CNBJMBX05.corpusers.net>
	<54216EA5.5010506@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:40782 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751031AbaIYHjI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Sep 2014 03:39:08 -0400
Received: by mail-ie0-f172.google.com with SMTP id rp18so11123909iec.17
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2014 00:39:08 -0700 (PDT)
In-Reply-To: <54216EA5.5010506@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "Wang, Yalin" <Yalin.Wang@sonymobile.com>, "gnurou@gmail.com" <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>

On Tue, Sep 23, 2014 at 2:59 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> Now the "irq_base" is used only twice in gpiolib code and below diff should
> allow to drop it completely from gpiolib code.
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 15cc0bb..81762ed 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -524,7 +524,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
>         /* Remove all IRQ mappings and delete the domain */
>         if (gpiochip->irqdomain) {
>                 for (offset = 0; offset < gpiochip->ngpio; offset++)
> -                       irq_dispose_mapping(gpiochip->irq_base + offset);
> +                       irq_dispose_mapping(irq_find_mapping(gpiochip->irqdomain, offset));
>                 irq_domain_remove(gpiochip->irqdomain);
>         }
>
> not tested.

I like the looks of this.

Grygorii, can you send a proper, tested patch for this? Thansk!

Yours,
Linus Walleij
