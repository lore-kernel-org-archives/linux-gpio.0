Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3E0488D92;
	Fri, 21 Aug 2026 11:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312177; cv=none; b=S8PIvoG8NEkdvVUiJ7icQcMJaN3I3z7q2r67VGkYyjaWaM1B02xf9f/HGZs9pjr+sixRyKPvSViMJ5gHsDlJD/1zIUOLxDMZJk0g6SSYJWFIPIHGEWiNHvglSoCF48z7uuh8xd3gLL8rHDROCmcllmEjIbRhyP9WwvQQoJR4WxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312177; c=relaxed/simple;
	bh=WY9jWYAHOddR4Lm/nSrkyeTtEJPi6lCNU2RGG0Up8mI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=frfoMXEFIPnxpDCAnL0/oHUoaYg1JinyUtOo8SAjM2z5v61FVsgx+0hGdhi9hy1q/xLodXqWwUj8sfBxacXZW3X93W1pIbqTDtDMJUWgnqJ+KbI4pnYVoFmrGu90yse/jKPo2aeIRForJWXh3NmyzhSwz6qBwcSuo3GZG7fRobw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8HFpDT3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8HFpDT3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9Lx7x1570964;
	Fri, 21 Aug 2026 11:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aEN39II/nT9
	oOGAVx5Qg5AYjlRPHYy7dePiX8wY0cWg=; b=G8HFpDT30Te8enU9N8MbVvGIISU
	b1JyLHWAgMTqYoCKNUdSkvg92Hv3jDj1rZ0gbgW64MU1v5MxZ+2sc53miQAf8CMi
	OiRrYYOPN/i+APNVWKaHNlekZN10kBofvPb48CmsRo8BbGWjkYlGxejw9LECYQvD
	h2MgyI++DsTeIHlj7sGJTaShJLpDhWdWZOSBVYT3nR/7ht/5wV3iNx96XYGfUhQP
	G6DVMqS93NCvaig5nNj/Gif42WourrpMpju/Fb0Ix7i2RMtRto+KC9K6MdzO3PPw
	/FnjxewvfPEw3HXyywysjd799BZO/j4PFZkPxnujVQfupM7P+oOlPlnARcA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fue1djc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 11:36:06 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67LBa2L1029389;
	Fri, 21 Aug 2026 11:36:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4g2h6m45py-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 11:36:02 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67LBa1Ce029366;
	Fri, 21 Aug 2026 11:36:01 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 67LBa1We029358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 11:36:01 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id AA5AA641; Fri, 21 Aug 2026 17:06:00 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v7 2/2] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM
Date: Fri, 21 Aug 2026 17:05:48 +0530
Message-Id: <20260821113548.2686650-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821113548.2686650-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260821113548.2686650-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4NyBTYWx0ZWRfXzf694umfmJVH
 ENRMoYg0o05jcmc1rSAfPlpr7TlHrq0YsMqm0hlyKC6jrwV2nPZgg3er2Gse+d7Igtm1fcxlhKr
 8WBj1eRk05E9EekWnnEPFfmLrpg0wzE=
X-Authority-Analysis: v=2.4 cv=U9+iy+ru c=1 sm=1 tr=0 ts=6a883826 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=RGdtN6rq-GqljJF8V3QA:9
 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: rZhuNY7dYK_X5HMv63UHzt1DhtrJth1a
X-Proofpoint-ORIG-GUID: rZhuNY7dYK_X5HMv63UHzt1DhtrJth1a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4NyBTYWx0ZWRfX2K3YUQwRJpZ7
 ppAydEwyE4OouW0bhujwD5/MUAHNTUQB5F330CCRMXa3Ek3Kflq0T2x2lxFTba5FSd2ub6nx0GN
 7FGSiXIp4nKETDrVO5q9agxEpjMuiKkXbXXaDdgzQKm2Z01GkBbjOb/shUGCcGfPROHbctORvsd
 5GqQr8V6BFJmrraCNv6d1BNCDiQn5GZTZm1cL+RFn6C3ZmWrajxpGMyA+llrA3Sibx9oNZ2Nr9L
 vpUK/Tq8dxvbjfBwcaceizZCYDnzgBcGO8/7TplWc565yScQVOPVr0xtwjzb0v5Hh4Av4KK8rtG
 ADiwtzuA1QzprKukX/MSuA0dbEljwLU5AK9w533W/NHTfVWyYwbh+o6bhPS3vUpGxVr7lSjKJM2
 u49gMCv/q1ajUm7ig8jLr4ZWRWJn+PYw6nQVRdbO433m9ZPc0WlAuZFckIcfOuw0PyB1jUyH8fI
 GVdxHNVSKVH0omxCepg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210087

