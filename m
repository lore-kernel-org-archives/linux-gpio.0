From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/2] pinctrl: rockchip: Fix the correct routing config for the gmac-m1 pins of rmii and rgmii
Date: Sat, 30 Sep 2017 17:07:27 +0200
Message-ID: <1908269.6t3djq65xf@phil>
References: <1506773601-27315-1-git-send-email-david.wu@rock-chips.com> <1506773601-27315-3-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:48900 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751028AbdI3PHx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 30 Sep 2017 11:07:53 -0400
In-Reply-To: <1506773601-27315-3-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: linus.walleij@linaro.org, huangtao@rock-chips.com, andy.yan@rock-chips.com, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi David,

Am Samstag, 30. September 2017, 20:13:21 CEST schrieb David Wu:
> If the gmac-m1 optimization(bit10) is selected, the gpio function
> of gmac pins is not valid. We may use the rmii mode for gmac interface,
> the pins such as rx_d2, rx_d3, which the rgmii mode used, but rmii not
> used could be taken as gpio function. So gmac_rxd0m1 selects the bit2,
> and gmac_rxd0m3 select bit10 is more correct.
> 
> Signed-off-by: David Wu <david.wu@rock-chips.com>

the patch subject should mention the the rk3328 whose routing gets fixed
(like adding a simple "on rk3328" to it), otherwise

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
