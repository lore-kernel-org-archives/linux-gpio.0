From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 1/5] pinctrl: imx: fix debug message for
 SHARE_MUX_CONF_REG case
Date: Mon, 22 May 2017 11:02:47 +0200
Message-ID: <CACRpkdYg9Ev2NPLR17bTx0kmNJQAHBHXTOWvejaK=uLtvFgZLw@mail.gmail.com>
References: <1495177545-23006-1-git-send-email-aisheng.dong@nxp.com> <1495177545-23006-2-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:33251 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757329AbdEVJCs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2017 05:02:48 -0400
Received: by mail-io0-f180.google.com with SMTP id p24so77187572ioi.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2017 02:02:48 -0700 (PDT)
In-Reply-To: <1495177545-23006-2-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Bai Ping <ping.bai@nxp.com>, fugang.duan@nxp.com, Sascha Hauer <kernel@pengutronix.de>

On Fri, May 19, 2017 at 9:05 AM, Dong Aisheng <aisheng.dong@nxp.com> wrote:

> The original implemented debug message does not work for
> SHARE_MUX_CONF_REG case. This patch fixes it.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Fixes: bf5a530971af ("pinctrl: imx: add VF610 support to imx pinctrl framework")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Patch applied with Shawn's ACK.

Yours,
Linus Walleij
