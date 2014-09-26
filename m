From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpiolib: irqchip: use irq_find_mapping while removing irqchip
Date: Fri, 26 Sep 2014 10:40:41 +0200
Message-ID: <CACRpkdZ+i+D85630WdWy12eyDZ9M1r_HyeL5MJV0PdpBgxj4Dw@mail.gmail.com>
References: <1411661364-19620-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179]:41323 "EHLO
	mail-ig0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753738AbaIZIkm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Sep 2014 04:40:42 -0400
Received: by mail-ig0-f179.google.com with SMTP id l13so9879605iga.6
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2014 01:40:41 -0700 (PDT)
In-Reply-To: <1411661364-19620-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "Wang, Yalin" <Yalin.Wang@sonymobile.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Sep 25, 2014 at 6:09 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> There is no guarantee that VIRQs will be allocated sequentially
> for gpio irqchip in gpiochip_irqchip_add().
> Therefore, it's unsafe to dispose VIRQ in gpiochip_irqchip_remove()
> basing on index relatively to stored irq_base value.
>
> Hence, use irq_find_mapping for VIRQ finding  in gpiochip_irqchip_remove()
> instead of irq_base + index.
>
> Reported-by: Wang, Yalin <Yalin.Wang@sonymobile.com>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