Add pin controller driver for the Low Power Audio SubSystem (LPASS)
Low Power Island (LPI) of Qualcomm Hawi SoC.

The controller has 23 GPIOs with SoundWire, I2S, DMIC, VA I2S,
ext_mclk1 and slimbus mux functions.

Two pins (gpio13, gpio22) require 6 mux slots due to a test_bus
entry occupying a middle hardware slot. Add LPI_PINGROUP6 macro
to pinctrl-lpass-lpi.h to support pins with 5 alternate functions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig                  |  10 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c | 244 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h      |  17 ++
 4 files changed, 272 insertions(+)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 18db350222b9..707067b9251f 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -62,6 +62,16 @@ config PINCTRL_LPASS_LPI
 	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
 
+config PINCTRL_HAWI_LPASS_LPI
+	tristate "Qualcomm Technologies Inc Hawi LPASS LPI pin controller driver"
+	depends on ARM64 || COMPILE_TEST
+	depends on PINCTRL_LPASS_LPI
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
+	  (Low Power Island) found on the Qualcomm Technologies Inc Hawi
+	  platform.
+
 config PINCTRL_MILOS_LPASS_LPI
 	tristate "Qualcomm Milos LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 43ecd246afe8..987a79f9d4c4 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_PINCTRL_APQ8084)	+= pinctrl-apq8084.o
 obj-$(CONFIG_PINCTRL_ELIZA)	+= pinctrl-eliza.o
 obj-$(CONFIG_PINCTRL_GLYMUR)	+= pinctrl-glymur.o
 obj-$(CONFIG_PINCTRL_HAWI)	+= pinctrl-hawi.o
+obj-$(CONFIG_PINCTRL_HAWI_LPASS_LPI) += pinctrl-hawi-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_IPQ4019)	+= pinctrl-ipq4019.o
 obj-$(CONFIG_PINCTRL_IPQ5018)	+= pinctrl-ipq5018.o
 obj-$(CONFIG_PINCTRL_IPQ8064)	+= pinctrl-ipq8064.o
