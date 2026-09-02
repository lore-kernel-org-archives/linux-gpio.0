Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D003E1D05
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 07:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334793; cv=none; b=BzsyVhx0awjBE3DL06kcFCITMIDl928Eru2D4TD2WbjX+j8LWJE41n3SH9jcYb0QZTaodGcSv87+C/HHmhtQPiCqqEOTsDAA1ELUKThwEPxz52ZDfiHlKJSFDT0n8IVr615vExx4FPByDWWoH57/K95VSds+PRHWJXjsbXYdsAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334793; c=relaxed/simple;
	bh=8NnPAtndwCLiyUYQOrEFhczA2QwzvIqCV2M/9HEmlSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PrZU+33Rh6x1SqddZJIKlpbQkwj7nSO/s3oH/o0qI5c0F0VA1GgDZLP0yecSTSF06RdrYgDl2u/3o8aFD8wo28vKC5+Yi4ZcYWuvRP3Jvuek95sZH0oxcMRBgeTbIF4RG7zWpUMwzx+p56H4w4sFb8XXYufq7WJ7JEBASOIaR8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGXkcrmu; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGXkcrmu"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f96c5b722so490420f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 00:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334789; x=1788939589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOyHjTCEcoFHo/QaU1ed7RXwDgLdnIb7/0FDfrBc/+k=;
        b=nGXkcrmu39W9Y7vAX2AeSXwpm4o0Ag48yUXrHrBS5lGGvL8aR0vOpcnuIFkzuI2G8z
         MrVzuS5UOACyUq/vHxXRu6H/pN01PTmlWT8RKERkd/L/mNtL1dudpcb/B0dXup7nmwnh
         QtSfkyfrzPmouOsPghuBHCwG5gi2j84YiPky99uhNynOiY62QoPLShWCnMQN2wrQQ92R
         nVhX17NP47CcZauME17LkwcPnqkv+y3xfr4MXzW1Q79SaW5tXAYYsF6hc4ZCI+50j46f
         T7hvSJl/9m8Szdz4uDYE880I2sU5LyixaxSp+ihadKkKvFU3BXi6+7g/nNFfOhKBlpGd
         vHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334789; x=1788939589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OOyHjTCEcoFHo/QaU1ed7RXwDgLdnIb7/0FDfrBc/+k=;
        b=Rztn6+Hi8B0ec+HiBI06LqEsU0tZk7Mlw41b8t5u/6AaiyN4faIOvODFyjXfzvklvB
         4m3tMxbsab+kqeylfwTOys30okwBncRGJDC8kyg+tQyu2EwgAH/8qeDDSjvMDEyWPJCW
         X17LNzeZouiEBCHESbE9BWMU9XDGWlxSEPKhDpXW4R+P10knNUPmn8saWjxoDc88VZJG
         FyMiZhGmG6DM6Dj4QghshxMZWqFP1xYUK1gVd2VZ/Cw+virFrT7aRPz4BcnXuwKrnkRB
         BTq6EGFyoYCldrsk9OnSSlrr9eXMe+l4s8UKjSf065Qi8JJi/u5nflD6qdODQUUN524I
         iJhA==
X-Forwarded-Encrypted: i=1; AKwUvBycRBvuSiyNhJ+Gflx2C2sSc1/3fyfPj/NTCR2sTFD4FOmQ3FIijfYKm7S92LXo9k0t3cXJEVLLSGSd@vger.kernel.org
X-Gm-Message-State: AFuF++l0w2ztjePtLHCaJ4R67NaxWXLmphxBxEkD7jGOnWS5xFO+3wKN
	XhlM6wjhmgCC2aFtUli/qD7un6oXG2TvbG9yCbubKio2FBavvi9GGx5e
X-Gm-Gg: AYBFou3RBSpVrTYBIQqKlLumBxlRqOCD5lmw/5rFx099QbK9JFYbbQDXwNf4gjKy9UD
	llW6e0SUruT1IH2Ibh9/DOUifUf8dahrd8we86EZNzfk9tXP6gmxTOH044xLLV2d5trtweHKpQs
	p1cYvmTUewSWqYsMQcm/HTVQGGrB+5sv/PM+MGixRT9TFlhZd5YoVtlMIetJUOXHIlMiLISllGr
	XReIL3YB81KhYamAU1RJJxLNKYNsPTlcMvf1s+/GQw30pr7uqzu/IoA1XKN3nkCH7fZs4VQi1Fc
	hraPosNTXfoatvgAb61AyejUFp2/kweAyUPQLDT6d8pLIDe3e6alboZdlEaFNR5RWv++2HuAFN5
	iQ7GfS7bEYgEyvxHvhWr09ZtKPw1+hcPFTJ/7W7Y16tEQL/oW9K25Ssv1vVHM1i5RjoyoiToLTl
	TdhuB9Fu1uC5FDA2LV40xTLAFcX0+8d5W9IRKxJeL/Y3A6u9w9Ip9aalo89LGfs0wxcg==
X-Received: by 2002:a5d:64c9:0:b0:482:fa3c:3e95 with SMTP id ffacd0b85a97d-48488f07dd0mr4552916f8f.8.1788334789361;
        Wed, 02 Sep 2026 00:39:49 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm4209375f8f.36.2026.09.02.00.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:39:48 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v2 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 09:39:45 +0200
