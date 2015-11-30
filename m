From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: bcm2835: Fix initial value for direction_output
Date: Mon, 30 Nov 2015 09:29:55 +0100
Message-ID: <CACRpkdbZicosnYnp6ZxqvOhLdyuTJTHv2gYR0spWoGMzbToYOg@mail.gmail.com>
References: <1447893147-9458-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33984 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753110AbbK3I3z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 03:29:55 -0500
Received: by oies6 with SMTP id s6so91754585oie.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2015 00:29:55 -0800 (PST)
In-Reply-To: <1447893147-9458-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Martin Sperl <kernel@martin.sperl.org>

On Thu, Nov 19, 2015 at 1:32 AM, Stefan Wahren <stefan.wahren@i2se.com> wrote:

> Currently the provided initial value for bcm2835_gpio_direction_output
> has no effect. So fix this issue by changing the value before
> changing the GPIO direction. As a result we need to move the function below
> bcm2835_gpio_set.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> CC: Martin Sperl <kernel@martin.sperl.org>
> CC: Stephen Warren <swarren@wwwdotorg.org>

Waiting for Stephen's ACK on this.

Yours,
Linus Walleij
