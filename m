Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901871;
	b=BFVw6SMHeDBtsOSgvNAF9NogZvsnLx1g7VNP2Jky5c6FOcDB4SyzxaVxIMGzRrELuRzt
	 3doiyUderDn2o9WvywjeSLp9WMynwt7/gsm7C3fjDNRaQG7BZAEPc15mYrzmHv+bAO7oY
	 +wA137n027YMAD323Lk6+F2aMp91h5mQzV6bg3yCmioogwMLyUai7L0zSFclCd5Lkfkoa
	 T8HZP6CgT0w9Y96enzD8sMaZz3jUFQy4Tzzg8p/UtntfSionDgZCRWbjqY5jMDRhetUse
	 iKi9ZIy7vEJ8RYimOEt7BP3QtMhloHwyf0Xq2jcN+ouaxKo8UXB3y8OnTLUJo98LEwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZU2IdOr5QYHmLIl7sOOQA/3Yv5So0+Ot3ic+14mKGm8=;
	b=IKShnrvl2paX+PpX8k/A+yuY+qS6fYAqDbdekIAB8si/dUhbRCzSjvHTcCQQ1unI48UW
	 ruqCDbRDJW2qmIII3O7BLdLBrHwJHJFChM0TlW0Eem21NXlHg8jHXlgOBj/5VKDeSZ+c9
	 tr53xNFM0mDNFs7VBQxaQbA6GYp+iEWw1tiHylPffeunbnghnhCIcJLy9srivE0DycJhf
	 XplE5TYxqUvQgIJGRdtTjRngFV4PjzRn8oa5TOo8TYp28BmvqH3E4nBSjIYxI+mMGhxu9
	 syyqnB+HTdQeHU/dlZ1p7VcMggQuP6LuM5YUkjfbQuGp8WE439qA5jAtvzh8d4PTSuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UVjaLtCg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F96C606A323;
	Tue, 17 Nov 2026 07:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F96C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UVjaLtCg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2a6JJ3407493;
	Tue, 17 Nov 2026 07:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZU2IdOr5QYH
	mLIl7sOOQA/3Yv5So0+Ot3ic+14mKGm8=; b=UVjaLtCgQ/3gdKDdcUEKHS7RPG/
	czlNqD3hkYNYgTxjVOJsAM6QZfK/EtdRVX5mW6Ko9ujE6XW31QuLNSSSuDEED3BY
	EaqU/Lb7uz36XL+YNf+k5Y57Qc/r2Hm/wILeOtv+ElB/7c9dviVMFZNE7ptiVw5o
	59depfU6QBq4c6dUBZrtunRIzOPFiUGSYorzTIH1+ZhiENSWjjG9xh0qrPqpFQsE
	JaRsm6iWgLslAK14dDonZT4O1hVIin2KfpM9e6K+Ll+ZQpI3BvqMYYNqJ2ousKLz
	/jh7lXnk79V7zizp3Go2Mvoay9TvgeE6WODeeovGBSUjum5jAYAryj4/QmQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09hthywt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 07:51:08 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH7p6GD2335665;
	Tue, 17 Nov 2026 07:51:06 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AH7p5432335656
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 07:51:06 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id A0E9C5F8; Tue, 17 Nov 2026 13:21:04 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Karthik S <karthik.s@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver
Date: Tue, 17 Nov 2026 13:20:59 +0530
Message-Id: <20261117075100.272535-3-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117075100.272535-1-karthik.s@oss.qualcomm.com>
References: <20261117075100.272535-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMSBTYWx0ZWRfX5uAtXUbgB51P
 j5Zrv8O5nbfH0GyAxM15Hjv3xmfDXUTQYk/WJIjEsFeatuFbuJw9oaVJ+Tq+zAA0D73LMcIFS5p
 rTOSx5tPkf9Rx7MgH6y7YIS2bPESaoQ=
