From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 6/9] gpiolib-sysfs: Show gpio-name in /sys/class/gpio/gpio*/name
Date: Mon, 21 Sep 2015 18:07:51 -0700
Message-ID: <CACRpkdZ4C25NsrCEHS0hxFx+AkjGfC7cyZeMvixOyoADtcvbmA@mail.gmail.com>
References: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
	<1439561466-14350-7-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:36128 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753650AbbIVBHw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2015 21:07:52 -0400
Received: by oibi136 with SMTP id i136so68615749oib.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2015 18:07:52 -0700 (PDT)
In-Reply-To: <1439561466-14350-7-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Fri, Aug 14, 2015 at 7:11 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> This patch adds a sysfs attribute 'name' to gpios that were exported. It
> exposes the newly added name property of gpio descriptors.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

The previous hunk adding the name to the sysfs ABI should
be in this patch.

But I have a problem with this. What is the rationale? The directory
that contains the file already has this name. Why should this
information be duplicated?

Yours,
Linus Walleij
