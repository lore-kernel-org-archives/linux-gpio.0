Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4990030DD1B
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363934; cv=none; b=axYnr1SviJpBN9UY20X7AswUsubiJ5Xu7cAc2sTSFUFWsyiucoXU/OfB9mzb/vOmFpBhlS4PTBMp8zQnKVosgkpW4o9WE63z42V0mbOzQ92F9I6ulIMF1XCL6SWXiPLBSwlzDniQLf9iiwf4O1tQDHbZdnOQp+2vJvIb8ThUymE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363934; c=relaxed/simple;
	bh=CQGvFSvRALghiXQoMxpKQcygboO0TQW4/ncJ6sj4Xqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxfB20AE8czVGO6FxerT3kJiTg5GJao8E7WvxAqGfypbvBW09GP9s4wno7HmyGbwj6cJEJi3D36ZYGT/p38chRWhD7Mc2k7M+/P3t7OLbHc7wBjsmzzVUohDqQ3rwaz7erju8SL7vezBvww13HrY0wWV/UbMiZg9Qg9gP7fbE5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1nXUXqQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1nXUXqQ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso8540155e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 08:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363929; x=1788968729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0CKgK3ovQK+3XnwU1cpQ9DqhxZBZUxnsENVeMbNExk=;
        b=X1nXUXqQLbtlBn7ZD+OHXdA5tt506MsTnk8YZWrCaBVVOFmu5x/PMKBeyfczlSuZ5j
         ePvUaWbb6BNPwhMrxrwADHX6l4awKe07ZMRbNivK9dCOa2m/iBUDMka6WpTAPOf+6+kn
         juxN9nmjBXFadxyArzIf0qyup6VgFyOyZjnrzt2xRiE+RXrS8UWzZnAKXksefhN5Ujn/
         kbz0NKiYdvXPvUhwpLkcjgcpG2+kHrFIfRH6JE9gbGX+Jc4wYMxwO9RvDl+I3fetwT6c
         0gzQX37d1dYRiDOyKHBju8m4wwnRJIwJKDxLvQmZvEJuk0guePC201M0KjhkKNJ4HnNQ
         tvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363929; x=1788968729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u0CKgK3ovQK+3XnwU1cpQ9DqhxZBZUxnsENVeMbNExk=;
        b=ia0WdCzmhN5UtDGAgaMCgHwi+unKBWAF0sDgx6yxX/2/4ItlgaKFSPz0Vms0l4E00/
         qWiU6JjpxYk8LKjYjoh9uBYdJ3smBd2fl6v09cVqjMK9zIWFpHfs1x0o/GGVju0zYqU+
         FvFDwsFE66cOG9gqkGsWkPWeLQTCPsDyFVhyi1hby1tak6N4iSK9jU2AP7J5wXeJ/ijL
         Bx5pKp8TN+Rj0K/sTQMP9/GUJqrefOk0AZLBZH0t0e50yfuPny4LHQ6E/sFVRby/vRVJ
         lQr8IdiGpC+gSwaGmJ2yKpbaOPeGXQ1Rr2LFxrMF0BlnbfFmGyQA6G70IpeLh2AAa2SP
         P/3w==
X-Forwarded-Encrypted: i=1; AHgh+Rrqz08FOO5MwVxSTuv9qRjpD41IAKB0S4y8Z8QmxH06HnimTSdRtV9lsOHGNk77SrUSiyGjnKCHtAkq@vger.kernel.org
X-Gm-Message-State: AFuF++mMK3mjRfC+xNV/Ys1ad3l+vBnlLnxY748jETLvgmwECBz2IVEV
	nhDl1V3aCeM8rt5IJSt/2AqCFVqFx48UaFVc6IeIC6WU09KznYfi7Qoy
