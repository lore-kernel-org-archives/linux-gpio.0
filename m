From: Quan Nguyen <qnguyen@apm.com>
Subject: Re: [PATCH] gpio: xgene: Fix kconfig for standby GIPO contoller
Date: Tue, 8 Mar 2016 11:43:41 +0700
Message-ID: <CAFopSPSr=+106qP+1ju+sYE9A2OK_NMYRrzVHOE6E=NMfQFQNg@mail.gmail.com>
References: <1457091732-21924-1-git-send-email-mbrugger@suse.com>
	<CACRpkda=EnW8h5Ungh8mybes3usCL28RRyMP5etuq_mQUG_3NQ@mail.gmail.com>
	<56DD5C25.3070702@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f45.google.com ([209.85.213.45]:34003 "EHLO
	mail-vk0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753231AbcCHEnm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Mar 2016 23:43:42 -0500
Received: by mail-vk0-f45.google.com with SMTP id e185so4470191vkb.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Mar 2016 20:43:42 -0800 (PST)
In-Reply-To: <56DD5C25.3070702@suse.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Matthias Brugger <mbrugger@suse.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Mar 7, 2016 at 5:47 PM, Matthias Brugger <mbrugger@suse.com> wrote:
>
>
> On 07/03/16 08:41, Linus Walleij wrote:
>>
>> On Fri, Mar 4, 2016 at 6:42 PM, Matthias Brugger <mbrugger@suse.com>
>> wrote:
>>
>>> The standby GPIO controller can be used as a interrupt controller.
>>> Select GPIOLIB_IRQCHIP when compiling this driver. Otherwise we get
>>> a compilation error:
>>>
>>> drivers/gpio/gpio-xgene-sb.c: In function 'xgene_gpio_sb_probe':
>>> drivers/gpio/gpio-xgene-sb.c:312:10: error: 'struct gpio_chip' has no
>>> member named 'irqdomain'
>>>    priv->gc.irqdomain = priv->irq_domain;
>>>            ^
>>> scripts/Makefile.build:295: recipe for target
>>> 'drivers/gpio/gpio-xgene-sb.o' failed
>>> make[2]: *** [drivers/gpio/gpio-xgene-sb.o] Error 1
>>>
>>> Apart if compiled as module, we get the following modpost errors:
>>> ERROR: "irq_chip_eoi_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
>>> ERROR: "irq_chip_unmask_parent" [drivers/gpio/gpio-xgene-sb.ko]
>>> undefined!
>>> ERROR: "irq_chip_mask_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
>>> ERROR: "irq_domain_create_hierarchy" [drivers/gpio/gpio-xgene-sb.ko]
>>> undefined!
>>> ERROR: "gpiochip_get_data" [drivers/gpio/gpio-xgene-sb.ko] undefined!
>>> ERROR: "irq_chip_set_type_parent" [drivers/gpio/gpio-xgene-sb.ko]
>>> undefined!
>>> ERROR: "irq_domain_alloc_irqs_parent" [drivers/gpio/gpio-xgene-sb.ko]
>>> undefined!
>>> ERROR: "irq_domain_set_hwirq_and_chip" [drivers/gpio/gpio-xgene-sb.ko]
>>> undefined!
>>> ERROR: "irq_domain_reset_irq_data" [drivers/gpio/gpio-xgene-sb.ko]
>>> undefined!
>>>
>>> This patch changes the kconfig so that the gpio controller can only be
>>> build-in and selects GPIOLIB_IRQCHIP.
>>>
>>> Fixes: 1013fc41 "gpio: xgene: Enable X-Gene standby GPIO as interrupt
>>> controller"
>>> Cc: Quan Nguyen <qnguyen@apm.com>
>>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>>> ---
>>>
>>> Changes for v2:
>>> - Add modprobe fix, changing tristate to bool
>>> - Add Cc tag
>>
>>
>> Quan has sent a patch exporting the offending functions, but no reply from
>> the irqchip maintainers yet.
>>
>> If they don't react we'll have to merge this and handle the module loading
>> later.
>>
>
> Thanks for the info.
>
> Just as a heads up, this patch fix two problems. Apart from the missing
> exports for the irqchip functions, it selects GPIOLIB_IRQCHIP as otherwise
> the config may be broken.
>
> Actually v1 of this patch just fixes this:
> https://patchwork.kernel.org/patch/8502401/

Hi Matthias,
I have acked your v1 as it helps fixing compile error if
CONFIG_GPIOLIB_IRQCHIP missing.
I also agreed with Linus on your v2.
Hence, I only acked the v2 patch if my patch
(https://lkml.org/lkml/2016/3/3/497) missed the merge windows as this
drivers can actually work as a module.

>
> Regards,
> Matthias
