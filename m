From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: menz127: Drop lock field from struct men_z127_gpio
Date: Tue, 22 Mar 2016 11:31:53 +0100
Message-ID: <CACRpkdZNrdn0p-usbpFP4OZXCfLRiPdiMR55uqcBnHJcrO429g@mail.gmail.com>
References: <1457527135.720.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:33980 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758597AbcCVKby (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2016 06:31:54 -0400
Received: by mail-oi0-f44.google.com with SMTP id i17so566216oib.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2016 03:31:53 -0700 (PDT)
In-Reply-To: <1457527135.720.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Andreas Werner <andreas.werner@men.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 9, 2016 at 1:38 PM, Axel Lin <axel.lin@ingics.com> wrote:

> Current code uses a uninitialized spin lock.
> bgpio_init() already initialized a spin lock, so let's switch to use
> &gc->bgpio_lock instead and remove the lock from struct men_z127_gpio.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied for the v4.7 cycle. Will not appear in -next until
after -rc1.

Yours,
Linus Walleij
