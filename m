Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908495;
	b=fGgEgBeDXMcJmzI22cWy7POezxVzQQ91R6qal6aBs0CHMYzjV2akwBX4R5/lCrbxjot6
	 LqK4Md6fU+Hpvjhzi3AYnCMUmx7c9VKGrhHmXM4A6aprwCYodxd0C/h8rXouuQDktQzqT
	 P5qJB8bWsBpDdd6vXIF1re1llKbYVBXueGC1wL/ynO0Sw2YxS9E5xkTQyDr+5pqLjTHZW
	 6rEvSiFTpxqHHUPAyav1XIFXWH9+qv8d/c0a+HqCb50p3ZOGmae7RD398ttfzOBsY/BwU
	 e9YuoWCRrGPb+85G9DyH79wL3wW3Dtt2ZrTGk6y429S2Ib8HOvUu5td3xRj3nvwm68g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b2cuoSSXuPlFWsURCaXb/TKI1SgcO0qXqGq45/zPoZc=;
	b=0Iyjp3UgXsdZXgSlT8f+7SbdIqAwDWtjqY+BIUxaOinJcshHtjiEf5EApwq2o/5qUIh6
	 kwt/ip5A5uyj1Lx+Dw0I/w8ZnNEceKfYM2dTBxZekbZ1WZENRklxAbEPr5yAOQA+Uymiw
	 0gqfo9xsmEOdvQlys3h4IsA6KJO02pQmk6vaXq26UPzPBncGasGS5lhjB5349VwxkxXF0
	 3c9Kc5J5KnXcV6UFlV4DrX2c1eipuZ2k+3NuJuLp5gCWr1WU+yfNqvRcKUWCGcY/2v0sB
	 V0Pd1ZId9EtISRgWPwxa/Yh7XKeUhsOYg6auhThhOUCer2plyHWCMQwDpiwmJqGZLNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TUA0m+pm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33C8606D81A
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 19:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F33C8606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TUA0m+pm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d05d51553so15133855e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 11:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908493; x=1794513293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2cuoSSXuPlFWsURCaXb/TKI1SgcO0qXqGq45/zPoZc=;
        b=TUA0m+pmwvIOB1FZH+J7qnSFSTgj5h6F5mL+jo9yQK01JIDiamT8G4kc7q7qVlQUSY
         G3KOoQuGm0yMVDWcFCG0mzPlPZXtnenXc+8xN5lmCVybB7uyt/TXXkJIfsO2rmWTX16p
         QG2cZ9dZFmgEk6hw7XIHZlvwksU820bvhPpaDl/d+BS1tOM61e1aE5mpx+8+rNU/3y4O
         gDE4sS/YOs9ygGwgc7HRUU/B75PvoljZA4Pd94dP1VJPRmcXl0rXgqcS3G+AEFmL18U5
         TZsOXFE1Ux77qWMD6SLq6vSrpyBzJ9mvnnLLWwRlmE+Db0RumRpX+HP7VfV4aeeNaIz+
         i3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908493; x=1794513293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b2cuoSSXuPlFWsURCaXb/TKI1SgcO0qXqGq45/zPoZc=;
        b=UG+bxWxkS6NJZ0aK0mCTrlK4xEs0580aPdBXcPt91nFwvKRpAqpdVsDE8lkJvVzfah
         xQPuG+bUUPgZ0glAutX1wSU5MTObFGcQgd5Pqd+DGmagzFVV9VfG02yus5ItBr1AGJ/X
         CWUBq1L9JLgxpjIr4zDRej9PwIOXZX8/NwT5F9NcZbkeLCls7ayAtvUo8GCJGbpM9P5z
         9s2lkiOlVybVe0r7AQyvPqjPaL26Si9L33JCyCvAJ5oM+dDKb5QqUS/eL+ANLlY9zuIH
         jhhEc1XwmcayoMGomFjcOrxUBurf4baacoeh/sQSBtKAV+pzgByylgpBU3gdWvuXx+j7
         d78g==
