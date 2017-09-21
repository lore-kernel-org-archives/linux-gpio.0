From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFT PATCH v2] gpiolib: allow gpio irqchip to map irqs dynamically
Date: Thu, 21 Sep 2017 13:41:45 +0200
Message-ID: <CACRpkdZAJ1c6VyHA+2P6P4GaMY51q-ANc2NLF_2o4atzz2mqrg@mail.gmail.com>
References: <20170721164900.7070-1-grygorii.strashko@ti.com>
 <CACRpkdbFVV669PxGDXO9Xzf-jj0sEKyQTvhdLMA_of16wBp7PQ@mail.gmail.com>
 <1501574614.2759.9.camel@baylibre.com> <835101ba-e5d5-fd5e-e0c2-06001d02f850@ti.com>
 <1505463960.16701.37.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:55819 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751754AbdIULlr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2017 07:41:47 -0400
Received: by mail-it0-f51.google.com with SMTP id 4so246043itv.4
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2017 04:41:46 -0700 (PDT)
In-Reply-To: <1505463960.16701.37.camel@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh@kernel.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Sep 15, 2017 at 10:26 AM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> I initially planned to do some refcounting in the gpio layer but that would make
> no sense, as you pointed out, the irq could be shared. This refcounting would
> only make sense at the irq level.
>
> On a more general note, I wonder when is it safe for a driver to dispose of the
> mapping of a possibly shared irq ? There is no way to know if the mapping is
> still used somewhere else, or am I missing something again ?

I have no idea, but maybe Marc Z or Rob H knows this?

They usually have a bit of deeper IRQ-centric knowledge.

Yours,
Linus Walleij
