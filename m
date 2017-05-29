From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/4] pinctrl: rockchip: Add iomux-route switching
 support for rk3399
Date: Mon, 29 May 2017 14:28:54 +0200
Message-ID: <CACRpkdb9pMvXiroSGDV3W9mP8qickaVQ+L_-tcbYynEMRvG40Q@mail.gmail.com>
References: <1495783223-28857-1-git-send-email-david.wu@rock-chips.com> <1495783223-28857-5-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:35880 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750966AbdE2M2z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 08:28:55 -0400
Received: by mail-it0-f46.google.com with SMTP id o5so26190035ith.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 05:28:55 -0700 (PDT)
In-Reply-To: <1495783223-28857-5-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Tao Huang <huangtao@rock-chips.com>, Doug Anderson <dianders@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, May 26, 2017 at 9:20 AM, David Wu <david.wu@rock-chips.com> wrote:

> There are 2 IP blocks pin routes need to be switched, that are
> uart2dbg, pcie_clkreq.
>
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> ---
> Change in v2:
>  - calculate the per-bank value dynamically (Heiko)

Patch applied with Heiko's ACK.

Yours,
Linus Walleij