X-Forwarded-Encrypted: i=1; AKwUvBzWW/VRnSXe8JAXQyDuzcLUSY6+iRsWDb2IPsJ8OjDA2OIwmpYEZ0VKNmojt6Afx/HM6eMaULD4yzLq@vger.kernel.org
X-Gm-Message-State: APuU4Z9NLIMhjEqCeoxEzfL2nfO5//4ZzEWa0zxLqMQ+DeEaRBciNrvY
	Ap0MxTVuxRrgbM/XUd2m9lyZfnfodkibiRFaiNsBMuuzO6gLJs1pePVY
X-Gm-Gg: AYBFou30r1uCgzKEvBI9otgxmnkXy0UPl55/y8994TS5I0YJOmrWz9e/Njc2A5WGNMn
	CfyFKgt3FJkhfrKNsuhCnMh0NKJPMCFSAJpSuJJMzYLtrIn9rtbLD0vdV8/fnXQSe1tN9B5sS27
	LqKb6iEGAXzz5Go2HkYox+TRpHgBa+Zp/eH6D4j/FpdR1uD5A8Ab2OVLU3LpAmk2F6Q/nGY9gbs
	58wEQIfbSgIF3hYQ/SXlW8IkCSftm7Kbig0t5OxOPL3A0MT2ew6M1AIAAUfpb6ueHESofeO4RQN
	qQOoy2gndvj95tsTw2FTPWLjjqcMXzHCkxYziAAaEfgOBhnp23LpxbPtTYIRC/zqUnehMvsj+Db
	fD59suMvF+XnFaB16lTyRoSusKD6HEklT9qusiCscVlX5VfQo5N4RAWJHF/HiTX9XA+dTvMbBdi
	XD3LyqZ8avfnh1HsMFvkI6AiP5hZ7rwywH7afT+4c/MJSfRg5dBBKU+HFhWefGjldZ9+Ns2ZAd/
	cd/MJFobnmpSl/wLHDgYzgSYgtzADb98/W1O9xAFYLU9dGUE8gLxPyrbMp//Vf6pQZXBQGk+0sV
	8G/7G1YRCNL8N8xcpWmcE0sfBVVqfI964U8CKlvEdITBFHg=
X-Received: by 2002:a05:600c:4e56:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4b6e0b0906bmr2631915e9.32.1793908493207;
        Thu, 05 Nov 2026 11:54:53 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm83862895e9.8.2026.11.05.11.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:54:52 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 6/8] pinctrl: mediatek: mt6397: Add MediaTek MT6392
Date: Thu,  5 Nov 2026 20:50:26 +0100
Message-ID: <20261105195206.3440-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105195206.3440-1-l.scorcia@gmail.com>
References: <20261105195206.3440-1-l.scorcia@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the MT6392 pinctrl device, which is very similar to
MT6397 with a handful of different property values and its own pins
definition.

Update the MT6397 driver to retrieve device data from the match table and
use it for driver init.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     | 37 ++++++++++-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h | 64 +++++++++++++++++++
 2 files changed, 99 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6397.c b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
index 13cee2a209c2..3944e39db7e6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6397.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
@@ -12,10 +12,32 @@
 #include <linux/mfd/mt6397/core.h>
 
 #include "pinctrl-mtk-common.h"
+#include "pinctrl-mtk-mt6392.h"
 #include "pinctrl-mtk-mt6397.h"
 
 #define MT6397_PIN_REG_BASE  0xc000
 
