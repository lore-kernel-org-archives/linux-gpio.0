From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] qnap-tsx51: add new driver for leds and button support on
 QNAP TS-x51 series
Date: Tue, 14 Jun 2016 09:17:18 +0200
Message-ID: <CACRpkdZ57_evCC=+hev9kNpY4bNViG+oBP7pOh8HkgRA0-oLXA@mail.gmail.com>
References: <20160606004406.29f016de@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:36000 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751467AbcFNHRT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2016 03:17:19 -0400
Received: by mail-oi0-f42.google.com with SMTP id p204so243402675oih.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jun 2016 00:17:19 -0700 (PDT)
In-Reply-To: <20160606004406.29f016de@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vincent Pelletier <plr.vincent@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jun 6, 2016 at 2:44 AM, Vincent Pelletier <plr.vincent@gmail.com> wrote:

> (please keep me CC'ed in replies, I'm not getting a majordomo
> subscription confirmation mail)

Please put me on To: on patches related to GPIO...

> I see drivers using GPIOs should use descriptors instead of gpio
> number. I fail to see how I should convert this driver to use
> descriptors. Or at least, I like a lot that this module has extremely
> little actual code, as I would expect from something which essentially
> does the same work as ACPI tables. Is it also achievable with
> descriptors ?

Yes, you can have static mappings, it's a bit tricky and only
done in a few places in the kernel. You have to add a static
lookup table using #include <linux/gpio/machine.h>

See:
arch/arm/mach-integrator/impd1.c function impd1_probe()
for an example.

git grep gpiod_add_lookup_table
for other examples.

Yours,
Linus Walleij
