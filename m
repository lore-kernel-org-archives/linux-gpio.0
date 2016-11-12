From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv3 2/6] pinctrl: sh-pfc: Add helper to handle bias lookup table
Date: Sat, 12 Nov 2016 17:04:25 +0100
Message-ID: <20161112160429.12524-3-niklas.soderlund+renesas@ragnatech.se>
References: <20161112160429.12524-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:60032 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966249AbcKLQGP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Nov 2016 11:06:15 -0500
In-Reply-To: <20161112160429.12524-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>

On some SoC there are no simple mapping of pins to bias register bits
and a lookup table is needed. This logic is already implemented in some
SoC specific drivers that could benefit from a generic implementation.

Add helpers to deal with the lookup which later can be used by the SoC
specific drivers. The logic used to lookup are different from the one it
aims to replace, this is intentional. This new method reduces the memory
consumption at the cost of increased CPU usage and fix a bug where a
WARN() would incorrectly be triggered if the register offset is 0.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/pinctrl/sh-pfc/core.c   | 15 +++++++++++++++
 drivers/pinctrl/sh-pfc/core.h   |  4 ++++
 drivers/pinctrl/sh-pfc/sh_pfc.h |  6 ++++++
 3 files changed, 25 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index f3a8897..cf80ce1 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -389,6 +389,21 @@ int sh_pfc_config_mux(struct sh_pfc *pfc, unsigned mark, int pinmux_type)
 	return 0;
 }
 
+const struct sh_pfc_bias_info *
+sh_pfc_pin_to_bias_info(const struct sh_pfc_bias_info *info,
+			unsigned int num, unsigned int pin)
+{
+	unsigned int i;
+
+	for (i = 0; i < num; i++)
+		if (info[i].pin == pin)
+			return &info[i];
+
+	WARN_ONCE(1, "Pin %u is not in bias info list\n", pin);
+
+	return NULL;
+}
+
 static int sh_pfc_init_ranges(struct sh_pfc *pfc)
 {
 	struct sh_pfc_pin_range *range;
diff --git a/drivers/pinctrl/sh-pfc/core.h b/drivers/pinctrl/sh-pfc/core.h
index 0bbdea58..6d598dd 100644
--- a/drivers/pinctrl/sh-pfc/core.h
+++ b/drivers/pinctrl/sh-pfc/core.h
@@ -33,4 +33,8 @@ void sh_pfc_write_reg(struct sh_pfc *pfc, u32 reg, unsigned int width,
 int sh_pfc_get_pin_index(struct sh_pfc *pfc, unsigned int pin);
 int sh_pfc_config_mux(struct sh_pfc *pfc, unsigned mark, int pinmux_type);
 
+const struct sh_pfc_bias_info *
+sh_pfc_pin_to_bias_info(const struct sh_pfc_bias_info *info,
+			unsigned int num, unsigned int pin);
+
 #endif /* __SH_PFC_CORE_H__ */
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 2345421..9556c17 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -189,6 +189,12 @@ struct sh_pfc_window {
 	unsigned long size;
 };
 
+struct sh_pfc_bias_info {
+	u16 pin;
+	u16 reg : 11;
+	u16 bit : 5;
+};
+
 struct sh_pfc_pin_range;
 
 struct sh_pfc {
-- 
2.10.2