+static const struct mtk_pinctrl_devdata mt6392_pinctrl_data = {
+	.pins = mtk_pins_mt6392,
+	.npins = ARRAY_SIZE(mtk_pins_mt6392),
+	.dir_offset = (MT6397_PIN_REG_BASE + 0x000),
+	.ies_offset = MTK_PINCTRL_NOT_SUPPORT,
+	.smt_offset = MTK_PINCTRL_NOT_SUPPORT,
+	.pullen_offset = (MT6397_PIN_REG_BASE + 0x020),
+	.pullsel_offset = (MT6397_PIN_REG_BASE + 0x040),
+	.dout_offset = (MT6397_PIN_REG_BASE + 0x080),
+	.din_offset = (MT6397_PIN_REG_BASE + 0x0a0),
+	.pinmux_offset = (MT6397_PIN_REG_BASE + 0x0c0),
+	.type1_start = 7,
+	.type1_end = 7,
+	.port_shf = 3,
+	.port_mask = 0x3,
+	.port_align = 2,
+	.mode_mask = 0xf,
+	.mode_per_reg = 5,
+	.mode_shf = 4,
+};
+
 static const struct mtk_pinctrl_devdata mt6397_pinctrl_data = {
 	.pins = mtk_pins_mt6397,
 	.npins = ARRAY_SIZE(mtk_pins_mt6397),
@@ -40,13 +62,24 @@ static const struct mtk_pinctrl_devdata mt6397_pinctrl_data = {
 static int mt6397_pinctrl_probe(struct platform_device *pdev)
 {
 	struct mt6397_chip *mt6397;
+	const struct mtk_pinctrl_devdata *data;
+
+	data = device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENOENT;
 
 	mt6397 = dev_get_drvdata(pdev->dev.parent);
-	return mtk_pctrl_init(pdev, &mt6397_pinctrl_data, mt6397->regmap);
+	return mtk_pctrl_init(pdev, data, mt6397->regmap);
 }
 
 static const struct of_device_id mt6397_pctrl_match[] = {
-	{ .compatible = "mediatek,mt6397-pinctrl", },
+	{
+		.compatible = "mediatek,mt6392-pinctrl",
+		.data = &mt6392_pinctrl_data
+	}, {
+		.compatible = "mediatek,mt6397-pinctrl",
+		.data = &mt6397_pinctrl_data
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mt6397_pctrl_match);
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
new file mode 100644
index 000000000000..e7241af28fdb
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __PINCTRL_MTK_MT6392_H
+#define __PINCTRL_MTK_MT6392_H
+
+#include <linux/pinctrl/pinctrl.h>
+#include "pinctrl-mtk-common.h"
+
+static const struct mtk_desc_pin mtk_pins_mt6392[] = {
+	MTK_PIN(PINCTRL_PIN(0, "INT"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO0"),
+		MTK_FUNCTION(1, "INT"),
+		MTK_FUNCTION(5, "TEST_CK2"),
+		MTK_FUNCTION(6, "TEST_IN1"),
+		MTK_FUNCTION(7, "TEST_OUT1")
+	),
+	MTK_PIN(PINCTRL_PIN(1, "SRCLKEN"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO1"),
+		MTK_FUNCTION(1, "SRCLKEN"),
+		MTK_FUNCTION(5, "TEST_CK0"),
+		MTK_FUNCTION(6, "TEST_IN2"),
+		MTK_FUNCTION(7, "TEST_OUT2")
+	),
+	MTK_PIN(PINCTRL_PIN(2, "RTC_32K1V8"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO2"),
+		MTK_FUNCTION(1, "RTC_32K1V8"),
+		MTK_FUNCTION(5, "TEST_CK1"),
+		MTK_FUNCTION(6, "TEST_IN3"),
+		MTK_FUNCTION(7, "TEST_OUT3")
+	),
+	MTK_PIN(PINCTRL_PIN(3, "SPI_CLK"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO3"),
+		MTK_FUNCTION(1, "SPI_CLK")
+	),
+	MTK_PIN(PINCTRL_PIN(4, "SPI_CSN"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO4"),
+		MTK_FUNCTION(1, "SPI_CSN")
+	),
+	MTK_PIN(PINCTRL_PIN(5, "SPI_MOSI"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO5"),
+		MTK_FUNCTION(1, "SPI_MOSI")
+	),
+	MTK_PIN(PINCTRL_PIN(6, "SPI_MISO"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO6"),
+		MTK_FUNCTION(1, "SPI_MISO"),
+		MTK_FUNCTION(6, "TEST_IN4"),
+		MTK_FUNCTION(7, "TEST_OUT4")
+	),
+};
+
+#endif /* __PINCTRL_MTK_MT6392_H */
-- 
2.43.0

