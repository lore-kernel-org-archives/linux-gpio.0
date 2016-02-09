From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6 v3] gpio: make the gpiochip a real device
Date: Tue, 9 Feb 2016 11:03:13 +0100
Message-ID: <CACRpkdZNX0s5EOkovLiDJQHj8s=SrrLPm2zeTLRQeTzd25z4og@mail.gmail.com>
References: <1454941947-25415-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33481 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755949AbcBIKDO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2016 05:03:14 -0500
Received: by mail-oi0-f42.google.com with SMTP id w5so12276023oie.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Feb 2016 02:03:14 -0800 (PST)
In-Reply-To: <1454941947-25415-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

On Mon, Feb 8, 2016 at 3:32 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> For a proper userspace ABI we need gpiochips to *always have a
> populated struct device, so add this in the gpio_chip struct.
> The name "dev" is unfortunately already take so we use "device"
> to name it.

Bah old comment. Stripping it, and merging these patches.

Yours,
Linus Walleij
