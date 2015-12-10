From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: bcm2835: Fix initial value for direction_output
Date: Thu, 10 Dec 2015 19:07:21 +0100
Message-ID: <CACRpkdYO50aSra3gAzpBwBd0aQPA_aiC3t2rVHDUuXWmDQr=eg@mail.gmail.com>
References: <1447893147-9458-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:33572 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753073AbbLJSHW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 13:07:22 -0500
Received: by oixx65 with SMTP id x65so50933440oix.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 10:07:21 -0800 (PST)
In-Reply-To: <1447893147-9458-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Martin Sperl <kernel@martin.sperl.org>

On Thu, Nov 19, 2015 at 1:32 AM, Stefan Wahren <stefan.wahren@i2se.com> wrote:

> Currently the provided initial value for bcm2835_gpio_direction_output
> has no effect. So fix this issue by changing the value before
> changing the GPIO direction. As a result we need to move the function below
> bcm2835_gpio_set.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> CC: Martin Sperl <kernel@martin.sperl.org>
> CC: Stephen Warren <swarren@wwwdotorg.org>

Patch applied for fixes.

Yours,
Linus Walleij
