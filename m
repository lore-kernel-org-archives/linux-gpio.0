Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595121;
	b=snWjB3xiDS5ahl61MC6mRVgS/8VkEPjWgkoAMD7VyyKG3vOt1sXSukghR20p+hox4/0A
	 4RZDmv1+HzS3P4Rtw6mDO/zgJ/kIOPH8/MeRA4Pfm0zwrhbQNqyGnj/9ZKnxBkNnzLltA
	 Tdzcxhbjb4GcCDQJr1BIylmBaXWu0O8lZ/bSb+tEZon2S7Mo5nsgTwUdp5s7T44EnEI9z
	 Fn1ighFIWGBdLjIfO2E7ox3pzsIQ9yu8WeRf0YP6avkzVwvgHGdFYUowfum4HPI7PF1fd
	 VGLw80YikRc5bGO5VhvdtmvUQliiBav+Z8/cf0U06KFOXWsiqVzeic1X68o27SOZ6ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QVzyg4PzzarhWqW6AHgu+GO/EUiNPPfu0ZCHZHvx1b4=;
	b=0ltlZonCq5BPweaUeMlZx3aAuO50n0kbnQZDjLTDvjdwPwWpQnM661attWFvO8PD3ENE
	 DABh9LH/TL5/7Fz6uPqQm3LW67oLuYvEmdhJ0eLWi0KMxh5kkxUtCRa8qXDjQ8clsvIgy
	 hfQR+CcBRSVUaHgQN1gbvwaa8/B+Pqbt/+D3C/ISAYZVKPvN3rvhy5XQH5Y25q3iQgeTq
	 TVu2LcaicmwqDXG0u3v60Z2+IKv9BUmkZoXDDqimkmj/rL+SIARVqw/fpncHquNGFN73n
	 MvbpTa7rY+NPdlB/rjNMd+yae9pfLozIZ8B2vbWE08PpwiqDNtM4GynCegSNuy5cFQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=R8qmkeFe;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE919606A8BF
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 18:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE919606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=R8qmkeFe
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49318428d98so536032f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595118; x=1795199918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVzyg4PzzarhWqW6AHgu+GO/EUiNPPfu0ZCHZHvx1b4=;
        b=R8qmkeFeWKWTaF9+shFBSL5oUiwJmRcAN0orjFvAUZ+2UYXJOkZ1uP+NhaqAZ0B6/p
         m6kvpJAqI4L53zY0LZivatg9UUOk5NzV9+4juf8oWchtW5N+GOipm81ekc53UW+ZR6xM
         Jc5q14jDzrI3Fso++j5ydZvKkzhwrSO9oTcY/tMulcl2cbYScuiSWln1AEiRpEeWUhRF
         UvxAA/Y/EfOvpzlo5L4rIfvWH596fDPWWYcXSggZ3cBeaZC4tq40fMR8CdDertdWcx6l
         LV4YBP0UHIWg1ILy2wWYb3ULzwxKHXKGx2/shjG/UZOg7fUMT6TvMDz0x5zXiNW0HDeK
         AAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595118; x=1795199918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVzyg4PzzarhWqW6AHgu+GO/EUiNPPfu0ZCHZHvx1b4=;
        b=G9uihnqgUEnC8w+bVzJJl9d79LHJp/BCuhE8XNTK2wAQ12zg1a8XHeRpMiIMm3ZWa3
         GbxVg86xDOhocJrXQRzuTlMnNtxURAXMfqwKhhKdJAHgtx9NAJytHQOIBVpQgR57szNa
         TImGahmdiMYXZqCyQwMU4Z+m966xo4psJRXm7fVqTA5DnE4Q24kkebdJMbeAVl5yCQYQ
         NqEPeN59MejD3sZ4j4Ce6hX7Mki05c7C7pjjFNyvWI0RTpaF9vuXry4m+G4vbuizBF9t
         88Mp97grb6X1MxIjpwYhGbXZk5XP/Zyt4cUavM/GkPOKXyk3raaN6/mLb5uC90hkHqGj
         mblg==
X-Forwarded-Encrypted: i=1; AL+hErEhI/ceru+gCvOey1ueeavSUVuPE9vjUeRvPIaP+fLdhnvulyadhu19er3y3l1egYF+oynUwag+ziry@vger.kernel.org
X-Gm-Message-State: APuU4Z+cLafH7KLhnpOuvSRoM0RD9YG9Ncd2QbGd4gnnYLVhLPUSQPiC
	GxrTAf8i1dEZsLQl3Fq7CayEx41uPehCZO9KCmybkLeLt3Ig0AuOHIlIJIwuBEcGwUg=
