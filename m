From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V4 RESEND 5/6] pinctrl: imx: make imx_pmx_ops.gpio_set_direction
 platform specific callbacks
Date: Tue, 1 Aug 2017 13:55:50 +0200
Message-ID: <CACRpkda-Gv2psw5CyzN8YQOXU_aEERbo-T90dS5LQh_rtALHGA@mail.gmail.com>
References: <1500990116-3620-1-git-send-email-aisheng.dong@nxp.com> <1500990116-3620-6-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:36244 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751352AbdHALzw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 07:55:52 -0400
Received: by mail-it0-f52.google.com with SMTP id 77so6571494itj.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 04:55:51 -0700 (PDT)
In-Reply-To: <1500990116-3620-6-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Dong Aisheng <dongas86@gmail.com>, Stefan Agner <stefan@agner.ch>, Bai Ping <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Jul 25, 2017 at 3:41 PM, Dong Aisheng <aisheng.dong@nxp.com> wrote:

> Various IMX platforms may have different imx_pmx_ops.gpio_set_direction
> implementations, so let's make it platform specific callbacks instead of
> the fixed common one.
>
> Currently only VF610 platform implements it. No function level changes.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Acked-by: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Patch applied.

Yours,
Linus Walleij
