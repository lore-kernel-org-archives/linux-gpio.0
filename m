From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: imx: output one pin/config pair per line in pinconf-groups
Date: Tue, 6 Sep 2016 00:19:07 +0200
Message-ID: <CACRpkdbwh=k3GD-7wSq9iBoBhyQ4SFD75xaLnx6g8WbRZ5X7Gg@mail.gmail.com>
References: <1471644337-10162-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:35986 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754754AbcIEWTI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2016 18:19:08 -0400
Received: by mail-oi0-f50.google.com with SMTP id w78so71078245oie.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2016 15:19:08 -0700 (PDT)
In-Reply-To: <1471644337-10162-1-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sat, Aug 20, 2016 at 12:05 AM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:

> cat /sys/kernel/debug/pinctrl/${pinctrl}/pinconf-groups output is
> hardly readable, if a pin group contains more than one pin the output
> is glued and looks like this:
>
>   MX6Q_PAD_SD1_DAT0: 0x17071MX6Q_PAD_SD1_CMD: 0x17071MX6Q_PAD_SD1_CLK: 0x17071
>
> Add two space indentation and a new line separator to improve
> readability of the output.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Patch applied with Shawn's ACK.

Yours,
Linus Walleij
