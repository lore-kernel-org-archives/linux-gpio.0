Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216A63A425B
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799785; cv=none; b=auoL9+3IN/GLsrz3UwydaC5KfoYoXO9aP3wPE3SJxiLOU2BBUmm6FCosEmuGWTPW9J8Wu1cbuai5HSJIyJuSw4GDXnWU5lkMifInEA/IOX2XhdScITBHAHV6F9RjAX5SQVv1Q0xw3fKUBAVQY1aBIX3kLVDeD1bPz/eYspm7Bts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799785; c=relaxed/simple;
	bh=AcDqqpUvQPtp2r2+5XU1PHfYoNql0A6LEGqhcq1OH+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h44Zcouk5RfZElFKXKFZUgyO480RE2YB+DWUUhl8Ax/dKbCm+839zdMleEe96YLYEzKlH0aoQXz+J4eXXUxvkEJXntYGYqRYXVVMgV4bom7qND9/GRXFo/I6VBojbax/hgh9VauV/d94qrbh8CEtmqQRpPhdKZb5Rta4v/Y1+6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNuMAOC1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNuMAOC1"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1631694f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 03:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799775; x=1792404575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNojFJwmE0oVprdqqjx/OIelZ/6m6PVyF1/QNYvXH3o=;
        b=DNuMAOC1qTMR/lvKGfNB75mWxCshSAmxMiflDf7msR5IzrXWXquCOLZEQ7z0Jm9KjE
         rXQuu71M7l6oKp8nYuPVM4pvXv4Y1nNobpJ7x/TSUjuUdhnZ8suyibxwuiprnYauwG9V
         P95nIBjlfVF/nTnNtIUe3IzXJwfn0vzDnruTKE+Pa6TCH5CaJkr/1qOi1FaDbqRFwhyq
         mDTjxfeprZwjmLTiIJtHZpBolUa0bCPB6O0z8hHIGH1qoGbiytlaOo/tX6A7LRgdg2TT
         pZjQa99IjIoqCQZdXOW79x+xvxv19sHsk0OusDEA619bhSOIbKGmpvDgKBpSa/iPnO0+
         ncgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799775; x=1792404575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNojFJwmE0oVprdqqjx/OIelZ/6m6PVyF1/QNYvXH3o=;
        b=sb+jQAb2G/bQN2ZhpeQec2qnORTG3ziHZZI9zsCGgks6ncUXsNH4+inIONNiUBDVAb
         RE5F8nvlOGmudOIisoNBR6N43kAQwxbTNa36nJUKkSjk23loedevQIlT0uiNtK5DXvXB
         WiH+b0/q5aUHgVuUj2x+gbuU0X1mCfCTjWnADilkl+3ZxuZ011ml0PsiDXyWRbfl3rl+
         YF3AAQA3XSOXB7dSIRv1AmVaCtZAwWJIME25jtk709xxIXblz+e6XqY+Lw47R+obmRF0
         wbLLIU+b/YbBq7iRA4QffC8lWmEZGZZOBsQhLCtK5wWL4MEbN1Q1sURGwKr6GxSMym4L
         VPGg==
X-Forwarded-Encrypted: i=1; AKwUvByQUC2oyB3aMELaFJ4vuJjHyl10W7EyQodloVW/DTA/b01SaCxgynX60YdY0k6dR0NxoL4m+8bd5DjX@vger.kernel.org
X-Gm-Message-State: AFq9FYIPMjWSIJJhv+l3jcd5ZT9jzUFff4x1te5EjywYmzuwGYeliyGV
	odP4Wxm/yR0l+PCsGbJMKZom4kJhvGSjt5jE2GjcYCVjefDaJwdoUj+m
