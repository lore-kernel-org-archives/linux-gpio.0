From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Tue, 10 Dec 2013 23:05:49 -0500 (EST)
Message-ID: <1395016599.620093.1386734749325.JavaMail.root@mail>
References: <CACRpkdZxjKamJvOMqdgN5zG5DrZvDNTCaVSiyaHSawkLxvUrFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([209.172.62.77]:52391 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751646Ab3LKEMP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2013 23:12:15 -0500
In-Reply-To: <CACRpkdZxjKamJvOMqdgN5zG5DrZvDNTCaVSiyaHSawkLxvUrFA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>, Bruno Randolf <br1@einfach.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Seth Heasley <seth.heasley@intel.com>, Darren Hart <dvhart@linux.intel.com>, kernel <kernel@savoirfairelinux.com>

Hi Linus,

You wrote:
> > This patch adds support for the GPIOs found on the SMSC "Super I/O"
> > chips
> > SCH311x.
> >
> > The chip detection and I/O functions are copied from sch311x_wdt.c
> >
> > Signed-off-by: Bruno Randolf <br1@einfach.org>
> >
> > ---
> > Notes:
> > - All GPIOs are now supported, driver data is runtime allocated
> >   and I tried to address all comments as far as possible.
> > - Still a platform device is registered, similar to gpio-f7188x.c
> 
> So I have a problem with this design pattern so I need to ask
> Matthew Garret about this:
> 
> - Driver *always* performs some port-mapped I/O probe on
>   some random ports as a compulsory initcall.
> 
> - No other hardware discovery.
> 
> - If detecting magic, registers a platform device.
> 
> - Then handles this device by also providing a device
>   driver for it.
> 
> - All of this is placed in one file.
> 
> Matthew is this how discovery and registration of x86 platform
> drivers for port-mapped devices should work or are we doing
> something weird here?
> 
> Since earlier we have:
> 
> drivers/gpio/gpio-f7188x.c - exactly the same pattern
> 
> drivers/gpio/gpio-it8761e.c - doesn't even bother to create a
> platform
>   device, goes on and creates a gpio_chip without any device
> 
> drivers/gpio/gpio-sch.c - port-mapped but platform device is
>   created by an MFD which is probed from PCI (seems fine).
> 
> drivers/gpio/gpio-ts5500.c - aha, created from
>   arch/x86/platform/ts5500/ts5500.c, a "board file".

Because of the lack of mechanism such as DMI, there's no safe way to verify the
machine at the GPIO driver level. However, the board code (which registers the
platform device) does a safe check by looking for some magic in the RAM.

Would it be safer if we make GPIO_TS5500 depends on TS5500?

> This is a bit heterogeneous, but I can't claim to understand how
> x86 want to register its devices so need some input here.
> 
> Maybe this is all the right way to do things, but I want to
> be hammered down by some convincing arguments first.

Best,
Vivien
