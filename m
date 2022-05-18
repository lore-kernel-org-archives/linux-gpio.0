Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94923C433F5
	for <linux-gpio@archiver.kernel.org>; Wed, 18 May 2022 10:06:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234902AbiERKGj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 18 May 2022 06:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235066AbiERKGR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 May 2022 06:06:17 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90BC11269BA;
        Wed, 18 May 2022 03:06:16 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id c10so2338957edr.2;
        Wed, 18 May 2022 03:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rsE4Tl7i5xII0f4A8mtGtiedwAGVAYJZJy1T+vifEko=;
        b=MZZDoLigjDS6l0mjpmpzQGD+t6bm9UdRnzphcWXQxJAjaRlLYbc84tdgsWnmgBF+P/
         RzRHzUf1EoUn1sKvfNkh4XyszD7q1+89OU9RtyINg8Eo9O5Ho7FqKbuwlZGp4wTZavKt
         6VzmqKjkGSdTc8wJ0lw8dXWtj95ovWy1vmKXslZz1TpLajokhYgHef41cv/3T45CY3uh
         rDK6VDr38tYAuIzgSoFujF3t53xXh9N5NJ6QqhZtlJ4B21Q+r5lPFQ5Cbooi5e9+yV47
         2+EhsHH75dnHL+C0R71JR0lZKcS9epwafwHh7RDlwz+ocR7UO9titjK0+E4XxFOxHjPg
         ojNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rsE4Tl7i5xII0f4A8mtGtiedwAGVAYJZJy1T+vifEko=;
        b=MtEFqwadMW5dp1XVdl6NhNS9jS6jNCjd+s1zvteBLyZ3Q+3aCy9zzcrcMNpqKrRpoD
         jko2ZIbYTI0OXWB+EeXyff5q1PJ2N8WIl/611GUIyX6eFEEIOhiMwzViTXVc8++J/Dbp
         HsQRVYKWydtkPWzGlQU8Qt2hUbegAi2QW0R6GKIMdhwuzBWN1O/IYPvfbp888J1c+fG3
         VZL/db4aR9DvUb7UQgksAdqZzjgjrL9cevUAkO4/9Agw87JMxww3WR1kMMyDZEgxumrQ
         Ltn91akiCdZAP1LJKjnN1L5MiQH98vzS1jd12EIdurREXc9CsarYtbLN9+h/6hJnD6FQ
         HhRg==
X-Gm-Message-State: AOAM5304JQIHopf7JGdcnvh4zYKw1eCz42uqjVmUAjfBkdulljIwikqP
        5X3jmobwsQTMTewxhQHT6lKSrnkKPAFd30tjTSI=
X-Google-Smtp-Source: ABdhPJzpfOJUShTW+ij0srRsACcXvU8BTYtIl3tH/PYey5DAT44V7zGl9fCMsqDbUcTqNsUVHlv40suxK7dno/qs0jM=
X-Received: by 2002:aa7:d911:0:b0:42a:af69:e167 with SMTP id
 a17-20020aa7d911000000b0042aaf69e167mr16407964edr.54.1652868374909; Wed, 18
 May 2022 03:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220517163820.86768-1-andriy.shevchenko@linux.intel.com>
 <YoR/QXuS+VlLVWto@lahna> <YoSyTq2908EptTGd@smile.fi.intel.com> <YoS6EkfU1TdggKS/@lahna>
In-Reply-To: <YoS6EkfU1TdggKS/@lahna>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 18 May 2022 12:05:38 +0200
Message-ID: <CAHp75VenknSRSUkGj9rKfzw2q1Mm-+zRrzAmcYRLdK1GJHDoHw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: intel: make irq_chip immutable
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 18, 2022 at 11:19 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Wed, May 18, 2022 at 11:46:06AM +0300, Andy Shevchenko wrote:
> > On Wed, May 18, 2022 at 08:08:17AM +0300, Mika Westerberg wrote:
> > > On Tue, May 17, 2022 at 07:38:19PM +0300, Andy Shevchenko wrote:
> > > > +static const struct irq_chip intel_gpio_irq_chip = {
> > > > + .name           = "intel-gpio",
> > > > + .irq_ack        = intel_gpio_irq_ack,
> > > > + .irq_mask       = intel_gpio_irq_mask,
> > > > + .irq_unmask     = intel_gpio_irq_unmask,
> > > > + .irq_set_type   = intel_gpio_irq_type,
> > > > + .irq_set_wake   = intel_gpio_irq_wake,
> > > > + .flags          = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE,
> > > > + GPIOCHIP_IRQ_RESOURCE_HELPERS,
> > > > +};
> > >
> > > You still have the inconsistent alignment here.
> >
> > I'm not sure what problem do you see.
>
> I mean the tab alignment you use:
>
>         .name           = "intel-gpio",
>         .irq_ack        = intel_gpio_irq_ack,
>         .irq_mask       = intel_gpio_irq_mask,
>         .irq_unmask     = intel_gpio_irq_unmask,
>         .irq_set_type   = intel_gpio_irq_type,
>         .irq_set_wake   = intel_gpio_irq_wake,
>
> All the other struct initializations in the driver use this style (and I
> prefer it too):
>
>         .name = "intel-gpio",
>         .irq_ack = intel_gpio_irq_ack,
>         .irq_mask = intel_gpio_irq_mask,
>         .irq_unmask = intel_gpio_irq_unmask,
>         .irq_set_type = intel_gpio_irq_type,
>         .irq_set_wake = intel_gpio_irq_wake,
>
> Hope this explains.

Yes, thanks!

Okay, can you give your conditional Ack if there are no other
comments? I will fix it locally.

-- 
With Best Regards,
Andy Shevchenko
