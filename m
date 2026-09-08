Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC5B3A544F;
	Tue,  8 Sep 2026 07:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854348; cv=none; b=a15Jtd1sMuPr79U3xGIZP3iKlW/vu4SST1zjX4GLHPplgvv2zWt+OkqVAuZKdS8b6bfOcWPOBsYcV3rgcn8H1eCMkUoDUM2GfKWknJDV5T6ofGYTSsDYkc+HhnTWsBz4WaaeUXUFCpoByUTIcMqN4mym6ZBjG235Y8Uoz6eJ+70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854348; c=relaxed/simple;
	bh=0aqcnCWUdmZY44pQzdUErGS0swZFAPzeyG3z328POLA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nULUgsIaIenrW861XpydPwKs2boBJFCaDQe8XZFrHoiAlCTBrMEiiVjv/Iem8CF77atcDoPVEiYWPQ2hnfNX44kIu8DAbVUjbiGiIXmXWa0TKCcSeowh1eU3c2VFR4FDyul3gO0ESOmyT1yb6Qt5HuMTHy9S0+56Y8zxN7JJ5Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSYQ6MoI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GSYQ6MoI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M24B2363249;
	Tue, 8 Sep 2026 07:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K0ynUCjfhcY
	ovbS41QcrP/TSCqHAw3ZA4kyHddxm0Zo=; b=GSYQ6MoIRS+vdyC/NMlcTdoc7ZW
	eRoz6IgBVGTcwIaYEf0JJCoOskAiRdF0/m0Avez7P9NRl9Xc/0gIhyqpEwViV85K
	RAD8VZxKvXHkaPfGANt8RHxJsGK+VvJf/8Ae7X0mwDKLcMXGt2B5ZynCpmoktcnd
	ZZLvbuuZqVm7IK/g15E+muOFANk1lCkvGg8HckWCtamtQVnnHl47bMG6gw1C+Rb2
	JC0eCaxkksoZPtD8rHZksm+pYXLfbnY6lC7yqCWmvzEoiqhsBAjGTHDCBE6vfWNf
	D6YO4I3Wb6ghd+zoh6j/MbbvyslUF6V15JkMccTttDvOEK87+kWDele8/Kw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjagugxbu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 07:59:03 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6887x0OI1372074;
	Tue, 8 Sep 2026 07:59:00 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6887x0MC1372065
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 07:59:00 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 700A9667; Tue,  8 Sep 2026 13:28:59 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Karthik S <karthik.s@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver
Date: Tue,  8 Sep 2026 13:28:54 +0530
Message-Id: <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
References: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6a9fc047 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=Nest-PfZTQrkbpmWNFYA:9
 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: xnVU_DJzBbJs_V1xAyR0iJz1QCMQyo1V
X-Proofpoint-ORIG-GUID: xnVU_DJzBbJs_V1xAyR0iJz1QCMQyo1V
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX7/ehvFQzqAGg
 Fb7WkajXAoDywmHiugRovanrcSJuowHq1OdCz3wjGEvFkacy8xNCkuZxKcmryR0+/qV+aFQUh75
 +Qv/UsT8SsZgeflLFfVtFavuNK2Qgck=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX62RoMKNWSABr
 gsjp/y0Jab00mdY2o4JR5/4Dnb0+9abj/djYle20xaASTMPs2ba+VgBAjBkXQwoAVlI+ahVMmId
 kYEjMs4G2fBRF4+3cedP/gwRdof4KNGfgiBreYHsdeOvu/eWp/UYUPIUq1Y1ekqIR8OsIVIkb9D
 n9WcnPwgYWtYkWtYAi1nStVg1kpOu+48Oq1ps5PAm7teIFdCd0iBLBjzey8lY7MIsj4g+UzbOtZ
 K0yqs0qfHzJZXmbKnBUdFQ+k5wV19ApopYx+LMTHbROi3LcEmPZJcqQh1SvezV4impkkcPrIpZM
 Jn4sYC7uR35RNdxrX/wfBsXm4Cujtw8BY+EBJEsT/0PAgHKG5o5EMpNurOzZnWCjcdfEn1R/YF2
 /jTRBvKUL2uCvclyKuBO9qkAf96lDrqN+/Mb+l3PuWmUUd5HlzfX45vme2QNo2YKAZ9m0wxg94g
 2hH7P2YGgAS6NF6xNVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080082

