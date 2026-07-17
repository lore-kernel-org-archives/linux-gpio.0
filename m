Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2029E3BED32
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 07:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784275182; cv=none; b=nQu7M5QPTRs94/jHBG9po8IMXHP/ntssFoloFaY4ZKlSTiVApdGbQOmYBTuJi8Aa8P1fRXkVSyUIUpTNvntykXqpv/uDJE26toMj5R9Xbm6WlGzooxqjNv1u97xLbEyeQBm0ZRU6SFsH2dpZJme1+8WOHQwN7AASG7z5O2pIuqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784275182; c=relaxed/simple;
	bh=rZOmbgFf4ozi62Otz7lhmFLdZvRCtMNSmJamThzyCB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=De0Bq3DSHic1RdFAlrhEsLEAH4X1mafPPxkRyXPoaqzOmy2chcd4jmxnjAaeB22pCVbJfrfrPw5cTZ7p61zLTMGd9bWnCtbnbsBFgPGjWKgaJr+1tgVDsflQ1fga72TZ0Bbjk9SeLgEgMXZ4QZGkXJCk0ZchCJz1ZXfgPFGEPIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ahdrone.com; spf=pass smtp.mailfrom=ahdrone.com; dkim=pass (2048-bit key) header.d=ahdrone.com header.i=@ahdrone.com header.b=EuTfwhVv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ahdrone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ahdrone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ahdrone.com header.i=@ahdrone.com header.b="EuTfwhVv"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47640541585so3731777f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 00:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ahdrone.com; s=google; t=1784275178; x=1784879978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDUk8y/EEhZBBu0L9bqDdy+tbB8EaRNIICnHcrc2lYI=;
        b=EuTfwhVv7n2/LA3Y3i1AIpTCDn23zKh2YPfpq+pxD/x7YE4hGA1h+vhzftc8+03L42
         LYG/FV3c/tHtVb9lLVptzoVUc2QohPSJLAehZlOnvReVapkAvGyhl1hAUymeb+lRsk37
         BmrQLuK2zu5RRuWey95dGF0BgvIKngAa6we2pVce7ZyROcxAIoSOxY0ZPFbLao/DWPOi
         HhvjbNO8zeRDGp/zPZ9lUhlhTc8Av2flu+wqmIlBXOzBPUr36NwhGZdOmRnHX91BWF21
         coPWsxy+w2jDIAMElElubFZlvB8bB4Nw0OL+qHsvs2qnZixURE8ILIZYTex01CgctdyZ
         zm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784275178; x=1784879978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDUk8y/EEhZBBu0L9bqDdy+tbB8EaRNIICnHcrc2lYI=;
        b=XPC80z1B4TZmPM3/tr/Pz4XjjiJy64fjWZHk2a2wcRBfQcbnXCYCIVK4xCW80hsUuH
         cCnE+w/GfZ43ilJGYYUi3mIpyGTii2BkPJBz0mU+9IrCGof8KdYwVBzVjxClcRjHfvll
         5Y/SWvVNGGQTx2ZDv0dotgVOA9eE+tQMyZw/3tRXEPs1kI/UOUGmfwxgZTph9OakFyLW
         +Nm5t1iZDHGBzgfbSBCZeXPIprzUqXYhFlWPYxs4JtYn6QBP7yrE9ROchB6F9QjwpZQZ
         GELhM0gDYrj7ISIHCdy2x1kdPqGSJcdiRv0hsa6cekqbuA6/T+yl7c1zPMnR9rKEUfX2
         sNyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1/HfUH70PaHRIl6W8bFF8AdQWhbJxWka5QZsRsZtmqxwp6YRGjRVJ5JKb4h3o3GP/q9D3G2oxwupa@vger.kernel.org
X-Gm-Message-State: AOJu0YyjvtOClLvT5NiRpR0i+0VW2cgHzjVFjK0D0TavlBuimdLvEgJM
	x8XJ33uhQHTVLmGUZ1I9FF2eLiTZvNJaM08Sr1FNPffkeCJl+yH9ldkfPv/5puKFTA==
