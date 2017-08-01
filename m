From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V4 RESEND 2/6] pinctrl: imx: switch to use the generic
 pinmux property
Date: Tue, 1 Aug 2017 13:52:05 +0200
Message-ID: <CACRpkdaR_F_skVW-6MwvcA9Ck0CNoeBjmgwcD76Tfp_jaHPtnw@mail.gmail.com>
References: <1500990116-3620-1-git-send-email-aisheng.dong@nxp.com> <1500990116-3620-3-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:36300 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751982AbdHALwG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 07:52:06 -0400
Received: by mail-it0-f46.google.com with SMTP id 77so6530217itj.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 04:52:06 -0700 (PDT)
In-Reply-To: <1500990116-3620-3-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Dong Aisheng <dongas86@gmail.com>, Stefan Agner <stefan@agner.ch>, Bai Ping <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Jul 25, 2017 at 3:41 PM, Dong Aisheng <aisheng.dong@nxp.com> wrote:

> The generic pinmux property seems to be more suitable for IMX.
> So we change to use 'pinmux' instead of 'pins'.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bai Ping <ping.bai@nxp.com>
> Acked-by: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Patch applied.

Yours,
Linus Walleij
