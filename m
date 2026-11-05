Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892240;
	b=M1XYq1QWRtD1UPGS5VkzW7MEddHS6Hz441jS4BqornPm60Q0I4sEVXPyCbbe4Yyhnb5w
	 G/udBR+tdh1qT5ct6QWljLd1O52Im3MFLQ+6s+yvJ5i3PUifLSpGYlEleuKHp61A1rj8z
	 9+Yf/1OXCD7C9vTQVANW6PsrZZag9qGeEuf9h6sEsJxA0icX4gZiDgRuTsbgFeOJW5zkX
	 bIuO0BvbaEh2OuiizbhmLYzd6G2cyACjnGLqr9FeVDpHn1hGMSPt2AyiV0WkzrY2dhldI
	 jT9+nFbueIRAH2z+pHBSqINddCbFz6Zx9lQPzOsd9P2WA3ONrvvHrk95kBdCpe8CG+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sNeCcAcnq+kq7Knv2crVqvIQp/nQfPFY9SZmNDJttrk=;
	b=hslUR5XCReyZVbwVbB/bGSJ5oQiqDPPSQh5qrH1DcFs6mMDlOtLPAH/fwr0VfUQ+0egq
	 UudERQJRZ6sxMRlsm2G/0yfpPtcB906UvKGPcArQMsPqigtO5mHBODXa9d0JWHwD1eu3E
	 ijqb5u3+efEU6c8yauw8pQmxMYcvS9DUQfzbIsIrVT30RlqJ5X8ujtlLG7+0zqpiQN81g
	 h1o9H3sOBYmsf1LSPhjAqUQe0vqIRmMxKQF9SHQPkD75PpsjT5HqqwPr1OguqA32c7y9b
	 DDmoj0fVh03Sd0H6J+LHsifChTm56XBgULeFYuifubcFALZ+tiMnC9HbX5+RCOS/vrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gba+nzdQ;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991BC606A333
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 15:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 991BC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gba+nzdQ
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so3375190c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 07:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793892239; x=1794497039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNeCcAcnq+kq7Knv2crVqvIQp/nQfPFY9SZmNDJttrk=;
        b=Gba+nzdQHGBvFjCoCbsAwcHyr8hLjYByQcMINR4Ay4Y6elfwFUyrwZGSiMM7qK5hws
         z6szCkiN7iCTSfdnZOx6A/ilhnZCkmccj8qdMtniW0nMa4ewwFJhY/BsFgZD5n9sP9KX
         yP/fI8DHgR7fT+v9AFqwQJICjISpAzOcIMwFoodasxIF2og6ZmtuoqpNyHVysMlXfUUA
         swL9gBNXIkuUF0jah7B6AcUEvXMNy61Du2twV2bwHiZJmQjnV97yYWsiyCosXYhIuoqs
         N7xvi+qA4XW4LkvkpfQJoFZyGX7+sHJOL6W9ShhnuWDxov3zsTQ6Ee8NzFVwl1Yzy3Q7
         TkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892239; x=1794497039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sNeCcAcnq+kq7Knv2crVqvIQp/nQfPFY9SZmNDJttrk=;
        b=ZB+RVmJbk/8NhyLILkuM0T4K2iMpgZBeYr3rvacjxV4C3ppgbyzPQZdzzXb5i7opLB
         wt3c6czW8SHotM8IQGhxAErRt/BVMvFMo/170qo+A414pDvPmOilE5lvFcP/TT7ZVlxi
         GRvakVSszh2guQdwxSSbHzUs1/SFyx4uuQ9KmpsDs9NFhN8A0mVAg0WntZeKfao4j2sH
         9q4Ukk2ZtIugv6PZUV0mkLxUom2lGHb5ZV/sTpwtqX/Al6AoMG7v2e22JnYpH7tsOnmm
         H5gifOTnPvZmsE45l8BXaXqZyvknqLZQHcRe66aAFWHsio7mu0oscEk4uCOTZe703onW
         3rgQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/elUmoyMBWnk41B5McLy9DDDbsKaknUgzJkgU/rvxdE0hpzxATaEB/UQYiSRlOBiN2YIGFXYS8sLU@vger.kernel.org
X-Gm-Message-State: APuU4Z+OvfnfxJkqNrrvVEDrJjG6zKOATCV3RuQg5j+n6wBlhGwdjwa0
	3gsojVNNUCzklRJSYYIBNzb8JatAiD8q8l48QMiosWKCFgehK5BlnSmp
