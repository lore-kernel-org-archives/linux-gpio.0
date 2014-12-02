From: Yunlei He <heyunlei@huawei.com>
Subject: [PATCH 2/2] gpio: pl061: document gpio-ranges property for bindings file
Date: Tue, 2 Dec 2014 12:33:00 +0800
Message-ID: <1417494780-3704-3-git-send-email-heyunlei@huawei.com>
References: <1417494780-3704-1-git-send-email-heyunlei@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from [119.145.14.66] ([119.145.14.66]:12018 "EHLO
	szxga03-in.huawei.com" rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org
	with ESMTP id S1754158AbaLBEd7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Dec 2014 23:33:59 -0500
In-Reply-To: <1417494780-3704-1-git-send-email-heyunlei@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: haojian.zhuang@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: bintian.wang@huawei.com, peifeiyue@huawei.com, liguozhu@hisilicon.com, Yunlei He <heyunlei@huawei.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>

Document gpio-ranges property in pl061-gpio.txt

Signed-off-by: Yunlei He <heyunlei@huawei.com>
Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Signed-off-by: Haojian Zhuang <haojian.zhuang@linaro.org>
---
 Documentation/devicetree/bindings/gpio/pl061-gpio.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.txt b/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
index a2c416b..89058d3 100644
--- a/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
@@ -7,4 +7,4 @@ Required properties:
   - bit 0 specifies polarity (0 for normal, 1 for inverted)
 - gpio-controller : Marks the device node as a GPIO controller.
 - interrupts : Interrupt mapping for GPIO IRQ.
-
+- gpio-ranges : Interaction with the PINCTRL subsystem.
-- 
1.9.1


