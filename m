From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFT] gpio: pisosr: Use gpiod_set_value_cansleep in pisosr_gpio_refresh()
Date: Thu, 25 Feb 2016 15:10:50 +0100
Message-ID: <CACRpkdZUp1H8R2KWF_hGMC1NwwsKVjOO+cLD5tvObBMH_p06gQ@mail.gmail.com>
References: <1456320674.8959.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:32862 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760085AbcBYOKv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 09:10:51 -0500
Received: by mail-ob0-f175.google.com with SMTP id jq7so48728665obb.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 06:10:51 -0800 (PST)
In-Reply-To: <1456320674.8959.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: "Andrew F. Davis" <afd@ti.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Feb 24, 2016 at 2:31 PM, Axel Lin <axel.lin@ingics.com> wrote:

> This driver has .can_sleep flag set.
> So the pisosr_gpio_get() can be called from contexts that can sleep.
> Thus use the cansleep() variant in pisosr_gpio_refresh().
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied.

Yours,
Linus Walleij
