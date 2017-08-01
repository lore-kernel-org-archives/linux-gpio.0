From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [RFT PATCH v2] gpiolib: allow gpio irqchip to map irqs
 dynamically
Date: Tue, 1 Aug 2017 13:27:18 -0500
Message-ID: <835101ba-e5d5-fd5e-e0c2-06001d02f850@ti.com>
References: <20170721164900.7070-1-grygorii.strashko@ti.com>
 <CACRpkdbFVV669PxGDXO9Xzf-jj0sEKyQTvhdLMA_of16wBp7PQ@mail.gmail.com>
 <1501574614.2759.9.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lelnx194.ext.ti.com ([198.47.27.80]:10054 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751327AbdHAS1U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 14:27:20 -0400
In-Reply-To: <1501574614.2759.9.camel@baylibre.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



On 08/01/2017 03:03 AM, Jerome Brunet wrote:
> On Tue, 2017-08-01 at 09:52 +0200, Linus Walleij wrote:
>> On Fri, Jul 21, 2017 at 6:49 PM, Grygorii Strashko
>> <grygorii.strashko@ti.com> wrote:
>>
>>> Now IRQ mappings are always created for all (allowed) GPIOs in gpiochip in
>>> gpiochip_irqchip_add_key() which goes against the idea of SPARSE_IRQ and,
>>> as result, leads to:
>>>   - increasing of memory consumption for IRQ descriptors most of which will
>>> never ever be used (espessially on platform with a high number of GPIOs).
>>> (sizeof(struct irq_desc) == 256 on my tested platforms)
>>>   - imposibility to use GPIO irqchip APIs by gpio drivers when HW implements
>>> GPIO IRQ functionality as IRQ crossbar/router which has only limited
>>> number of IRQ outputs (example from [1], all GPIOs can be mapped on only 8
>>> IRQs).
> 
> Sorry, I forgot to reply to this thread until now.
> This patch is generalization of create mapping in the gpio_to_irq, right ?
> 
> So the issue of mapping left lying around until the gpio driver is unloaded is
> still there ?

Yep. But this should unblock you work and allow to use static boot time IRQ
mappings (if you'll be able to implement irq_domain hierarchy properly). 

> 
> Having gpio_irq_prepare/gpio_irq_unprepare would solve that, I suppose
> (Again, sorry I could not send an RFC for this yet ...)

Sry, but still do not see how it will work :( But hope you might find the way :) 
Few notes to take into account:

There is no way now to know when you can release mappings and when it's safe to do :(,
except when gpio driver is unloaded.

1) drivers using GPIO IRQ directly (no gpio_to_irq() calls). IRQ can be shared.
IRQ mappings will happen in platform_get_irq()/of_irq_get().
Drivers may call request_irq/free_irq() many times using the same Linux IRQ number.
Such drivers, in many cases, do not expect to call any kind of GPIO APIs.

2) drivers using GPIO as IRQ (gpio_to_irq() calls).
IRQ mappings will happen in gpio_to_irq(). Theoretically driver can call
some API to dispose mappings as it knows when its safe to do, but...
The same IRQ still can be used by another driver as shared IRQ.

Note. IRQ mappings have no refcount.

Regarding, your use case - MMC issue can be WA using irq_valid_mask.
(don't blame me it's just WA).

-- 
regards,
-grygorii
