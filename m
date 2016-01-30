From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH v3 0/2] add pinctrl support for rk3399
Date: Sat, 30 Jan 2016 19:31:55 +0800
Message-ID: <1454153517-52969-1-git-send-email-david.wu@rock-chips.com>
References: <1451997055-47655-1-git-send-email-wdc@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.131]:56036 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754085AbcA3LsX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Jan 2016 06:48:23 -0500
In-Reply-To: <1451997055-47655-1-git-send-email-wdc@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: heiko@sntech.de
Cc: linus.walleij@linaro.org, huangtao@rock-chips.com, zyw@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>

Test on rk3399 fpga-board

David Wu (2):
  pinctrl: rockchip: add support for the rk3399
  dt-bindings: rockchip-pinctrl: Support the RK3399 SoCs compatible

 .../bindings/pinctrl/rockchip,pinctrl.txt          |   1 +
 drivers/pinctrl/pinctrl-rockchip.c                 | 372 ++++++++++++++++++++-
 2 files changed, 359 insertions(+), 14 deletions(-)

-- 
1.9.1


