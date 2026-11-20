Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205759;
	b=bbwjEPfKpVls2OG4S8MyTx0kba9XH/bio5rl7Xx5+02o58iqeYPH995ml5ogKvS43S2Q
	 49KGTT2uW4cWqX6ywcYV0KtFAs6bgsqCLpVb/23uNPLtGCFbwMHnE2vVowc/Alv6P2/0K
	 GKxUs1TGSWfg5eIYR42FXn5bAFp6r1Dijyko0MESJ38QHioT/iNP8chcm3XarxzRCTn6h
	 yOKkSjzyBWb6SegtoaNlNYeavvNGdfRt8U8/Uf0yi7DG/zqrBjOlg+25h26sZXJFQz3f1
	 jCGYBbzOOWFAXHyMM5yFylxPHIB/HgyjIb2CB2Zy54Yq5ez8x9KLcYaowQfAXrzWiMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205759;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=n/hZHGeIt+h+WZIRaIc6xW62uzKvAoC1A95prVUGR50=;
	b=e1095WS5FP5r3y1REOf6OCCtQhntHciK67TgM8LwZSl1KePsRIVxOVN10XmNvKxwNTke
	 K95jFA9w4OCIWd1Wag/MtzvVH7yn52jtFwv6Qgy2P/ixrD7QAszma/Ess0LTWDQboilCp
	 xGNVBh1SmyCnjfdRSuiY6kZYe2L0EkEBbI6tcaTLU+KJT69DQN+AJPZNlirCzvdmHtHhc
	 dvhM5rtuR5oWaSC1A15fnvh8hxXTIzgrMPILFaNU6LQAZ3QnPU/FJLECJiB78A2+zq1fT
	 pR4uWgX3E+rHFMuzvqRzOPuNXgtbns5yDJC2YnAK7rSFXEDNbR6wwLlKwv1DQOO8JcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=KPVEzt7V;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=YmjCu5BL;
	arc=none smtp.remote-ip=121.127.44.73
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08960606A6D3
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 20:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08960606A6D3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=KPVEzt7V;
	dkim=pass (1024-bit key, unprotected) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=YmjCu5BL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795205749; bh=n/hZHGeIt+h+WZIRaIc6xW62uzKvAoC1A95prVUGR50=;
 b=KPVEzt7VroJH8q02nVl7UaJZDofOz/192ra6kzUrOckFpglwQ9c3DLlUcbn+RGm7dGTepSibA
 TCLwjH/cbuyxhutRIdc4buuPkbJY1YvHIZWPLKzbTzMqYASQN4SL7rUOSu/mlm/afJ7bsPIWpE9
 yve6TcxcqjdJDdJutNgJhe4JOQLXcDoBOStDS7EVP7zassAXfx3gAeMnq//JU++HTXqQ/CODQ6k
 U2EKufEZKP0BRm8/I9bwlGjAX5GzoigmCnK0PzfW6iohr4ckdZDg/97DUQAqGFjmZjEMwIge5WQ
 H/1I3qN7LZrKNMcPL8QvBh8Zgs99GNaz4MzR3zIzzNYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795205749; bh=n/hZHGeIt+h+WZIRaIc6xW62uzKvAoC1A95prVUGR50=;
 b=YmjCu5BLlmO7qvc2DzdYNJVXvChHahJZPmPz/pT44Ri73pBKmBejooZxoQl87rfxdghA+7a+S
 Dag+G9HmuUbfGVUhHKISchylpgXbLmWxSw6wg6GTX4KZyUk+9L/bwu0eDLSxReGVEjXHvNrIWQU
 VjKTafxTEapA6/OmCJ2zsYc=
CFBL-Feedback-ID: 6b00aa72774eddf080e7f073:e7410673846c8ea6efcb7b8d7722dfd8
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b00aa72774eddf080e7f073
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linusw@kernel.org>,
	Ye Zhang <ye.zhang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] pinctrl: rockchip: Fix RK3506 pinctrl support
Date: Fri, 20 Nov 2026 20:15:39 +0000
Message-ID: <20261120201540.672016-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
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

