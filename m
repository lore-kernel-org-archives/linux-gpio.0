From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 1/1] gpio: gpio-vf610: add imx7ulp support
Date: Mon, 7 Aug 2017 14:05:25 +0200
Message-ID: <CACRpkda6AmCUyDz-zNQbh9XCCDjUcKqhMH07oET6CEXzXV=0rw@mail.gmail.com>
References: <1501596257-20825-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:33693 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752902AbdHGMF0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 08:05:26 -0400
Received: by mail-io0-f169.google.com with SMTP id j32so1856203iod.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2017 05:05:26 -0700 (PDT)
In-Reply-To: <1501596257-20825-1-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Bai Ping <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, Dong Aisheng <dongas86@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, Peter Chen <peter.chen@nxp.com>

On Tue, Aug 1, 2017 at 4:04 PM, Dong Aisheng <aisheng.dong@nxp.com> wrote:

> The Rapid General-Purpose Input and Output with 2 Ports (RGPIO2P)
> on MX7ULP is similar to GPIO on Vibrid. But unlike Vibrid, the
> RGPIO2P has an extra Port Data Direction Register (PDDR) used
> to configure the individual port pins for input or output.
>
> We introduce a bool have_paddr with fsl_gpio_soc_data data
> to distinguish this differences. And we support getting the output
> status by checking the GPIO direction in PDDR.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Fugang Duan <fugang.duan@nxp.com>
> Cc: Peter Chen <peter.chen@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
>
> ---
> ChangeLog:
> v1->v2:
>  * remove flags and use bool have_paddr instead

Patch applied.

Yours,
Linus Walleij
