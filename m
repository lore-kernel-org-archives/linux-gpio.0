From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V4 RESEND 3/6] pinctrl: imx: add imx7ulp driver
Date: Tue, 1 Aug 2017 13:53:19 +0200
Message-ID: <CACRpkdbkrjDE6mo7k=uShKd3_J95i-n98jP2zJ1-atqgcLefVQ@mail.gmail.com>
References: <1500990116-3620-1-git-send-email-aisheng.dong@nxp.com> <1500990116-3620-4-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:33747 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751746AbdHALxU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 07:53:20 -0400
Received: by mail-io0-f177.google.com with SMTP id j32so7288094iod.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 04:53:20 -0700 (PDT)
In-Reply-To: <1500990116-3620-4-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Dong Aisheng <dongas86@gmail.com>, Stefan Agner <stefan@agner.ch>, Bai Ping <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Jul 25, 2017 at 3:41 PM, Dong Aisheng <aisheng.dong@nxp.com> wrote:

> i.MX 7ULP has three IOMUXC instances: IOMUXC0 for M4 ports,
> IOMUXC1 for A7 ports and IOMUXC DDR for DDR interface.
>
> This patch adds the IOMUXC1 support for A7.
> It only supports generic pin config.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bai Ping <ping.bai@nxp.com>
> Acked-by: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Patch applied.

Yours,
Linus Walleij