The pinctrl driver added in commit dbd2317d7b9f ("pinctrl: rockchip:
Add rk3506 pinctrl support") depends on a rockchip,ioc1 property not
documented in dt-bindings to work, i.e. it expects the pinctrl node to
look something like following:

  pinctrl {
	rockchip,pmu = <&gpio0_ioc>;
	rockchip,ioc1 = <&gpio1_ioc>;
	rockchip,grf = <&gpio234_ioc>;

	gpio0 { };
	gpio1 { };
	gpio2 { };
  };

With the commit 63113d4fce6c ("pinctrl: rockchip: Add RV1106 pinctrl
support") the driver gained support for using GPIO bank referenced IO
control register blocks using the rockchip,grf phandle of the bank node.

Change the driver to work with dt-bindings documented nodes and
properties, i.e. something like:

  pinctrl {
	rockchip,grf = <&gpio234_ioc>;

	gpio0 {
		rockchip,grf = <&gpio0_ioc>;
	};
	gpio1 {
		rockchip,grf = <&gpio1_ioc>;
	};
	gpio2 { };
  };

Fixes: dbd2317d7b9f ("pinctrl: rockchip: Add rk3506 pinctrl support")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
The initial devicetree submitted for RK3506 at [1] uses rockchip,grf
props in gpio0 and gpio1 nodes together with a rockchip,grf in the
pinctrl node to work as the fallback for gpio2, gpio3 and gpio4.

[1] https://patch.msgid.link/20261119152055.556266-3-jonas@kwiboo.se/

Changes in v2:
- Drop IOMUX_SOURCE_PMU flag
- Collect r-b tag
Link to v1: https://patch.msgid.link/20261119211739.566874-1-jonas@kwiboo.se/
---
 drivers/pinctrl/pinctrl-rockchip.c | 57 ++++++++++++------------------
 drivers/pinctrl/pinctrl-rockchip.h |  1 -
 2 files changed, 23 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index b78be7dd5342..97a73f8c4f6e 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1335,12 +1335,8 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin >= 12)
 		return 0;
 
-	if (ctrl->type == RK3506) {
-		if (bank->bank_num == 1)
-			regmap = info->regmap_ioc1;
-		else if (bank->bank_num == 4)
-			return 0;
-	}
+	if (ctrl->type == RK3506 && bank->bank_num == 4)
+		return 0;
 
 	/* get basic quadrupel of mux registers and the correct reg inside */
 	mux_type = bank->iomux[iomux_num].type;
@@ -1492,12 +1488,8 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin >= 12)
 		return 0;
 
-	if (ctrl->type == RK3506) {
-		if (bank->bank_num == 1)
-			regmap = info->regmap_ioc1;
-		else if (bank->bank_num == 4)
-			return 0;
-	}
+	if (ctrl->type == RK3506 && bank->bank_num == 4)
+		return 0;
 
 	/* get basic quadrupel of mux registers and the correct reg inside */
 	mux_type = bank->iomux[iomux_num].type;
@@ -2568,9 +2560,13 @@ static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 	struct rockchip_pinctrl *info = bank->drvdata;
 	int ret = 0;
 