X-Gm-Gg: AYBFou2bj5rHjMM+mkYAMZY2/1SheiN4y+jHsFUjpR3+Fxn6T5eJn49UpmfCRNT0d9I
	QZmBxp79fuA+9UPD1ImWHcHFK+Ub+y8M94i0uYciAEYEqR6vhiYBGQzzA8xIPFhTq14ESKO+yYp
	hJWR80bPxq/8vVhJ3UMlR6bU5z3M37HG71cH1nfDWPcewbHo1X76eQl8dtSWNq1yQFvMEiGDRwo
	bM7nIDVrFc2+BgpWcYgqoQ2q5g/EC5BgqZy9mBLvr0cf0PHIn7D3Vj0g+RmMRQ4cQiZN9UUXxHs
	kKd/AOb8VRgd+OhvAEyWFOVFuLNm98R7GGV7XnHhg6Z68Rw1y4MG3wmGe/3ck8nChmhRqIgk3rv
	sU0w1TA34Xfbp7yakNzjPFoXQ1kIrpefAblthb0wpXIO9e9d93tNSDfQzzMmp0eVFQI0T9e0P0/
	NretFahD45Qbv9tKTXCVlURLVD/vb6MkTqtKkARGqa/iO3o6kecCO7dIZ4kJr7Wjf5hi0IyBxM/
	RwSs1yGTVrsQWWTE1pY7mHGWkOU0LV7kFweve30+M4r8l+rEOTspC3UOVq0b8W5xqqkSHx7+/6K
	Z6VG4YAh87o09VGWi4IOyrS923qFzqDhMC5b7HBx1I8fTx0XrZcGcmWPoZwenD3w
X-Received: by 2002:a05:6000:18a3:b0:48d:f3a5:4563 with SMTP id ffacd0b85a97d-49c70ed9360mr8729678f8f.20.1794595117555;
        Fri, 13 Nov 2026 10:38:37 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:16 +0100
Subject: [PATCH RFC 02/23] clk: qcom: add SM8650 LPASS core & audio clock
 controllers
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-topic-sm8650-el2-v1-2-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=41256;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qpy4rOV6l2xkmUsZicLqui0l7N98pZfnTjmhd6w4PD8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91keoFPAkDr9HSGEPYGwperoQmhMM0vV2ZrbC2Yt
 46iG7hSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZHgAKCRB33NvayMhJ0TNID/
 91/0mONNP9NlMGs1k8FTMycgNk+Tt4iMZhHaBWd3e7n414oWtDVU2z/vTJ8CrZpnfmUGE4xQKy13fU
 +qcRSaILa/AJlbfgIYM7/qtKqnoFktJEDuXopmLtd7x/rSs87EWkW6SQYa2LUGqcZlFhpCxFZghexb
 4EJAS9TUIx0zz3qmQ6EM0dsBVW118sDdo3YAnD/58jnIFVCDbRWF6kOvEKSTz+Di2rCGKrdwUxLtfg
 CJTXsFpYtf+igRFIN27PDQE21ZWN9Sninzcdj20oTmvUP+Y5vBTB1YuBh2g2ipIYj1tk/pN4nzQoSu
 NmcGcpuOCdeniq1zbmZa0uEmcIoWa2c0YmlgNaT6iGOgZ+fs0wkw8GqT0l3HHZfv9LBzsgw0oAAfEv
 cKHqYUuXpORXLcnrPVAwvPqzeRDOhrGlELuEYa8kC3JQXeZqwUejxuY6knJks2MrLwr4rpsb5LBfmy
 hnhrXEa7ZVbuYSvJy5RyvPO7ZWhFslNofQILslTQ5wVS9Xp+6OQCYun1EhliABghFYsraDVZqDFVnT
 yTxcCRtDXlRH1qska2YU5f4yYOJ0VMI80W9m5eu/c+JMb2c7u6H9KURoBrSaleOpLxcbKc9oIPNvn1
 JlcR5G/9pEzkD4uQzh572TiAIMbopuqmOPxaZdM0QMpvO80xzi2FdxC/lxrQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Without the ADSP firmware, the LPASS clocks (MI2S bit clocks, codec
macro MCLKs, LPM memory clocks...) must be controlled by Linux.

