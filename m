From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH v1 0/2] Add pinctrl input schmitt support
Date: Tue, 14 Feb 2017 18:35:39 +0800
Message-ID: <1487068541-14120-1-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, linus.walleij@linaro.org
Cc: huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "david.wu" <david.wu@rock-chips.com>
List-Id: linux-gpio@vger.kernel.org

From: "david.wu" <david.wu@rock-chips.com>

Some pins need to enable Schmitt triggers which are used
in open loop configurations for noise immunity and closed
loop configurations to implement function generators.

david.wu (2):
  pinctrl: rockchip：Add input schmitt support
  pinctrl: rockchip: Add input schmitt support for rk3328

 drivers/pinctrl/pinctrl-rockchip.c | 90 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

-- 
1.9.1
