From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] gpio: of: drop needless gpio_chip look-up in of_parse_own_gpio()
Date: Thu, 23 Jun 2016 09:34:51 +0200
Message-ID: <CACRpkdZQpUTx2mpgt0U6u1RS9B-ZfMYHVNO_3iYYqCeVt=2rKg@mail.gmail.com>
References: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com> <1465898827-2229-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:36122 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750912AbcFWHew (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2016 03:34:52 -0400
Received: by mail-oi0-f41.google.com with SMTP id f189so58032726oig.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2016 00:34:52 -0700 (PDT)
In-Reply-To: <1465898827-2229-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 14, 2016 at 12:07 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This function is doing more complicated than needed.  The caller of
> this function, of_gpiochip_scan_gpios() already knows the pointer to
> the gpio_chip.  It can pass it to of_parse_own_gpio() instead of
> looking up the gpio_chip by gpiochip_find().
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied!

First I was worried about this semantic change:

> -       chip_np = np->parent;
> +       chip_np = chip->of_node;

But then I read up on the code and saw that of_gpiochip_add() sets
it to the parent if not set before.

Yours,
Linus Walleij