Message-ID: <20260902073946.3709080-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902073946.3709080-1-mehmet.fide@gmail.com>
References: <20260902073946.3709080-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The mmio pinconf get callback ignores which parameter was requested and
returns the raw conf register, so a generic query through
pinctrl_gpio_get_config() gets register bits back instead of the packed
parameter it asked for.

Decode the requested parameter and answer PIN_CONFIG_OUTPUT_ENABLE and
PIN_CONFIG_INPUT_ENABLE on SoCs that declare where those bits live in
the pad register; Vybrid has OBE at bit 1 and IBE at bit 0. The answer
is 0 with the bit value as the argument, which is what the
pinctrl_gpio_get_config() users (gpio-by-pinctrl, and gpio-mmio in the
next patch) expect. Everything else, including pins the device tree
never configured, gets -ENOTSUPP.

The only in-tree user of the raw register was the debugfs group dump,
which called the callback with an uninitialized config; it now reads
the register through its own helper, like the single pin dump already
did.

This gives gpio-mmio a way to read back the line direction on chips
whose direction lives in the pin controller.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
v2:
 - the pin_config_get callback answers only the parameters the SoC
   declares and returns -ENOTSUPP otherwise; the debugfs group dump reads
   the raw register through its own helper instead of calling the
   callback with an uninitialized config (Sashiko)
 - subject prefix pinctrl: imx:
 drivers/pinctrl/freescale/pinctrl-imx.c   | 51 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 3 files changed, 54 insertions(+), 3 deletions(-)
 drivers/pinctrl/freescale/pinctrl-imx.c   | 51 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 3 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9a45b376d36f..506ee6627c82 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -21,6 +21,7 @@
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 
@@ -291,8 +292,8 @@ struct pinmux_ops imx_pmx_ops = {
 	.set_mux = imx_pmx_set,
 };
 
-static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
-				unsigned long *config)
+static int imx_pinconf_get_raw_mmio(struct pinctrl_dev *pctldev,
+				    unsigned int pin_id, unsigned long *config)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
@@ -312,6 +313,38 @@ static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
 	return 0;
 }
 
+static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev,
+				unsigned int pin_id, unsigned long *config)
+{
+	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	const struct imx_pin_reg *pin_reg = &ipctl->pin_regs[pin_id];
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	unsigned int mask;
+	u32 raw;
+
+	/* only the parameters the SoC declares a pad bit for */
+	switch (param) {
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		mask = info->obe_mask;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		mask = info->ibe_mask;
+		break;
+	default:
+		mask = 0;
+		break;
+	}
+
+	if (!mask || pin_reg->conf_reg == -1)
+		return -ENOTSUPP;
+
+	raw = readl(ipctl->base + pin_reg->conf_reg);
+	*config = pinconf_to_config_packed(param, !!(raw & mask));
+
+	return 0;
+}
+
 static int imx_pinconf_get(struct pinctrl_dev *pctldev,
 			   unsigned pin_id, unsigned long *config)
 {
@@ -324,6 +357,18 @@ static int imx_pinconf_get(struct pinctrl_dev *pctldev,
 		return imx_pinconf_get_mmio(pctldev, pin_id, config);
 }
 
+static int imx_pinconf_get_raw(struct pinctrl_dev *pctldev,
+			       unsigned int pin_id, unsigned long *config)
+{
+	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct imx_pinctrl_soc_info *info = ipctl->info;
+
+	if (info->flags & IMX_USE_SCU)
+		return info->imx_pinconf_get(pctldev, pin_id, config);
+	else
+		return imx_pinconf_get_raw_mmio(pctldev, pin_id, config);
+}
+
 static int imx_pinconf_set_mmio(struct pinctrl_dev *pctldev,
 				unsigned pin_id, unsigned long *configs,
 				unsigned num_configs)
@@ -426,7 +471,7 @@ static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 		struct imx_pin *pin = &((struct imx_pin *)(grp->data))[i];
 
 		name = pin_get_name(pctldev, pin->pin);
-		ret = imx_pinconf_get(pctldev, pin->pin, &config);
+		ret = imx_pinconf_get_raw(pctldev, pin->pin, &config);
 		if (ret)
 			return;
 		seq_printf(s, "  %s: 0x%lx\n", name, config);
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/freescale/pinctrl-imx.h
index f65ff45b4003..8fa7e1e2521d 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -91,6 +91,10 @@ struct imx_pinctrl_soc_info {
 	unsigned int mux_mask;
 	u8 mux_shift;
 
+	/* OBE/IBE bits in the conf register, 0 if the pad does not have them */
+	unsigned int obe_mask;
+	unsigned int ibe_mask;
+
 	int (*gpio_set_direction)(struct pinctrl_dev *pctldev,
 				  struct pinctrl_gpio_range *range,
 				  unsigned offset,
diff --git a/drivers/pinctrl/freescale/pinctrl-vf610.c b/drivers/pinctrl/freescale/pinctrl-vf610.c
index 76a4bc0181a0..77d077618782 100644
--- a/drivers/pinctrl/freescale/pinctrl-vf610.c
+++ b/drivers/pinctrl/freescale/pinctrl-vf610.c
@@ -319,6 +319,8 @@ static const struct imx_pinctrl_soc_info vf610_pinctrl_info = {
 	.gpio_set_direction = vf610_pmx_gpio_set_direction,
 	.mux_mask = 0x700000,
 	.mux_shift = 20,
+	.obe_mask = 0x2,
+	.ibe_mask = 0x1,
 };
 
 static const struct of_device_id vf610_pinctrl_of_match[] = {
-- 
2.54.0

