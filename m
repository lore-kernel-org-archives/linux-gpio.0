From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH] gpio: iop: fix devm_ioremap_resource() return value checking
Date: Wed, 19 Mar 2014 09:58:52 -0700
Message-ID: <CAPcyv4hYFBY2GwXcF_wfigtsqT+s7Sgq9UHdH0nWGYZD7DaxcQ@mail.gmail.com>
References: <1625450.oZua1OVhNs@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f169.google.com ([209.85.128.169]:52133 "EHLO
	mail-ve0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933960AbaCSQ6x (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Mar 2014 12:58:53 -0400
Received: by mail-ve0-f169.google.com with SMTP id pa12so9207366veb.14
        for <linux-gpio@vger.kernel.org>; Wed, 19 Mar 2014 09:58:52 -0700 (PDT)
In-Reply-To: <1625450.oZua1OVhNs@amdc1032>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Lennert Buytenhek <kernel@wantstofly.org>, Mikael Pettersson <mikpe@it.uu.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Mar 18, 2014 at 2:58 AM, Bartlomiej Zolnierkiewicz
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

Acked-by: Dan Williams <dan.j.williams@intel.com>