+	if (bank->regmap_ioc)
+		*regmap = bank->regmap_ioc;
+	else
+		*regmap = info->regmap_base;
+
 	switch (bank->bank_num) {
 	case 0:
-		*regmap = info->regmap_pmu;
 		if (pin_num > 24) {
 			ret = -EINVAL;
 		} else if (pin_num < 24) {
@@ -2584,7 +2580,6 @@ static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 1:
-		*regmap = info->regmap_ioc1;
 		if (pin_num < 28)
 			*reg = RK3506_DRV_GPIO1_OFFSET;
 		else
@@ -2592,7 +2587,6 @@ static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 2:
-		*regmap = info->regmap_base;
 		if (pin_num < 17)
 			*reg = RK3506_DRV_GPIO2_OFFSET;
 		else
@@ -2600,7 +2594,6 @@ static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 3:
-		*regmap = info->regmap_base;
 		if (pin_num < 15)
 			*reg = RK3506_DRV_GPIO3_OFFSET;
 		else
@@ -2608,7 +2601,6 @@ static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 4:
-		*regmap = info->regmap_base;
 		if (pin_num < 8 || pin_num > 11) {
 			ret = -EINVAL;
 		} else {
@@ -2653,9 +2645,13 @@ static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 	struct rockchip_pinctrl *info = bank->drvdata;
 	int ret = 0;
 
+	if (bank->regmap_ioc)
+		*regmap = bank->regmap_ioc;
+	else
+		*regmap = info->regmap_base;
+
 	switch (bank->bank_num) {
 	case 0:
-		*regmap = info->regmap_pmu;
 		if (pin_num > 24) {
 			ret = -EINVAL;
 		} else if (pin_num < 24) {
@@ -2669,7 +2665,6 @@ static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 1:
-		*regmap = info->regmap_ioc1;
 		if (pin_num < 28)
 			*reg = RK3506_PULL_GPIO1_OFFSET;
 		else
@@ -2677,7 +2672,6 @@ static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 2:
-		*regmap = info->regmap_base;
 		if (pin_num < 17)
 			*reg = RK3506_PULL_GPIO2_OFFSET;
 		else
@@ -2685,7 +2679,6 @@ static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 3:
-		*regmap = info->regmap_base;
 		if (pin_num < 15)
 			*reg = RK3506_PULL_GPIO3_OFFSET;
 		else
@@ -2693,7 +2686,6 @@ static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 4:
-		*regmap = info->regmap_base;
 		if (pin_num < 8 || pin_num > 11) {
 			ret = -EINVAL;
 		} else {
@@ -2739,9 +2731,13 @@ static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 	struct rockchip_pinctrl *info = bank->drvdata;
 	int ret = 0;
 
+	if (bank->regmap_ioc)
+		*regmap = bank->regmap_ioc;
+	else
+		*regmap = info->regmap_base;
+
 	switch (bank->bank_num) {
 	case 0:
-		*regmap = info->regmap_pmu;
 		if (pin_num > 24) {
 			ret = -EINVAL;
 		} else if (pin_num < 24) {
@@ -2755,7 +2751,6 @@ static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 1:
-		*regmap = info->regmap_ioc1;
 		if (pin_num < 28)
 			*reg = RK3506_SMT_GPIO1_OFFSET;
 		else
@@ -2763,7 +2758,6 @@ static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 2:
-		*regmap = info->regmap_base;
 		if (pin_num < 17)
 			*reg = RK3506_SMT_GPIO2_OFFSET;
 		else
@@ -2771,7 +2765,6 @@ static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 3:
-		*regmap = info->regmap_base;
 		if (pin_num < 15)
 			*reg = RK3506_SMT_GPIO3_OFFSET;
 		else
@@ -2779,7 +2772,6 @@ static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 4:
-		*regmap = info->regmap_base;
 		if (pin_num < 8 || pin_num > 11) {
 			ret = -EINVAL;
 		} else {
@@ -5030,9 +5022,6 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	/* try to find the optional reference to the pmu syscon */
 	info->regmap_pmu = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,pmu");
 
-	/* try to find the optional reference to the ioc1 syscon */
-	info->regmap_ioc1 = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,ioc1");
-
 	if (ctrl->type == RK3308) {
 		ret = rk3308_soc_data_init(info);
 		if (ret)
@@ -5651,10 +5640,10 @@ static struct rockchip_pin_ctrl rk3399_pin_ctrl = {
 
 static struct rockchip_pin_bank rk3506_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS_PULL_FLAGS(0, 32, "gpio0",
-				    IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
-				    IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
-				    IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
-				    IOMUX_WIDTH_2BIT | IOMUX_SOURCE_PMU,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_2BIT,
 				    0x0, 0x8, 0x10, 0x830,
 				    DRV_TYPE_IO_LEVEL_8_BIT,
 				    DRV_TYPE_IO_LEVEL_8_BIT,
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 553197f6dc69..b565f14254d8 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -468,7 +468,6 @@ struct rockchip_pinctrl {
 	int				reg_size;
 	struct regmap			*regmap_pull;
 	struct regmap			*regmap_pmu;
-	struct regmap			*regmap_ioc1;
 	struct device			*dev;
 	struct rockchip_pin_ctrl	*ctrl;
 	struct pinctrl_desc		pctl;
-- 
2.56.1