diff --git a/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
new file mode 100644
index 000000000000..7036bf4c6692
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+
+#include "pinctrl-lpass-lpi.h"
+
+enum lpass_lpi_functions {
+	LPI_MUX_dmic1_clk,
+	LPI_MUX_dmic1_data,
+	LPI_MUX_dmic2_clk,
+	LPI_MUX_dmic2_data,
+	LPI_MUX_dmic3_clk,
+	LPI_MUX_dmic3_data,
+	LPI_MUX_dmic4_clk,
+	LPI_MUX_dmic4_data,
+	LPI_MUX_ext_mclk1_a,
+	LPI_MUX_ext_mclk1_b,
+	LPI_MUX_ext_mclk1_c,
+	LPI_MUX_ext_mclk1_d,
+	LPI_MUX_ext_mclk1_e,
+	LPI_MUX_i2s0_clk,
+	LPI_MUX_i2s0_data,
+	LPI_MUX_i2s0_ws,
+	LPI_MUX_i2s1_clk,
+	LPI_MUX_i2s1_data,
+	LPI_MUX_i2s1_ws,
+	LPI_MUX_i2s2_clk,
+	LPI_MUX_i2s2_data,
+	LPI_MUX_i2s2_ws,
+	LPI_MUX_i2s3_clk,
+	LPI_MUX_i2s3_data,
+	LPI_MUX_i2s3_ws,
+	LPI_MUX_lpass_lpi_dbg_clk,
+	LPI_MUX_qca_swr_clk,
+	LPI_MUX_qca_swr_data,
+	LPI_MUX_slimbus_clk,
+	LPI_MUX_slimbus_data,
+	LPI_MUX_swr_rx_clk,
+	LPI_MUX_swr_rx_data,
+	LPI_MUX_swr_tx_clk,
+	LPI_MUX_swr_tx_clk1,
+	LPI_MUX_swr_tx_data,
+	LPI_MUX_va_i2s0_clk,
+	LPI_MUX_va_i2s0_data,
+	LPI_MUX_va_i2s0_ws,
+	LPI_MUX_wsa2_swr_clk,
+	LPI_MUX_wsa2_swr_data,
+	LPI_MUX_wsa_swr_clk,
+	LPI_MUX_wsa_swr_data,
+	LPI_MUX_gpio,
+	LPI_MUX__,
+};
+
+static const struct pinctrl_pin_desc hawi_lpi_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	PINCTRL_PIN(2, "gpio2"),
+	PINCTRL_PIN(3, "gpio3"),
+	PINCTRL_PIN(4, "gpio4"),
+	PINCTRL_PIN(5, "gpio5"),
+	PINCTRL_PIN(6, "gpio6"),
+	PINCTRL_PIN(7, "gpio7"),
+	PINCTRL_PIN(8, "gpio8"),
+	PINCTRL_PIN(9, "gpio9"),
+	PINCTRL_PIN(10, "gpio10"),
+	PINCTRL_PIN(11, "gpio11"),
+	PINCTRL_PIN(12, "gpio12"),
+	PINCTRL_PIN(13, "gpio13"),
+	PINCTRL_PIN(14, "gpio14"),
+	PINCTRL_PIN(15, "gpio15"),
+	PINCTRL_PIN(16, "gpio16"),
+	PINCTRL_PIN(17, "gpio17"),
+	PINCTRL_PIN(18, "gpio18"),
+	PINCTRL_PIN(19, "gpio19"),
+	PINCTRL_PIN(20, "gpio20"),
+	PINCTRL_PIN(21, "gpio21"),
+	PINCTRL_PIN(22, "gpio22"),
+};
+
+static const char * const gpio_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7",
+	"gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio14",
+	"gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21",
+	"gpio22",
+};
+
+static const char * const swr_tx_clk_groups[] = { "gpio0" };
+static const char * const i2s0_clk_groups[] = { "gpio0" };
+static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio14" };
+static const char * const i2s0_ws_groups[] = { "gpio1" };
+static const char * const swr_rx_clk_groups[] = { "gpio3" };
+static const char * const i2s0_data_groups[] = { "gpio2", "gpio3", "gpio4", "gpio5" };
+static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
+static const char * const ext_mclk1_c_groups[] = { "gpio5" };
+static const char * const dmic1_clk_groups[] = { "gpio6" };
+static const char * const va_i2s0_clk_groups[] = { "gpio6" };
+static const char * const dmic1_data_groups[] = { "gpio7" };
+static const char * const va_i2s0_ws_groups[] = { "gpio7" };
+static const char * const dmic2_clk_groups[] = { "gpio8" };
+static const char * const va_i2s0_data_groups[] = { "gpio8", "gpio9" };
+static const char * const dmic2_data_groups[] = { "gpio9" };
+static const char * const ext_mclk1_b_groups[] = { "gpio9" };
+static const char * const i2s1_clk_groups[] = { "gpio10" };
+static const char * const wsa_swr_clk_groups[] = { "gpio10" };
+static const char * const i2s1_ws_groups[] = { "gpio11" };
+static const char * const wsa_swr_data_groups[] = { "gpio11", "gpio21" };
+static const char * const dmic3_clk_groups[] = { "gpio12" };
+static const char * const i2s3_clk_groups[] = { "gpio12" };
+static const char * const dmic3_data_groups[] = { "gpio13" };
+static const char * const i2s3_ws_groups[] = { "gpio13" };
+static const char * const ext_mclk1_a_groups[] = { "gpio13" };
+static const char * const lpass_lpi_dbg_clk_groups[] = { "gpio13" };
+static const char * const swr_tx_clk1_groups[] = { "gpio14" };
+static const char * const ext_mclk1_d_groups[] = { "gpio14" };
+static const char * const i2s1_data_groups[] = { "gpio15", "gpio16", "gpio21", "gpio22" };
+static const char * const wsa2_swr_clk_groups[] = { "gpio15" };
+static const char * const wsa2_swr_data_groups[] = { "gpio16", "gpio22" };
+static const char * const dmic4_clk_groups[] = { "gpio17" };
+static const char * const i2s3_data_groups[] = { "gpio17", "gpio18" };
+static const char * const dmic4_data_groups[] = { "gpio18" };
+static const char * const i2s2_clk_groups[] = { "gpio19" };
+static const char * const slimbus_clk_groups[] = { "gpio19" };
+static const char * const qca_swr_clk_groups[] = { "gpio19" };
+static const char * const i2s2_ws_groups[] = { "gpio20" };
+static const char * const slimbus_data_groups[] = { "gpio20" };
+static const char * const qca_swr_data_groups[] = { "gpio20" };
+static const char * const i2s2_data_groups[] = { "gpio21", "gpio22" };
+static const char * const ext_mclk1_e_groups[] = { "gpio22" };
+
+static const struct lpi_pingroup hawi_groups[] = {
+	LPI_PINGROUP(0, 11, swr_tx_clk, i2s0_clk, _, _),
+	LPI_PINGROUP(1, 11, swr_tx_data, i2s0_ws, _, _),
+	LPI_PINGROUP(2, 11, swr_tx_data, i2s0_data, _, _),
+	LPI_PINGROUP(3, 11, swr_rx_clk, i2s0_data, _, _),
+	LPI_PINGROUP(4, 11, swr_rx_data, i2s0_data, _, _),
+	LPI_PINGROUP(5, 11, swr_rx_data, ext_mclk1_c, i2s0_data, _),
+	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, va_i2s0_clk, _, _),
+	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, va_i2s0_ws, _, _),
+	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, va_i2s0_data, _, _),
+	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, va_i2s0_data, ext_mclk1_b, _),
+	LPI_PINGROUP(10, 11, i2s1_clk, wsa_swr_clk, _, _),
+	LPI_PINGROUP(11, 11, i2s1_ws, wsa_swr_data, _, _),
+	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s3_clk, _, _),
+	LPI_PINGROUP6(13, LPI_NO_SLEW, dmic3_data, i2s3_ws, ext_mclk1_a, _, lpass_lpi_dbg_clk),
+	LPI_PINGROUP(14, 11, swr_tx_data, swr_tx_clk1, ext_mclk1_d, _),
+	LPI_PINGROUP(15, 11, i2s1_data, wsa2_swr_clk, _, _),
+	LPI_PINGROUP(16, 11, i2s1_data, wsa2_swr_data, _, _),
+	LPI_PINGROUP(17, LPI_NO_SLEW, dmic4_clk, i2s3_data, _, _),
+	LPI_PINGROUP(18, LPI_NO_SLEW, dmic4_data, i2s3_data, _, _),
+	LPI_PINGROUP(19, LPI_NO_SLEW, i2s2_clk, slimbus_clk, qca_swr_clk, _),
+	LPI_PINGROUP(20, LPI_NO_SLEW, i2s2_ws, slimbus_data, qca_swr_data, _),
+	LPI_PINGROUP(21, 11, i2s2_data, _, wsa_swr_data, i2s1_data),
+	LPI_PINGROUP6(22, 11, i2s2_data, ext_mclk1_e, _, i2s1_data, wsa2_swr_data),
+};
+
+static const struct lpi_function hawi_functions[] = {
+	LPI_FUNCTION(gpio),
+	LPI_FUNCTION(dmic1_clk),
+	LPI_FUNCTION(dmic1_data),
+	LPI_FUNCTION(dmic2_clk),
+	LPI_FUNCTION(dmic2_data),
+	LPI_FUNCTION(dmic3_clk),
+	LPI_FUNCTION(dmic3_data),
+	LPI_FUNCTION(dmic4_clk),
+	LPI_FUNCTION(dmic4_data),
+	LPI_FUNCTION(ext_mclk1_a),
+	LPI_FUNCTION(ext_mclk1_b),
+	LPI_FUNCTION(ext_mclk1_c),
+	LPI_FUNCTION(ext_mclk1_d),
+	LPI_FUNCTION(ext_mclk1_e),
+	LPI_FUNCTION(i2s0_clk),
+	LPI_FUNCTION(i2s0_data),
+	LPI_FUNCTION(i2s0_ws),
+	LPI_FUNCTION(i2s1_clk),
+	LPI_FUNCTION(i2s1_data),
+	LPI_FUNCTION(i2s1_ws),
+	LPI_FUNCTION(i2s2_clk),
+	LPI_FUNCTION(i2s2_data),
+	LPI_FUNCTION(i2s2_ws),
+	LPI_FUNCTION(i2s3_clk),
+	LPI_FUNCTION(i2s3_data),
+	LPI_FUNCTION(i2s3_ws),
+	LPI_FUNCTION(lpass_lpi_dbg_clk),
+	LPI_FUNCTION(qca_swr_clk),
+	LPI_FUNCTION(qca_swr_data),
+	LPI_FUNCTION(slimbus_clk),
+	LPI_FUNCTION(slimbus_data),
+	LPI_FUNCTION(swr_rx_clk),
+	LPI_FUNCTION(swr_rx_data),
+	LPI_FUNCTION(swr_tx_clk),
+	LPI_FUNCTION(swr_tx_clk1),
+	LPI_FUNCTION(swr_tx_data),
+	LPI_FUNCTION(va_i2s0_clk),
+	LPI_FUNCTION(va_i2s0_data),
+	LPI_FUNCTION(va_i2s0_ws),
+	LPI_FUNCTION(wsa2_swr_clk),
+	LPI_FUNCTION(wsa2_swr_data),
+	LPI_FUNCTION(wsa_swr_clk),
+	LPI_FUNCTION(wsa_swr_data),
+};
+
+static const struct lpi_pinctrl_variant_data hawi_lpi_data = {
+	.pins = hawi_lpi_pins,
+	.npins = ARRAY_SIZE(hawi_lpi_pins),
+	.groups = hawi_groups,
+	.ngroups = ARRAY_SIZE(hawi_groups),
+	.functions = hawi_functions,
+	.nfunctions = ARRAY_SIZE(hawi_functions),
+	.flags = LPI_FLAG_SLEW_RATE_SAME_REG,
+};
+
+static const struct of_device_id lpi_pinctrl_of_match[] = {
+	{
+		.compatible = "qcom,hawi-lpass-lpi-pinctrl",
+		.data = &hawi_lpi_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
+
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static struct platform_driver lpi_pinctrl_driver = {
+	.driver = {
+		.name = "qcom-hawi-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
+	},
+	.probe = lpi_pinctrl_probe,
+	.remove = lpi_pinctrl_remove,
+};
+
+module_platform_driver(lpi_pinctrl_driver);
+MODULE_DESCRIPTION("Qualcomm Hawi LPI GPIO pin control driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
index 6ba0c4eba984..056c4a774389 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
@@ -92,6 +92,23 @@ struct pinctrl_pin_desc;
 		.pin_offset = 0,				\
 	}
 
+#define LPI_PINGROUP6(id, soff, f1, f2, f3, f4, f5)		\
+	{							\
+		.pin = id,					\
+		.slew_offset = soff,				\
+		.slew_base_spare_1 = false,			\
+		.funcs = (int[]){				\
+			LPI_MUX_gpio,				\
+			LPI_MUX_##f1,				\
+			LPI_MUX_##f2,				\
+			LPI_MUX_##f3,				\
+			LPI_MUX_##f4,				\
+			LPI_MUX_##f5,				\
+		},						\
+		.nfuncs = 6,					\
+		.pin_offset = 0,				\
+	}
+
 /*
  * Slew rate control is done in the same register as rest of the
  * pin configuration.
-- 
2.34.1

