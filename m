From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/2][v5] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Sat, 21 Jun 2014 16:08:34 +0900
Message-ID: <CAAVeFuKs5OXAWDKd3W-+m+b7fjgzZG4EOTvOVugKvwmPx2FwYw@mail.gmail.com>
References: <25983307.ZjJOfz2Kpg@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:64658 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751032AbaFUHIz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Jun 2014 03:08:55 -0400
Received: by mail-vc0-f174.google.com with SMTP id hy4so4237626vcb.33
        for <linux-gpio@vger.kernel.org>; Sat, 21 Jun 2014 00:08:55 -0700 (PDT)
In-Reply-To: <25983307.ZjJOfz2Kpg@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Gerhard Sittig <gsi@denx.de>

On Mon, Jun 16, 2014 at 10:51 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
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

Tried to find something more to say, but each and every concern I had
has been addressed through the various revisions of this series.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

As far as I can judge, this is a very nicely crafted patch.
