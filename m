From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xgene: Fix kconfig for standby GIPO contoller
Date: Mon, 7 Mar 2016 14:41:23 +0700
Message-ID: <CACRpkda=EnW8h5Ungh8mybes3usCL28RRyMP5etuq_mQUG_3NQ@mail.gmail.com>
References: <1457091732-21924-1-git-send-email-mbrugger@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:36373 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752006AbcCGHlY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Mar 2016 02:41:24 -0500
Received: by mail-ob0-f178.google.com with SMTP id rt7so98108082obb.3
        for <linux-gpio@vger.kernel.org>; Sun, 06 Mar 2016 23:41:24 -0800 (PST)
In-Reply-To: <1457091732-21924-1-git-send-email-mbrugger@suse.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Matthias Brugger <mbrugger@suse.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Quan Nguyen <qnguyen@apm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Mar 4, 2016 at 6:42 PM, Matthias Brugger <mbrugger@suse.com> wrote:

> The standby GPIO controller can be used as a interrupt controller.
> Select GPIOLIB_IRQCHIP when compiling this driver. Otherwise we get
> a compilation error:
>
> drivers/gpio/gpio-xgene-sb.c: In function 'xgene_gpio_sb_probe':
> drivers/gpio/gpio-xgene-sb.c:312:10: error: 'struct gpio_chip' has no member named 'irqdomain'
>   priv->gc.irqdomain = priv->irq_domain;
>           ^
> scripts/Makefile.build:295: recipe for target 'drivers/gpio/gpio-xgene-sb.o' failed
> make[2]: *** [drivers/gpio/gpio-xgene-sb.o] Error 1
>
> Apart if compiled as module, we get the following modpost errors:
> ERROR: "irq_chip_eoi_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> ERROR: "irq_chip_unmask_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> ERROR: "irq_chip_mask_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> ERROR: "irq_domain_create_hierarchy" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> ERROR: "gpiochip_get_data" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> ERROR: "irq_chip_set_type_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> ERROR: "irq_domain_alloc_irqs_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> ERROR: "irq_domain_set_hwirq_and_chip" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> ERROR: "irq_domain_reset_irq_data" [drivers/gpio/gpio-xgene-sb.ko] undefined!
>
> This patch changes the kconfig so that the gpio controller can only be
> build-in and selects GPIOLIB_IRQCHIP.
>
> Fixes: 1013fc41 "gpio: xgene: Enable X-Gene standby GPIO as interrupt controller"
> Cc: Quan Nguyen <qnguyen@apm.com>
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>
> Changes for v2:
> - Add modprobe fix, changing tristate to bool
> - Add Cc tag

Quan has sent a patch exporting the offending functions, but no reply from
the irqchip maintainers yet.

If they don't react we'll have to merge this and handle the module loading
later.

Yours,
Linus Walleij
