From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv3 6/6] pinctrl: sh-pfc: Support named pins with custom configuration
Date: Sat, 12 Nov 2016 17:04:29 +0100
Message-ID: <20161112160429.12524-7-niklas.soderlund+renesas@ragnatech.se>
References: <20161112160429.12524-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:60057 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966115AbcKLQGQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Nov 2016 11:06:16 -0500
In-Reply-To: <20161112160429.12524-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>

Pins not associated with a GPIO port can still have other configuration
parameters. Add a new macro SH_PFC_PIN_NAMED_CFG which allows for named
pins to be declared with a set of configurations. The new macro is an
modification of SH_PFC_PIN_NAMED to allow for optional configuration to
be assigned.

The flag SH_PFC_PIN_CFG_NO_GPIO is still enforced as this should only be
used to define pins not associated with a GPIO port.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 9556c17..e42cc7a 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -546,6 +546,14 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 		.configs = SH_PFC_PIN_CFG_NO_GPIO,			\
 	}
 
+/* SH_PFC_PIN_NAMED_CFG - Expand to a sh_pfc_pin entry with the given name */
+#define SH_PFC_PIN_NAMED_CFG(row, col, _name, cfgs)			\
+	{								\
+		.pin = PIN_NUMBER(row, col),				\
+		.name = __stringify(PIN_##_name),			\
+		.configs = SH_PFC_PIN_CFG_NO_GPIO | cfgs,		\
+	}
+
 /* PINMUX_DATA_ALL - Expand to a list of PORT_name_DATA, PORT_name_FN0,
  *		     PORT_name_OUT, PORT_name_IN marks
  */
-- 
2.10.2

