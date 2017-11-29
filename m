From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: omap: initialize gpioirq chip as part of gpiochip_add_data
Date: Wed, 29 Nov 2017 14:19:34 +0100
Message-ID: <CACRpkdaSCMyp9kjsWZiR-gLU-d4C93FMB+SH+VVAWvB6J0_-Jg@mail.gmail.com>
References: <20171115183633.12382-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:41650 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752182AbdK2NTf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Nov 2017 08:19:35 -0500
Received: by mail-it0-f68.google.com with SMTP id x28so3979524ita.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2017 05:19:34 -0800 (PST)
In-Reply-To: <20171115183633.12382-1-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, Santosh Shilimkar <ssantosh@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>

On Wed, Nov 15, 2017 at 7:36 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> Hence, series from Thierry Reding [1] merged - the OMAP GPIO driver can be
> switched to reuse new feature and just fill new struct gpio_irq_chip before
> calling gpiochip_add_data() instead of using few separate gpioirq chip
> APIs. gpiochip_add_data() will do the job and create and initialize gpioirq
> chip
>
> [1] https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1531592.html
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Thierry: can you confirm that the stuff is used as intended?

Yours,
Linus Walleij
