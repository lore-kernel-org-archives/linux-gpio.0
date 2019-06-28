Return-Path: <SRS0=o0Q7=U3=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B2BC4321A
	for <linux-gpio@archiver.kernel.org>; Fri, 28 Jun 2019 09:31:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B2D1208E3
	for <linux-gpio@archiver.kernel.org>; Fri, 28 Jun 2019 09:31:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfF1JbF (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 28 Jun 2019 05:31:05 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:51497 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbfF1JbF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jun 2019 05:31:05 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hgnDj-0002lR-A5 from Harish_Kandiga@mentor.com ; Fri, 28 Jun 2019 02:31:03 -0700
Received: from hkandiga-VirtualBox.ina-wifi.mentorg.com (137.202.0.90) by
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Fri, 28 Jun 2019 10:30:57 +0100
From:   Harish Jenny K N <harish_kandiga@mentor.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Subject: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
Date:   Fri, 28 Jun 2019 15:00:50 +0530
Message-ID: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
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

