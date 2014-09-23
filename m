From: "Wang, Yalin" <Yalin.Wang@sonymobile.com>
Subject: RE: [PATCH] gpiolib:change to use irq_alloc_descs_from to alloc
 virqs
Date: Tue, 23 Sep 2014 20:03:18 +0800
Message-ID: <35FD53F367049845BC99AC72306C23D103D6DB4D6F29@CNBJMBX05.corpusers.net>
References: <35FD53F367049845BC99AC72306C23D103CDBFBFB017@CNBJMBX05.corpusers.net>,<CACRpkdbmnPcDFHu6oLhXQERyFzXD2K1QHH1hRUtci41KuEDdtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cnbjrel01.sonyericsson.com ([219.141.167.165]:13912 "EHLO
	cnbjrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751307AbaIWMHp convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 23 Sep 2014 08:07:45 -0400
In-Reply-To: <CACRpkdbmnPcDFHu6oLhXQERyFzXD2K1QHH1hRUtci41KuEDdtQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "gnurou@gmail.com" <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>

hi 

this is because , here:

gpiochip->irqdomain = irq_domain_add_simple(of_node,
					gpiochip->ngpio, first_irq,
					&gpiochip_domain_ops, gpiochip);


 irq_domain_add_simple() in this function,
 	if (first_irq > 0) {
		if (IS_ENABLED(CONFIG_SPARSE_IRQ)) {
			/* attempt to allocated irq_descs */
			int rc = irq_alloc_descs(first_irq, first_irq, size,
					of_node_to_nid(of_node));
			if (rc < 0)
				pr_info("Cannot allocate irq_descs @ IRQ%d, assuming pre-allocated\n",
						first_irq);
		}
		irq_domain_associate_many(domain, first_irq, 0, size);
	}

if first_irq  > 0 , it will allocate it ,
and make sure the return virq is equal to first_irq  .
so we don't need allocate it again .
________________________________________
From: Linus Walleij [linus.walleij@linaro.org]
Sent: Tuesday, September 23, 2014 6:21 PM
To: Wang, Yalin
Cc: gnurou@gmail.com; linux-gpio@vger.kernel.org; akpm@linux-foundation.org
Subject: Re: [PATCH] gpiolib:change to use irq_alloc_descs_from to alloc virqs

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