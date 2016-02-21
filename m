From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: add userspace ABI for GPIO line information
Date: Sun, 21 Feb 2016 20:04:17 +0100
Message-ID: <CACRpkdYCo6zTj8ZSrPC57bY3MrqFztyzonX+cpMMPWyn7Y6o6g@mail.gmail.com>
References: <1455542435-3182-1-git-send-email-linus.walleij@linaro.org>
	<8756ef874911997cc5ef45fec30fb75e@jic23.retrosnub.co.uk>
	<CACRpkdb2+MDhTiUy9bS-dVORyQpCo-MNvtKpU3TSpq=5JkXDWw@mail.gmail.com>
	<4414113.xrDgcf7gfo@galactica>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:35124 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750812AbcBUTER (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Feb 2016 14:04:17 -0500
Received: by mail-oi0-f46.google.com with SMTP id x21so42585510oix.2
        for <linux-gpio@vger.kernel.org>; Sun, 21 Feb 2016 11:04:17 -0800 (PST)
In-Reply-To: <4414113.xrDgcf7gfo@galactica>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>, Michael Welling <mwelling@ieee.org>, Jonathan Cameron <jic23@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Sun, Feb 21, 2016 at 2:13 PM, Markus Pargmann <mpa@pengutronix.de> wrote:

> The gpio-hogging DT bindings still seem perfectly fine for me:
>
>         qe_pio_a: gpio-controller@1400 {
>                 compatible = "fsl,qe-pario-bank-a", "fsl,qe-pario-bank";
>                 reg = <0x1400 0x18>;
>                 gpio-controller;
>                 #gpio-cells = <2>;
>
>                 line_b {
>                         gpio-hog;
>                         gpios = <6 0>;
>                         output-low;
>                         line-name = "foo-bar-gpio";
>                 };
>         };
>
> This could be something like this without hogging:
>                 ...
>                 line_b {
>                         gpios = <6 0>;
>                         line-name = "foo-bar-gpio";
>                 };

I agree. Didn't you even make a patch for this that we didn't merge
because we didn't have a use case?

(I have a memory problem, admittedly, too much people and patches
flying around ...)

If you rebase the patch that make it possible to simply name lines
without hogging them, I'm certainly game for merging it.

Enclosing a lsgpio sample output gives extra points.

Yours,
Linus Walleij
