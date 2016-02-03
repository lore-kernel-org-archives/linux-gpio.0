From: Biao Huang <biao.huang@mediatek.com>
Subject: [PATCH 0/2] pinctrl: mediatek: Add direction control and gpio_request_enable Support
Date: Wed, 3 Feb 2016 09:24:44 +0800
Message-ID: <1454462686-770-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

1. Set direction to input when do input-enable/disable and input-schmitt-enable/disable properties.
2. Add gpio_request_enable support to set pin to gpio function.

Biao Huang (2):
  pinctrl: mediatek: fix direction control issue
  pinctrl: mediatek: Add gpio_request_enable support

 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |   38 +++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

-- 
1.7.9.5
