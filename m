From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: rockchip: Add rk3128 pinctrl support
Date: Thu, 3 Aug 2017 09:32:04 +0200
Message-ID: <CACRpkdZRFcNJFLp_NJBg1e1OEjy=yoLWNyrg_mWFcAZOrmfRiw@mail.gmail.com>
References: <1500618435-15092-1-git-send-email-david.wu@rock-chips.com> <1500618435-15092-3-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:34445 "EHLO
        mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751050AbdHCHcF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2017 03:32:05 -0400
Received: by mail-oi0-f43.google.com with SMTP id x3so5374932oia.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2017 00:32:05 -0700 (PDT)
In-Reply-To: <1500618435-15092-3-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Tao Huang <huangtao@rock-chips.com>, Doug Anderson <dianders@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jul 21, 2017 at 8:27 AM, David Wu <david.wu@rock-chips.com> wrote:

> There are 3 IP blocks pin routes need to be switched, that are
> emmc-cmd, spi, i2s. And there are some pins need to be recalced,
> which are gpio2c4~gpio2c7 and gpio2d0.
>
> Signed-off-by: David Wu <david.wu@rock-chips.com>

Patch applied with Heiko's review tag.

Yours,
Linus Walleij
