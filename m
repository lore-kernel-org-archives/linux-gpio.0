From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [RFC] gpio: about the need to manage irq mapping dynamically.
Date: Fri, 30 Jun 2017 14:54:37 -0500
Message-ID: <f8495533-b53f-8999-9320-38f18ca7691b@ti.com>
References: <1497543642.3086.35.camel@baylibre.com>
 <CACRpkdZWw_-joPT4CJ-RAJ31s4BxuE6vusjg5YnZWaHtkRg5+w@mail.gmail.com>
 <1497954416.7387.1.camel@baylibre.com>
 <CACRpkdZu74aAsu8hggxsfffQPMk0nqihCSfuMaMbf+-4EFSYYA@mail.gmail.com>
 <1497979438.7387.10.camel@baylibre.com>
 <CACRpkdZ2cqUgMwOFG+9JVyAOxYTfHYa3+yrUzUozLpYD87KdOQ@mail.gmail.com>
 <1498141515.7387.16.camel@baylibre.com>
 <0e12f9bd-4e0b-c602-5627-5dbda5371dee@ti.com>
 <1498587929.25567.12.camel@baylibre.com>
 <657221fa-c6b3-e914-1a81-9a48972ee6d5@ti.com>
 <CACRpkdar9YwnMgLb1y1sP1Vbg-1MgPAOcRPcfNCtmpKuf+g+kQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:33630 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752611AbdF3TzI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2017 15:55:08 -0400
In-Reply-To: <CACRpkdar9YwnMgLb1y1sP1Vbg-1MgPAOcRPcfNCtmpKuf+g+kQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Linux Kernel <linux-kernel@vger.kernel.org>



On 06/29/2017 09:16 AM, Linus Walleij wrote:
> On Tue, Jun 27, 2017 at 10:43 PM, Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
> 
>> And my opinion is still the same here - It should be perfectly valid to create
>> mappings from gpio_to_irq() to handle properly orthogonality of gpiochip and
>> gpio-irqchip functionality and satisfy SPARSE_IRQ goal (allocate Linux virq and
>> irq descriptors on demand).
> 
> You are right.
> 
> I would rather say: GPIO drivers that have a 1-to-1 mapping between GPIO
> lines and IRQs should not do it, they should map up them all at probe().
> 

Sry, can't completely agree here :( There could be 300 (or even thousands)
of gpios and only dozen of them will be used as GPIO IRQ, so statical mapping will
just waste system resources. So, better not define such kind of restrictions -
it seems platform/system specific.

> Drivers that actually have fewer IRQs than GPIO lines should be able to
> create the mappings in gpio_to_irq().

-- 
regards,
-grygorii
