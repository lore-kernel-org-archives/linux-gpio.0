From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Propagate all errors in devm_get_gpiod_from_child()
Date: Thu, 25 Feb 2016 10:04:51 +0100
Message-ID: <CACRpkdaNbCtGGzbwiE9iXOtaMUugyvc_7EunxhnjOdekQVi95g@mail.gmail.com>
References: <1455876050-5481-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:36142 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760199AbcBYJEw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 04:04:52 -0500
Received: by mail-oi0-f48.google.com with SMTP id w5so35409815oie.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 01:04:52 -0800 (PST)
In-Reply-To: <1455876050-5481-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, Olliver Schinagl <oliver@schinagl.nl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Feb 19, 2016 at 11:00 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> devm_get_gpiod_from_child() tries several property suffixes to find a
> GPIO descriptor. If all suffixes fail and no probe deferral has been
> detected, it returns the error of the last try.
>
> However, if any but the last try fails with a real error (e.g. -EBUSY),
> this error is not propagated, and -ENOENT will be returned.
> This confuses drivers that e.g. want to detect if a GPIO is already in
> use.
>
> To fix this, change the loop logic to continue on -ENOENT, which
> indicates the property was not found and the next suffix should be
> tried, and propagate all other detected errors.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
