From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/4] pinctrl: rockchip: Add iomux-route switching
 support for rk3328
Date: Mon, 29 May 2017 14:27:52 +0200
Message-ID: <CACRpkdYmCuyU8=H35opcToK26DanHQF4QgaHQ86BZ9Vvh0P8wg@mail.gmail.com>
References: <1495783223-28857-1-git-send-email-david.wu@rock-chips.com> <1495783223-28857-4-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:37962 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751062AbdE2M1y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 08:27:54 -0400
Received: by mail-it0-f51.google.com with SMTP id r63so26061290itc.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 05:27:53 -0700 (PDT)
In-Reply-To: <1495783223-28857-4-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Tao Huang <huangtao@rock-chips.com>, Doug Anderson <dianders@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, May 26, 2017 at 9:20 AM, David Wu <david.wu@rock-chips.com> wrote:

> There are 8 IP blocks pin routes need to be switched, that are
> uart2dbg, gmac-m1-optimized, pdm, spi, i2s2, card, tsp, cif.
>
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> ---
> Change in v2:
>  - calculate the per-bank value dynamically (Heiko)

Patch applied with Heiko's ACK.

Yours,
Linus Walleij
