From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V4 RESEND 6/6] pinctrl: pinctrl-imx7ulp: add
 gpio_set_direction support
Date: Tue, 1 Aug 2017 13:56:50 +0200
Message-ID: <CACRpkdYV1atJZUS1DXeRnOHSrW=Z2h05eDFCa6DfOFF0UeKKcA@mail.gmail.com>
References: <1500990116-3620-1-git-send-email-aisheng.dong@nxp.com> <1500990116-3620-7-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:34853 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751959AbdHAL4w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 07:56:52 -0400
Received: by mail-it0-f48.google.com with SMTP id h199so6598382ith.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 04:56:52 -0700 (PDT)
In-Reply-To: <1500990116-3620-7-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Dong Aisheng <dongas86@gmail.com>, Stefan Agner <stefan@agner.ch>, Bai Ping <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Jul 25, 2017 at 3:41 PM, Dong Aisheng <aisheng.dong@nxp.com> wrote:

> Add gpio_set_direction support. This makes the driver support
> GPIO input/output dynamically change from userspace.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Fugang Duan <fugang.duan@nxp.com>
> Cc: Bai Ping <ping.bai@nxp.com>
> Acked-by: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Patch applied.

Yours,
Linus Walleij