X-Gm-Gg: AfdE7cm1mvKKRyHGhYJZQMKV8OBtom3BYGkIYIR+XXaqFJpGE/o11xkU1ShjKZ5KfgQ
	agI2LBk0t6SwruTLqj+8MeXQ8k3d2VZIjqszXgrfhUEkaUKLVCQog2RQnZYsoiH47Res/cJMHeb
	QZxzwf1jpAGqRBrud6BHuCiwtQLRMyBvXHt5bz/YFuFwdiSGAksftKV6ya8ICnLOWC7F63ERKEv
	iBynWy5FKT72lVJKtFIqJUuQ2vS075PlkVxq1W3DoErl9WYL02xNDPftn4Bm2kXDcb56y8n3XST
	jw+lOCZiCmmoAABUZ+f/L6OoXffvi+kdGWVRaEpPLEriZrnZpJpVAp7zs9bQNXOV/t4cmMNTYcX
	cdqo7/707smEIupEuIeTRlKikEYFnjtrsy9oXLWah/jQG5TK2XIQau+jAPLNLLwBsqnykIhaqc9
	Ax89PhqiSdgNrgtTzKfUmHrDm4eUUaf2YjJ11m
X-Received: by 2002:a05:600c:3b8e:b0:495:4bf3:2150 with SMTP id 5b1f17b1804b1-4954bf3216amr5291465e9.8.1784275178234;
        Fri, 17 Jul 2026 00:59:38 -0700 (PDT)
Received: from rikus ([2a01:e0a:edb:6330:cc2f:bd70:58a:fcfb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm31709045e9.4.2026.07.17.00.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:59:37 -0700 (PDT)
From: Hugo VALTIER <hugo@ahdrone.com>
To: Linus Walleij <linusw@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Hugo VALTIER <hugo@ahdrone.com>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 1/3] pinctrl: rockchip: constify mux recalced and route data arrays
Date: Fri, 17 Jul 2026 09:59:14 +0200
Message-ID: <20260717075918.1869879-2-hugo@ahdrone.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717075918.1869879-1-hugo@ahdrone.com>
References: <20260717075918.1869879-1-hugo@ahdrone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mux_recalced_data and mux_route_data arrays are never modified after
initialization. Mark them const so they can be placed in read-only
memory. Also constify the corresponding struct fields in
rockchip_pin_ctrl and local pointer variables.

This is inspired by review comments on Dmitry Yashin's earlier
RK3308B series [1].

[1] https://lore.kernel.org/all/20240515121634.23945-1-dmt.yashin@gmail.com/

Signed-off-by: Hugo VALTIER <hugo@ahdrone.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 34 +++++++++++++++---------------
 drivers/pinctrl/pinctrl-rockchip.h |  4 ++--
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 7e0fcd45fd26..849e72f1832c 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -483,7 +483,7 @@ static struct rockchip_mux_recalced_data rv1103b_mux_recalced_data[] = {
 	},
 };
 
