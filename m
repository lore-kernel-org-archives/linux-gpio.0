From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH 0/2] Fix two pinctrl issues
Date: Sat, 30 Sep 2017 20:13:19 +0800
Message-ID: <1506773601-27315-1-git-send-email-david.wu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, linus.walleij@linaro.org
Cc: huangtao@rock-chips.com, andy.yan@rock-chips.com, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>
List-Id: linux-gpio@vger.kernel.org

They are:
1. Fix the rk3399 gpio0 and gpio1 banks' drive strength offset.
2. Fix the correct routing config for the gmac-m1 pins between rmii and rgmii.

David Wu (2):
  pinctrl: rockchip: Fix the rk3399 gpio0 and gpio1 banks' drv_offset at
    pmu grf
  pinctrl: rockchip: Fix the correct routing config for the gmac-m1 pins
    of rmii and rgmii

 drivers/pinctrl/pinctrl-rockchip.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

-- 
1.9.1
