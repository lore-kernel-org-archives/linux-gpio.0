From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mcp23s08: depend on OF_GPIO
Date: Thu, 23 Jan 2014 09:30:28 +0100
Message-ID: <CACRpkdYqTBMgETNH_Q6E9yH4aLgHGM0GLRqLV-VvbcrrtdOoog@mail.gmail.com>
References: <1390205344-15194-1-git-send-email-linus.walleij@linaro.org>
	<4701386.ZaUECGUEut@lem-wkst-02>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:45970 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752798AbaAWIa2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2014 03:30:28 -0500
Received: by mail-oa0-f47.google.com with SMTP id m1so1772225oag.34
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2014 00:30:28 -0800 (PST)
In-Reply-To: <4701386.ZaUECGUEut@lem-wkst-02>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Wed, Jan 22, 2014 at 4:05 PM, Lars Poeschel <poeschel@lemonage.de> wrote:

> After I read Torvalds mail, I
> realized that mcp23s08 driver now depends on OF_GPIO. I wonder if your patch
> was the best way to fix this.


I did this:

        depends on (SPI_MASTER && !I2C) || I2C && OF_GPIO


But Torvalds realized we have to do it like this:

        depends on OF_GPIO
        depends on (SPI_MASTER && !I2C) || I2C

Due to some funny business in Kconfig.

> I think a better way would be to not explicitly
> depend on OF_GPIO rather than disabling interrupt functionality if OF_GPIO is
> not selected. What I am a bit concerned about is, that we locked out non-OF
> users from being able to use this driver from now on.

OK you need to think of something, if it's not causing any regressions
on some board it's no problem.

So user stories are needed to justify this as a regression fix.

> I seems since Linus Torvalds now pulled our patches and fixed them up, it is a
> bit too late, but should we do another patch third patch, that reenables the
> non-OF usage of the driver ? What do you think ?

That will be for the next merge window in that case.

Yours,
Linus Walleij
