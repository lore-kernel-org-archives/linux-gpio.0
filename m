From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/2] pinctrl: rockchip: Add rk3128 pinctrl support
Date: Fri, 21 Jul 2017 11:38:08 +0200
Message-ID: <1588105.fpdkWe6dTk@phil>
References: <1500618435-15092-1-git-send-email-david.wu@rock-chips.com> <1500618435-15092-3-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:46006 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753617AbdGUJiP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 Jul 2017 05:38:15 -0400
In-Reply-To: <1500618435-15092-3-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: linus.walleij@linaro.org, huangtao@rock-chips.com, dianders@chromium.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Am Freitag, 21. Juli 2017, 14:27:15 CEST schrieb David Wu:
> There are 3 IP blocks pin routes need to be switched, that are
> emmc-cmd, spi, i2s. And there are some pins need to be recalced,
> which are gpio2c4~gpio2c7 and gpio2d0.
>  
> Signed-off-by: David Wu <david.wu@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
