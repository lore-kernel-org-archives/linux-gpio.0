From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3][v6] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Fri, 14 Nov 2014 10:56:50 +0100
Message-ID: <CACRpkdbGRvT_+35JyJjQcG_RjNt9Y52P-WMXoWNjTOQ1awW1zQ@mail.gmail.com>
References: <2001937.AhYQP8b40K@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:64312 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965061AbaKNJ4v (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Nov 2014 04:56:51 -0500
Received: by mail-ig0-f182.google.com with SMTP id hn18so1208335igb.9
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2014 01:56:50 -0800 (PST)
In-Reply-To: <2001937.AhYQP8b40K@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Gerhard Sittig <gsi@denx.de>

On Tue, Nov 4, 2014 at 5:12 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:

> Introduce new functions gpiod_set_array & gpiod_set_raw_array to the consumer
> interface which allow setting multiple outputs with just one function call.
> Also add an optional set_multiple function to the driver interface. Without an
> implementation of that function in the chip driver outputs are set
> sequentially.
>
> Implementing the set_multiple function in a chip driver allows for:
> - Improved performance for certain use cases. The original motivation for this
>   was the task of configuring an FPGA. In that specific case, where 9 GPIO
>   lines have to be set many times, configuration time goes down from 48 s to
>   20 s when using the new function.
> - Simultaneous glitch-free setting of multiple pins on any kind of parallel
>   bus attached to GPIOs provided they all reside on the same chip and bank.
>
> Limitations:
>   Performance is only improved for normal high-low outputs. Open drain and
>   open source outputs are always set separately from each other. Those kinds
>   of outputs could probably be accelerated in a similar way if we could
>   forgo the error checking when setting GPIO directions.
>
> Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Mark Brown <broonie@linaro.org>

OK let's do this.

Patch applied!

Yours,
Linus Walleij
