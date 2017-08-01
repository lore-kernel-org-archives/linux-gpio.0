From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND 2/2] gpio: gpio-vf610: add imx7ulp support
Date: Tue, 1 Aug 2017 14:03:52 +0200
Message-ID: <CACRpkdYjkaEzuqvtryCwfAWPHhsP3wD8_U3M7kaO7cbCmj5rZg@mail.gmail.com>
References: <1500990438-3894-1-git-send-email-aisheng.dong@nxp.com> <1500990438-3894-3-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:34493 "EHLO
        mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751115AbdHAMDy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 08:03:54 -0400
Received: by mail-io0-f178.google.com with SMTP id o9so7402636iod.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 05:03:53 -0700 (PDT)
In-Reply-To: <1500990438-3894-3-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Bai Ping <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, Peter Chen <peter.chen@nxp.com>, Dong Aisheng <dongas86@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Jul 25, 2017 at 3:47 PM, Dong Aisheng <aisheng.dong@nxp.com> wrote:

> The Rapid General-Purpose Input and Output with 2 Ports (RGPIO2P)
> on MX7ULP is similar to GPIO on Vibrid. But unlike Vibrid, the
> RGPIO2P has an extra Port Data Direction Register (PDDR) used
> to configure the individual port pins for input or output.
>
> We introduce a FSL_GPIO_HAVE_PDDR with fsl_gpio_soc_data data
> to distinguish this differences. And we support getting the output
> status by checking the GPIO direction in PDDR.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Fugang Duan <fugang.duan@nxp.com>
> Cc: Peter Chen <peter.chen@nxp.com>
> Acked-by: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

This is mostly OK but I want a change.

> +struct fsl_gpio_soc_data {
> +       u32 flags;
> +};

Why introduce complex things like bitwise flags. That looks
like premature optimization and trying to outsmart the compiler,
don't do that.

Add a bool have_paddr;

simply, and use that in the code.

Apart from that it is fine.

Yours,
Linus Walleij
