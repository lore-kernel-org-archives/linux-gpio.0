From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] gpio: rcar: Improve clock error handling and reporting
Date: Fri, 11 Dec 2015 00:14:56 +0100
Message-ID: <CACRpkdYaF8pCeiKqYU9WKE8PHxV=0fsC9ZCUDm8+UqABq2r-YQ@mail.gmail.com>
References: <1449243233-11089-1-git-send-email-geert+renesas@glider.be>
	<1449243233-11089-3-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:36567 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751388AbbLJXO5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 18:14:57 -0500
Received: by oiww189 with SMTP id w189so55262264oiw.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 15:14:56 -0800 (PST)
In-Reply-To: <1449243233-11089-3-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

On Fri, Dec 4, 2015 at 4:33 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> If the Renesas R-Car GPIO driver cannot find a functional clock, it
> prints a warning, .e.g.
>
>         gpio_rcar ffc40000.gpio: unable to get clock
>
> and continues, as the clock is optional, depending on the SoC type.
> This warning may confuse users.
>
> To fix this, add a flag to indicate that the clock is mandatory or
> optional:
>   - If the clock is mandatory (on R-Car Gen2 and Gen3), a missing clock
>     is now treated as a fatal error,
>   - If the clock is optional (on R-Car Gen1), the warning is no longer
>     printed.
>
> Suggested-by: Magnus Damm <magnus.damm@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Use booleans instead of bitfields,
>   - Add reference to R-Car Gen3.

Patch applied.

Yours,
Linus Walleij
