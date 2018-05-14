From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] pinctrl: rockchip: Add pinctrl support for PX30
Date: Mon, 14 May 2018 15:36:37 +0200
Message-ID: <2756512.RvepBuBXky@phil>
References: <1526299191-1140-1-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526299191-1140-1-git-send-email-david.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: linus.walleij@linaro.org, huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi David,

Am Montag, 14. Mai 2018, 13:59:51 CEST schrieb David Wu:
> There are 4 banks (GPIO0 ~ GPIO3), bank0 is in PD_PMU
> subsystem, bank1/bank2/bank3 are in PD_BUS subsystem.
> 
> Signed-off-by: David Wu <david.wu@rock-chips.com>

the PX30 looks pretty simple in the pinctrl-area and I couldn't
find anything looking out of the ordinary, so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


Thanks
Heiko
