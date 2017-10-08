From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFT PATCH v2] gpiolib: allow gpio irqchip to map irqs dynamically
Date: Sun, 8 Oct 2017 02:27:56 +0200
Message-ID: <CACRpkdZVSXtj31stVo6QvQ05LN43nEVj_1BccrebbcT7Ee24-A@mail.gmail.com>
References: <20170721164900.7070-1-grygorii.strashko@ti.com> <20170928083348.GI4630@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:56051 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753187AbdJHA15 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Oct 2017 20:27:57 -0400
Received: by mail-io0-f175.google.com with SMTP id z187so18749416ioz.12
        for <linux-gpio@vger.kernel.org>; Sat, 07 Oct 2017 17:27:57 -0700 (PDT)
In-Reply-To: <20170928083348.GI4630@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Chris Gorman <chrisjohgorman@gmail.com>

On Thu, Sep 28, 2017 at 10:33 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Fri, Jul 21, 2017 at 11:49:00AM -0500, Grygorii Strashko wrote:
>> Now IRQ mappings are always created for all (allowed) GPIOs in gpiochip in
>> gpiochip_irqchip_add_key() which goes against the idea of SPARSE_IRQ and,
>> as result, leads to:
>>  - increasing of memory consumption for IRQ descriptors most of which will
>> never ever be used (espessially on platform with a high number of GPIOs).
>> (sizeof(struct irq_desc) == 256 on my tested platforms)
>>  - imposibility to use GPIO irqchip APIs by gpio drivers when HW implements
>> GPIO IRQ functionality as IRQ crossbar/router which has only limited
>> number of IRQ outputs (example from [1], all GPIOs can be mapped on only 8
>> IRQs).
>>
>> Hence, remove static IRQ mapping code from gpiochip_irqchip_add_key() and
>> instead replace irq_find_mapping() with irq_create_mapping() in
>> gpiochip_to_irq(). Also add additional gpiochip_irqchip_irq_valid() calls
>> in gpiochip_to_irq() and gpiochip_irq_map().
>>
>> After this change gpio2irq mapping will happen the following way when GPIO
>> irqchip APIs are used by gpio driver:
>>  - IRQ mappings will be created statically if driver passes first_irq>0
>> vlaue in gpiochip_irqchip_add_key().
>>  - IRQ mappings will be created dynamically from gpio_to_irq() or
>> of_irq_get().
>>
>> Tested on am335x-evm and dra72-evm-revc.
>> - dra72-evm-revc: number of created irq mappings decreased from 402 -> 135
>>   Mem savings 267*256 = 68352 (66kB)
>> - am335x-evm: number of created irq mappings decreased from 188 -> 63
>>   Mem savings 125*256 = 32000 (31kB)
>>
>> [1] https://lkml.org/lkml/2017/6/15/428
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>
> Hi Grygorii,
>
> It looks like dc749a09ea5e41 ("gpiolib: allow gpio irqchip to map irqs
> dynamically") broke the quirk we added for some Intel Cherryview
> systems [1]. Basically after this keyboard of those systems stopped
> working again.

It seems like we need to revert this change.

I have also noted the following:

-       /*
-        * Prepare the mapping since the irqchip shall be orthogonal to
-        * any gpiochip calls. If the first_irq was zero, this is
-        * necessary to allocate descriptors for all IRQs.
-        */
-       for (offset = 0; offset < gpiochip->ngpio; offset++) {
-               if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
-                       continue;
-               irq_base = irq_create_mapping(gpiochip->irqdomain, offset);
-               if (!irq_base_set) {
-                       /*
-                        * Store the base into the gpiochip to be used when
-                        * unmapping the irqs.
-                        */
-                       gpiochip->irq_base = irq_base;
-                       irq_base_set = true;
-               }

Note assignment of gpiochip->irq_base.

A whole slew of drivers use this.

We cannot merge a change like this without also fixing all the users
of .irq_base, as it will cause regressions on them.

Yours,
Linus Walleij