X-Gm-Gg: AYBFou1bqVUV7mikSoyIb3SMM3ARd5AskXEAtnJ6jDMXeR644Y9DY3hpU1K163Y4dYQ
	Og9OBjMRtBYngCppWu9YvTYckXJo9yzT2xKWbeLcp+KeWCuPao/PNqfF2c1+5mBhXuboIhdYXQM
	U8WbsZyU475TyGLQfdprdl7xp1+WcCVEeczxYxSR4Qy2k1NoLSj8IwpO8WzFKVbfSZImuX9twuO
	74M7unlHfa6EC9bdLxYpyPtJm0LlMuz6okcbVtCsLI2Y32011RicNxt3i08KpcVduzxMbHZVsP3
	XaQwD1myyBpuo3dHSWiyI2RMcy3dHjEN4ChO2VBg7no4VFpGJyW+aLu7HDPvrX9Tc07fWdd3n5v
	9DkWlBparjjq+pSNBuIVMw3vfYBzOyr1BCEX3q37SKsKYXt0KjebOLnGfQTWRVqouFH2GIl1v4L
	dTYPJ8t6+errmW+gdGJ/APsbsLhJs1Ic3d19U+R6qJSCEn7YcrRGt8Jaml9y2YBvKbZqTDw9+Oy
	1C1b2kCIZHEPV0YTy3I3XlkabGy5syxSgZ4FDqCSmosV1iVvfD9cvkYXixvHCVlGXcPNQiF2X7j
	V//Ya70wRO71ljCWvpJZp2rkdd0Jpvn2kt9IVP0QyDIjEQ==
X-Received: by 2002:a05:7022:f108:b0:150:c9c5:1ce4 with SMTP id a92af1059eb24-1ac55960a70mr24069179c88.6.1793892236997;
        Thu, 05 Nov 2026 07:23:56 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245ac2f44sm17862752c88.0.2026.11.05.07.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:23:56 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linusw@kernel.org
Cc: andrew@codeconstruct.com.au,
	joel@jms.id.au,
	brgl@kernel.org,
	tan.siewert@9elements.com,
	billy_tsai@aspeedtech.com,
	linux-aspeed@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v3] pinctrl: aspeed: Hand over global GPIOP passthrough to local mux controls
Date: Thu,  5 Nov 2026 20:53:47 +0530
Message-ID: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022024314.48623-1-prasanth.padarthi10@gmail.com>
References: <20261022024314.48623-1-prasanth.padarthi10@gmail.com>
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

On B650D4U, GPIO-only host power control fails when SCU51C[9]
enables GPIOP passthrough, even after the normal GPIO request path
clears the individual SCU4BC selections.

Transfer globally selected GPIOP0-P5 THRU roles to SCU4BC[29:24]
before registering the controller, then clear the active shared
sources. Leave PWM selection and the strap-source selector unchanged.
Clear SCU510[28] through SCU514 and verify the shared enables cleared.

If handover fails, retain an instance-local error and reject affected
GPIO and mux requests before changing their mux state. Check every
pin in a mux group before calling the shared helper. Retain prepared
local selections after partial failure rather than blindly restoring
a shared enable.

Probe-time normalization policy, concurrent SCU writers and
post-handover registration failure remain open design questions.
Electrical continuity, mixed-pair forwarding, protected-write paths,
PWM coexistence and SCU510[28] hardware handling remain unvalidated.

The implementation passed remote power-on, remote graceful power-off
and physical-button power-on tests on B650D4U with an OpenBMC Linux
6.18.24-based kernel. The rebased version was ARM compile-tested on
v7.4-rc1 using aspeed_g5_defconfig with AST2600 pinctrl enabled.
The rebased kernel has not been tested on hardware.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 145 ++++++++++++++++++++-
 1 file changed, 141 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 85d6640ff..be22a9184 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -4,7 +4,10 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/types.h>
@@ -36,6 +39,8 @@
 #define SCU4D8		0x4D8 /* Multi-function Pin Control #23 */
 #define SCU500		0x500 /* Hardware Strap 1 */
 #define SCU510		0x510 /* Hardware Strap 2 */
+#define SCU514		0x514 /* Hardware Strap 2 Clear */
+#define SCU51C		0x51c /* Hardware Strap 3 */
 #define SCU610		0x610 /* Disable GPIO Internal Pull-Down #0 */
 #define SCU614		0x614 /* Disable GPIO Internal Pull-Down #1 */
 #define SCU618		0x618 /* Disable GPIO Internal Pull-Down #2 */
@@ -2743,12 +2748,56 @@ static struct aspeed_pinctrl_data aspeed_g6_pinctrl_data = {
 	.nconfmaps = ARRAY_SIZE(aspeed_g6_pin_config_map),
 };
 
