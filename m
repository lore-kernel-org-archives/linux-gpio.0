From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3] gpio: aspeed: Add banks Y, Z, AA, AB and AC
Date: Fri, 27 Jan 2017 16:53:58 +1100
Message-ID: <CACPK8XcWri+cZ39yZYyYUb-kHM=j8yjRSh8GgcZ6CpW6=5hgMg@mail.gmail.com>
References: <20170127042442.28994-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:34965 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753841AbdA0GEh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2017 01:04:37 -0500
In-Reply-To: <20170127042442.28994-1-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>

On Fri, Jan 27, 2017 at 3:24 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> This is less straight-forward than one would hope, as some banks only
> have 4 pins rather than 8, others are output only, yet more (W and
> X, already supported) are input-only, and in the case of the g4 SoC bank
> AC doesn't exist.
>
> Add some structs to describe the varying properties of different banks
> and integrate mechanisms to deny requests for unsupported
> configurations.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
>
> Since v2:
>
> Drop linux/gpio.h include and change away from using GPIOF_* macros
>
> Since v1:
>
> Fix types for for_each_clear_bit() iteration
>
>  drivers/gpio/gpio-aspeed.c | 173 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 159 insertions(+), 14 deletions(-)
