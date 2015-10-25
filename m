From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Sun, 25 Oct 2015 16:06:26 +0900
Message-ID: <CAAVeFuLMqCE81c8_e009uu1bYypmbagHS1DnPkZ1vxcuU=ukQg@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org> <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:36157 "EHLO
	mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750947AbbJYHGq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Oct 2015 03:06:46 -0400
Received: by ioll68 with SMTP id l68so160264039iol.3
        for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2015 00:06:46 -0700 (PDT)
In-Reply-To: <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Thu, Oct 22, 2015 at 5:32 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> GPIO chips have been around for years, but were never real devices,
> instead they were piggy-backing on a parent device (such as a
> platform_device or amba_device) but this was always optional.
> GPIO chips could also exist without any device at all, with its
> struct device *dev pointer being set to null.
>
> When sysfs was in use, a mock device would be created, with the
> optional parent assigned, or just floating orphaned with NULL
> as parent.
>
> For a proper userspace ABI we need gpiochips to *always have a
> populated struct device, so add this in the gpio_chip struct.
> The name "dev" is unfortunately already take so we use "device"
> to name it.
>
> If sysfs is active, it will use this device as parent, and the
> former parent device "dev" will be set as parent of the new
> "device" struct member.

Why not rename "dev" to "parent" so "dev" becomes what we expect it to
be? The two members being of the same type, keeping it that way seems
error-prone to me.
