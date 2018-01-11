From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH] gpio: winbond: fix ISA_BUS_API dependency
Date: Thu, 11 Jan 2018 08:00:45 -0500
Message-ID: <20180111130045.GA23562@sophia>
References: <20180111083600.4121805-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:43300 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933141AbeAKNAx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jan 2018 08:00:53 -0500
Content-Disposition: inline
In-Reply-To: <20180111083600.4121805-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Guenter Roeck <linux@roeck-us.net>, "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jan 11, 2018 at 09:35:15AM +0100, Arnd Bergmann wrote:
>This particular driver appears to be different from the other ISA_BUS_API
>based drivers, in that it is not normally an add-on card (ISA or PC104)
>but instead is an LPC-attached component on the mainboard. We already
>support other functionality provided by this chip, at least
>drivers/watchdog/w83627hf_wdt.c and drivers/hwmon/w83627ehf.c, plus
>there is a discovery function for this hardware in
>drivers/parport/parport_pc.c.
>
>If we want to use this driver without having to enable CONFIG_EXPERT,
>it might be better to not use the isa_bus_type for it, but rather
>turn it into a platform_driver, acpi_driver or add an MFD for it that
>is shared with the wdt and hwmon portions and does the probing.

I think there is some merit to reinvestigate an MFD driver at a later
point; Super I/O chips by their design typically control various
multiple devices, which I believe fits in well with the MFD paradigm.
Although other existing Super I/O drivers in the kernel do not make use
of MFD, this doesn't necessarily mean it is not apt -- it may be
appropriate to refactor those drivers as well to take advantage of MFD.

As far as this particular patch is concerned however, I'm going to
suggest waiting for the ISA_BUS_API Kconfig fixes
((https://patchwork.ozlabs.org/project/linux-gpio/list/?series=20657)
to be pulled-in; applying this patch now will just require a revert
later once the patchset makes it into the tree.

William Breathitt Gray
