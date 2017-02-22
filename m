From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v2] gpio: pl061: use all specified IRQs for chained
 handler
Date: Wed, 22 Feb 2017 13:57:30 +0100
Message-ID: <7e183e70-50e0-61ed-6b33-e691046df725@nokia.com>
References: <20170222123049.17588-1-alexander.sverdlin@nokia.com>
 <CACRpkdZpYzpMDWqJobSYH=JHgB74HbCQihOtexs+sVyo6SRJdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-eopbgr00138.outbound.protection.outlook.com ([40.107.0.138]:64230
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754202AbdBVM6L (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Feb 2017 07:58:11 -0500
In-Reply-To: <CACRpkdZpYzpMDWqJobSYH=JHgB74HbCQihOtexs+sVyo6SRJdA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?B?U8WCYXdvbWlyIFN0xJlwaWXFhA==?= <slawomir.stepien@nokia.com>

Hi!

On 22/02/17 13:47, Linus Walleij wrote:
>> There are several implementations of PL061 which lack GPIOINTR signal in
>> hardware and only have individual GPIOMIS[7:0] interrupts. It's possible
>> to support these variants with minimal changes to the driver just
>> requesting all these IRQs for the same chained handler. While the solution
>> seems to be suboptimal, this is just a quirk for some particular IPs.
>>
>> Power Management (wakeup) is not expected to work with these IPs. Only the
>> basic GPIO functionality.
>>
>> One in-tree example is arch/arm/boot/dts/axm55xx.dtsi, pl061 instances have
>> 8 IRQs defined, but current driver supports only the first one, so only one
>> pin would work as IRQ trigger.
>>
>> Reported-by: Sławomir Stępień <slawomir.stepien@nokia.com>
>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>> Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Alexandre Courbot <gnurou@gmail.com>
>> Cc: linux-gpio@vger.kernel.org
>> Cc: Sławomir Stępień <slawomir.stepien@nokia.com>
>> ---
>> Changes since v1:
>> - Added AMBA_NR_IRQS loop limit
> Nice in a way, but is this really what we want to do?
> 
> This means that the platform has assigned individual IRQs to
> all of the lines and no IRQ to the accumulated IRQ GPIOINTR
> if I understand it correctly.
> 
> In that case these IRQs are 1-to-1 and should be modeled using
> a hierarchical irqdomain, because the loop in pl061_irq_handler()
> is unnecessary, we already know which IRQ line has been fired,
> right?
> 
> I think we need to add a mechanism in the gpiolib core to handle
> also hierarchical irqdomains and this is a good opportunity.
> 
> I would make a patch that:
> 
> - If the device has 1 IRQ line, assume it is GPIOINTR and work
>   as before.
> 
> - If the component has 8 IRQ lines, create a hierarchical IRQdomain
>   and chip using a gpiolib core helper.

This was an option of course, the only this is, PL061 spec says, there is
GPIOINTR and if someone has forgot it, we can support it with a quirk.
It's not specified to work this way at all, so why spend any resources
and add second implementation to the driver?

But if you are sure it's the way to go -- I can provide another patch, as
I do not have strong opinion on this story.

> - If not 1 or 8 lines, bail out with an error.

Well, I'd divide it into "1" and "!= 1" cases... Who knows, maybe
only 4 GPIOs will be implemented...

-- 
Best regards,
Alexander Sverdlin.