Add drivers for the SM8650 LPASS HM, core, audio and AON clock
controllers, the HM, audio and AON controllers keeping their iface clock
enabled while in use, LPASS HM's being the GCC LPASS config NoC clock.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/Kconfig               |  12 +
 drivers/clk/qcom/Makefile              |   1 +
 drivers/clk/qcom/lpassaudiocc-sm8650.c | 777 +++++++++++++++++++++++++++++++++
 drivers/clk/qcom/lpasscorecc-sm8650.c  | 509 +++++++++++++++++++++
 4 files changed, 1299 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 27d0ab24d50a..a693948322f8 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1959,6 +1959,18 @@ config SM_GPUCC_8750
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
+config SM_LPASS_CORECC_8650
+	tristate "SM8650 LPASS Core & Audio Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select SM_GCC_8650
+	select QCOM_GDSC
+	default m if ARCH_QCOM
+	help
+	  Support for the LPASS(Low Power Audio Subsystem) core and audio clock
+	  controller on SM8650 devices.
+	  Say Y if you want to use LPASS clocks and power domains of the LPASS
+	  core clock controller.
+
 config SM_LPASSCC_6115
 	tristate "SM6115 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6affb5073f26..b6862dc0437a 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -213,6 +213,7 @@ obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
 obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
 obj-$(CONFIG_SM_GPUCC_8750) += gpucc-sm8750.o gxclkctl-kaanapali.o
 obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o gxclkctl-kaanapali.o
+obj-$(CONFIG_SM_LPASS_CORECC_8650) += lpasscorecc-sm8650.o lpassaudiocc-sm8650.o
 obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
