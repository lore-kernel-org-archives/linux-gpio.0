Return-Path: <SRS0=bHLr=US=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC74C31E49
	for <linux-gpio@archiver.kernel.org>; Wed, 19 Jun 2019 12:46:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC82C206E0
	for <linux-gpio@archiver.kernel.org>; Wed, 19 Jun 2019 12:46:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731876AbfFSMqC (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 19 Jun 2019 08:46:02 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:58123 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727244AbfFSMqC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jun 2019 08:46:02 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hdZyS-0004Xr-KO from Harish_Kandiga@mentor.com ; Wed, 19 Jun 2019 05:46:00 -0700
Received: from hkandiga-VirtualBox.ina-wifi.mentorg.com (137.202.0.90) by
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Wed, 19 Jun 2019 13:45:56 +0100
From:   Harish Jenny K N <harish_kandiga@mentor.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Subject: [PATCH V3 2/2] gpio: inverter: document the inverter bindings
Date:   Wed, 19 Jun 2019 18:15:44 +0530
Message-ID: <1560948344-6543-3-git-send-email-harish_kandiga@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560948344-6543-1-git-send-email-harish_kandiga@mentor.com>
References: <1560948344-6543-1-git-send-email-harish_kandiga@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the device tree binding for the inverter gpio
controller to configure the polarity of the gpio pins
used by the consumers.

Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
---
 .../devicetree/bindings/gpio/gpio-inverter.txt     | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-inverter.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-inverter.txt b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
new file mode 100644
index 0000000..8bb6b2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
@@ -0,0 +1,29 @@
+GPIO-INVERTER
+======
+This binding defines the gpio-inverter. The gpio-inverter is a driver that
+allows to properly describe the gpio polarities on the hardware.
+
+Please refer to gpio.txt for generic information regarding GPIO bindings.
+
+Required properties:
+- compatible : "gpio-inverter".
+- gpio-controller: Marks the port as GPIO controller.
+- #gpio-cells: One. This is the pin number.
+- inverted-gpios: Array of GPIO pins required from consumers, whose polarity
+  has to be inverted in the driver.
+Note: gpio flag should be set as GPIO_ACTIVE_HIGH. Using GPIO_ACTICE_LOW will
+cause double inversion.
+
+Optional properties:
+- gpio-line-names: Refer to gpio.txt for details regarding this property.
+
+Example:
+
+gpio_inv: gpio-inv {
+	compatible = "gpio-inverter";
+	gpio-controller;
+	#gpio-cells = <1>;
+	inverted-gpios = <&gpio5 24 GPIO_ACTIVE_HIGH>,
+	<&gpio7 0 GPIO_ACTIVE_HIGH>, <&gpio7 1 GPIO_ACTIVE_HIGH>;
+	gpio-line-names = "JTAG_DNL_EN", "lvds-pwrdwn", "lcd-on";
+};
--
2.7.4

