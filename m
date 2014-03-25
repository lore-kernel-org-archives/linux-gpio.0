From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: iop: fix devm_ioremap_resource() return value checking
Date: Tue, 25 Mar 2014 15:04:26 +0100
Message-ID: <CACRpkdYTSBEOxJ9h95JdDWhkGjL4QgZT5KmhmmGm1oraSKRhdw@mail.gmail.com>
References: <1625450.oZua1OVhNs@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:60429 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753336AbaCYOE1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Mar 2014 10:04:27 -0400
Received: by mail-ob0-f170.google.com with SMTP id uz6so596126obc.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2014 07:04:26 -0700 (PDT)
In-Reply-To: <1625450.oZua1OVhNs@amdc1032>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Lennert Buytenhek <kernel@wantstofly.org>, Dan Williams <dan.j.williams@intel.com>, Mikael Pettersson <mikpe@it.uu.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Mar 18, 2014 at 10:58 AM, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:

> devm_ioremap_resource() returns a pointer to the remapped memory or
> an ERR_PTR() encoded error code on failure.  Fix the check inside
> iop3xx_gpio_probe() accordingly.
>
> Cc: Lennert Buytenhek <kernel@wantstofly.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Mikael Pettersson <mikpe@it.uu.se>
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Patch applied with ACKs.

Yours,
Linus Walleij
