From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [RFC] gpio: about the need to manage irq mapping dynamically.
Date: Thu, 22 Jun 2017 16:25:15 +0200
Message-ID: <1498141515.7387.16.camel@baylibre.com>
References: <1497543642.3086.35.camel@baylibre.com>
         <CACRpkdZWw_-joPT4CJ-RAJ31s4BxuE6vusjg5YnZWaHtkRg5+w@mail.gmail.com>
         <1497954416.7387.1.camel@baylibre.com>
         <CACRpkdZu74aAsu8hggxsfffQPMk0nqihCSfuMaMbf+-4EFSYYA@mail.gmail.com>
         <1497979438.7387.10.camel@baylibre.com>
         <CACRpkdZ2cqUgMwOFG+9JVyAOxYTfHYa3+yrUzUozLpYD87KdOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f171.google.com ([209.85.128.171]:34604 "EHLO
        mail-wr0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751095AbdFVOZT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Jun 2017 10:25:19 -0400
Received: by mail-wr0-f171.google.com with SMTP id 77so25789076wrb.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2017 07:25:18 -0700 (PDT)
In-Reply-To: <CACRpkdZ2cqUgMwOFG+9JVyAOxYTfHYa3+yrUzUozLpYD87KdOQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Linux Kernel <linux-kernel@vger.kernel.org>

On Wed, 2017-06-21 at 22:50 +0200, Linus Walleij wrote:
> On Tue, Jun 20, 2017 at 7:23 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> > On Tue, 2017-06-20 at 18:37 +0200, Linus Walleij wrote:
> > > Eventually gpio_to_irq() should be DELETED and replaced in full with
> > > the prepare/unprepare calls.
> > 
> > Woahh, that's not what I meant. gpio_to_irq should stay. Getting rid of it
> > would
> > be a mess and it is a useful call.
> > 
> > The gpio_irq_prepare is meant so that the consumer can tell the gpio driver
> > it
> > will want to get irq from a particular gpio at some point.
> > 
> > IOW, it's the consumer saying to the gpio driver "please do whatever you
> > need to
> > do, if anything, so this gpio can generate an interrupt"
> > 
> > This is a much simpler change. Using devm, all we need is to put a
> > devm_gpio_irq_prepare(<gpio_num>) in the probe of the drivers using
> > gpio_to_irq.
> > 
> > Mandating call to gpio_irq_prepare before any call to gpio_to_irq will be
> > fairly
> > easy.
> 
> So why can't we just return the IRQ from prepare() and be done with it

We can return it here as well, it's actually a good idea. New drivers could just
use that one if they are keeping track of the irq number.

> instead of having two calls? (Plus a third eventual unprepare()).
> 
> Clocks, regulators and godknowswhat is managed by two symmetrical
> calls, so why shouldn't GPIO IRQs be?

The approach is exactly the same as what we trying to follow in the irq
framework:

framework     | irq                 | gpio
-----------------------------------------------------
index         | hwirq               | gpio_num
creation      | irq_create_mapping  | gpio_irq_prepare   ?
removal       | irq_dispose_mapping | gpio_irq_unprepare ?
(fast) lookup | irq_find_mapping    | gpio_to_irq

We are going to have at lookup function somehow, why not expose it ?

Another reason for keeping gpio_to_irq is that many existing drivers using the
callback don't keep track of their irq number, just the gpio. For every irq
operation, they call gpio_to_irq. Things like this:

* irq_enable(gpio_to_irq(<gpio_num>))
* irq_release(gpio_to_irq(<gpio_num>))
* etc ...

It's a bit lazy maybe, but I don't think there is anything utterly wrong with
it.

Getting rid of gpio_to_irq would mean reworking all those drivers so they keep
track of their irq number. I think this would be a mess for a very little gain.

Also, except for the 26 gpio drivers I have listed, the rest should already be
implementing what qualify as a "lookup" function in gpio_to_irq. I don't think
we should by modifying every single gpio driver when there is a solution to
'surgically' address the matter.

The series would already affect a significant amount of drivers, I'm trying to
keep it as simple an contained as possible.

If that is OK with you, I could send an RFC implementing the idea but fixing
only 1 gpio driver and 2 or 3 consumer. We would have actual code to discuss on,
it might be easier. 

> 
> It would be counterintuitive to have a third call in the middle.
> 
> Yours,
> Linus Walleij

