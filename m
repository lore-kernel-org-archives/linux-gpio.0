From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: max732x: Add missing dev reference to gpiochip
Date: Thu, 16 Jul 2015 13:43:13 +0200
Message-ID: <CACRpkdZ_MWwfjExjvW59+dQ=E2rv4c9_MsSsjNwO5M8yM+j9fg@mail.gmail.com>
References: <1435687458-4671-1-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33482 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752180AbbGPLnN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 07:43:13 -0400
Received: by oige126 with SMTP id e126so48377499oig.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 04:43:13 -0700 (PDT)
In-Reply-To: <1435687458-4671-1-git-send-email-marex@denx.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marek Vasut <marex@denx.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mans Rullgard <mans@mansr.com>, Olaf Mandel <o.mandel@menlosystems.com>, Semen Protsenko <semen.protsenko@globallogic.com>

On Tue, Jun 30, 2015 at 8:04 PM, Marek Vasut <marex@denx.de> wrote:

> In case the gpiochip doesn't have the .dev field set, as is the case
> in here, it is not possible to reference this device in DT as a GPIO
> controller. A good example of this problem is that gpio-leds can not
> be used when connected to this chip, the gpio-leds driver bails out
> with -EPROBE_DEFER.
>
> Fix this problem by setting the .dev field of the gpio_chip to the
> parent i2c device.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mans Rullgard <mans@mansr.com>
> Cc: Olaf Mandel <o.mandel@menlosystems.com>
> Cc: Semen Protsenko <semen.protsenko@globallogic.com>

Patch applied for fixes.

Yours,
Linus Walleij
