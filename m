From: biao huang <biao.huang@mediatek.com>
Subject: pinctrl: mediatek: questions about gpio/pinctrl/eint
Date: Thu, 28 Jan 2016 10:35:41 +0800
Message-ID: <1453948541.14802.38.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw02.mediatek.com ([218.249.47.111]:44823 "EHLO
	mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S964802AbcA1Kf4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2016 05:35:56 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>

Hi Linus,

	We have two questions associate with mediatek pinctrl/gpio in linux
kernel to asking for your help.

	First, when user call GPIO API to control medaitek gpio, they should
call pinctrl API to set pinmux to mode 0 ahead, so this pin is function
as gpio. And this makes things a little complicated. Is there any simple
API can solve this problem? How about add pinmux setting in
gpio_request?

	Second, here is our request_irq flow in mkd eint driver:
request_irq --> mtk_pinctrl_irq_request_resources--> mtk_pmx_set_mode,
Normally, it'll set pinmux to eint mode (usually is mode 0) in
mtk_pmx_set_mode function. But for special case, such as iddig (connect
to usb), when iddig request_irq, it should set pinmux to iddig mode
(mode 2 in mt8163).
	Is there a better way than changing
        MTK_PIN(
                PINCTRL_PIN(16, "IDDIG"),
                NULL, "mt8173",
                MTK_EINT_FUNCTION(0, 16),
                MTK_FUNCTION(0, "GPIO16"),
                MTK_FUNCTION(1, "IDDIG"),
                MTK_FUNCTION(2, "CMFLASH"),
                MTK_FUNCTION(4, "PWM5")
        ),
	to
        MTK_PIN(
                PINCTRL_PIN(16, "IDDIG"),
                NULL, "mt8173",
                MTK_EINT_FUNCTION(2, 16),
                MTK_FUNCTION(0, "GPIO16"),
                MTK_FUNCTION(1, "IDDIG"),
                MTK_FUNCTION(2, "CMFLASH"),
                MTK_FUNCTION(4, "PWM5")
        ),
	in drivers/pinctrl/mediatek/pinctrl-mtk-mt8163.h?

	We are looking forward for your help, thanks very much!

Best Regards!
Yours,
Biao Huang




