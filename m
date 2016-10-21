From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC PATCH 13/13] ARM64: dts: meson-gxl-p23x: Enable IR receiver
Date: Fri, 21 Oct 2016 16:40:38 +0200
Message-ID: <1477060838-14164-14-git-send-email-narmstrong@baylibre.com>
References: <1477060838-14164-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f175.google.com ([209.85.216.175]:36810 "EHLO
        mail-qt0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934612AbcJUOlE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2016 10:41:04 -0400
Received: by mail-qt0-f175.google.com with SMTP id m5so88901375qtb.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2016 07:41:04 -0700 (PDT)
In-Reply-To: <1477060838-14164-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: khilman@baylibre.com, carlo@caione.org, linus.walleij@linaro.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

Enable the Infraread Receiver on the p23x board.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi
index 77637ce..11a9010 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi
@@ -109,6 +109,12 @@
 	status = "okay";
 };
 
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
+
 /* Wireless SDIO Module */
 &sd_emmc_a {
 	status = "okay";
-- 
1.9.1

