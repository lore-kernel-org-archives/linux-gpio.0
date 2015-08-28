From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v1 2/3] pinctrl: rockchip: add support for the rk3036
Date: Fri, 28 Aug 2015 09:53:20 +0200
Message-ID: <2085107.a4DMzAYYyZ@phil>
References: <1440740808-15004-1-git-send-email-zhengxing@rock-chips.com> <1440740808-15004-3-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:40732 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751074AbbH1Hxd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 28 Aug 2015 03:53:33 -0400
In-Reply-To: <1440740808-15004-3-git-send-email-zhengxing@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hi,

Am Freitag, 28. August 2015, 13:46:47 schrieb Xing Zheng:
> Many parts of pinctrl rk3036 are similar to rk2928's.
> 
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> ---
> 
> Changes in v1: None
> 
>  drivers/pinctrl/pinctrl-rockchip.c |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

please also add the new "rockchip,rk3036-pinctrl" compatible to 
Documentation/devicetree/pinctrl/rockchip,pinctrl.txt


I've checked the values against the rk3036 TRM and everything seems to fit, so 
with the missing compatible added to the binding you can add my

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


Heiko
