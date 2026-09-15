Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC1F3AB28F
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 08:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459513; cv=none; b=nr8ruQoKjtHGohkh7qY0aRCNaaJmn7eVS/1VJb2ZaZ2n4zlw4h3CQTQexQiVb9ho368qLEwvBOzQ/7C/Ov/xYkRl/q2WjsllYtypyFWLdWnqBJtbbzCZ4llR0R444693me15Ww6AqKg+qhjAngrOR92G2kpKtnBzptwSzycuKEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459513; c=relaxed/simple;
	bh=mUeECvre9N/g2AeEciKDvfrTAyCAo+pbekzbwT4/uBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RNz4pScp+tqs6f6qpCjqQvvBYTyq2J5NWL9wSyfiZ/SoU2Sk84eJsWr0tt/LBIuO8ag10NQpvLw0wGj/v9Rf7+Nop1hkdSqATwjdHTZ7l0CM6pLGrUiHRJuHwmePCHk6gNk49TYkLadMfB5lTK16ytFWpcol9s2fFUsTTXATXiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2Sf0p5b; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2Sf0p5b"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so8781f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 01:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459506; x=1790064306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rh1GYOmyo/w6ySQPuPwCmll79vIZ+StwKSaTeDc/e6E=;
        b=b2Sf0p5b1fnEYh6hJcuDuGGyDG8qzy+i3ZHdDuWBZUPgqucR513FU+zFKrdlsabAt9
         qT4fuR0Lz1Yw6Xk21U3pReeNOdQ94LG/xo9YHdODtXjDmtt52pz5appMjzqyzuu3fs+Y
         KW29O4o4fPESnrYLgFgSenjgvdqQZMK81pPRCIi2wN80IXeLHZokStZxJ0Ayquwldzop
         LYr1wdmhJ5IMjpKPD4EXKNY8X2VQJIKgAafH2HD7GjfRS2ZLaJqpgkLf32xIk1ozvFpp
         GB2RlDRncQD7+0LSQwdw8/SjVGnT+5nljY4qFc+gmexO5PpK5SRATeC5OOPLF7Acgxeu
         GzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459506; x=1790064306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rh1GYOmyo/w6ySQPuPwCmll79vIZ+StwKSaTeDc/e6E=;
        b=ha7r46FIfgxN6zqaT7KS1lTcBQYUWXMMOt/ANXnmX+GwFZsR3hLS2N2XAakF0PiHb5
         v38HaIMR47vfDx+SMYKq/xBxn3F93YxmvFyYBzEpHLbTY5cx2JmRZMdP1MBqYpPyzcnH
         zfWDE8Jt9HPFkCGRE7UzfLsfOL+NALC/h/RZD4b8ygakF2t8Ye+kb7S14mm8BhMXFTr9
         zFF4WSsDQzuD5WEgCPC7xp2PopFZ+1XCnXYZYE8CUjhLzv8KmvkgcamlmBRujz7Gz3Ly
         XJoWSUWGdvvctLowTLoKceZcd1DNcubGZfs3Pux1NOJuau0BOFZ1cj9gPb0sUNSQEGLS
         nl6w==
X-Forwarded-Encrypted: i=1; AKwUvBzQoiJto0kJPnzq2hSsyszReVrQQ3tx7ZTdjUguUOtS9Nxbl9U1r9Rm6hVpMBvjvo/L51e4Mmv752MW@vger.kernel.org
X-Gm-Message-State: AFuF++nb3m+RTYUOXNO7QzfEHheRwieiOA+HQvsecrsT8P72MyixIR32
	0GAz+XceFqMkp/BJQBYAAf+SlLnIUVK++hL3V9pR5wFu98Mz8l42TlPj
X-Gm-Gg: AYBFou27pZ35Pyplzt9q5ZZNJOX3PAKNfS7Ip8aaeihY6/BEOk/GQbK/BNd/akVjkIO
	vqMCP6QPP/D+buQAep5Z1UV5GGTYld4ETo4IcskkDGXgU7vglyJDm3q3/7K3QsuxW70HWsUB2At
	qUSVWAnNICnzcFCk8NpLes2lf9qlPOyQpvZRgTyAhoPorrEg/Z9UaiWzRPDycMoxkrj26aPbf1x
	3RiPopj+z9++F+7yOro4Xf5ul7v2EgA01AQAVjYlorGGvsT9/+LaST/SIRGbD0I6Bf3q27u3oFY
	nXtLRQhQVVYOiF23cvbMxMHFCTBHSCzxKBReuS9SnZn9ZPyrFPiQUbOOT/lhh6erBX0SpaKpRwU
	zy+c7EzVrGsZQDjTGl9FM9uHhyORcmkvTgFYqDOZsljI3O86hC5gdlVKPZDrIRn2E2QVU/eTjo0
	Wx7GtxbQ9qSEkcUFDT45Qi2MgpmQ78rkXRyPcqeZdwT47L836oVT9+CtBd1wxxzZ48VOTE8g/At
	ioSd6MgMmUIPc8=
X-Received: by 2002:a05:600c:4f46:b0:49c:cfbe:5a76 with SMTP id 5b1f17b1804b1-49e82213d4bmr1619135e9.2.1789459505886;
        Tue, 15 Sep 2026 01:05:05 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27315csm48588365e9.2.2026.09.15.01.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:05 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
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
Subject: [PATCH v6 2/4] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Tue, 15 Sep 2026 10:04:59 +0200
Message-ID: <20260915080501.329424-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
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
Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   | 54 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 3 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9a45b376d36f..f08ef52bf4f8 100644
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
@@ -312,16 +313,61 @@ static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
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
@@ -426,7 +472,7 @@ static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
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
2.55.0