X-Proofpoint-ORIG-GUID: yunsG0wsas9G4P0jfkSu4nly2NeJPwsx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMSBTYWx0ZWRfXweHn12etezBr
 S/Mj6DvmEPZKhI1RS/refmj/wmXLu5WrqWQ0gi1jusEAFnfW3mYhpfU5q9RqApJ8hsARxzCKmqk
 lcruGEuP9Pql0UXilVVWSTP3po6IjLv6TodNFhPIeWnN9oU4ZZWueY22ZXbBCy8FsaztjB2aL1P
 i+Y0VPGopzxoQYiokxPEgHKl8idHBAPdDjZX/MbDHpMVsMHZPkby2aU2ZBDW3hq9OMw6mLWctBs
 y9Nq0VG5UyEn2iE48ETGlzMqnKR5tDvYRpGkqckK+EgwiCWDfezhNOoSLNBzvThIZ+Ds8FM9bOl
 EBUFUvd+qLc6SeO5PBRIbezyJ/IdjlAMJvoDmCVL4BYpXDKZ2fz5IX7HtrBAOP3/CcZCUY7DGVy
 vhxKddCMYbKIFpKZnw7zaTgaXyoFEj9NNRQTgwLoixKn5brGyuRqvzqQGBXBE8ZyKpGqMgNowZ7
 XbzUHe7oWZ9ezkDD0/g==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afc076d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=Nzfv_0lDyK50x_oVsYMA:9
 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: yunsG0wsas9G4P0jfkSu4nly2NeJPwsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170031

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
 drivers/pinctrl/qcom/Kconfig                  |  10 ++
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c   | 161 ++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 707067b9251f..abe7155f209f 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -72,6 +72,16 @@ config PINCTRL_HAWI_LPASS_LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc Hawi
 	  platform.
 
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
index a3daca77a448..32d1b1bd53de 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_PINCTRL_MSM8998)   += pinctrl-msm8998.o
 obj-$(CONFIG_PINCTRL_QCM2290)	+= pinctrl-qcm2290.o
 obj-$(CONFIG_PINCTRL_QCS404)	+= pinctrl-qcs404.o
 obj-$(CONFIG_PINCTRL_QCS615)    += pinctrl-qcs615.o
+obj-$(CONFIG_PINCTRL_QCS615_LPASS_LPI) += pinctrl-qcs615-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_QCS8300)	+= pinctrl-qcs8300.o
 obj-$(CONFIG_PINCTRL_QDF2XXX)	+= pinctrl-qdf2xxx.o
 obj-$(CONFIG_PINCTRL_MDM9607)	+= pinctrl-mdm9607.o
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c
new file mode 100644
index 000000000000..dc348dcca9f0
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c
@@ -0,0 +1,161 @@
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
+	LPI_MUX_i2s2_clk,
+	LPI_MUX_i2s2_ws,
+	LPI_MUX_i2s2_data,
+	LPI_MUX_dmic1_clk,
+	LPI_MUX_dmic1_data,
+	LPI_MUX_dmic2_clk,
+	LPI_MUX_dmic2_data,
+	LPI_MUX_gpio,
+	LPI_MUX__,
+};
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
+static const char * const i2s2_clk_groups[] = { "gpio23" };
+static const char * const i2s2_ws_groups[] = { "gpio24" };
+static const char * const i2s2_data_groups[] = { "gpio25", "gpio26", "gpio27", "gpio28" };
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
+	LPI_PINGROUP(23, LPI_NO_SLEW, _, _, i2s2_clk, _),
+	LPI_PINGROUP(24, LPI_NO_SLEW, i2s2_ws, _, _, _),
+	LPI_PINGROUP(25, LPI_NO_SLEW, i2s2_data, _, _, _),
+	LPI_PINGROUP(26, LPI_NO_SLEW, dmic1_clk, i2s2_data, _, _),
+	LPI_PINGROUP(27, LPI_NO_SLEW, dmic1_data, i2s2_data, _, _),
+	LPI_PINGROUP(28, LPI_NO_SLEW, dmic2_clk, i2s2_data, _, _),
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
+	LPI_FUNCTION(i2s2_clk),
+	LPI_FUNCTION(i2s2_ws),
+	LPI_FUNCTION(i2s2_data),
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

