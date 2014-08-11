From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: Don't allow drivers to specify a base with DT
Date: Mon, 11 Aug 2014 09:26:49 +0200
Message-ID: <CACRpkdaD2K4L+dF3iaXqQTsYJpoVRnRnp-4La38BWC3cRVUm7g@mail.gmail.com>
References: <1406808468-12559-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:41660 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752180AbaHKH0t (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Aug 2014 03:26:49 -0400
Received: by mail-ob0-f177.google.com with SMTP id wp18so5592061obc.22
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2014 00:26:49 -0700 (PDT)
In-Reply-To: <1406808468-12559-1-git-send-email-broonie@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Mark Brown <broonie@linaro.org>

On Thu, Jul 31, 2014 at 2:07 PM, Mark Brown <broonie@kernel.org> wrote:

> From: Mark Brown <broonie@linaro.org>
>
> DT based systems should have no reason to use fixed GPIO numbers but some
> drivers that work on both DT and non-DT platforms specify them anyway. In
> order to improve robustness in cases where drivers use gpio_is_valid() to
> check for a valid GPIO on data initialized to zero as a default and avoid
> bugs due to assuptions about fixed numbers creeping in ignore any specified
> base when DT is in use.

Hm in principle you are right...

> -       if (base < 0) {
> +       if (base < 0 || of_have_populated_dt()) {
>                 base = gpiochip_find_base(chip->ngpio);

But here I worry about breaking in-transition systems, e.g.
defining part of the peripherals through DT but adding a
GPIO device with AUXDATA, setting up base that way.

Not that it should stay that way for sure, but it does need
some consideration...

Yours,
Linus Walleij