diff --git a/drivers/clk/qcom/lpassaudiocc-sm8650.c b/drivers/clk/qcom/lpassaudiocc-sm8650.c
new file mode 100644
index 000000000000..636ce9a1b345
--- /dev/null
+++ b/drivers/clk/qcom/lpassaudiocc-sm8650.c
@@ -0,0 +1,777 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,lpassaudiocc-sm8650.h>
+
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	P_BI_TCXO,
+};
+
+static const struct parent_map lpass_audio_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data lpass_audio_cc_parent_data_0[] = {
+	{ .index = 0 },
+};
+
+static const struct parent_map lpass_aon_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data lpass_aon_cc_parent_data_0[] = {
+	{ .index = 0 },
+};
+
+/* XO only for now: the ADSP plan also uses the audio CC PLLs for MCLKs */
+static const struct freq_tbl ftbl_lpass_mclk_clk_src[] = {
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+/* XO only for now: the ADSP plan feeds these from the audio CC DIG PLL */
+static const struct freq_tbl ftbl_lpass_cc_ext_clk_src[] = {
+	F(1536000, P_BI_TCXO, 1, 2, 25),
+	F(2304000, P_BI_TCXO, 1, 3, 25),
+	F(3072000, P_BI_TCXO, 1, 4, 25),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 lpass_aon_cc_ext_if1_clk_src = {
+	.cmd_rcgr = 0xb004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_audio_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_cc_ext_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_aon_cc_ext_if1_clk_src",
+		.parent_data = lpass_aon_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_aon_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_aon_cc_main_rcg_clk_src = {
+	.cmd_rcgr = 0x19000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = lpass_aon_cc_parent_map_0,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_aon_cc_main_rcg_clk_src",
+		.parent_data = lpass_aon_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_aon_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_aon_cc_tx_mclk_clk_src = {
+	.cmd_rcgr = 0x1b004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = lpass_aon_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_mclk_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_aon_cc_tx_mclk_clk_src",
+		.parent_data = lpass_aon_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_aon_cc_parent_data_0),
+		//.flags = CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_audio_cc_ext_if1_clk_src = {
+	.cmd_rcgr = 0x18004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_audio_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_cc_ext_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_audio_cc_ext_if1_clk_src",
+		.parent_data = lpass_audio_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_audio_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_audio_cc_ext_if2_clk_src = {
+	.cmd_rcgr = 0x19004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_audio_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_cc_ext_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_audio_cc_ext_if2_clk_src",
+		.parent_data = lpass_audio_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_audio_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_audio_cc_ext_if4_clk_src = {
+	.cmd_rcgr = 0x1c004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_audio_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_cc_ext_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_audio_cc_ext_if4_clk_src",
+		.parent_data = lpass_audio_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_audio_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_audio_cc_ext_if5_clk_src = {
+	.cmd_rcgr = 0x1d004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_audio_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_cc_ext_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_audio_cc_ext_if5_clk_src",
+		.parent_data = lpass_audio_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_audio_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_audio_cc_wsa_mclk_clk_src = {
+	.cmd_rcgr = 0x2a004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = lpass_audio_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_mclk_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_audio_cc_wsa_mclk_clk_src",
+		.parent_data = lpass_audio_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_audio_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_audio_cc_rx_mclk_clk_src = {
+	.cmd_rcgr = 0x2c004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = lpass_audio_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_mclk_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_audio_cc_rx_mclk_clk_src",
+		.parent_data = lpass_audio_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_audio_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+/* MCLK = RCG / CDIV (reset value: divide by 2), the 2X clocks are the RCG */
+static struct clk_regmap_div lpass_audio_cc_cdiv_rx_mclk_div_clk_src = {
+	.reg = 0x2c0d0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "lpass_audio_cc_cdiv_rx_mclk_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_audio_cc_rx_mclk_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div lpass_audio_cc_cdiv_wsa_mclk_div_clk_src = {
+	.reg = 0x2a0d0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "lpass_audio_cc_cdiv_wsa_mclk_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_audio_cc_wsa_mclk_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div lpass_aon_cc_cdiv_tx_mclk_div_clk_src = {
+	.reg = 0x1b010,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "lpass_aon_cc_cdiv_tx_mclk_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch lpass_aon_cc_audio_hm_h_clk;
+
+static struct clk_branch lpass_audio_cc_codec_mem_clk = {
+	.halt_reg = 0x2e000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_codec_mem_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_audio_hm_h_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_codec_mem0_clk = {
+	.halt_reg = 0x2e004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_codec_mem0_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_audio_hm_h_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_codec_mem1_clk = {
+	.halt_reg = 0x2e010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_codec_mem1_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_audio_hm_h_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_codec_mem2_clk = {
+	.halt_reg = 0x2e01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_codec_mem2_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_audio_hm_h_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_codec_mem3_clk = {
+	.halt_reg = 0x2e028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_codec_mem3_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_audio_hm_h_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_rx_mclk_clk = {
+	.halt_reg = 0x2c0d4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c0d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_rx_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_cdiv_rx_mclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_ext_if1_ibit_clk = {
+	.halt_reg = 0x1801c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1801c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_ext_if1_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_ext_if1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_ext_if2_ibit_clk = {
+	.halt_reg = 0x1901c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1901c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_ext_if2_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_ext_if2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_ext_if4_ibit_clk = {
+	.halt_reg = 0x1c01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1c01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_ext_if4_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_ext_if4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_ext_if5_ibit_clk = {
+	.halt_reg = 0x1d01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1d01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_ext_if5_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_ext_if5_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_wsa_mclk_clk = {
+	.halt_reg = 0x2a0d4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a0d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_wsa_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_cdiv_wsa_mclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_wsa2_mclk_clk = {
+	.halt_reg = 0x2d004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2d004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_wsa2_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_wsa_mclk_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_aon_cc_tx_mclk_clk;
+
+static struct clk_branch lpass_audio_cc_tx_mclk_wsa_clk = {
+	.halt_reg = 0x2a0f4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a0f4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_tx_mclk_wsa_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_tx_mclk_rx_clk = {
+	.halt_reg = 0x2c0e0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c0e0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_tx_mclk_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_tx_mclk_wsa2_clk = {
+	.halt_reg = 0x2d00c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2d00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_audio_cc_tx_mclk_wsa2_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_aon_cc_ext_if1_ibit_clk = {
+	.halt_reg = 0xb01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_aon_cc_ext_if1_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_ext_if1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_aon_cc_audio_hm_h_clk = {
+	.halt_reg = 0x11014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_aon_cc_audio_hm_h_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_main_rcg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_aon_cc_va_mem0_clk = {
+	.halt_reg = 0x11060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_aon_cc_va_mem0_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_main_rcg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_aon_cc_tx_mclk_clk = {
+	.halt_reg = 0x1b014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1b014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_aon_cc_tx_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_cdiv_tx_mclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc lpass_aon_cc_lpass_audio_hm_gdsc = {
+	.gdscr = 0x11090,
+	.pd = {
+		.name = "lpass_aon_cc_lpass_audio_hm_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *lpass_aon_cc_sm8650_clocks[] = {
+	[LPASS_AON_CC_MAIN_RCG_CLK_SRC] = &lpass_aon_cc_main_rcg_clk_src.clkr,
+	[LPASS_AON_CC_AUDIO_HM_H_CLK] = &lpass_aon_cc_audio_hm_h_clk.clkr,
+	[LPASS_AON_CC_VA_MEM0_CLK] = &lpass_aon_cc_va_mem0_clk.clkr,
+	[LPASS_AON_CC_TX_MCLK_CLK_SRC] = &lpass_aon_cc_tx_mclk_clk_src.clkr,
+	[LPASS_AON_CC_TX_MCLK_CLK] = &lpass_aon_cc_tx_mclk_clk.clkr,
+	[LPASS_AON_CC_CDIV_TX_MCLK_DIV_CLK_SRC] = &lpass_aon_cc_cdiv_tx_mclk_div_clk_src.clkr,
+	[LPASS_AON_CC_EXT_IF1_CLK_SRC] = &lpass_aon_cc_ext_if1_clk_src.clkr,
+	[LPASS_AON_CC_EXT_IF1_IBIT_CLK] = &lpass_aon_cc_ext_if1_ibit_clk.clkr,
+};
+
+static struct gdsc *lpass_aon_cc_sm8650_gdscs[] = {
+	[LPASS_AON_CC_LPASS_AUDIO_HM_GDSC] = &lpass_aon_cc_lpass_audio_hm_gdsc,
+};
+
+static struct clk_regmap *lpass_audio_cc_sm8650_clocks[] = {
+	[LPASS_AUDIO_CC_WSA_MCLK_CLK_SRC] = &lpass_audio_cc_wsa_mclk_clk_src.clkr,
+	[LPASS_AUDIO_CC_RX_MCLK_CLK] = &lpass_audio_cc_rx_mclk_clk.clkr,
+	[LPASS_AUDIO_CC_RX_MCLK_CLK_SRC] = &lpass_audio_cc_rx_mclk_clk_src.clkr,
+	[LPASS_AUDIO_CC_WSA_MCLK_CLK] = &lpass_audio_cc_wsa_mclk_clk.clkr,
+	[LPASS_AUDIO_CC_WSA2_MCLK_CLK] = &lpass_audio_cc_wsa2_mclk_clk.clkr,
+	[LPASS_AUDIO_CC_CODEC_MEM_CLK] = &lpass_audio_cc_codec_mem_clk.clkr,
+	[LPASS_AUDIO_CC_CODEC_MEM0_CLK] = &lpass_audio_cc_codec_mem0_clk.clkr,
+	[LPASS_AUDIO_CC_CODEC_MEM1_CLK] = &lpass_audio_cc_codec_mem1_clk.clkr,
+	[LPASS_AUDIO_CC_CODEC_MEM2_CLK] = &lpass_audio_cc_codec_mem2_clk.clkr,
+	[LPASS_AUDIO_CC_CODEC_MEM3_CLK] = &lpass_audio_cc_codec_mem3_clk.clkr,
+	[LPASS_AUDIO_CC_TX_MCLK_WSA_CLK] = &lpass_audio_cc_tx_mclk_wsa_clk.clkr,
+	[LPASS_AUDIO_CC_TX_MCLK_RX_CLK] = &lpass_audio_cc_tx_mclk_rx_clk.clkr,
+	[LPASS_AUDIO_CC_TX_MCLK_WSA2_CLK] = &lpass_audio_cc_tx_mclk_wsa2_clk.clkr,
+	[LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC] = &lpass_audio_cc_cdiv_rx_mclk_div_clk_src.clkr,
+	[LPASS_AUDIO_CC_CDIV_WSA_MCLK_DIV_CLK_SRC] = &lpass_audio_cc_cdiv_wsa_mclk_div_clk_src.clkr,
+	[LPASS_AUDIO_CC_EXT_IF1_CLK_SRC] = &lpass_audio_cc_ext_if1_clk_src.clkr,
+	[LPASS_AUDIO_CC_EXT_IF1_IBIT_CLK] = &lpass_audio_cc_ext_if1_ibit_clk.clkr,
+	[LPASS_AUDIO_CC_EXT_IF2_CLK_SRC] = &lpass_audio_cc_ext_if2_clk_src.clkr,
+	[LPASS_AUDIO_CC_EXT_IF2_IBIT_CLK] = &lpass_audio_cc_ext_if2_ibit_clk.clkr,
+	[LPASS_AUDIO_CC_EXT_IF4_CLK_SRC] = &lpass_audio_cc_ext_if4_clk_src.clkr,
+	[LPASS_AUDIO_CC_EXT_IF4_IBIT_CLK] = &lpass_audio_cc_ext_if4_ibit_clk.clkr,
+	[LPASS_AUDIO_CC_EXT_IF5_CLK_SRC] = &lpass_audio_cc_ext_if5_clk_src.clkr,
+	[LPASS_AUDIO_CC_EXT_IF5_IBIT_CLK] = &lpass_audio_cc_ext_if5_ibit_clk.clkr,
+};
+
+static const struct regmap_config lpass_audio_cc_sm8650_regmap_config = {
+	.name = "lpasscc_audio",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x2f000,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc lpass_audio_cc_sm8650_desc = {
+	.config = &lpass_audio_cc_sm8650_regmap_config,
+	.clks = lpass_audio_cc_sm8650_clocks,
+	.num_clks = ARRAY_SIZE(lpass_audio_cc_sm8650_clocks),
+};
+
+static const struct of_device_id lpass_audio_cc_sm8650_match_table[] = {
+	{ .compatible = "qcom,sm8650-lpassaudiocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_audio_cc_sm8650_match_table);
+
+static int lpass_audio_cc_sm8650_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_pm_clk_create(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_clk_add(&pdev->dev, "iface");
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to acquire iface clock\n");
+		return ret;
+	}
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = qcom_cc_probe(pdev, &lpass_audio_cc_sm8650_desc);
+
+	pm_runtime_put_sync(&pdev->dev);
+
+	return ret;
+}
+
+static const struct dev_pm_ops lpass_audio_cc_sm8650_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static struct platform_driver lpass_audio_cc_sm8650_driver = {
+	.probe = lpass_audio_cc_sm8650_probe,
+	.driver = {
+		.name = "lpass_audio_cc-sm8650",
+		.of_match_table = lpass_audio_cc_sm8650_match_table,
+		.pm = &lpass_audio_cc_sm8650_pm_ops,
+	},
+};
+
+static const struct regmap_config lpass_aon_cc_sm8650_regmap_config = {
+	.name = "lpasscc_aon",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x2f000,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc lpass_aon_cc_sm8650_desc = {
+	.config = &lpass_aon_cc_sm8650_regmap_config,
+	.clks = lpass_aon_cc_sm8650_clocks,
+	.num_clks = ARRAY_SIZE(lpass_aon_cc_sm8650_clocks),
+	.gdscs = lpass_aon_cc_sm8650_gdscs,
+	.num_gdscs = ARRAY_SIZE(lpass_aon_cc_sm8650_gdscs),
+};
+
+static int lpass_aon_cc_sm8650_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_pm_clk_create(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_clk_add(&pdev->dev, "iface");
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to acquire iface clock\n");
+		return ret;
+	}
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = qcom_cc_probe(pdev, &lpass_aon_cc_sm8650_desc);
+
+	pm_runtime_put_sync(&pdev->dev);
+
+	return ret;
+}
+
+static const struct of_device_id lpass_aon_cc_sm8650_match_table[] = {
+	{ .compatible = "qcom,sm8650-lpassaoncc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_aon_cc_sm8650_match_table);
+
+static struct platform_driver lpass_aon_cc_sm8650_driver = {
+	.probe = lpass_aon_cc_sm8650_probe,
+	.driver = {
+		.name = "lpass_aon_cc-sm8650",
+		.of_match_table = lpass_aon_cc_sm8650_match_table,
+		.pm = &lpass_audio_cc_sm8650_pm_ops,
+	},
+};
+
+static int __init lpass_audio_cc_sm8650_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&lpass_aon_cc_sm8650_driver);
+	if (ret)
+		return ret;
+
+	return platform_driver_register(&lpass_audio_cc_sm8650_driver);
+}
+subsys_initcall(lpass_audio_cc_sm8650_init);
+
+static void __exit lpass_audio_cc_sm8650_exit(void)
+{
+	platform_driver_unregister(&lpass_audio_cc_sm8650_driver);
+	platform_driver_unregister(&lpass_aon_cc_sm8650_driver);
+}
+module_exit(lpass_audio_cc_sm8650_exit);
+
+MODULE_DESCRIPTION("LPASS Audio CC SM8650 Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/lpasscorecc-sm8650.c b/drivers/clk/qcom/lpasscorecc-sm8650.c
new file mode 100644
index 000000000000..4f91ab0d772e
--- /dev/null
+++ b/drivers/clk/qcom/lpasscorecc-sm8650.c
@@ -0,0 +1,509 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,lpasscorecc-sm8650.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+
+enum {
+	P_BI_TCXO,
+	P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN,
+	P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC,
+	P_LPASS_CORE_CC_DIG_PLL_OUT_ODD,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+static const struct alpha_pll_config lpass_core_cc_dig_pll_config = {
+	/* 614.4 MHz */
+	.l = 0x20,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll lpass_core_cc_dig_pll = {
+	.offset = 0x0,
+	.config = &lpass_core_cc_dig_pll_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_core_cc_dig_pll",
+			.parent_data = &(const struct clk_parent_data){
+				.index = 0,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_lpass_core_cc_dig_pll_out_odd[] = {
+	{ 0x5, 5 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv lpass_core_cc_dig_pll_out_odd = {
+	.offset = 0x0,
+	.post_div_shift = 14,
+	.post_div_table = post_div_table_lpass_core_cc_dig_pll_out_odd,
+	.num_post_div = ARRAY_SIZE(post_div_table_lpass_core_cc_dig_pll_out_odd),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_core_cc_dig_pll_out_odd",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_core_cc_dig_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_ops,
+	},
+};
+
+static struct clk_regmap_div lpass_core_cc_dig_pll_out_main_div_clk_src = {
+	.reg = 0x10008,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "lpass_core_cc_dig_pll_out_main_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_core_cc_dig_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static const struct parent_map lpass_core_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_LPASS_CORE_CC_DIG_PLL_OUT_ODD, 5 },
+};
+
+static const struct clk_parent_data lpass_core_cc_parent_data_0[] = {
+	{ .index = 0 },
+	{ .hw = &lpass_core_cc_dig_pll_out_odd.clkr.hw },
+};
+
+static const struct parent_map lpass_core_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN, 1 },
+	{ P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 2 },
+};
+
+static const struct clk_parent_data lpass_core_cc_parent_data_ao_2[] = {
+	{ .index = 1 },
+	{ .hw = &lpass_core_cc_dig_pll.clkr.hw },
+	{ .hw = &lpass_core_cc_dig_pll_out_main_div_clk_src.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_lpass_core_cc_core_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(51200000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 6, 0, 0),
+	F(102400000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 3, 0, 0),
+	F(204800000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 lpass_core_cc_core_clk_src = {
+	.cmd_rcgr = 0x25000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_2,
+	.freq_tbl = ftbl_lpass_core_cc_core_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_core_cc_core_clk_src",
+		.parent_data = lpass_core_cc_parent_data_ao_2,
+		.num_parents = ARRAY_SIZE(lpass_core_cc_parent_data_ao_2),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_lpass_core_cc_ext_if0_clk_src[] = {
+	F(1536000, P_BI_TCXO, 1, 2, 25),
+	F(2304000, P_BI_TCXO, 1, 3, 25),
+	F(3072000, P_BI_TCXO, 1, 4, 25),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 lpass_core_cc_ext_if0_clk_src = {
+	.cmd_rcgr = 0x18000,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_core_cc_ext_if0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_core_cc_ext_if0_clk_src",
+		.parent_data = lpass_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_core_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_core_cc_ext_if1_clk_src = {
+	.cmd_rcgr = 0x19000,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_core_cc_ext_if0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_core_cc_ext_if1_clk_src",
+		.parent_data = lpass_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_core_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_core_cc_ext_if2_clk_src = {
+	.cmd_rcgr = 0x1a000,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_core_cc_ext_if0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_core_cc_ext_if2_clk_src",
+		.parent_data = lpass_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_core_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_core_cc_ext_mclk0_clk_src = {
+	.cmd_rcgr = 0x28000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_core_cc_ext_if0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "lpass_core_cc_ext_mclk0_clk_src",
+		.parent_data = lpass_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_core_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch lpass_core_cc_core_clk = {
+	.halt_reg = 0x27000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x27000,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x27000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_core_cc_core_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_ext_if0_ibit_clk = {
+	.halt_reg = 0x18018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x18018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_core_cc_ext_if0_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_ext_if0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_ext_if1_ibit_clk = {
+	.halt_reg = 0x19018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x19018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_core_cc_ext_if1_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_ext_if1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_ext_if2_ibit_clk = {
+	.halt_reg = 0x1a018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1a018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_core_cc_ext_if2_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_ext_if2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_lpm_core_clk = {
+	.halt_reg = 0x26000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x26000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_core_cc_lpm_core_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_lpm_mem0_core_clk = {
+	.halt_reg = 0x26004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x26004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_core_cc_lpm_mem0_core_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_ext_mclk0_clk = {
+	.halt_reg = 0x28014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_core_cc_ext_mclk0_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_ext_mclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_sysnoc_mport_core_clk = {
+	.halt_reg = 0x2b000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2b000,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2b000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "lpass_core_cc_sysnoc_mport_core_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc lpass_core_cc_lpass_core_hm_gdsc = {
+	.gdscr = 0x0,
+	.pd = {
+		.name = "lpass_core_cc_lpass_core_hm_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *lpass_core_cc_sm8650_clocks[] = {
+	[LPASS_CORE_CC_CORE_CLK] = &lpass_core_cc_core_clk.clkr,
+	[LPASS_CORE_CC_CORE_CLK_SRC] = &lpass_core_cc_core_clk_src.clkr,
+	[LPASS_CORE_CC_DIG_PLL] = &lpass_core_cc_dig_pll.clkr,
+	[LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC] =
+		&lpass_core_cc_dig_pll_out_main_div_clk_src.clkr,
+	[LPASS_CORE_CC_DIG_PLL_OUT_ODD] = &lpass_core_cc_dig_pll_out_odd.clkr,
+	[LPASS_CORE_CC_EXT_IF0_CLK_SRC] = &lpass_core_cc_ext_if0_clk_src.clkr,
+	[LPASS_CORE_CC_EXT_IF0_IBIT_CLK] = &lpass_core_cc_ext_if0_ibit_clk.clkr,
+	[LPASS_CORE_CC_EXT_IF1_CLK_SRC] = &lpass_core_cc_ext_if1_clk_src.clkr,
+	[LPASS_CORE_CC_EXT_IF1_IBIT_CLK] = &lpass_core_cc_ext_if1_ibit_clk.clkr,
+	[LPASS_CORE_CC_EXT_IF2_CLK_SRC] = &lpass_core_cc_ext_if2_clk_src.clkr,
+	[LPASS_CORE_CC_EXT_IF2_IBIT_CLK] = &lpass_core_cc_ext_if2_ibit_clk.clkr,
+	[LPASS_CORE_CC_LPM_CORE_CLK] = &lpass_core_cc_lpm_core_clk.clkr,
+	[LPASS_CORE_CC_LPM_MEM0_CORE_CLK] = &lpass_core_cc_lpm_mem0_core_clk.clkr,
+	[LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK] = &lpass_core_cc_sysnoc_mport_core_clk.clkr,
+	[LPASS_CORE_CC_EXT_MCLK0_CLK] = &lpass_core_cc_ext_mclk0_clk.clkr,
+	[LPASS_CORE_CC_EXT_MCLK0_CLK_SRC] = &lpass_core_cc_ext_mclk0_clk_src.clkr,
+};
+
+static const struct regmap_config lpass_core_cc_sm8650_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x56014,
+	.fast_io = true,
+};
+
+static struct clk_alpha_pll *lpass_core_cc_sm8650_plls[] = {
+	&lpass_core_cc_dig_pll,
+};
+
+static const struct qcom_cc_driver_data lpass_core_cc_sm8650_driver_data = {
+	.alpha_plls = lpass_core_cc_sm8650_plls,
+	.num_alpha_plls = ARRAY_SIZE(lpass_core_cc_sm8650_plls),
+};
+
+static const struct qcom_cc_desc lpass_core_cc_sm8650_desc = {
+	.config = &lpass_core_cc_sm8650_regmap_config,
+	.clks = lpass_core_cc_sm8650_clocks,
+	.num_clks = ARRAY_SIZE(lpass_core_cc_sm8650_clocks),
+	.driver_data = &lpass_core_cc_sm8650_driver_data,
+	.use_rpm = true,
+};
+
+static const struct of_device_id lpass_core_cc_sm8650_match_table[] = {
+	{ .compatible = "qcom,sm8650-lpasscorecc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_core_cc_sm8650_match_table);
+
+static struct gdsc *lpass_core_hm_sm8650_gdscs[] = {
+	[LPASS_CORE_HM_GDSC] = &lpass_core_cc_lpass_core_hm_gdsc,
+};
+
+static const struct regmap_config lpass_core_hm_sm8650_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9000,
+	.fast_io = true,
+};
+
+static const u32 lpass_core_hm_sm8650_critical_cbcrs[] = {
+	0x9000, /* LPASS_TOP_CC_LPASS_CORE_SWAY_AHB_LS */
+};
+
+static const struct qcom_cc_driver_data lpass_core_hm_sm8650_driver_data = {
+	.clk_cbcrs = lpass_core_hm_sm8650_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(lpass_core_hm_sm8650_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc lpass_core_hm_sm8650_desc = {
+	.config = &lpass_core_hm_sm8650_regmap_config,
+	.gdscs = lpass_core_hm_sm8650_gdscs,
+	.num_gdscs = ARRAY_SIZE(lpass_core_hm_sm8650_gdscs),
+	.driver_data = &lpass_core_hm_sm8650_driver_data,
+	.use_rpm = true,
+};
+
+static int lpass_core_cc_sm8650_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &lpass_core_cc_sm8650_desc);
+}
+
+static struct platform_driver lpass_core_cc_sm8650_driver = {
+	.probe = lpass_core_cc_sm8650_probe,
+	.driver = {
+		.name = "lpass_core_cc-sm8650",
+		.of_match_table = lpass_core_cc_sm8650_match_table,
+	},
+};
+
+static int lpass_hm_core_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &lpass_core_hm_sm8650_desc);
+}
+
+static const struct dev_pm_ops lpass_hm_sm8650_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static const struct of_device_id lpass_hm_sm8650_match_table[] = {
+	{ .compatible = "qcom,sm8650-lpasshm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_hm_sm8650_match_table);
+
+static struct platform_driver lpass_hm_sm8650_driver = {
+	.probe = lpass_hm_core_probe,
+	.driver = {
+		.name = "lpass_hm-sm8650",
+		.of_match_table = lpass_hm_sm8650_match_table,
+		.pm = &lpass_hm_sm8650_pm_ops,
+	},
+};
+
+static int __init lpass_core_cc_sm8650_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&lpass_hm_sm8650_driver);
+	if (ret)
+		return ret;
+
+	return platform_driver_register(&lpass_core_cc_sm8650_driver);
+}
+subsys_initcall(lpass_core_cc_sm8650_init);
+
+static void __exit lpass_core_cc_sm8650_exit(void)
+{
+	platform_driver_unregister(&lpass_core_cc_sm8650_driver);
+	platform_driver_unregister(&lpass_hm_sm8650_driver);
+}
+module_exit(lpass_core_cc_sm8650_exit);
+
+MODULE_DESCRIPTION("QTI LPASS_CORE_CC SM8650 Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