X-Gm-Gg: AR+sD13AIz57yshg/wk/E5YJJ3KwcIacPK7ud2cWo3Fc9Zt1uk4NEAFxmZy6IUUPp11
	K7MU1qa87Y9SqZB9OrFbfjh+wXEwsFKkUVxItk7Xl/HNaZCsmctCiUShSj4jEZxnaB8Fc+IrmJT
	k3rEOmpPC9bJX39w7ua9ss0lDHuUnd+lu3pfhy+RR/C8iNgPuGxMcFPDEOFzSFBdA8ShcnhiTs0
	Ds6rw+0+arIlnUeQGehAM1X0GaO/Ww6p6BIBWnlZMkNbR0OL/2ADvYDlRbbtylLfxHb8BwUfQk7
	g/NGQW/n5xniI8qPEW/JpWI9/RG54PAnoL7X0Je1K+R/J8/JTYPEiNsRxNu/wS7uqlACp4JrU5m
	RCYiztU3OuFcA8uctOzleDrdELDpbTqBXcSHQM6MBOIsnvBEL17MnH+9xfXSFXWxTtSoSV1j8d4
	O/jJQxz5z5Rm7Tt/N5hAyUpAFs5ohYaXM20M86IJVHv4v2JKmOlKx+CTDThBH3EGgQBg==
X-Received: by 2002:a05:600c:3acf:b0:49c:c8de:96a9 with SMTP id 5b1f17b1804b1-49ce5810906mr113425805e9.2.1788363928485;
        Wed, 02 Sep 2026 08:45:28 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5e686fsm530655e9.15.2026.09.02.08.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:45:27 -0700 (PDT)
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
Subject: [PATCH v3 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 17:45:24 +0200
Message-ID: <20260902154525.4090276-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902154525.4090276-1-mehmet.fide@gmail.com>
References: <20260902154525.4090276-1-mehmet.fide@gmail.com>
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
next patch) expect. Other parameters and the SCU based SoCs, whose
firmware call returns the raw pad value as well, get -ENOTSUPP; a pin
the device tree never configured gets -EINVAL, as the raw helper already
does, so a caller can tell "no answer for this pin" from "this
controller never answers".

The pin index comes from the gpio range unchecked and the driver indexes
flat arrays with it, so an out of range gpio-ranges entry would read
past pin_regs[]. Nothing called pin_config_get through a gpio range on
these SoCs before; now something will, so reject an index beyond npins.

The only in-tree user of the raw register was the debugfs group dump,
which called the callback with an uninitialized config; it now reads
the register through its own helper, like the single pin dump already
did.

The set callback is not touched: the fsl,pins binding hands it the raw
pad register value and that stays the only thing it accepts. Nothing
in-tree sends generic parameters to it on these SoCs; making it
understand them is a separate change.

This gives gpio-mmio a way to read back the line direction on chips
whose direction lives in the pin controller.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   | 56 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 3 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9a45b376d36f..1bcb2f772d38 100644
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
@@ -312,16 +313,63 @@ static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
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
+	if (!mask)
+		return -ENOTSUPP;
+	if (pin_reg->conf_reg == -1)
+		return -EINVAL;
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
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
 
+	if (info->flags & IMX_USE_SCU)
+		return -ENOTSUPP;
+	if (pin_id >= info->npins)
+		return -EINVAL;
+
+	return imx_pinconf_get_mmio(pctldev, pin_id, config);
+}
+
+static int imx_pinconf_get_raw(struct pinctrl_dev *pctldev,
+			       unsigned int pin_id, unsigned long *config)
+{
+	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct imx_pinctrl_soc_info *info = ipctl->info;
+
 	if (info->flags & IMX_USE_SCU)
 		return info->imx_pinconf_get(pctldev, pin_id, config);
 	else
-		return imx_pinconf_get_mmio(pctldev, pin_id, config);
+		return imx_pinconf_get_raw_mmio(pctldev, pin_id, config);
 }
 
 static int imx_pinconf_set_mmio(struct pinctrl_dev *pctldev,
@@ -426,7 +474,7 @@ static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
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