+struct aspeed_g6_probe_data {
+	struct aspeed_pinctrl_data pdata;
+	int thru_error;
+};
+
+static bool aspeed_g6_is_thru_pin(unsigned int pin)
+{
+	return pin >= AB22 && pin <= AB23;
+}
+
+static int aspeed_g6_gpio_request_enable(struct pinctrl_dev *pctldev,
+					 struct pinctrl_gpio_range *range,
+					 unsigned int offset)
+{
+	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	struct aspeed_g6_probe_data *g6 =
+		container_of(pdata, struct aspeed_g6_probe_data, pdata);
+
+	if (g6->thru_error && aspeed_g6_is_thru_pin(offset))
+		return g6->thru_error;
+
+	return aspeed_gpio_request_enable(pctldev, range, offset);
+}
+
+static int aspeed_g6_set_mux(struct pinctrl_dev *pctldev,
+			     unsigned int function, unsigned int group)
+{
+	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	struct aspeed_g6_probe_data *g6 =
+		container_of(pdata, struct aspeed_g6_probe_data, pdata);
+	const struct aspeed_pin_group *pgroup = &pdata->pinmux.groups[group];
+	unsigned int i;
+
+	/* Check the entire group before the shared helper changes any pin. */
+	if (g6->thru_error) {
+		for (i = 0; i < pgroup->npins; i++) {
+			if (aspeed_g6_is_thru_pin(pgroup->pins[i]))
+				return g6->thru_error;
+		}
+	}
+
+	return aspeed_pinmux_set_mux(pctldev, function, group);
+}
+
 static const struct pinmux_ops aspeed_g6_pinmux_ops = {
 	.get_functions_count = aspeed_pinmux_get_fn_count,
 	.get_function_name = aspeed_pinmux_get_fn_name,
 	.get_function_groups = aspeed_pinmux_get_fn_groups,
-	.set_mux = aspeed_pinmux_set_mux,
-	.gpio_request_enable = aspeed_gpio_request_enable,
+	.set_mux = aspeed_g6_set_mux,
+	.gpio_request_enable = aspeed_g6_gpio_request_enable,
 	.strict = true,
 };
 
@@ -2778,15 +2827,103 @@ static const struct pinctrl_desc aspeed_g6_pinctrl_desc = {
 	.confops = &aspeed_g6_conf_ops,
 };
 
+/*
+ * Experimental: transfer the global GPIOP0-P5 THRU selection to the
+ * individual mux controls before registering any pinctrl consumers.
+ * PWM selection is higher priority and is deliberately left unchanged.
+ *
+ * Do not undo the local selections on error: a shared enable may already
+ * have cleared. Keeping the equivalent local selections preserves routing
+ * while rejecting affected requests, rather than granting an unsafe GPIO.
+ * Signal continuity during this transfer still needs hardware validation.
+ */
+static int aspeed_g6_thru_handover(struct regmap *scu)
+{
+	const u32 local_mask = GENMASK(29, 24);
+	unsigned int strap2, strap3, local;
+	int ret;
+
+	ret = regmap_read(scu, SCU510, &strap2);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU51C, &strap3);
+	if (ret)
+		return ret;
+
+	if (!(strap2 & BIT(28)) &&
+	    ((strap2 & BIT(30)) || !(strap3 & BIT(9))))
+		return 0;
+
+	/* Preserve every globally selected role, including under PWM. */
+	ret = regmap_update_bits(scu, SCU4BC, local_mask, local_mask);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU4BC, &local);
+	if (ret)
+		return ret;
+	if ((local & local_mask) != local_mask)
+		return -EPERM;
+
+	/* Leave the inactive GPIOZ6 source alone in dedicated-strap mode. */
+	if (!(strap2 & BIT(30)) && (strap3 & BIT(9))) {
+		ret = regmap_update_bits(scu, SCU51C, BIT(9), 0);
+		if (ret)
+			return ret;
+	}
+
+	if (strap2 & BIT(28)) {
+		/* SCU510 is write-one-set; do not use an ordinary RW clear. */
+		ret = regmap_write(scu, SCU514, BIT(28));
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_read(scu, SCU510, &strap2);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU51C, &strap3);
+	if (ret)
+		return ret;
+	if ((strap2 & BIT(28)) ||
+	    (!(strap2 & BIT(30)) && (strap3 & BIT(9))))
+		return -EPERM;
+
+	return 0;
+}
+
 static int aspeed_g6_pinctrl_probe(struct platform_device *pdev)
 {
-	int i;
+	struct aspeed_g6_probe_data *g6;
+	struct regmap *scu;
+	int i, ret;
+
+	if (!pdev->dev.parent)
+		return -ENODEV;
+	scu = syscon_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(scu))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scu),
+				     "No SCU regmap for THRU handover\n");
+
+	g6 = devm_kzalloc(&pdev->dev, sizeof(*g6), GFP_KERNEL);
+	if (!g6)
+		return -ENOMEM;
+	memcpy(&g6->pdata, &aspeed_g6_pinctrl_data, sizeof(g6->pdata));
+
+	ret = aspeed_g6_thru_handover(scu);
+	if (ret == -EPROBE_DEFER)
+		return ret;
+	if (ret) {
+		g6->thru_error = ret;
+		dev_warn(&pdev->dev,
+			 "THRU handover failed (%d); GPIOP0-P5 mux requests blocked\n",
+			 ret);
+	}
 
 	for (i = 0; i < ARRAY_SIZE(aspeed_g6_pins); i++)
 		aspeed_g6_pins[i].number = i;
 
 	return aspeed_pinctrl_probe(pdev, &aspeed_g6_pinctrl_desc,
-			&aspeed_g6_pinctrl_data);
+			&g6->pdata);
 }
 
 static const struct of_device_id aspeed_g6_pinctrl_of_match[] = {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