Add pinctrl driver to support pin configuration for LPASS
(Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
on QCS615.

This IP is an additional pin control block for Audio Pins on top the
existing SoC Top level pin-controller.

This pin controller has some similarities compared to Top level
msm SoC Pin controller like 'each pin belongs to a single group'
and so on. However this one is intended to control only audio
pins in particular, which can not be configured/touched by the
Top level SoC pin controller except setting them as gpios.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig                  |   1 +
 drivers/pinctrl/qcom/Kconfig                  |  10 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c   | 185 ++++++++++++++++++
 4 files changed, 197 insertions(+)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..80423678fe25 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -700,6 +700,7 @@ CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
+CONFIG_PINCTRL_QCS615_LPASS_LPI=m
 CONFIG_PINCTRL_MILOS_LPASS_LPI=m
 CONFIG_PINCTRL_SC7280_LPASS_LPI=m
 CONFIG_PINCTRL_SM6115_LPASS_LPI=m
diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 18db350222b9..9cef5fccae3f 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -62,6 +62,16 @@ config PINCTRL_LPASS_LPI
 	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
 
+config PINCTRL_QCS615_LPASS_LPI
+       tristate "Qualcomm Technologies Inc QCS615 LPASS LPI pin controller driver"
+       depends on ARM64 || COMPILE_TEST
+       depends on PINCTRL_LPASS_LPI
+       help
+         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+         Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
+         (Low Power Island) found on the Qualcomm Technologies Inc QCS615
+         platform.
+
 config PINCTRL_MILOS_LPASS_LPI
 	tristate "Qualcomm Milos LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 43ecd246afe8..de2c9bdfbad2 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_PINCTRL_MSM8998)   += pinctrl-msm8998.o
 obj-$(CONFIG_PINCTRL_QCM2290)	+= pinctrl-qcm2290.o
 obj-$(CONFIG_PINCTRL_QCS404)	+= pinctrl-qcs404.o
 obj-$(CONFIG_PINCTRL_QCS615)    += pinctrl-qcs615.o
+obj-$(CONFIG_PINCTRL_QCS615_LPASS_LPI) += pinctrl-qcs615-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_QCS8300)	+= pinctrl-qcs8300.o
 obj-$(CONFIG_PINCTRL_QDF2XXX)	+= pinctrl-qdf2xxx.o
 obj-$(CONFIG_PINCTRL_MDM9607)	+= pinctrl-mdm9607.o
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c
new file mode 100644
index 000000000000..78c8e7670c38
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * ALSA SoC platform-machine driver for QTi LPASS
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
+	LPI_MUX_i2s1_clk,
+	LPI_MUX_i2s1_ws,
+	LPI_MUX_i2s1_data,
+	LPI_MUX_spkr_i2s_mclk_a,
+	LPI_MUX_dmic1_clk,
+	LPI_MUX_dmic1_data,
+	LPI_MUX_dmic2_clk,
+	LPI_MUX_dmic2_data,
+	LPI_MUX_gpio,
+	LPI_MUX__,
+};
+
+static int gpio8_pins[] = { 8 };
+static int gpio9_pins[] = { 9 };
+static int gpio10_pins[] = { 10 };
+static int gpio11_pins[] = { 11 };
+static int gpio19_pins[] = { 19 };
+static int gpio26_pins[] = { 26 };
+static int gpio27_pins[] = { 27 };
+static int gpio28_pins[] = { 28 };
+static int gpio29_pins[] = { 29 };
+static int gpio0_pins[] = { 0 };
+static int gpio1_pins[] = { 1 };
+static int gpio2_pins[] = { 2 };
+static int gpio3_pins[] = { 3 };
+static int gpio4_pins[] = { 4 };
+static int gpio5_pins[] = { 5 };
+static int gpio6_pins[] = { 6 };
+static int gpio7_pins[] = { 7 };
+static int gpio12_pins[] = { 12 };
+static int gpio13_pins[] = { 13 };
+static int gpio14_pins[] = { 14 };
+static int gpio15_pins[] = { 15 };
+static int gpio16_pins[] = { 16 };
+static int gpio17_pins[] = { 17 };
+static int gpio18_pins[] = { 18 };
+static int gpio20_pins[] = { 20 };
+static int gpio21_pins[] = { 21 };
+static int gpio22_pins[] = { 22 };
+static int gpio23_pins[] = { 23 };
+static int gpio24_pins[] = { 24 };
+static int gpio25_pins[] = { 25 };
+static int gpio30_pins[] = { 30 };
+static int gpio31_pins[] = { 31 };
+
+static const struct pinctrl_pin_desc qcs615_lpi_pins[] = {
+	PINCTRL_PIN(0,  "gpio0"),
+	PINCTRL_PIN(1,  "gpio1"),
+	PINCTRL_PIN(2,  "gpio2"),
+	PINCTRL_PIN(3,  "gpio3"),
+	PINCTRL_PIN(4,  "gpio4"),
+	PINCTRL_PIN(5,  "gpio5"),
+	PINCTRL_PIN(6,  "gpio6"),
+	PINCTRL_PIN(7,  "gpio7"),
+	PINCTRL_PIN(8,  "gpio8"),
+	PINCTRL_PIN(9,  "gpio9"),
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
+	PINCTRL_PIN(23, "gpio23"),
+	PINCTRL_PIN(24, "gpio24"),
+	PINCTRL_PIN(25, "gpio25"),
+	PINCTRL_PIN(26, "gpio26"),
+	PINCTRL_PIN(27, "gpio27"),
+	PINCTRL_PIN(28, "gpio28"),
+	PINCTRL_PIN(29, "gpio29"),
+	PINCTRL_PIN(30, "gpio30"),
+	PINCTRL_PIN(31, "gpio31"),
+};
+
+static const char * const i2s1_clk_groups[] = { "gpio8" };
+static const char * const i2s1_ws_groups[] = { "gpio9" };
+static const char * const i2s1_data_groups[] = { "gpio10", "gpio11" };
+static const char * const spkr_i2s_mclk_a_groups[] = { "gpio19" };
+static const char * const dmic1_clk_groups[] = { "gpio26" };
+static const char * const dmic1_data_groups[] = { "gpio27" };
+static const char * const dmic2_clk_groups[] = { "gpio28" };
+static const char * const dmic2_data_groups[] = { "gpio29" };
+
+static const struct lpi_pingroup qcs615_groups[] = {
+	LPI_PINGROUP(0,  LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(1,  LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(2,  LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(3,  LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(4,  LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(5,  LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(6,  LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(7,  LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(8,  LPI_NO_SLEW, _, _, i2s1_clk, _),
+	LPI_PINGROUP(9,  LPI_NO_SLEW, _, _, i2s1_ws, _),
+	LPI_PINGROUP(10, LPI_NO_SLEW, _, _, _, i2s1_data),
+	LPI_PINGROUP(11, LPI_NO_SLEW, _, i2s1_data, _, _),
+	LPI_PINGROUP(12, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(13, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(14, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(15, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(16, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(18, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(19, LPI_NO_SLEW, spkr_i2s_mclk_a, _, _, _),
+	LPI_PINGROUP(20, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(21, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(22, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(23, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(24, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(25, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(26, LPI_NO_SLEW, dmic1_clk, _, _, _),
+	LPI_PINGROUP(27, LPI_NO_SLEW, dmic1_data, _, _, _),
+	LPI_PINGROUP(28, LPI_NO_SLEW, dmic2_clk, _, _, _),
+	LPI_PINGROUP(29, LPI_NO_SLEW, dmic2_data, _, _, _),
+	LPI_PINGROUP(30, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(31, LPI_NO_SLEW, _, _, _, _),
+};
+
+static const struct lpi_function qcs615_functions[] = {
+	LPI_FUNCTION(i2s1_clk),
+	LPI_FUNCTION(i2s1_ws),
+	LPI_FUNCTION(i2s1_data),
+	LPI_FUNCTION(spkr_i2s_mclk_a),
+	LPI_FUNCTION(dmic1_clk),
+	LPI_FUNCTION(dmic1_data),
+	LPI_FUNCTION(dmic2_clk),
+	LPI_FUNCTION(dmic2_data),
+};
+
+static const struct lpi_pinctrl_variant_data qcs615_lpi_data = {
+	.pins = qcs615_lpi_pins,
+	.npins = ARRAY_SIZE(qcs615_lpi_pins),
+	.groups = qcs615_groups,
+	.ngroups = ARRAY_SIZE(qcs615_groups),
+	.functions = qcs615_functions,
+	.nfunctions = ARRAY_SIZE(qcs615_functions),
+};
+
+static const struct of_device_id lpi_pinctrl_of_match[] = {
+	{
+	       .compatible = "qcom,qcs615-lpass-lpi-pinctrl",
+	       .data = &qcs615_lpi_data,
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
+		   .name = "qcom-qcs615-lpass-lpi-pinctrl",
+		   .of_match_table = lpi_pinctrl_of_match,
+		   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
+	},
+	.probe = lpi_pinctrl_probe,
+	.remove = lpi_pinctrl_remove,
+};
+
+module_platform_driver(lpi_pinctrl_driver);
+MODULE_DESCRIPTION("QTI QCS615 LPI GPIO pin control driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

