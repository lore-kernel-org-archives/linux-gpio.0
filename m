From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: [RFC] qnap-tsx51: add new driver for leds and button support on
 QNAP TS-x51 series
Date: Wed, 15 Jun 2016 00:45:04 +0000
Message-ID: <20160615004504.7b83d83c@gmail.com>
References: <20160606004406.29f016de@gmail.com>
	<CACRpkdZ57_evCC=+hev9kNpY4bNViG+oBP7pOh8HkgRA0-oLXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f68.google.com ([209.85.220.68]:34077 "EHLO
	mail-pa0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752618AbcFOApI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2016 20:45:08 -0400
Received: by mail-pa0-f68.google.com with SMTP id us13so284426pab.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jun 2016 17:45:08 -0700 (PDT)
In-Reply-To: <CACRpkdZ57_evCC=+hev9kNpY4bNViG+oBP7pOh8HkgRA0-oLXA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, 14 Jun 2016 09:17:18 +0200, Linus Walleij
<linus.walleij@linaro.org> wrote:
> Yes, you can have static mappings, it's a bit tricky and only
> done in a few places in the kernel. You have to add a static
> lookup table using #include <linux/gpio/machine.h>
> 
> See:
> arch/arm/mach-integrator/impd1.c function impd1_probe()
> for an example.
> 
> git grep gpiod_add_lookup_table
> for other examples.

Thanks for the examples.

I notice that no driver using gpiod_add_lookup_table also uses
gpiod_get for the gpios it just declared (output reordered & annotated):

  $ git grep -l gpiod_add_lookup_table | xargs grep -l gpiod_get
  Documentation/gpio/board.txt
  drivers/gpio/gpiolib.c
  include/linux/gpio/machine.h
    All above are on the gpio subsystem side, so it makes sense to
    reference both.
  drivers/mfd/intel_soc_pmic_core.c
    This one declares a "panel" descriptor and gets one for
    "intel_soc_pmic", so it is not using the descriptor it declares.
  $

So I wonder if it makes sense at all for a driver to both define a gpio
lookup table and then look for each gpio it just defined.

Maybe I am doing it wrong and/or at the wrong level ?

I looked at the ACPI API and try to find a way to extend the
incomplete tables when my platform module gets loaded. It seems
possible with devicetree (drivers/of/dynamic.c) but I couldn't find a
way with APCI yet. I did find that it's possible to override acpi
entire tables, but that seems overkill for my needs (it's not that the
existing tables are wrong, they are incomplete) and hard to maintain
(depends on bios revision).

Regards,
-- 
Vincent Pelletier
