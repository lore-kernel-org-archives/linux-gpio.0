From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio/ABI: document what is already the case
Date: Mon, 17 Aug 2015 16:26:33 +0900
Message-ID: <CAAVeFuJ+DowFVPLxKmwD6nkr7Sd89XzbJJaVk_+eBX4jdbSiAQ@mail.gmail.com>
References: <1439200817-7268-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:34560 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750942AbbHQH0x (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2015 03:26:53 -0400
Received: by obbfr1 with SMTP id fr1so105104562obb.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2015 00:26:52 -0700 (PDT)
In-Reply-To: <1439200817-7268-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Daniel Silverstone <dsilvers@digital-scurf.org>, Markus Pargmann <mpa@pengutronix.de>, Johan Hovold <johan@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>

On Mon, Aug 10, 2015 at 7:00 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> commit 926b663ce8215ba448960e1ff6e58b67a2c3b99b
> "gpiolib: allow GPIOs to be named" added the ability to
> name GPIO lines by an array of names stored in the GPIO
> chip. This was in 2009 and has been an ABI since. Let's
> document it properly.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
