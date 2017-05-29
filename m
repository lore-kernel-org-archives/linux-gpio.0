From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/4] pinctrl: rockchip: Add iomux-route switching
 support for rk3228
Date: Mon, 29 May 2017 14:26:38 +0200
Message-ID: <CACRpkdaq-tx7W2BrZ=BUTbJtCJiDgq9jPuYJyENtCBDfN-0SnA@mail.gmail.com>
References: <1495783223-28857-1-git-send-email-david.wu@rock-chips.com> <1495783223-28857-3-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:34004 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbdE2M0k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 08:26:40 -0400
Received: by mail-io0-f177.google.com with SMTP id k91so40314527ioi.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 05:26:39 -0700 (PDT)
In-Reply-To: <1495783223-28857-3-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Tao Huang <huangtao@rock-chips.com>, Doug Anderson <dianders@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, May 26, 2017 at 9:20 AM, David Wu <david.wu@rock-chips.com> wrote:

> There are 9 IP blocks pin routes need to be switched, that are
> pwm-0, pwm-1, pwm-2, pwm-3, sdio, spi, emmc, uart2, uart1.
>
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> ---
> Change in v2:
>  - calculate the per-bank value dynamically (Heiko)

Patch applied with Heikos ACK.

Yours,
Linus Walleij
