From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib:change to use irq_alloc_descs_from to alloc virqs
Date: Tue, 23 Sep 2014 12:21:58 +0200
Message-ID: <CACRpkdbmnPcDFHu6oLhXQERyFzXD2K1QHH1hRUtci41KuEDdtQ@mail.gmail.com>
References: <35FD53F367049845BC99AC72306C23D103CDBFBFB017@CNBJMBX05.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:46592 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754283AbaIWKV7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Sep 2014 06:21:59 -0400
Received: by mail-ie0-f173.google.com with SMTP id tr6so9056545ieb.4
        for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2014 03:21:58 -0700 (PDT)
In-Reply-To: <35FD53F367049845BC99AC72306C23D103CDBFBFB017@CNBJMBX05.corpusers.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Wang, Yalin" <Yalin.Wang@sonymobile.com>
Cc: "gnurou@gmail.com" <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>

On Tue, Sep 9, 2014 at 9:12 AM, Wang, Yalin <Yalin.Wang@sonymobile.com> wrote:

> this patch change use from irq_create_mapping to irq_alloc_descs_from,
> use irq_create_mapping to alloc virq one by one is not safe,
> it can't promise the allcated virqs are continuous,
> in stead, we use irq_alloc_descs_from() to alloc virqs in one time,
> so that the allocated virqs are in continuous bitmaps.
>
> Signed-off-by: Yalin Wang <yalin.wang@sonymobile.com>

(...)

> -       for (offset = 0; offset < gpiochip->ngpio; offset++) {
> -               irq_base = irq_create_mapping(gpiochip->irqdomain, offset);
> -               if (offset == 0)
> -                       /*
> -                        * Store the base into the gpiochip to be used when
> -                        * unmapping the irqs.
> -                        */
> -                       gpiochip->irq_base = irq_base;
> +       if (first_irq > 0) {
> +               gpiochip->irq_base = first_irq;

Wait is this safe? Now you assume all descriptors are pre-allocated
and associated in this case, atleast explain what is going on.

> +       } else {
> +               gpiochip->irq_base = irq_alloc_descs_from(1, gpiochip->ngpio,
> +                               of_node_to_nid(of_node));
> +               irq_domain_associate_many(gpiochip->irqdomain,
> +                               gpiochip->irq_base, 0, gpiochip->ngpio);

This part looks OK.

I'm holding this patch back until the above is clarified.

Yours,
Linus Walleij
