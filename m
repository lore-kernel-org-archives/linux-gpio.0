From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Sun, 15 Dec 2013 21:46:04 -0500 (EST)
Message-ID: <1962407133.2003.1387161964453.JavaMail.root@mail>
References: <CACRpkdYU_AV=E67cGcqqwiq4byOeJx+J+XDST3Mo_s5xmfDTnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([209.172.62.77]:64340 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751180Ab3LPCqG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Dec 2013 21:46:06 -0500
In-Reply-To: <CACRpkdYU_AV=E67cGcqqwiq4byOeJx+J+XDST3Mo_s5xmfDTnQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>, Bruno Randolf <br1@einfach.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Seth Heasley <seth.heasley@intel.com>, Darren Hart <dvhart@linux.intel.com>, kernel <kernel@savoirfairelinux.com>

Hi Linus,

You wrote:
> >> drivers/gpio/gpio-ts5500.c - aha, created from
> >>   arch/x86/platform/ts5500/ts5500.c, a "board file".
> >
> > Because of the lack of mechanism such as DMI, there's no safe way
> > to verify the
> > machine at the GPIO driver level. However, the board code (which
> > registers the
> > platform device) does a safe check by looking for some magic in the
> > RAM.
> >
> > Would it be safer if we make GPIO_TS5500 depends on TS5500?
> 
> I don't know actually. How does it work with these x86 things?
> Is it so that the system comes up and then you modprobe this driver?

With TS5500 selected, the board comes up, get probed reading the RAM
(from the board code), then registers this GPIO platform device.

> In that case, do you bring up a fully generic kernel or do you have
> to have it compiled with CONFIG_TS5500 set to 'y' and is that
> done of a say, typical distro kernel?

GPIO_TS5500 cannot probe the DIO blocks by itself. It needs a board
code to fill and register the corresponding platform device structures.

So a generic x86 kernel will work on the board, but we need TS5500 set
to 'y' in order to have the GPIOs.

> If we don't know if it will be modprobed or not on a certain system
> we should keep it as is, but of the distro kernels all set
> CONFIG_TS5500 to 'n' then we should add a dependency
> like that.

As it is an embedded platform, I don't think CONFIG_TS5500 is enabled
on distro kernels.

I hope it's a bit clearer. Let me know what is your advice on this.

Best,
Vivien
