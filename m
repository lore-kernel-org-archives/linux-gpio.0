From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: gpio/gpiolib-acpi.c:559: pointless test ?
Date: Thu, 9 Apr 2015 10:55:42 +0900
Message-ID: <CAAVeFu+eGOctb99oSdKpQrd7+yz_GnFM4i2GkKzDFKvp_5qSFg@mail.gmail.com>
References: <DUB128-W81974691C87CB9F27B504B9CFD0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:35164 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753200AbbDIB4O (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2015 21:56:14 -0400
Received: by iggg4 with SMTP id g4so55553825igg.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2015 18:56:13 -0700 (PDT)
In-Reply-To: <DUB128-W81974691C87CB9F27B504B9CFD0@phx.gbl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Binderman <dcb314@hotmail.com>, "qipeng.zha" <qipeng.zha@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Patch 4de60970abf9f49737f51ec6e7a1e3bcf6d36742 introduced this code.
Either the type is wrong, or the test should not be performed.
Considering the return type of acpi_gpiochip_pin_to_gpio_offset and
the fact it can return -EINVAL, I would say it is the former.

Qipeng, can you post a fix if you agree with my analysis, giving David
credit with the Reported-by tag?

Thanks!

On Tue, Apr 7, 2015 at 7:27 PM, David Binderman <dcb314@hotmail.com> wrote:
> Hello there,
>
> [linux-4.0-rc7/drivers/gpio/gpiolib-acpi.c:559]: (style) Checking if unsigned variable 'pin' is less than zero.
>
>         if (pin < 0) {
>
> but
>
>       unsigned pin = agpio->pin_table[i];
>
> Regards
>
> David Binderman
>
>
