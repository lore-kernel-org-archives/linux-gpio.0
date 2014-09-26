From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC/RFT PATCH 2/2] gpiolib: irqchip: get rid of irq_base
Date: Fri, 26 Sep 2014 10:44:43 +0200
Message-ID: <CACRpkdZSOhNTV5eKB10-=1F-pWOkUmUyo1p04bD+bUW2GK54OA@mail.gmail.com>
References: <1411661364-19620-1-git-send-email-grygorii.strashko@ti.com>
	<1411661364-19620-2-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:65383 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754103AbaIZIoo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Sep 2014 04:44:44 -0400
Received: by mail-ig0-f172.google.com with SMTP id a13so9985901igq.5
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2014 01:44:43 -0700 (PDT)
In-Reply-To: <1411661364-19620-2-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "Wang, Yalin" <Yalin.Wang@sonymobile.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Sep 25, 2014 at 6:09 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> Remove irq_base from struct gpio_chip, as it is seems to
> be unused.
> Aslo, using this field by drivers is unsafe because it's
> uncompatible with Sparse IRQ feature.
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
> Hi Linus,
>
> I've not found users of this field in drivers/gpio/ folder,
> so I've decided to created this patch to get more comments.

Wut?

git grep '>irq_base'
(...)
drivers/gpio/gpio-max732x.c:    return chip->irq_base + off;
drivers/gpio/gpio-ml-ioh.c:     return chip->irq_base + offset;
drivers/gpio/gpio-pch.c:        chip->irq_base = irq_base;
etc etc

Yours,
Linus Walleij
