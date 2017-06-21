From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: about the need to manage irq mapping dynamically.
Date: Wed, 21 Jun 2017 22:50:14 +0200
Message-ID: <CACRpkdZ2cqUgMwOFG+9JVyAOxYTfHYa3+yrUzUozLpYD87KdOQ@mail.gmail.com>
References: <1497543642.3086.35.camel@baylibre.com> <CACRpkdZWw_-joPT4CJ-RAJ31s4BxuE6vusjg5YnZWaHtkRg5+w@mail.gmail.com>
 <1497954416.7387.1.camel@baylibre.com> <CACRpkdZu74aAsu8hggxsfffQPMk0nqihCSfuMaMbf+-4EFSYYA@mail.gmail.com>
 <1497979438.7387.10.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:35711 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751028AbdFUUuQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jun 2017 16:50:16 -0400
Received: by mail-io0-f179.google.com with SMTP id h134so3047668iof.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jun 2017 13:50:16 -0700 (PDT)
In-Reply-To: <1497979438.7387.10.camel@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Linux Kernel <linux-kernel@vger.kernel.org>

On Tue, Jun 20, 2017 at 7:23 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Tue, 2017-06-20 at 18:37 +0200, Linus Walleij wrote:

>> Eventually gpio_to_irq() should be DELETED and replaced in full with
>> the prepare/unprepare calls.
>
> Woahh, that's not what I meant. gpio_to_irq should stay. Getting rid of it would
> be a mess and it is a useful call.
>
> The gpio_irq_prepare is meant so that the consumer can tell the gpio driver it
> will want to get irq from a particular gpio at some point.
>
> IOW, it's the consumer saying to the gpio driver "please do whatever you need to
> do, if anything, so this gpio can generate an interrupt"
>
> This is a much simpler change. Using devm, all we need is to put a
> devm_gpio_irq_prepare(<gpio_num>) in the probe of the drivers using gpio_to_irq.
>
> Mandating call to gpio_irq_prepare before any call to gpio_to_irq will be fairly
> easy.

So why can't we just return the IRQ from prepare() and be done with it
instead of having two calls? (Plus a third eventual unprepare()).

Clocks, regulators and godknowswhat is managed by two symmetrical
calls, so why shouldn't GPIO IRQs be?

It would be counterintuitive to have a third call in the middle.

Yours,
Linus Walleij