-static struct rockchip_mux_recalced_data rv1108_mux_recalced_data[] = {
+static const struct rockchip_mux_recalced_data rv1108_mux_recalced_data[] = {
 	{
 		.num = 1,
 		.pin = 0,
@@ -547,7 +547,7 @@ static struct rockchip_mux_recalced_data rv1108_mux_recalced_data[] = {
 	},
 };
 
-static struct rockchip_mux_recalced_data rv1126_mux_recalced_data[] = {
+static const struct rockchip_mux_recalced_data rv1126_mux_recalced_data[] = {
 	{
 		.num = 0,
 		.pin = 20,
@@ -578,7 +578,7 @@ static struct rockchip_mux_recalced_data rv1126_mux_recalced_data[] = {
 	},
 };
 
-static  struct rockchip_mux_recalced_data rk3128_mux_recalced_data[] = {
+static const struct rockchip_mux_recalced_data rk3128_mux_recalced_data[] = {
 	{
 		.num = 2,
 		.pin = 20,
@@ -612,7 +612,7 @@ static  struct rockchip_mux_recalced_data rk3128_mux_recalced_data[] = {
 	},
 };
 
-static struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
+static const struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
 	{
 		/* gpio1b6_sel */
 		.num = 1,
@@ -721,7 +721,7 @@ static struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
 	},
 };
 
-static struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
+static const struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
 	{
 		/* gpio2_b7_sel */
 		.num = 2,
@@ -793,7 +793,7 @@ static void rockchip_get_recalced_mux(struct rockchip_pin_bank *bank, int pin,
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
 	struct rockchip_pin_ctrl *ctrl = info->ctrl;
-	struct rockchip_mux_recalced_data *data;
+	const struct rockchip_mux_recalced_data *data;
 	int i;
 
 	for (i = 0; i < ctrl->niomux_recalced; i++) {
@@ -811,7 +811,7 @@ static void rockchip_get_recalced_mux(struct rockchip_pin_bank *bank, int pin,
 	*bit = data->bit;
 }
 
-static struct rockchip_mux_route_data px30_mux_route_data[] = {
+static const struct rockchip_mux_route_data px30_mux_route_data[] = {
 	RK_MUXROUTE_SAME(2, RK_PB4, 1, 0x184, BIT(16 + 7)), /* cif-d0m0 */
 	RK_MUXROUTE_SAME(3, RK_PA1, 3, 0x184, BIT(16 + 7) | BIT(7)), /* cif-d0m1 */
 	RK_MUXROUTE_SAME(2, RK_PB6, 1, 0x184, BIT(16 + 7)), /* cif-d1m0 */
@@ -862,7 +862,7 @@ static struct rockchip_mux_route_data px30_mux_route_data[] = {
 	RK_MUXROUTE_SAME(1, RK_PB5, 2, 0x184, BIT(16 + 9) | BIT(9)), /* uart3-rtsm1 */
 };
 
-static struct rockchip_mux_route_data rv1126_mux_route_data[] = {
+static const struct rockchip_mux_route_data rv1126_mux_route_data[] = {
 	RK_MUXROUTE_GRF(3, RK_PD2, 1, 0x10260, WRITE_MASK_VAL(0, 0, 0)), /* I2S0_MCLK_M0 */
 	RK_MUXROUTE_GRF(3, RK_PB0, 3, 0x10260, WRITE_MASK_VAL(0, 0, 1)), /* I2S0_MCLK_M1 */
 
@@ -959,7 +959,7 @@ static struct rockchip_mux_route_data rv1126_mux_route_data[] = {
 	RK_MUXROUTE_PMU(1, RK_PD0, 5, 0x0118, WRITE_MASK_VAL(2, 2, 1)), /* UART1_TX_M1 */
 };
 
-static struct rockchip_mux_route_data rk3128_mux_route_data[] = {
+static const struct rockchip_mux_route_data rk3128_mux_route_data[] = {
 	RK_MUXROUTE_SAME(1, RK_PB2, 1, 0x144, BIT(16 + 3) | BIT(16 + 4)), /* spi-0 */
 	RK_MUXROUTE_SAME(1, RK_PD3, 3, 0x144, BIT(16 + 3) | BIT(16 + 4) | BIT(3)), /* spi-1 */
 	RK_MUXROUTE_SAME(0, RK_PB5, 2, 0x144, BIT(16 + 3) | BIT(16 + 4) | BIT(4)), /* spi-2 */
@@ -969,12 +969,12 @@ static struct rockchip_mux_route_data rk3128_mux_route_data[] = {
 	RK_MUXROUTE_SAME(2, RK_PA4, 2, 0x144, BIT(16 + 6) | BIT(6)), /* emmc-1 */
 };
 
-static struct rockchip_mux_route_data rk3188_mux_route_data[] = {
+static const struct rockchip_mux_route_data rk3188_mux_route_data[] = {
 	RK_MUXROUTE_SAME(0, RK_PD0, 1, 0xa0, BIT(16 + 11)), /* non-iomuxed emmc/flash pins on flash-dqs */
 	RK_MUXROUTE_SAME(0, RK_PD0, 2, 0xa0, BIT(16 + 11) | BIT(11)), /* non-iomuxed emmc/flash pins on emmc-clk */
 };
 
-static struct rockchip_mux_route_data rk3228_mux_route_data[] = {
+static const struct rockchip_mux_route_data rk3228_mux_route_data[] = {
 	RK_MUXROUTE_SAME(0, RK_PD2, 1, 0x50, BIT(16)), /* pwm0-0 */
 	RK_MUXROUTE_SAME(3, RK_PC5, 1, 0x50, BIT(16) | BIT(0)), /* pwm0-1 */
 	RK_MUXROUTE_SAME(0, RK_PD3, 1, 0x50, BIT(16 + 1)), /* pwm1-0 */
@@ -995,12 +995,12 @@ static struct rockchip_mux_route_data rk3228_mux_route_data[] = {
 	RK_MUXROUTE_SAME(3, RK_PB5, 1, 0x50, BIT(16 + 11) | BIT(11)), /* uart1-1_rx */
 };
 
-static struct rockchip_mux_route_data rk3288_mux_route_data[] = {
+static const struct rockchip_mux_route_data rk3288_mux_route_data[] = {
 	RK_MUXROUTE_SAME(7, RK_PC0, 2, 0x264, BIT(16 + 12) | BIT(12)), /* edphdmi_cecinoutt1 */
 	RK_MUXROUTE_SAME(7, RK_PC7, 4, 0x264, BIT(16 + 12)), /* edphdmi_cecinout */
 };
 
-static struct rockchip_mux_route_data rk3308_mux_route_data[] = {
+static const struct rockchip_mux_route_data rk3308_mux_route_data[] = {
 	RK_MUXROUTE_SAME(0, RK_PC3, 1, 0x314, BIT(16 + 0) | BIT(0)), /* rtc_clk */
 	RK_MUXROUTE_SAME(1, RK_PC6, 2, 0x314, BIT(16 + 2) | BIT(16 + 3)), /* uart2_rxm0 */
 	RK_MUXROUTE_SAME(4, RK_PD2, 2, 0x314, BIT(16 + 2) | BIT(16 + 3) | BIT(2)), /* uart2_rxm1 */
@@ -1016,7 +1016,7 @@ static struct rockchip_mux_route_data rk3308_mux_route_data[] = {
 	RK_MUXROUTE_SAME(2, RK_PA4, 3, 0x600, BIT(16 + 2) | BIT(2)), /* pdm-clkm-m2 */
 };
 
-static struct rockchip_mux_route_data rk3328_mux_route_data[] = {
+static const struct rockchip_mux_route_data rk3328_mux_route_data[] = {
 	RK_MUXROUTE_SAME(1, RK_PA1, 2, 0x50, BIT(16) | BIT(16 + 1)), /* uart2dbg_rxm0 */
 	RK_MUXROUTE_SAME(2, RK_PA1, 1, 0x50, BIT(16) | BIT(16 + 1) | BIT(0)), /* uart2dbg_rxm1 */
 	RK_MUXROUTE_SAME(1, RK_PB3, 2, 0x50, BIT(16 + 2) | BIT(2)), /* gmac-m1_rxd0 */
@@ -1031,7 +1031,7 @@ static struct rockchip_mux_route_data rk3328_mux_route_data[] = {
 	RK_MUXROUTE_SAME(2, RK_PC0, 4, 0x50, BIT(16 + 9) | BIT(9)), /* cif_data5m1 */
 };
 
-static struct rockchip_mux_route_data rk3399_mux_route_data[] = {
+static const struct rockchip_mux_route_data rk3399_mux_route_data[] = {
 	RK_MUXROUTE_SAME(4, RK_PB0, 2, 0xe21c, BIT(16 + 10) | BIT(16 + 11)), /* uart2dbga_rx */
 	RK_MUXROUTE_SAME(4, RK_PC0, 2, 0xe21c, BIT(16 + 10) | BIT(16 + 11) | BIT(10)), /* uart2dbgb_rx */
 	RK_MUXROUTE_SAME(4, RK_PC3, 1, 0xe21c, BIT(16 + 10) | BIT(16 + 11) | BIT(11)), /* uart2dbgc_rx */
@@ -1039,7 +1039,7 @@ static struct rockchip_mux_route_data rk3399_mux_route_data[] = {
 	RK_MUXROUTE_SAME(4, RK_PD0, 1, 0xe21c, BIT(16 + 14) | BIT(14)), /* pcie_clkreqnb */
 };
 
-static struct rockchip_mux_route_data rk3568_mux_route_data[] = {
+static const struct rockchip_mux_route_data rk3568_mux_route_data[] = {
 	RK_MUXROUTE_PMU(0, RK_PB7, 1, 0x0110, WRITE_MASK_VAL(1, 0, 0)), /* PWM0 IO mux M0 */
 	RK_MUXROUTE_PMU(0, RK_PC7, 2, 0x0110, WRITE_MASK_VAL(1, 0, 1)), /* PWM0 IO mux M1 */
 	RK_MUXROUTE_PMU(0, RK_PC0, 1, 0x0110, WRITE_MASK_VAL(3, 2, 0)), /* PWM1 IO mux M0 */
@@ -1140,7 +1140,7 @@ static bool rockchip_get_mux_route(struct rockchip_pin_bank *bank, int pin,
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
 	struct rockchip_pin_ctrl *ctrl = info->ctrl;
-	struct rockchip_mux_route_data *data;
+	const struct rockchip_mux_route_data *data;
 	int i;
 
 	for (i = 0; i < ctrl->niomux_routes; i++) {
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index bb0e803e3b8a..dd07a16f615c 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -400,9 +400,9 @@ struct rockchip_pin_ctrl {
 	int				pmu_mux_offset;
 	int				grf_drv_offset;
 	int				pmu_drv_offset;
-	struct rockchip_mux_recalced_data *iomux_recalced;
+	const struct rockchip_mux_recalced_data *iomux_recalced;
 	u32				niomux_recalced;
-	struct rockchip_mux_route_data *iomux_routes;
+	const struct rockchip_mux_route_data *iomux_routes;
 	u32				niomux_routes;
 
 	int	(*pull_calc_reg)(struct rockchip_pin_bank *bank,
-- 
2.55.0

