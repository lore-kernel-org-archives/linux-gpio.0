From: Biao Huang <biao.huang@mediatek.com>
Subject: [RESEND PATCH 0/2] pinctrl: mediatek: add pinctrl/GPIO/EINT driver for mt2701
Date: Wed, 13 Apr 2016 15:07:42 +0800
Message-ID: <1460531264-4405-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw02.mediatek.com ([210.61.82.184]:55423 "EHLO
	mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S932760AbcDMHH7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2016 03:07:59 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>

Biao Huang (1):
  arm: dts: Add pinctrl/GPIO/EINT node for mt2701

Erin Lo (1):
  ARM: mediatek: Add MT2701 config options for mediatek SoCs.

 arch/arm/boot/dts/mt2701.dtsi  |   19 +++++++++++++++++++
 arch/arm/mach-mediatek/Kconfig |    4 ++++
 2 files changed, 23 insertions(+)

-- 
1.7.9.5

