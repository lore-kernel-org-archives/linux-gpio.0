From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] gpio: max732x: Add missing dev reference to gpiochip
Date: Fri, 14 Aug 2015 23:10:58 +0200
Message-ID: <201508142310.58606.marex@denx.de>
References: <1435687458-4671-1-git-send-email-marex@denx.de> <CACRpkdZ_MWwfjExjvW59+dQ=E2rv4c9_MsSsjNwO5M8yM+j9fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:38707 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751590AbbHNVLD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Aug 2015 17:11:03 -0400
In-Reply-To: <CACRpkdZ_MWwfjExjvW59+dQ=E2rv4c9_MsSsjNwO5M8yM+j9fg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mans Rullgard <mans@mansr.com>, Olaf Mandel <o.mandel@menlosystems.com>, Semen Protsenko <semen.protsenko@globallogic.com>

On Thursday, July 16, 2015 at 01:43:13 PM, Linus Walleij wrote:
> On Tue, Jun 30, 2015 at 8:04 PM, Marek Vasut <marex@denx.de> wrote:
> > In case the gpiochip doesn't have the .dev field set, as is the case
> > in here, it is not possible to reference this device in DT as a GPIO
> > controller. A good example of this problem is that gpio-leds can not
> > be used when connected to this chip, the gpio-leds driver bails out
> > with -EPROBE_DEFER.
> > 
> > Fix this problem by setting the .dev field of the gpio_chip to the
> > parent i2c device.
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Alexandre Courbot <gnurou@gmail.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Mans Rullgard <mans@mansr.com>
> > Cc: Olaf Mandel <o.mandel@menlosystems.com>
> > Cc: Semen Protsenko <semen.protsenko@globallogic.com>
> 
> Patch applied for fixes.

Hi,

I don't see this one in -next , did it get lost or something please ?

Best regards,
Marek Vasut