X-Gm-Gg: AYBFou0NVbm98za/dPOjPcgJgAEQ6Ww4T5dlhNednGmEhDoLcLPY7XhD/8JRZ85Rqa/
	viV1K7iuNgHSoChKHeAZ6ciFOEMR7pj7yL4YwnSDWi9IU3rjUta5zSmYupj9hnT8wquAP2hq9tC
	VnysvjK71A9YcAH5bRcuBk5g34jAqvrWTKZSTpKPCJ8M+qW8YsTpVzDiuqpKZO5wqQ9jr7dwXLx
	vKMTIYO3Rqs/u726ljuaNaB7ca7lGgwvp0+WAWDQ9tkX5SoCOz4XgjviADn0pPdu9E7s2ctql//
	ekNvw7R20uQHYLY5hpIvT+9J+3XLq/z4wtW9A6sAFUa/0XcHf6u5Sg9J0PrBRPuI4rEPrSnWT1K
	1JzzjTkC5n5q5b1zP5dHbNv77dOYhW+6KFeKq/6ZMDMdMuNMwLR0MPpyVwVFt103PUmSoZXnb0l
	R+3PRIZY7Ge3CpsgGd3VYAOwQKuGlkmvNmPYxDqn9gQSh4eLRs99Qzi3HBaFlvX9zNg1nGKAv5F
	Kp/7ZcxoBHrp3EeMbnAlrPNTeAvzZSV
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a18e498471mr190194615e9.20.1791799775134;
        Mon, 12 Oct 2026 03:09:35 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:34 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 04/11] pinctrl: sunxi: add Allwinner B288 pin controller driver
Date: Mon, 12 Oct 2026 11:08:09 +0100
Message-ID: <20261012100816.331033-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

80 pins across ports B, C, D, F and G; the mux values come from the DT.
Port C has no external interrupts. PH0 is BSP FPGA-only and omitted.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/Kconfig              | 10 +++++
 drivers/pinctrl/sunxi/Makefile             |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c | 49 ++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index dc62eba96348..a08186133090 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -56,6 +56,16 @@ config PINCTRL_SUN8I_A23_R
 	default MACH_SUN8I
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN8I_B288
+	bool "Support for the Allwinner B288 PIO"
+	default MACH_SUN8I
+	select PINCTRL_SUNXI
+	help
+	  Say Y here to enable pin controller and GPIO support for the
+	  Allwinner B288 (sun8iw10p1) SoC, as used in e-book readers such
+	  as the PocketBook Verse. This covers ports B, C, D, F and G,
+	  including the four banks of external interrupt capable pins.
+
 config PINCTRL_SUN8I_H3
 	bool "Support for the Allwinner H3 PIO"
 	default MACH_SUN8I
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 951b3f1e4b4f..5129c0f19f3e 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_PINCTRL_SUN50I_A100)	+= pinctrl-sun50i-a100.o
 obj-$(CONFIG_PINCTRL_SUN50I_A100_R)	+= pinctrl-sun50i-a100-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_A83T)	+= pinctrl-sun8i-a83t.o
 obj-$(CONFIG_PINCTRL_SUN8I_A83T_R)	+= pinctrl-sun8i-a83t-r.o
+obj-$(CONFIG_PINCTRL_SUN8I_B288)	+= pinctrl-sun8i-b288.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3)		+= pinctrl-sun8i-h3.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3_R)	+= pinctrl-sun8i-h3-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_V3S)		+= pinctrl-sun8i-v3s.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
new file mode 100644
index 000000000000..f973c2b3f2eb
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Allwinner B288 (sun8iw10p1) SoC pinctrl driver.
+ *
+ * Bank sizes and the interrupt mux derived from Allwinner's BSP driver
+ * pinctrl-sun8iw10p1.c, which is:
+ * Copyright (C) 2014 Jackie Hwang <huangshr@allwinnertech.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-sunxi.h"
+
+/* PH0 exists only on the BSP's FPGA platform and is omitted. */
+static const u8 b288_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG */
+	{  0, 17, 15, 29,  0,  7, 12 };
+
+static const u8 b288_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG */
+	{  0,  6,  0,  6,  0,  6,  6 };
+
+static struct sunxi_pinctrl_desc b288_pinctrl_data = {
+	.irq_banks	= 4,
+};
+
+static int b288_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_dt_table_init(pdev, b288_nr_bank_pins,
+					   b288_irq_bank_muxes,
+					   &b288_pinctrl_data, 0);
+}
+
+static const struct of_device_id b288_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun8i-b288-pinctrl", },
+	{}
+};
+
+static struct platform_driver b288_pinctrl_driver = {
+	.probe	= b288_pinctrl_probe,
+	.driver	= {
+		.name		= "sun8i-b288-pinctrl",
+		.of_match_table	= b288_pinctrl_match,
+	},
+};
+builtin_platform_driver(b288_pinctrl_driver);
-- 
2.52.0

