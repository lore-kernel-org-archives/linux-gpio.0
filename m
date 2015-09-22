From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 5/9] gpiolib: Add gpio name information to /sys/kernel/debug/gpio
Date: Mon, 21 Sep 2015 18:05:18 -0700
Message-ID: <CACRpkdZDsy+D+BMwjD5dCyi0c3Ha64K4jOJgySh8+6ELNuce2w@mail.gmail.com>
References: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
	<1439561466-14350-6-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:33741 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756290AbbIVBFS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2015 21:05:18 -0400
Received: by obbbh8 with SMTP id bh8so96345257obb.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2015 18:05:18 -0700 (PDT)
In-Reply-To: <1439561466-14350-6-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Fri, Aug 14, 2015 at 7:11 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> Add some information about gpio names to the debugfs gpio file. name and
> label of a GPIO are then displayed next to each other. This way it is
> easy to see what the real name of GPIO is and what the driver requested
> it for.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

PARTLY applied.

> +++ b/Documentation/ABI/testing/sysfs-gpio
> @@ -21,6 +21,7 @@ Description:
>             /value ... always readable, writes fail for input GPIOs
>             /direction ... r/w as: in, out (default low); write: high, low
>             /edge ... r/w as: none, falling, rising, both
> +           /name ... r/o, unique name of the GPIO

This patch has nothing to do with sysfs and this is not added to the ABI.
I removed this hunk from the patch.

The rest is applied.

Yours,
Linus Walleij
