From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Tue, 10 Dec 2013 12:51:30 +0100
Message-ID: <CACRpkdZxjKamJvOMqdgN5zG5DrZvDNTCaVSiyaHSawkLxvUrFA@mail.gmail.com>
References: <1386116613-5241-1-git-send-email-br1@einfach.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <1386116613-5241-1-git-send-email-br1@einfach.org>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Bruno Randolf <br1@einfach.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Seth Heasley <seth.heasley@intel.com>, Darren Hart <dvhart@linux.intel.com>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2013 at 1:23 AM, Bruno Randolf <br1@einfach.org> wrote:

> This patch adds support for the GPIOs found on the SMSC "Super I/O" chips
> SCH311x.
>
> The chip detection and I/O functions are copied from sch311x_wdt.c
>
> Signed-off-by: Bruno Randolf <br1@einfach.org>
>
> ---
> Notes:
> - All GPIOs are now supported, driver data is runtime allocated
>   and I tried to address all comments as far as possible.
> - Still a platform device is registered, similar to gpio-f7188x.c

So I have a problem with this design pattern so I need to ask
Matthew Garret about this:

- Driver *always* performs some port-mapped I/O probe on
  some random ports as a compulsory initcall.

- No other hardware discovery.

- If detecting magic, registers a platform device.

- Then handles this device by also providing a device
  driver for it.

- All of this is placed in one file.

Matthew is this how discovery and registration of x86 platform
drivers for port-mapped devices should work or are we doing
something weird here?

Since earlier we have:

drivers/gpio/gpio-f7188x.c - exactly the same pattern

drivers/gpio/gpio-it8761e.c - doesn't even bother to create a platform
  device, goes on and creates a gpio_chip without any device

drivers/gpio/gpio-sch.c - port-mapped but platform device is
  created by an MFD which is probed from PCI (seems fine).

drivers/gpio/gpio-ts5500.c - aha, created from
  arch/x86/platform/ts5500/ts5500.c, a "board file".

This is a bit heterogeneous, but I can't claim to understand how
x86 want to register its devices so need some input here.

Maybe this is all the right way to do things, but I want to
be hammered down by some convincing arguments first.

Yours,
Linus Walleij
