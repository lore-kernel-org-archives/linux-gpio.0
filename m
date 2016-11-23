From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] pinctrl: sx150x: set multiple pins at once
Date: Wed, 23 Nov 2016 10:20:01 +0100
Message-ID: <96d50f53-7497-932f-57e2-37fe6cfbafa5@baylibre.com>
References: <1479830762-1839-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:35792 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933445AbcKWJ13 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2016 04:27:29 -0500
Received: by mail-wm0-f43.google.com with SMTP id a197so68777284wmd.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2016 01:27:29 -0800 (PST)
In-Reply-To: <1479830762-1839-1-git-send-email-peda@axentia.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, linux-gpio@vger.kernel.org

On 11/22/2016 05:06 PM, Peter Rosin wrote:
> Hi!
> 
> I have only tested this on an 8-bit sx1502, so I'm uncertain if
> the there needs to be locking for this to work as intended for
> the bigger chips with an oscio pin? Probably.
> 
> So, I didn't add (or rather, removed) these lines at the end of
> sx150x_gpio_set_multiple() and made the op optional instead.
> 
> 	if (*mask & pctl->oscio_mask)
> 		sx150x_gpio_oscio_set(pctl, *bits & pctl->oscio_mask);
> 
> I mean, what happens if there are two users writing multiple pins
> where one of the pins is the oscio pin, and this happens concurrently?
> I get the feeling that there is nothing stopping interleaving in that
> case, and you could end up with the desired values from user 1 for the
> normal pins, and the desired value for the oscio pin from user 2.
> 
> But for the easy case (no oscio) where the existing regmap locking
> holds, this is a nice speedup and desired behaviour without a lot
> of individual pin changes.
> 
> Cheers,
> Peter
> 
> Peter Rosin (2):
>   pinctrl: sx150x: various spelling fixes and some white-space cleanup
>   pinctrl: sx150x: support setting multiple pins at once
> 
>  drivers/pinctrl/pinctrl-sx150x.c | 50 ++++++++++++++++++++++++++++------------
>  1 file changed, 35 insertions(+), 15 deletions(-)
> 

Hi Peter,

Thanks for the patch, yes the oscio has a clearly separate register part of the clock management,
but it could be handled by the set_multiple by masking the oscio bit and managing it separately.

Using a simple integer to store the oscio pin number (or -1 for 456 devices) would simplify the process.

Neil
