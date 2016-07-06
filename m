From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: of_find_gpio(): Don't discard errors
Date: Wed, 6 Jul 2016 10:38:29 +0200
Message-ID: <CACRpkdZG=fXh-j_NT2M_iSyfWux8fAzbwe5DCw2z+Nm+f1BYWA@mail.gmail.com>
References: <1467387609-13811-1-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:32944 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751157AbcGFIia (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2016 04:38:30 -0400
Received: by mail-oi0-f42.google.com with SMTP id u201so261852209oie.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2016 01:38:30 -0700 (PDT)
In-Reply-To: <1467387609-13811-1-git-send-email-lars@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jul 1, 2016 at 5:40 PM, Lars-Peter Clausen <lars@metafoo.de> wrote:

> Since commit dd34c37aa3e8 ("gpio: of: Allow -gpio suffix for property
> names") when requesting a GPIO from the devicetree gpiolib looks for
> properties with both the '-gpio' and the '-gpios' suffix. This was
> implemented by first searching for the property with the '-gpios' suffix
> and if that yields an error try the '-gpio' suffix. This approach has the
> issue that any error returned when looking for the '-gpios' suffix is
> silently discarded.
>
> Commit 06fc3b70f1dc ("gpio: of: Fix handling for deferred probe for -gpio
> suffix") partially addressed the issue by treating the EPROBE_DEFER error
> as a special condition. This fixed the case when the property is specified,
> but the GPIO provider is not ready yet. But there are other cases in which
> of_get_named_gpiod_flags() returns an error even though the property is
> specified, e.g. if the specification is incorrect.
>
> of_find_gpio() should only try to look for the property with the '-gpio'
> suffix if no property with the '-gpios' suffix was found. If the property
> was not found of_get_named_gpiod_flags() will return -ENOENT, so update the
> condition to abort and propagate the error to the caller in all other
> cases.
>
> This is important for gpiod_get_optinal() and friends to behave correctly
> in case the specifier contains errors. Without this patch they'll return
> NULL if the property uses the '-gpios' suffix and the specifier contains
> errors, which falsely indicates to the caller that no GPIO was specified.
>
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

This makes all kind of sense. Patch applied.

Yours,
Linus Walleij
