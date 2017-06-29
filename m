From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: about the need to manage irq mapping dynamically.
Date: Thu, 29 Jun 2017 16:14:17 +0200
Message-ID: <CACRpkdZfvGm+sy+B2wsuw5TfD57h9cTJc7ii=1Q1DEuMxNk_8A@mail.gmail.com>
References: <1497543642.3086.35.camel@baylibre.com> <CACRpkdZWw_-joPT4CJ-RAJ31s4BxuE6vusjg5YnZWaHtkRg5+w@mail.gmail.com>
 <1497954416.7387.1.camel@baylibre.com> <CACRpkdZu74aAsu8hggxsfffQPMk0nqihCSfuMaMbf+-4EFSYYA@mail.gmail.com>
 <1497979438.7387.10.camel@baylibre.com> <CACRpkdZ2cqUgMwOFG+9JVyAOxYTfHYa3+yrUzUozLpYD87KdOQ@mail.gmail.com>
 <1498141515.7387.16.camel@baylibre.com> <0e12f9bd-4e0b-c602-5627-5dbda5371dee@ti.com>
 <1498587929.25567.12.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:38294 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753115AbdF2OOU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2017 10:14:20 -0400
Received: by mail-it0-f43.google.com with SMTP id k192so7805073ith.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2017 07:14:19 -0700 (PDT)
In-Reply-To: <1498587929.25567.12.camel@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Linux Kernel <linux-kernel@vger.kernel.org>

On Tue, Jun 27, 2017 at 8:25 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> At the time Linus strongly rejected the idea of calling  irq_create_mapping (or
> any sleeping functions) in gpio_to_irq: please see the reply from Oct 26, 2016
> (sorry for quoting such an old discussion but this is really the starting point)
>
> * Me: There is really a *lot* of gpio drivers which use irq_create_mapping in
> the to_irq callback, are these all wrong ?
> * Linus: Yes they are all wrong. They should all be using irq_find_mapping().
>
> * Me: If this should not be used, what should we all do instead ?
> * Linus: Call irq_create_mapping() in some other place.
>
> gpio_prepare_irq is a proposition for this 'other place'.

There is a misunderstanding here.

I wrote (at the time):

> Yes, but you want to call irq_create_mapping() in slowpath (irq setup)
> and irq_find_mapping() in fastpath (irq handler). Else the first IRQ
> may result in unwelcomed surprises.

This does not mean that irq_create_mapping() cannot be called
in irq context because I think it can.

What it means is that I think that is suboptimal from a performance
point of view if called from gpio_to_irq(), because nominally, at this
point, the mapping should already exist, since the GPIO and IRQ
frameworks are orthogonal.

But that may not apply to the case with many-to-few interrupt
mappings... so I think I was in some 1-to-1-mapping context
when I wrote this. Sorry :(

So I changed my mind, it is fine for this type of driver to call
irq_create_mapping() in gpio_to_irq(). Preferably with some comment
around the call.

It remains to see what happens if gpio_to_irq() would fail, as can
happen in this case. Like if gpio_to_irq() would return 0 (NO_IRQ)
or something negative. I think many drivers are not equipped for
handling this.

So I guess if you could change the semantics of all drivers
calling gpio_to_irq() to also handle say 0 as an error and bail
out, we can call irq_create_mapping() in gpio_to_irq().

Sorry if I'm confused... or confusing.

Yours,
Linus Walleij
