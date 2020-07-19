Return-Path: <SRS0=Wf+k=A6=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38290C433DF
	for <linux-gpio@archiver.kernel.org>; Sun, 19 Jul 2020 16:34:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08256208B3
	for <linux-gpio@archiver.kernel.org>; Sun, 19 Jul 2020 16:34:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xCZVf2Dm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgGSQeh (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 19 Jul 2020 12:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgGSQeg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Jul 2020 12:34:36 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEAD7C0619D2
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2020 09:34:36 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id k7so7309749vso.2
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2020 09:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s6r98q2ynb+5ExTfukADiWvI04wnKRnstSenMP2+KI8=;
        b=xCZVf2DmDmaWXIzYm0+ZV8awOGMODqgWIZDCGyBkiFDXCXgl8Io1MNSJUVTrq+be10
         dVSggN97MvlQXWWyr2e4rutdGpso+3Jnvcp92ishcNNfaSY6ntKYsxC2qzZw3B1c3VLh
         Zm20CDVFvoanxiSZf3yRGqaDvqCTZSFAFgiRo1zuX+xCR0dmvs/cHaxZqr4bHdj+bBob
         SEQdDJacCIIaos/PXvYLy5HZ9lW7a8O1pLiMx3Wk9leCJVz7z1XKnB0nC7cJPmEWECp4
         V5xrPz4j7ZSay+p69NXcEfDjMFtOXNzTNUEM+gSxrYFHcRlV3WXxnOgLw9IK1kO47ksk
         8kOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s6r98q2ynb+5ExTfukADiWvI04wnKRnstSenMP2+KI8=;
        b=d8HqRcQ5rw/DdCXdjJaM94NibFo2RoKQijD3vGtdGuKCM3Z26QFBVaj8YB2g1WqZDj
         GbdP4/07ER+54f1TMzMLg6GtI1k7+klNIb0eLUuGWGYai1ZX54IJrmNVuD4iZZyLpBNz
         olaOVY/hNlJ+UGkTJ3Bn2hSmf+BH3L+J+QMOMsTqmhEOZrU3O4lBECvsF5jy5+CSCocA
         4wDl0DquasdaJqvOjgcLdvIMcyyl3mbRE1Qvyi8fjmSJtO7G3NucSNjrdyc1Z9RgQFyL
         EjY4wcm1bRwbjw7qNaLMzoh8/CPukVGrCJKo9kBqoOOKyTJo/NvMISBhQIVJldTC82hd
         A/cA==
X-Gm-Message-State: AOAM53058eT00RzH9QuHEIK0ZCssjY3dM6Sida2a44DvRlchKTW0NLDg
        JLQegg/5H836CN2/Qr5ZzurKAiLBDyt/Xu0fAtctv316z68=
X-Google-Smtp-Source: ABdhPJzIhVw2a/5aPEbj/V8jWngCnnjRQfnq732djKOdF3BIG1fuYVcnJgeYcz0RPQnz28U/l9LBfVluH2jiutFcaxU=
X-Received: by 2002:a67:c997:: with SMTP id y23mr13005092vsk.90.1595176475794;
 Sun, 19 Jul 2020 09:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200717141924.57887-1-linus.walleij@linaro.org>
In-Reply-To: <20200717141924.57887-1-linus.walleij@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sun, 19 Jul 2020 19:34:23 +0300
Message-ID: <CAPLW+4kX_1YNDNNeqzQGHZmnr0PYKHsrN++jw9-jOYv6Da3UuQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: max732x: Use irqchip template
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Fri, 17 Jul 2020 at 17:19, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This makes the driver use the irqchip template to assign
> properties to the gpio_irq_chip instead of using the
> explicit calls to gpiochip_irqchip_add_nested() and
> gpiochip_set_nested_irqchip(). The irqchip is instead
> added while adding the gpiochip.
>
> Cc: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

I can test it on my MAX7325 board with BeagleBone Black in a day or
two. Do you want me to verify your patch on top of linux-mainline or
linux-next? Also, is there any specific stuff you want me to look at,
or making sure there are no regressions w.r.t. IRQ from the chip is
enough?

Thanks!

>  drivers/gpio/gpio-max732x.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
> index 63472f308857..347415344a20 100644
> --- a/drivers/gpio/gpio-max732x.c
> +++ b/drivers/gpio/gpio-max732x.c
> @@ -503,6 +503,8 @@ static int max732x_irq_setup(struct max732x_chip *chip,
>
>         if (((pdata && pdata->irq_base) || client->irq)
>                         && has_irq != INT_NONE) {
> +               struct gpio_irq_chip *girq;
> +
>                 if (pdata)
>                         irq_base = pdata->irq_base;
>                 chip->irq_features = has_irq;
> @@ -517,19 +519,17 @@ static int max732x_irq_setup(struct max732x_chip *chip,
>                                 client->irq);
>                         return ret;
>                 }
> -               ret =  gpiochip_irqchip_add_nested(&chip->gpio_chip,
> -                                                  &max732x_irq_chip,
> -                                                  irq_base,
> -                                                  handle_simple_irq,
> -                                                  IRQ_TYPE_NONE);
> -               if (ret) {
> -                       dev_err(&client->dev,
> -                               "could not connect irqchip to gpiochip\n");
> -                       return ret;
> -               }
> -               gpiochip_set_nested_irqchip(&chip->gpio_chip,
> -                                           &max732x_irq_chip,
> -                                           client->irq);
> +
> +               girq = &chip->gpio_chip.irq;
> +               girq->chip = &max732x_irq_chip;
> +               /* This will let us handle the parent IRQ in the driver */
> +               girq->parent_handler = NULL;
> +               girq->num_parents = 0;
> +               girq->parents = NULL;
> +               girq->default_type = IRQ_TYPE_NONE;
> +               girq->handler = handle_simple_irq;
> +               girq->threaded = true;
> +               girq->first = irq_base; /* FIXME: get rid of this */
>         }
>
>         return 0;
> --
> 2.26.2
>
