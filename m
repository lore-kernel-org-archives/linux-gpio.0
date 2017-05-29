From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: rockchip: Add iomux-route switching support
Date: Mon, 29 May 2017 14:25:11 +0200
Message-ID: <CACRpkdb7t5DWq3punafcsf3Kjqpwcvfyb2VyH59iUBX1EAx8eg@mail.gmail.com>
References: <1495783223-28857-1-git-send-email-david.wu@rock-chips.com> <1495783223-28857-2-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:37246 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751011AbdE2MZN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 08:25:13 -0400
Received: by mail-it0-f43.google.com with SMTP id g126so26036132ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 05:25:12 -0700 (PDT)
In-Reply-To: <1495783223-28857-2-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Tao Huang <huangtao@rock-chips.com>, Doug Anderson <dianders@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, May 26, 2017 at 9:20 AM, David Wu <david.wu@rock-chips.com> wrote:

> On the some rockchip SOCS, some things like rk3399 specific uart2 can use
> multiple pins. Somewhere between the pin io-cells and the uart it seems
> to have some sort of switch to decide to which pin to actually route the
> data.
>
> +-------+    +--------+  /- GPIO4_B0 (pinmux 2)
>
> | uart2 | -- | switch | --- GPIO4_C0 (pinmux 2)
>
> +-------+    +--------+  \- GPIO4_C3 (pinmux 2)
> (switch selects one of the 3 pins base on the GRF_SOC_CON7[BIT0, BIT1])
>
> The routing switch is determined by one pin of a specific group to be set
> to its special pinmux function. If the pinmux setting is wrong for that
> pin the ip block won't work correctly anyway.
>
> Signed-off-by: David Wu <david.wu@rock-chips.com>

Patch applied with Heiko's ACK.

Yours,
Linus Walleij
