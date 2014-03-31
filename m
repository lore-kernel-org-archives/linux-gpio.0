From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: unmap gpio irqs properly
Date: Mon, 31 Mar 2014 08:58:30 +0200
Message-ID: <CACRpkdZ9=tUg62Au3MNyamT4QgYzFDsA11_o_0VADa=4to0=Zw@mail.gmail.com>
References: <1396035858-23758-1-git-send-email-linus.walleij@linaro.org>
	<CAAVeFu+Z33toX=ye7yncE+HhsymKO114QtD_OZsACDQdm69N=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:45294 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751854AbaCaG6a (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Mar 2014 02:58:30 -0400
Received: by mail-ob0-f170.google.com with SMTP id uz6so8688435obc.15
        for <linux-gpio@vger.kernel.org>; Sun, 30 Mar 2014 23:58:30 -0700 (PDT)
In-Reply-To: <CAAVeFu+Z33toX=ye7yncE+HhsymKO114QtD_OZsACDQdm69N=g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Sat, Mar 29, 2014 at 5:27 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Sat, Mar 29, 2014 at 4:44 AM, Linus Walleij <linus.walleij@linaro.org> wrote:

>> +static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
>> +{
>> +#ifdef CONFIG_ARM
>> +       set_irq_flags(irq, 0);
>> +#endif
>
> Just curious here, why is a special case needed for ARM? I would not
> expect architecture-specific code on gpiolib, but I'm sure you have
> your reasons for that.

This is open-coded like this in all ARM-applicable drivers so I'm
just refactoring really.

I don't really know why but I was under the impression that this
ARM-specific function exists because the IRQ implementations in
the different archs have never really converged.

Yours,
Linus Walleij
