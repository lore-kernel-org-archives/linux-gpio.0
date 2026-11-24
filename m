Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517606;
	b=kzROkzxgdHPPtIZM8S+kTV4ZAIbx6l8ZgNzWeve4oJmwSVcJSnAeZe4eOa5nvu/HpMOn
	 h3n8zukZnc4Pa49J4zyUpSKLVFhaKxLMWc2VYx1JJ2cUqpmvEiUalKfycSMYwNP9zMTxc
	 un/rZMI81utdWemsCjfkTxPwFPQAMnP0peidKoOarsoV7+Wi4JvuLnaVEy3rWZOPWXxva
	 hh+aTJDn/Lw4v/usZO/lHSOVCCSGNrcDymu2sD4SmRqm7Wep6Eo6n1F4IYSVDemwIwKDU
	 L3YnBujbV91Uo17zithA/DDCXvCSaJhDT+Xbxc5lQi94MlFPPruu6Uk7PIPN/iUekzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517606;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nRKeHcvaTiN+NrrFbxG5vBPLIyTeXL5cuOfe2yH6cBY=;
	b=jusba2VhkeWvIJeQwHVAGkvaHMGyH8xCi+zeD5wg3FN7dR13wiYqLlCTIPomoE0+6YMn
	 7XcDAB9x7uZB+5eqvRtWeikFYp3XwhF5EHF3hD83NsnfFMFLt3E0MSCJtzHarRPC2r0nx
	 0C+gdgNiOQyt5nthagoO0Iru8oOx+kFvricMXCY0bbT5/Drh6CbwCah0iZwwILVv8k4hp
	 VLcFBtFPHg1kIGqJjT4e5m/DITHIp+Rgr1NUn9ltMDLXrk+hUoJW4wLchQr5S/my7qoXl
	 Nl59DtBg3dapnTbauVS04wgvofdV53fGu39ZBym2xIK7uS+Wl8iSYvXUfPp/mXtAzcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3iWSGYu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clhh2YdH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180FE606A326
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 10:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 180FE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3iWSGYu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clhh2YdH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8DLlD2209206
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 10:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nRKeHcvaTiN
	+NrrFbxG5vBPLIyTeXL5cuOfe2yH6cBY=; b=a3iWSGYujjzatML4uK8SplvLC0x
	+EvYilkK2SVXu3TScIWVdFdjhmmKKUX1vqW0sHJt9rrGjwBbyq4c1xOQhYZRhQqc
	ujp54PNuCRs0wAFDj0xp871m8UIazEjkhUrhKO0dMeR1+KeR5iHYoXcBlFJc8fSn
	EYrmhYISpHiBw8TSf/paN0kvRj67+zpoUD/qROb3HJ0PSR83RBe99JTHiagQmtMm
	CVadshodw19PlA7399pI2Vw7iim1NyOraahV9Zy6b76nTQTosA35P5ZO1Gg2BTfW
	JIvvEHfChXGoQb5XwskGG/txdCFCm8z2gZuQ+tGLLTT2u/+ucQU5iOGKi4Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy12be4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 10:53:22 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b5b49cabso4022897c88.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 02:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517602; x=1796122402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRKeHcvaTiN+NrrFbxG5vBPLIyTeXL5cuOfe2yH6cBY=;
        b=clhh2YdHaGsYESzZ4X4m3qJV8jWGQRQYr8SXnLBGKOnt4XnMheaXezh4SWoYNKhwLc
         RKiCXbIXy8W+yUSTAlsCsrX8NRjo6nT5/JN1a3ZbwBeMpxMDr5ZoFdh451TemquKOIe8
         wD7p3txL/63POLQWsyfwjnXRDlxbNQfA3tfIGcyabT0OZ7fbu9rytMzdcrd1CWwfoGC+
         u3cagtGXplHuyEWTG9n5ubjm4yUmB2D9bfL7lroPOtbJ08SctNl8pD16Kht+XLcTD0WU
         BLjdfeQTyEZA67reaeFHYcuRvS5WxM9+zWURuw+RNQosu+ymN08e32gaZErvBmo1XdUD
         EE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517602; x=1796122402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nRKeHcvaTiN+NrrFbxG5vBPLIyTeXL5cuOfe2yH6cBY=;
        b=SvrmO3129KQ4Dy6EyUzsgmDeG8cawWBaphMFjRi6RaMEupv6R/Q4ZpLf0G9omAspA2
         iganEljs2xrdqgzVY+AMbXuJKq6jG7LRkoWzCQ26r1sBQyv79tYmeN3lGXtbLtjXaZXQ
         ojvJBjS/uOKXRsKrAdJ1lydhTc/U+ltv+v9jxgPpvi1V1FoEw3OlBjiZ1IWVhjC4+IfP
         eAWLSOPcGu7IkgovRZ5P2eVMdDQ3gRqlhvk3RIF7IOveyYDLhZRM3ecjYdkPCN86lOj9
         w6FtXXMWXd8AZ65zzhdKYzJFCPGmlCDzIogrzrS3QT5xZnZXUFq/MtnVkmAwtJEa4Ofe
         RvRQ==
X-Forwarded-Encrypted: i=1; AL+hErEeIk1GOUuPUESBW4q9N5TWOzPOFNggofiOFNBiQCg4scoKTs7Qo+c5oLkfWCIMja6DDwtrA+abF/hq@vger.kernel.org
X-Gm-Message-State: APuU4Z/KP/EDnUv/w3nLbKXShAjvK4bc4iYqHRb5nsneu9l6BhsYqC/N
	L42rRPti3+3XuOE6Yv00gDkv+XThiBVLKgbI4F2uLLViFHDgaSIwFsc9AunkavxzzAzj9Le2wyC
	XQP1pqkahFB5poMtz7t64xEbECAOUDW54Un9rRO6r+hyDKDvwzjb+t69zWIyLl9dXENmA33+p
X-Gm-Gg: AZFdTZdx8o6Wt+yLKiIrV5PBocK77TwNin/YC3trQmqCs4JYLcDdy2XNfDcgBRxFJqw
	oqlVH4tRKMaJ9YHC0g0Z38siFiM6n+0p+y8a56DCpk8GRHZjTjowxvXzC7xdhkfFrJZlxpWTuga
	tRkqxlXSeKqcG7zWCpAzuKoWChkxqBEOOOrj/YD1F/zDnRJsrnESSJlE7BkBna+dEvgEvIq64m4
	kCJjWuV7GORExPXp6Ggb03CT1/MWXclFh5uhDyUJP4/5Q+e4kjuDrIfJg6YIG/2MMU8E4OlHZzZ
	QBILK3pbN6InV9mqvhi9irvSGz0oMR0LH6Wi4HeaITZrnqjksjqRR68grLMKHVJFqJ394yybR0W
	CS8zmU6byVa+e0IrsRcvv++jOf3gOSEauj0H+tuMO0s2sI4IduReviOENkMHc334B5+qHyINssx
	zZWtCVw59MbI2Tvdq5EEu6cm232iooZc4FgqTqKhiF0y2Y8QLAOMeO3XAC
X-Received: by 2002:a05:7022:f10f:b0:1b3:abd2:2eb2 with SMTP id a92af1059eb24-1b55689ed61mr16906582c88.10.1795517600972;
        Tue, 24 Nov 2026 02:53:20 -0800 (PST)
X-Received: by 2002:a05:7022:f10f:b0:1b3:abd2:2eb2 with SMTP id a92af1059eb24-1b55689ed61mr16906550c88.10.1795517599846;
        Tue, 24 Nov 2026 02:53:19 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm35075998c88.12.2026.11.24.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:19 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 2/2] pinctrl: qcom: Add seca pinctrl driver
Date: Tue, 24 Nov 2026 16:23:03 +0530
Message-ID: <78986ee9ad305c4cd414a9ff606d5d99ec232478.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
References: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: xtWk5jlwKQU0NIyRlqmKceMPZICAEdSS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXzMdxnhl4d6O3
 65lr29Hm2NZBgkuzF3WatJv75FuHzjhCM5668JQqzv14aZLVn6WPseSOjIM2m1iji+F/aPo0fwf
 /8T9N0+VUn6vYou6cyaMh6jx4xugKFQ=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b056ca3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ExstbVCCFKdY7kyAwbkA:9 a=O8hF6Hzn-FEA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX2Y0NawYNnDIw
 PMxG6G2vkbIyWFOg0B5Q97CkmnYYZu7fb4+6kAnQHp8JX/X3ICLmqNMyE/k/4/Dcll74By06Ht9
 oPl7mghiMF80wkjJQzZKx6mvHQ6282VfTBNQgpXza92x0ecwlovwZyL+TTVMr5c+DEYRPUGONdO
 6ScBW+sX8b9unNIwkCNExJLOoe98JMfFNFUQ5s2idPLWTyQnsmZLMNUMkXkMO+4T/dCxLtBWw2v
 9o0UefVbhA2yIs257iV3SYqTqWkVi5WtN/KbYLtpCkm1pXMPbiiSk1D+zIK1pUos53BgEWdUHVB
 CHdherb3yz4NARSCQtCFjdsf7XX4reCGpem+jKY+fBj2vfTe4h0bcNmE1mjD8ZEDbAfc7ATVBaB
 hQ3chh+fHxQJof26NGn8rzhLT/36G7kHR7fTNruLoGCMWEZ4eaYQ/c46GgQrKr/UXlSvQjUfSCy
 X4NwdZGIL1e4vwnTRhQ==
X-Proofpoint-GUID: xtWk5jlwKQU0NIyRlqmKceMPZICAEdSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add TLMM pinctrl driver to support pin configuration with pinctrl
framework for Seca SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig.msm    |   11 +
 drivers/pinctrl/qcom/Makefile       |    1 +
 drivers/pinctrl/qcom/pinctrl-seca.c | 1705 +++++++++++++++++++++++++++
 3 files changed, 1717 insertions(+)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-seca.c

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index e45c701db627..836b1562f969 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -461,6 +461,17 @@ config PINCTRL_SDX75
          Qualcomm Technologies Inc TLMM block found on the Qualcomm
          Technologies Inc SDX75 platform.
 
+config PINCTRL_SECA
+	tristate "Qualcomm Seca pin controller driver"
+	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc Top Level Mode Multiplexer block (TLMM)
+	  found on the Qualcomm Technologies Inc Seca platform.
+	  Say Y here to compile statically, or M here to compile it as a module.
+	  If unsure, say N.
+
 config PINCTRL_SHIKRA
 	tristate "Qualcomm Shikra pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index a3daca77a448..2d6be2a43753 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
 obj-$(CONFIG_PINCTRL_SDX55) += pinctrl-sdx55.o
 obj-$(CONFIG_PINCTRL_SDX65) += pinctrl-sdx65.o
 obj-$(CONFIG_PINCTRL_SDX75) += pinctrl-sdx75.o
+obj-$(CONFIG_PINCTRL_SECA) += pinctrl-seca.o
 obj-$(CONFIG_PINCTRL_SHIKRA) += pinctrl-shikra.o
 obj-$(CONFIG_PINCTRL_SM4250_LPASS_LPI) += pinctrl-sm4250-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_SM4450) += pinctrl-sm4450.o
diff --git a/drivers/pinctrl/qcom/pinctrl-seca.c b/drivers/pinctrl/qcom/pinctrl-seca.c
new file mode 100644
index 000000000000..4520cb1d9f28
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-seca.c
@@ -0,0 +1,1705 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-msm.h"
+
+#define REG_SIZE 0x1000
+#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11)    \
+	{                                                             \
+		.grp = PINCTRL_PINGROUP("gpio" #id,                   \
+					gpio##id##_pins,              \
+					ARRAY_SIZE(gpio##id##_pins)), \
+		.ctl_reg = REG_SIZE * id,                             \
+		.io_reg = 0x4 + REG_SIZE * id,                        \
+		.intr_cfg_reg = 0x8 + REG_SIZE * id,                  \
+		.intr_status_reg = 0xc + REG_SIZE * id,               \
+		.mux_bit = 2,                                         \
+		.pull_bit = 0,                                        \
+		.drv_bit = 6,                                         \
+		.egpio_enable = 12,                                   \
+		.egpio_present = 11,                                  \
+		.oe_bit = 9,                                          \
+		.in_bit = 0,                                          \
+		.out_bit = 1,                                         \
+		.intr_enable_bit = 0,                                 \
+		.intr_status_bit = 0,                                 \
+		.intr_wakeup_present_bit = 6,                         \
+		.intr_wakeup_enable_bit = 7,                          \
+		.intr_target_bit = 8,                                 \
+		.intr_target_width = 4,                               \
+		.intr_target_kpss_val = 3,                            \
+		.intr_raw_status_bit = 4,                             \
+		.intr_polarity_bit = 1,                               \
+		.intr_detection_bit = 2,                              \
+		.intr_detection_width = 2,                            \
+		.funcs = (int[]){                                     \
+			msm_mux_gpio, /* gpio mode */                 \
+			msm_mux_##f1,                                 \
+			msm_mux_##f2,                                 \
+			msm_mux_##f3,                                 \
+			msm_mux_##f4,                                 \
+			msm_mux_##f5,                                 \
+			msm_mux_##f6,                                 \
+			msm_mux_##f7,                                 \
+			msm_mux_##f8,                                 \
+			msm_mux_##f9,                                 \
+			msm_mux_##f10,                                \
+			msm_mux_##f11 /* egpio mode */                \
+		},                                                    \
+		.nfuncs = 12,                                         \
+	}
+
+#define UFS_RESET(pg_name, ctl, io)                                  \
+	{                                                            \
+		.grp = PINCTRL_PINGROUP(#pg_name,                    \
+					pg_name##_pins,              \
+					ARRAY_SIZE(pg_name##_pins)), \
+		.ctl_reg = ctl,                                      \
+		.io_reg = io,                                        \
+		.intr_cfg_reg = 0,                                   \
+		.intr_status_reg = 0,                                \
+		.mux_bit = -1,                                       \
+		.pull_bit = 3,                                       \
+		.drv_bit = 0,                                        \
+		.oe_bit = -1,                                        \
+		.in_bit = -1,                                        \
+		.out_bit = 0,                                        \
+		.intr_enable_bit = -1,                               \
+		.intr_status_bit = -1,                               \
+		.intr_target_bit = -1,                               \
+		.intr_raw_status_bit = -1,                           \
+		.intr_polarity_bit = -1,                             \
+		.intr_detection_bit = -1,                            \
+		.intr_detection_width = -1,                          \
+	}
+
+static const struct pinctrl_pin_desc seca_pins[] = {
+	PINCTRL_PIN(0, "GPIO_0"),
+	PINCTRL_PIN(1, "GPIO_1"),
+	PINCTRL_PIN(2, "GPIO_2"),
+	PINCTRL_PIN(3, "GPIO_3"),
+	PINCTRL_PIN(4, "GPIO_4"),
+	PINCTRL_PIN(5, "GPIO_5"),
+	PINCTRL_PIN(6, "GPIO_6"),
+	PINCTRL_PIN(7, "GPIO_7"),
+	PINCTRL_PIN(8, "GPIO_8"),
+	PINCTRL_PIN(9, "GPIO_9"),
+	PINCTRL_PIN(10, "GPIO_10"),
+	PINCTRL_PIN(11, "GPIO_11"),
+	PINCTRL_PIN(12, "GPIO_12"),
+	PINCTRL_PIN(13, "GPIO_13"),
+	PINCTRL_PIN(14, "GPIO_14"),
+	PINCTRL_PIN(15, "GPIO_15"),
+	PINCTRL_PIN(16, "GPIO_16"),
+	PINCTRL_PIN(17, "GPIO_17"),
+	PINCTRL_PIN(18, "GPIO_18"),
+	PINCTRL_PIN(19, "GPIO_19"),
+	PINCTRL_PIN(20, "GPIO_20"),
+	PINCTRL_PIN(21, "GPIO_21"),
+	PINCTRL_PIN(22, "GPIO_22"),
+	PINCTRL_PIN(23, "GPIO_23"),
+	PINCTRL_PIN(24, "GPIO_24"),
+	PINCTRL_PIN(25, "GPIO_25"),
+	PINCTRL_PIN(26, "GPIO_26"),
+	PINCTRL_PIN(27, "GPIO_27"),
+	PINCTRL_PIN(28, "GPIO_28"),
+	PINCTRL_PIN(29, "GPIO_29"),
+	PINCTRL_PIN(30, "GPIO_30"),
+	PINCTRL_PIN(31, "GPIO_31"),
+	PINCTRL_PIN(32, "GPIO_32"),
+	PINCTRL_PIN(33, "GPIO_33"),
+	PINCTRL_PIN(34, "GPIO_34"),
+	PINCTRL_PIN(35, "GPIO_35"),
+	PINCTRL_PIN(36, "GPIO_36"),
+	PINCTRL_PIN(37, "GPIO_37"),
+	PINCTRL_PIN(38, "GPIO_38"),
+	PINCTRL_PIN(39, "GPIO_39"),
+	PINCTRL_PIN(40, "GPIO_40"),
+	PINCTRL_PIN(41, "GPIO_41"),
+	PINCTRL_PIN(42, "GPIO_42"),
+	PINCTRL_PIN(43, "GPIO_43"),
+	PINCTRL_PIN(44, "GPIO_44"),
+	PINCTRL_PIN(45, "GPIO_45"),
+	PINCTRL_PIN(46, "GPIO_46"),
+	PINCTRL_PIN(47, "GPIO_47"),
+	PINCTRL_PIN(48, "GPIO_48"),
+	PINCTRL_PIN(49, "GPIO_49"),
+	PINCTRL_PIN(50, "GPIO_50"),
+	PINCTRL_PIN(51, "GPIO_51"),
+	PINCTRL_PIN(52, "GPIO_52"),
+	PINCTRL_PIN(53, "GPIO_53"),
+	PINCTRL_PIN(54, "GPIO_54"),
+	PINCTRL_PIN(55, "GPIO_55"),
+	PINCTRL_PIN(56, "GPIO_56"),
+	PINCTRL_PIN(57, "GPIO_57"),
+	PINCTRL_PIN(58, "GPIO_58"),
+	PINCTRL_PIN(59, "GPIO_59"),
+	PINCTRL_PIN(60, "GPIO_60"),
+	PINCTRL_PIN(61, "GPIO_61"),
+	PINCTRL_PIN(62, "GPIO_62"),
+	PINCTRL_PIN(63, "GPIO_63"),
+	PINCTRL_PIN(64, "GPIO_64"),
+	PINCTRL_PIN(65, "GPIO_65"),
+	PINCTRL_PIN(66, "GPIO_66"),
+	PINCTRL_PIN(67, "GPIO_67"),
+	PINCTRL_PIN(68, "GPIO_68"),
+	PINCTRL_PIN(69, "GPIO_69"),
+	PINCTRL_PIN(70, "GPIO_70"),
+	PINCTRL_PIN(71, "GPIO_71"),
+	PINCTRL_PIN(72, "GPIO_72"),
+	PINCTRL_PIN(73, "GPIO_73"),
+	PINCTRL_PIN(74, "GPIO_74"),
+	PINCTRL_PIN(75, "GPIO_75"),
+	PINCTRL_PIN(76, "GPIO_76"),
+	PINCTRL_PIN(77, "GPIO_77"),
+	PINCTRL_PIN(78, "GPIO_78"),
+	PINCTRL_PIN(79, "GPIO_79"),
+	PINCTRL_PIN(80, "GPIO_80"),
+	PINCTRL_PIN(81, "GPIO_81"),
+	PINCTRL_PIN(82, "GPIO_82"),
+	PINCTRL_PIN(83, "GPIO_83"),
+	PINCTRL_PIN(84, "GPIO_84"),
+	PINCTRL_PIN(85, "GPIO_85"),
+	PINCTRL_PIN(86, "GPIO_86"),
+	PINCTRL_PIN(87, "GPIO_87"),
+	PINCTRL_PIN(88, "GPIO_88"),
+	PINCTRL_PIN(89, "GPIO_89"),
+	PINCTRL_PIN(90, "GPIO_90"),
+	PINCTRL_PIN(91, "GPIO_91"),
+	PINCTRL_PIN(92, "GPIO_92"),
+	PINCTRL_PIN(93, "GPIO_93"),
+	PINCTRL_PIN(94, "GPIO_94"),
+	PINCTRL_PIN(95, "GPIO_95"),
+	PINCTRL_PIN(96, "GPIO_96"),
+	PINCTRL_PIN(97, "GPIO_97"),
+	PINCTRL_PIN(98, "GPIO_98"),
+	PINCTRL_PIN(99, "GPIO_99"),
+	PINCTRL_PIN(100, "GPIO_100"),
+	PINCTRL_PIN(101, "GPIO_101"),
+	PINCTRL_PIN(102, "GPIO_102"),
+	PINCTRL_PIN(103, "GPIO_103"),
+	PINCTRL_PIN(104, "GPIO_104"),
+	PINCTRL_PIN(105, "GPIO_105"),
+	PINCTRL_PIN(106, "GPIO_106"),
+	PINCTRL_PIN(107, "GPIO_107"),
+	PINCTRL_PIN(108, "GPIO_108"),
+	PINCTRL_PIN(109, "GPIO_109"),
+	PINCTRL_PIN(110, "GPIO_110"),
+	PINCTRL_PIN(111, "GPIO_111"),
+	PINCTRL_PIN(112, "GPIO_112"),
+	PINCTRL_PIN(113, "GPIO_113"),
+	PINCTRL_PIN(114, "GPIO_114"),
+	PINCTRL_PIN(115, "GPIO_115"),
+	PINCTRL_PIN(116, "GPIO_116"),
+	PINCTRL_PIN(117, "GPIO_117"),
+	PINCTRL_PIN(118, "GPIO_118"),
+	PINCTRL_PIN(119, "GPIO_119"),
+	PINCTRL_PIN(120, "GPIO_120"),
+	PINCTRL_PIN(121, "GPIO_121"),
+	PINCTRL_PIN(122, "GPIO_122"),
+	PINCTRL_PIN(123, "GPIO_123"),
+	PINCTRL_PIN(124, "GPIO_124"),
+	PINCTRL_PIN(125, "GPIO_125"),
+	PINCTRL_PIN(126, "GPIO_126"),
+	PINCTRL_PIN(127, "GPIO_127"),
+	PINCTRL_PIN(128, "GPIO_128"),
+	PINCTRL_PIN(129, "GPIO_129"),
+	PINCTRL_PIN(130, "GPIO_130"),
+	PINCTRL_PIN(131, "GPIO_131"),
+	PINCTRL_PIN(132, "GPIO_132"),
+	PINCTRL_PIN(133, "GPIO_133"),
+	PINCTRL_PIN(134, "GPIO_134"),
+	PINCTRL_PIN(135, "GPIO_135"),
+	PINCTRL_PIN(136, "GPIO_136"),
+	PINCTRL_PIN(137, "GPIO_137"),
+	PINCTRL_PIN(138, "GPIO_138"),
+	PINCTRL_PIN(139, "GPIO_139"),
+	PINCTRL_PIN(140, "GPIO_140"),
+	PINCTRL_PIN(141, "GPIO_141"),
+	PINCTRL_PIN(142, "GPIO_142"),
+	PINCTRL_PIN(143, "GPIO_143"),
+	PINCTRL_PIN(144, "GPIO_144"),
+	PINCTRL_PIN(145, "GPIO_145"),
+	PINCTRL_PIN(146, "GPIO_146"),
+	PINCTRL_PIN(147, "GPIO_147"),
+	PINCTRL_PIN(148, "GPIO_148"),
+	PINCTRL_PIN(149, "GPIO_149"),
+	PINCTRL_PIN(150, "GPIO_150"),
+	PINCTRL_PIN(151, "GPIO_151"),
+	PINCTRL_PIN(152, "GPIO_152"),
+	PINCTRL_PIN(153, "GPIO_153"),
+	PINCTRL_PIN(154, "GPIO_154"),
+	PINCTRL_PIN(155, "GPIO_155"),
+	PINCTRL_PIN(156, "GPIO_156"),
+	PINCTRL_PIN(157, "GPIO_157"),
+	PINCTRL_PIN(158, "GPIO_158"),
+	PINCTRL_PIN(159, "GPIO_159"),
+	PINCTRL_PIN(160, "GPIO_160"),
+	PINCTRL_PIN(161, "GPIO_161"),
+	PINCTRL_PIN(162, "GPIO_162"),
+	PINCTRL_PIN(163, "GPIO_163"),
+	PINCTRL_PIN(164, "GPIO_164"),
+	PINCTRL_PIN(165, "GPIO_165"),
+	PINCTRL_PIN(166, "GPIO_166"),
+	PINCTRL_PIN(167, "GPIO_167"),
+	PINCTRL_PIN(168, "GPIO_168"),
+	PINCTRL_PIN(169, "GPIO_169"),
+	PINCTRL_PIN(170, "GPIO_170"),
+	PINCTRL_PIN(171, "GPIO_171"),
+	PINCTRL_PIN(172, "GPIO_172"),
+	PINCTRL_PIN(173, "GPIO_173"),
+	PINCTRL_PIN(174, "GPIO_174"),
+	PINCTRL_PIN(175, "GPIO_175"),
+	PINCTRL_PIN(176, "GPIO_176"),
+	PINCTRL_PIN(177, "GPIO_177"),
+	PINCTRL_PIN(178, "GPIO_178"),
+	PINCTRL_PIN(179, "GPIO_179"),
+	PINCTRL_PIN(180, "GPIO_180"),
+	PINCTRL_PIN(181, "UFS_RESET"),
+};
+
+#define DECLARE_MSM_GPIO_PINS(pin) \
+	static const unsigned int gpio##pin##_pins[] = { pin }
+DECLARE_MSM_GPIO_PINS(0);
+DECLARE_MSM_GPIO_PINS(1);
+DECLARE_MSM_GPIO_PINS(2);
+DECLARE_MSM_GPIO_PINS(3);
+DECLARE_MSM_GPIO_PINS(4);
+DECLARE_MSM_GPIO_PINS(5);
+DECLARE_MSM_GPIO_PINS(6);
+DECLARE_MSM_GPIO_PINS(7);
+DECLARE_MSM_GPIO_PINS(8);
+DECLARE_MSM_GPIO_PINS(9);
+DECLARE_MSM_GPIO_PINS(10);
+DECLARE_MSM_GPIO_PINS(11);
+DECLARE_MSM_GPIO_PINS(12);
+DECLARE_MSM_GPIO_PINS(13);
+DECLARE_MSM_GPIO_PINS(14);
+DECLARE_MSM_GPIO_PINS(15);
+DECLARE_MSM_GPIO_PINS(16);
+DECLARE_MSM_GPIO_PINS(17);
+DECLARE_MSM_GPIO_PINS(18);
+DECLARE_MSM_GPIO_PINS(19);
+DECLARE_MSM_GPIO_PINS(20);
+DECLARE_MSM_GPIO_PINS(21);
+DECLARE_MSM_GPIO_PINS(22);
+DECLARE_MSM_GPIO_PINS(23);
+DECLARE_MSM_GPIO_PINS(24);
+DECLARE_MSM_GPIO_PINS(25);
+DECLARE_MSM_GPIO_PINS(26);
+DECLARE_MSM_GPIO_PINS(27);
+DECLARE_MSM_GPIO_PINS(28);
+DECLARE_MSM_GPIO_PINS(29);
+DECLARE_MSM_GPIO_PINS(30);
+DECLARE_MSM_GPIO_PINS(31);
+DECLARE_MSM_GPIO_PINS(32);
+DECLARE_MSM_GPIO_PINS(33);
+DECLARE_MSM_GPIO_PINS(34);
+DECLARE_MSM_GPIO_PINS(35);
+DECLARE_MSM_GPIO_PINS(36);
+DECLARE_MSM_GPIO_PINS(37);
+DECLARE_MSM_GPIO_PINS(38);
+DECLARE_MSM_GPIO_PINS(39);
+DECLARE_MSM_GPIO_PINS(40);
+DECLARE_MSM_GPIO_PINS(41);
+DECLARE_MSM_GPIO_PINS(42);
+DECLARE_MSM_GPIO_PINS(43);
+DECLARE_MSM_GPIO_PINS(44);
+DECLARE_MSM_GPIO_PINS(45);
+DECLARE_MSM_GPIO_PINS(46);
+DECLARE_MSM_GPIO_PINS(47);
+DECLARE_MSM_GPIO_PINS(48);
+DECLARE_MSM_GPIO_PINS(49);
+DECLARE_MSM_GPIO_PINS(50);
+DECLARE_MSM_GPIO_PINS(51);
+DECLARE_MSM_GPIO_PINS(52);
+DECLARE_MSM_GPIO_PINS(53);
+DECLARE_MSM_GPIO_PINS(54);
+DECLARE_MSM_GPIO_PINS(55);
+DECLARE_MSM_GPIO_PINS(56);
+DECLARE_MSM_GPIO_PINS(57);
+DECLARE_MSM_GPIO_PINS(58);
+DECLARE_MSM_GPIO_PINS(59);
+DECLARE_MSM_GPIO_PINS(60);
+DECLARE_MSM_GPIO_PINS(61);
+DECLARE_MSM_GPIO_PINS(62);
+DECLARE_MSM_GPIO_PINS(63);
+DECLARE_MSM_GPIO_PINS(64);
+DECLARE_MSM_GPIO_PINS(65);
+DECLARE_MSM_GPIO_PINS(66);
+DECLARE_MSM_GPIO_PINS(67);
+DECLARE_MSM_GPIO_PINS(68);
+DECLARE_MSM_GPIO_PINS(69);
+DECLARE_MSM_GPIO_PINS(70);
+DECLARE_MSM_GPIO_PINS(71);
+DECLARE_MSM_GPIO_PINS(72);
+DECLARE_MSM_GPIO_PINS(73);
+DECLARE_MSM_GPIO_PINS(74);
+DECLARE_MSM_GPIO_PINS(75);
+DECLARE_MSM_GPIO_PINS(76);
+DECLARE_MSM_GPIO_PINS(77);
+DECLARE_MSM_GPIO_PINS(78);
+DECLARE_MSM_GPIO_PINS(79);
+DECLARE_MSM_GPIO_PINS(80);
+DECLARE_MSM_GPIO_PINS(81);
+DECLARE_MSM_GPIO_PINS(82);
+DECLARE_MSM_GPIO_PINS(83);
+DECLARE_MSM_GPIO_PINS(84);
+DECLARE_MSM_GPIO_PINS(85);
+DECLARE_MSM_GPIO_PINS(86);
+DECLARE_MSM_GPIO_PINS(87);
+DECLARE_MSM_GPIO_PINS(88);
+DECLARE_MSM_GPIO_PINS(89);
+DECLARE_MSM_GPIO_PINS(90);
+DECLARE_MSM_GPIO_PINS(91);
+DECLARE_MSM_GPIO_PINS(92);
+DECLARE_MSM_GPIO_PINS(93);
+DECLARE_MSM_GPIO_PINS(94);
+DECLARE_MSM_GPIO_PINS(95);
+DECLARE_MSM_GPIO_PINS(96);
+DECLARE_MSM_GPIO_PINS(97);
+DECLARE_MSM_GPIO_PINS(98);
+DECLARE_MSM_GPIO_PINS(99);
+DECLARE_MSM_GPIO_PINS(100);
+DECLARE_MSM_GPIO_PINS(101);
+DECLARE_MSM_GPIO_PINS(102);
+DECLARE_MSM_GPIO_PINS(103);
+DECLARE_MSM_GPIO_PINS(104);
+DECLARE_MSM_GPIO_PINS(105);
+DECLARE_MSM_GPIO_PINS(106);
+DECLARE_MSM_GPIO_PINS(107);
+DECLARE_MSM_GPIO_PINS(108);
+DECLARE_MSM_GPIO_PINS(109);
+DECLARE_MSM_GPIO_PINS(110);
+DECLARE_MSM_GPIO_PINS(111);
+DECLARE_MSM_GPIO_PINS(112);
+DECLARE_MSM_GPIO_PINS(113);
+DECLARE_MSM_GPIO_PINS(114);
+DECLARE_MSM_GPIO_PINS(115);
+DECLARE_MSM_GPIO_PINS(116);
+DECLARE_MSM_GPIO_PINS(117);
+DECLARE_MSM_GPIO_PINS(118);
+DECLARE_MSM_GPIO_PINS(119);
+DECLARE_MSM_GPIO_PINS(120);
+DECLARE_MSM_GPIO_PINS(121);
+DECLARE_MSM_GPIO_PINS(122);
+DECLARE_MSM_GPIO_PINS(123);
+DECLARE_MSM_GPIO_PINS(124);
+DECLARE_MSM_GPIO_PINS(125);
+DECLARE_MSM_GPIO_PINS(126);
+DECLARE_MSM_GPIO_PINS(127);
+DECLARE_MSM_GPIO_PINS(128);
+DECLARE_MSM_GPIO_PINS(129);
+DECLARE_MSM_GPIO_PINS(130);
+DECLARE_MSM_GPIO_PINS(131);
+DECLARE_MSM_GPIO_PINS(132);
+DECLARE_MSM_GPIO_PINS(133);
+DECLARE_MSM_GPIO_PINS(134);
+DECLARE_MSM_GPIO_PINS(135);
+DECLARE_MSM_GPIO_PINS(136);
+DECLARE_MSM_GPIO_PINS(137);
+DECLARE_MSM_GPIO_PINS(138);
+DECLARE_MSM_GPIO_PINS(139);
+DECLARE_MSM_GPIO_PINS(140);
+DECLARE_MSM_GPIO_PINS(141);
+DECLARE_MSM_GPIO_PINS(142);
+DECLARE_MSM_GPIO_PINS(143);
+DECLARE_MSM_GPIO_PINS(144);
+DECLARE_MSM_GPIO_PINS(145);
+DECLARE_MSM_GPIO_PINS(146);
+DECLARE_MSM_GPIO_PINS(147);
+DECLARE_MSM_GPIO_PINS(148);
+DECLARE_MSM_GPIO_PINS(149);
+DECLARE_MSM_GPIO_PINS(150);
+DECLARE_MSM_GPIO_PINS(151);
+DECLARE_MSM_GPIO_PINS(152);
+DECLARE_MSM_GPIO_PINS(153);
+DECLARE_MSM_GPIO_PINS(154);
+DECLARE_MSM_GPIO_PINS(155);
+DECLARE_MSM_GPIO_PINS(156);
+DECLARE_MSM_GPIO_PINS(157);
+DECLARE_MSM_GPIO_PINS(158);
+DECLARE_MSM_GPIO_PINS(159);
+DECLARE_MSM_GPIO_PINS(160);
+DECLARE_MSM_GPIO_PINS(161);
+DECLARE_MSM_GPIO_PINS(162);
+DECLARE_MSM_GPIO_PINS(163);
+DECLARE_MSM_GPIO_PINS(164);
+DECLARE_MSM_GPIO_PINS(165);
+DECLARE_MSM_GPIO_PINS(166);
+DECLARE_MSM_GPIO_PINS(167);
+DECLARE_MSM_GPIO_PINS(168);
+DECLARE_MSM_GPIO_PINS(169);
+DECLARE_MSM_GPIO_PINS(170);
+DECLARE_MSM_GPIO_PINS(171);
+DECLARE_MSM_GPIO_PINS(172);
+DECLARE_MSM_GPIO_PINS(173);
+DECLARE_MSM_GPIO_PINS(174);
+DECLARE_MSM_GPIO_PINS(175);
+DECLARE_MSM_GPIO_PINS(176);
+DECLARE_MSM_GPIO_PINS(177);
+DECLARE_MSM_GPIO_PINS(178);
+DECLARE_MSM_GPIO_PINS(179);
+DECLARE_MSM_GPIO_PINS(180);
+
+static const unsigned int ufs_reset_pins[] = { 181 };
+
+enum seca_functions {
+	msm_mux_gpio,
+	msm_mux_aoss_cti,
+	msm_mux_atest_char,
+	msm_mux_atest_usb20,
+	msm_mux_atest_usb21,
+	msm_mux_aud_intfc0_clk,
+	msm_mux_aud_intfc0_data,
+	msm_mux_aud_intfc0_ws,
+	msm_mux_aud_intfc10_clk,
+	msm_mux_aud_intfc10_data,
+	msm_mux_aud_intfc10_ws,
+	msm_mux_aud_intfc1_clk,
+	msm_mux_aud_intfc1_data,
+	msm_mux_aud_intfc1_ws,
+	msm_mux_aud_intfc2_clk,
+	msm_mux_aud_intfc2_data,
+	msm_mux_aud_intfc2_ws,
+	msm_mux_aud_intfc3_clk,
+	msm_mux_aud_intfc3_data,
+	msm_mux_aud_intfc3_ws,
+	msm_mux_aud_intfc4_clk,
+	msm_mux_aud_intfc4_data,
+	msm_mux_aud_intfc4_ws,
+	msm_mux_aud_intfc5_clk,
+	msm_mux_aud_intfc5_data,
+	msm_mux_aud_intfc5_ws,
+	msm_mux_aud_intfc6_clk,
+	msm_mux_aud_intfc6_data,
+	msm_mux_aud_intfc6_ws,
+	msm_mux_aud_intfc7_clk,
+	msm_mux_aud_intfc7_data,
+	msm_mux_aud_intfc7_ws,
+	msm_mux_aud_intfc8_clk,
+	msm_mux_aud_intfc8_data,
+	msm_mux_aud_intfc8_ws,
+	msm_mux_aud_intfc9_clk,
+	msm_mux_aud_intfc9_data,
+	msm_mux_aud_intfc9_ws,
+	msm_mux_aud_mclk0_mira,
+	msm_mux_aud_mclk0_mirb,
+	msm_mux_aud_mclk1_mira,
+	msm_mux_aud_mclk1_mirb,
+	msm_mux_aud_mclk2_mira,
+	msm_mux_aud_mclk2_mirb,
+	msm_mux_aud_refclk0,
+	msm_mux_aud_refclk1,
+	msm_mux_bist_done,
+	msm_mux_ccu_async_in,
+	msm_mux_ccu_i2c_scl,
+	msm_mux_ccu_i2c_sda,
+	msm_mux_ccu_timer,
+	msm_mux_dbg_out,
+	msm_mux_dbg_out_clk,
+	msm_mux_ddr_bist_complete,
+	msm_mux_ddr_bist_fail,
+	msm_mux_ddr_bist_start,
+	msm_mux_ddr_bist_stop,
+	msm_mux_ddr_pxi,
+	msm_mux_dp_rx0,
+	msm_mux_dp_rx00,
+	msm_mux_dp_rx01,
+	msm_mux_dp_rx0_mute,
+	msm_mux_edp0_hot,
+	msm_mux_edp0_lcd,
+	msm_mux_edp1_hot,
+	msm_mux_edp1_lcd,
+	msm_mux_edp2_hot,
+	msm_mux_edp2_lcd,
+	msm_mux_emac0_mcg,
+	msm_mux_emac0_mdc,
+	msm_mux_emac0_mdio,
+	msm_mux_emac0_ptp,
+	msm_mux_emac1_mcg,
+	msm_mux_emac1_mdc,
+	msm_mux_emac1_mdio,
+	msm_mux_emac1_ptp,
+	msm_mux_gcc_gp1_clk,
+	msm_mux_gcc_gp2_clk,
+	msm_mux_gcc_gp3_clk,
+	msm_mux_gcc_gp4_clk,
+	msm_mux_gcc_gp5_clk,
+	msm_mux_gcc_gp6_clk,
+	msm_mux_gcc_gp7_clk,
+	msm_mux_gcc_gp8_clk,
+	msm_mux_jitter_bist,
+	msm_mux_lbist_pass,
+	msm_mux_mbist_pass,
+	msm_mux_mdp0_vsync_out,
+	msm_mux_mdp1_vsync_out,
+	msm_mux_mdp_vsync_e,
+	msm_mux_mdp_vsync_p,
+	msm_mux_mdp_vsync_s,
+	msm_mux_pcie0_clk_req_n,
+	msm_mux_pcie1_clk_req_n,
+	msm_mux_pcie2_clk_req_n,
+	msm_mux_pcie3_clk_req_n,
+	msm_mux_phase_flag,
+	msm_mux_pll_bist_sync,
+	msm_mux_pll_clk_aux,
+	msm_mux_prng_rosc0,
+	msm_mux_prng_rosc1,
+	msm_mux_pwrbrk_i_n,
+	msm_mux_qdss,
+	msm_mux_qdss_cti,
+	msm_mux_qspi,
+	msm_mux_qup0_se0,
+	msm_mux_qup0_se1,
+	msm_mux_qup0_se2,
+	msm_mux_qup0_se3,
+	msm_mux_qup0_se4,
+	msm_mux_qup0_se5,
+	msm_mux_qup1_se0,
+	msm_mux_qup1_se1,
+	msm_mux_qup1_se2_01,
+	msm_mux_qup1_se2_23,
+	msm_mux_qup1_se3_01,
+	msm_mux_qup1_se3_23,
+	msm_mux_qup1_se4,
+	msm_mux_qup1_se5,
+	msm_mux_qup1_se6,
+	msm_mux_qup2_se0,
+	msm_mux_qup2_se1,
+	msm_mux_qup2_se2,
+	msm_mux_qup2_se3,
+	msm_mux_qup2_se4,
+	msm_mux_qup2_se5,
+	msm_mux_qup2_se6,
+	msm_mux_qup3_se0_mira,
+	msm_mux_qup3_se0_mirb,
+	msm_mux_sailss_ospi,
+	msm_mux_sdc4,
+	msm_mux_sdc4_clk,
+	msm_mux_sdc4_cmd,
+	msm_mux_smb_alert,
+	msm_mux_smb_alert_n,
+	msm_mux_smb_clk,
+	msm_mux_smb_dat,
+	msm_mux_tb_trig_sdc4,
+	msm_mux_tmess_prng0,
+	msm_mux_tmess_prng1,
+	msm_mux_tsc_timer,
+	msm_mux_tsense_clm,
+	msm_mux_tsense_pwm,
+	msm_mux_usb0_hs,
+	msm_mux_usb0_phy_ps,
+	msm_mux_usb1_hs,
+	msm_mux_usb1_phy_ps,
+	msm_mux_usb2_hs,
+	msm_mux_usxgmii0_phy,
+	msm_mux_usxgmii1_phy,
+	msm_mux_vsense_trigger_mirnat,
+	msm_mux_wcn_sw,
+	msm_mux_wcn_sw_ctrl,
+	msm_mux__,
+};
+
+static const char *const gpio_groups[] = {
+	"gpio0",   "gpio1",   "gpio2",	 "gpio3",   "gpio4",   "gpio5",
+	"gpio6",   "gpio7",   "gpio8",	 "gpio9",   "gpio10",  "gpio11",
+	"gpio12",  "gpio13",  "gpio14",	 "gpio15",  "gpio16",  "gpio17",
+	"gpio18",  "gpio19",  "gpio20",	 "gpio21",  "gpio22",  "gpio23",
+	"gpio24",  "gpio25",  "gpio26",	 "gpio27",  "gpio28",  "gpio29",
+	"gpio30",  "gpio31",  "gpio32",	 "gpio33",  "gpio34",  "gpio35",
+	"gpio36",  "gpio37",  "gpio38",	 "gpio39",  "gpio40",  "gpio41",
+	"gpio42",  "gpio43",  "gpio44",	 "gpio45",  "gpio46",  "gpio47",
+	"gpio48",  "gpio49",  "gpio50",	 "gpio51",  "gpio52",  "gpio53",
+	"gpio54",  "gpio55",  "gpio56",	 "gpio57",  "gpio58",  "gpio59",
+	"gpio60",  "gpio61",  "gpio62",	 "gpio63",  "gpio64",  "gpio65",
+	"gpio66",  "gpio67",  "gpio68",	 "gpio69",  "gpio70",  "gpio71",
+	"gpio72",  "gpio73",  "gpio74",	 "gpio75",  "gpio76",  "gpio77",
+	"gpio78",  "gpio79",  "gpio80",	 "gpio81",  "gpio82",  "gpio83",
+	"gpio84",  "gpio85",  "gpio86",	 "gpio87",  "gpio88",  "gpio89",
+	"gpio90",  "gpio91",  "gpio92",	 "gpio93",  "gpio94",  "gpio95",
+	"gpio96",  "gpio97",  "gpio98",	 "gpio99",  "gpio100", "gpio101",
+	"gpio102", "gpio103", "gpio104", "gpio105", "gpio106", "gpio107",
+	"gpio108", "gpio109", "gpio110", "gpio111", "gpio112", "gpio113",
+	"gpio114", "gpio115", "gpio116", "gpio117", "gpio118", "gpio119",
+	"gpio120", "gpio121", "gpio122", "gpio123", "gpio124", "gpio125",
+	"gpio126", "gpio127", "gpio128", "gpio129", "gpio130", "gpio131",
+	"gpio132", "gpio133", "gpio134", "gpio135", "gpio136", "gpio137",
+	"gpio138", "gpio139", "gpio140", "gpio141", "gpio142", "gpio143",
+	"gpio144", "gpio145", "gpio146", "gpio147", "gpio148", "gpio149",
+	"gpio150", "gpio151", "gpio152", "gpio153", "gpio154", "gpio155",
+	"gpio156", "gpio157", "gpio158", "gpio159", "gpio160", "gpio161",
+	"gpio162", "gpio163", "gpio164", "gpio165", "gpio166", "gpio167",
+	"gpio168", "gpio169", "gpio170", "gpio171", "gpio172", "gpio173",
+	"gpio174", "gpio175", "gpio176", "gpio177", "gpio178", "gpio179",
+	"gpio180",
+};
+
+static const char *const aoss_cti_groups[] = {
+	"gpio51",
+	"gpio52",
+	"gpio53",
+	"gpio54",
+};
+
+static const char *const atest_char_groups[] = {
+	"gpio176", "gpio177", "gpio178", "gpio179", "gpio180",
+};
+
+static const char *const atest_usb20_groups[] = {
+	"gpio126",
+	"gpio128",
+	"gpio130",
+};
+
+static const char *const atest_usb21_groups[] = {
+	"gpio127",
+	"gpio129",
+	"gpio131",
+};
+
+static const char *const aud_intfc0_clk_groups[] = {
+	"gpio57",
+};
+
+static const char *const aud_intfc0_data_groups[] = {
+	"gpio59", "gpio60", "gpio61", "gpio62", "gpio63", "gpio64", "gpio65", "gpio66",
+};
+
+static const char *const aud_intfc0_ws_groups[] = {
+	"gpio58",
+};
+
+static const char *const aud_intfc10_clk_groups[] = {
+	"gpio61",
+};
+
+static const char *const aud_intfc10_data_groups[] = {
+	"gpio81", "gpio82",
+};
+
+static const char *const aud_intfc10_ws_groups[] = {
+	"gpio62",
+};
+
+static const char *const aud_intfc1_clk_groups[] = {
+	"gpio67",
+};
+
+static const char *const aud_intfc1_data_groups[] = {
+	"gpio69", "gpio70", "gpio71", "gpio72", "gpio73", "gpio74", "gpio75", "gpio76",
+};
+
+static const char *const aud_intfc1_ws_groups[] = {
+	"gpio68",
+};
+
+static const char *const aud_intfc2_clk_groups[] = {
+	"gpio77",
+};
+
+static const char *const aud_intfc2_data_groups[] = {
+	"gpio79", "gpio80", "gpio81", "gpio82",
+};
+
+static const char *const aud_intfc2_ws_groups[] = {
+	"gpio78",
+};
+
+static const char *const aud_intfc3_clk_groups[] = {
+	"gpio83",
+};
+
+static const char *const aud_intfc3_data_groups[] = {
+	"gpio85", "gpio86",
+};
+
+static const char *const aud_intfc3_ws_groups[] = {
+	"gpio84",
+};
+
+static const char *const aud_intfc4_clk_groups[] = {
+	"gpio87",
+};
+
+static const char *const aud_intfc4_data_groups[] = {
+	"gpio89", "gpio90",
+};
+
+static const char *const aud_intfc4_ws_groups[] = {
+	"gpio88",
+};
+
+static const char *const aud_intfc5_clk_groups[] = {
+	"gpio91",
+};
+
+static const char *const aud_intfc5_data_groups[] = {
+	"gpio93", "gpio94",
+};
+
+static const char *const aud_intfc5_ws_groups[] = {
+	"gpio92",
+};
+
+static const char *const aud_intfc6_clk_groups[] = {
+	"gpio95",
+};
+
+static const char *const aud_intfc6_data_groups[] = {
+	"gpio97", "gpio98",
+};
+
+static const char *const aud_intfc6_ws_groups[] = {
+	"gpio96",
+};
+
+static const char *const aud_intfc7_clk_groups[] = {
+	"gpio63",
+};
+
+static const char *const aud_intfc7_data_groups[] = {
+	"gpio65", "gpio66",
+};
+
+static const char *const aud_intfc7_ws_groups[] = {
+	"gpio64",
+};
+
+static const char *const aud_intfc8_clk_groups[] = {
+	"gpio73",
+};
+
+static const char *const aud_intfc8_data_groups[] = {
+	"gpio75", "gpio76",
+};
+
+static const char *const aud_intfc8_ws_groups[] = {
+	"gpio74",
+};
+
+static const char *const aud_intfc9_clk_groups[] = {
+	"gpio70",
+};
+
+static const char *const aud_intfc9_data_groups[] = {
+	"gpio72",
+};
+
+static const char *const aud_intfc9_ws_groups[] = {
+	"gpio71",
+};
+
+static const char *const aud_mclk0_mira_groups[] = {
+	"gpio99",
+};
+
+static const char *const aud_mclk0_mirb_groups[] = {
+	"gpio86",
+};
+
+static const char *const aud_mclk1_mira_groups[] = {
+	"gpio100",
+};
+
+static const char *const aud_mclk1_mirb_groups[] = {
+	"gpio90",
+};
+
+static const char *const aud_mclk2_mira_groups[] = {
+	"gpio101",
+};
+
+static const char *const aud_mclk2_mirb_groups[] = {
+	"gpio94",
+};
+
+static const char *const aud_refclk0_groups[] = {
+	"gpio100",
+};
+
+static const char *const aud_refclk1_groups[] = {
+	"gpio101",
+};
+
+static const char *const bist_done_groups[] = {
+	"gpio168",
+};
+
+static const char *const ccu_async_in_groups[] = {
+	"gpio45", "gpio176", "gpio177", "gpio178", "gpio179", "gpio180",
+};
+
+static const char *const ccu_i2c_scl_groups[] = {
+	"gpio16", "gpio18", "gpio20", "gpio22", "gpio24",
+	"gpio114", "gpio116", "gpio126", "gpio130", "gpio132",
+};
+
+static const char *const ccu_i2c_sda_groups[] = {
+	"gpio15", "gpio17", "gpio19", "gpio21", "gpio23",
+	"gpio113", "gpio115", "gpio125", "gpio129", "gpio131",
+};
+
+static const char *const ccu_timer_groups[] = {
+	"gpio25", "gpio26", "gpio27", "gpio28", "gpio29", "gpio30",
+	"gpio31", "gpio32", "gpio33", "gpio34", "gpio143", "gpio144",
+	"gpio150", "gpio151", "gpio152", "gpio153",
+};
+
+static const char *const dbg_out_groups[] = {
+	"gpio113",
+};
+
+static const char *const dbg_out_clk_groups[] = {
+	"gpio165",
+};
+
+static const char *const ddr_bist_complete_groups[] = {
+	"gpio37",
+};
+
+static const char *const ddr_bist_fail_groups[] = {
+	"gpio39",
+};
+
+static const char *const ddr_bist_start_groups[] = {
+	"gpio36",
+};
+
+static const char *const ddr_bist_stop_groups[] = {
+	"gpio38",
+};
+
+static const char *const ddr_pxi_groups[] = {
+	"gpio99", "gpio100", "gpio109", "gpio110", "gpio113", "gpio114",
+	"gpio115", "gpio116", "gpio117", "gpio118", "gpio119", "gpio120",
+	"gpio121", "gpio122", "gpio164", "gpio165",
+};
+
+static const char *const dp_rx0_groups[] = {
+	"gpio55", "gpio83", "gpio84",  "gpio85",  "gpio86",
+	"gpio88", "gpio89", "gpio137", "gpio138",
+};
+
+static const char *const dp_rx00_groups[] = {
+	"gpio99",
+};
+
+static const char *const dp_rx01_groups[] = {
+	"gpio100",
+};
+
+static const char *const dp_rx0_mute_groups[] = {
+	"gpio35",
+};
+
+static const char *const edp0_hot_groups[] = {
+	"gpio51",
+};
+
+static const char *const edp0_lcd_groups[] = {
+	"gpio47",
+};
+
+static const char *const edp1_hot_groups[] = {
+	"gpio52",
+};
+
+static const char *const edp1_lcd_groups[] = {
+	"gpio48",
+};
+
+static const char *const edp2_hot_groups[] = {
+	"gpio53",
+};
+
+static const char *const edp2_lcd_groups[] = {
+	"gpio49",
+};
+
+static const char *const emac0_mcg_groups[] = {
+	"gpio16", "gpio17", "gpio18", "gpio19",
+};
+
+static const char *const emac0_mdc_groups[] = {
+	"gpio47",
+};
+
+static const char *const emac0_mdio_groups[] = {
+	"gpio48",
+};
+
+static const char *const emac0_ptp_groups[] = {
+	"gpio133", "gpio134", "gpio135", "gpio136",
+	"gpio139", "gpio140", "gpio141", "gpio142",
+};
+
+static const char *const emac1_mcg_groups[] = {
+	"gpio20", "gpio21", "gpio22", "gpio23",
+};
+
+static const char *const emac1_mdc_groups[] = {
+	"gpio49",
+};
+
+static const char *const emac1_mdio_groups[] = {
+	"gpio50",
+};
+
+static const char *const emac1_ptp_groups[] = {
+	"gpio37", "gpio38", "gpio39", "gpio40",
+	"gpio41", "gpio42", "gpio43", "gpio44",
+};
+
+static const char *const gcc_gp1_clk_groups[] = {
+	"gpio51",
+};
+
+static const char *const gcc_gp2_clk_groups[] = {
+	"gpio52",
+};
+
+static const char *const gcc_gp3_clk_groups[] = {
+	"gpio42",
+};
+
+static const char *const gcc_gp4_clk_groups[] = {
+	"gpio43",
+};
+
+static const char *const gcc_gp5_clk_groups[] = {
+	"gpio105",
+};
+
+static const char *const gcc_gp6_clk_groups[] = {
+	"gpio106",
+};
+
+static const char *const gcc_gp7_clk_groups[] = {
+	"gpio13",
+};
+
+static const char *const gcc_gp8_clk_groups[] = {
+	"gpio14",
+};
+
+static const char *const jitter_bist_groups[] = {
+	"gpio123",
+	"gpio138",
+};
+
+static const char *const lbist_pass_groups[] = {
+	"gpio121",
+};
+
+static const char *const mbist_pass_groups[] = {
+	"gpio122",
+};
+
+static const char *const mdp0_vsync_out_groups[] = {
+	"gpio113", "gpio114", "gpio115", "gpio116", "gpio121", "gpio122",
+	"gpio139", "gpio140", "gpio141", "gpio142", "gpio143",
+};
+
+static const char *const mdp1_vsync_out_groups[] = {
+	"gpio123", "gpio124", "gpio125", "gpio126", "gpio129", "gpio130",
+	"gpio131", "gpio132", "gpio133", "gpio134", "gpio135",
+};
+
+static const char *const mdp_vsync_e_groups[] = {
+	"gpio109",
+};
+
+static const char *const mdp_vsync_p_groups[] = {
+	"gpio110",
+};
+
+static const char *const mdp_vsync_s_groups[] = {
+	"gpio144",
+};
+
+static const char *const pcie0_clk_req_n_groups[] = {
+	"gpio1",
+};
+
+static const char *const pcie1_clk_req_n_groups[] = {
+	"gpio4",
+};
+
+static const char *const pcie2_clk_req_n_groups[] = {
+	"gpio7",
+};
+
+static const char *const pcie3_clk_req_n_groups[] = {
+	"gpio10",
+};
+
+static const char *const phase_flag_groups[] = {
+	"gpio67", "gpio68", "gpio69", "gpio70", "gpio71", "gpio72", "gpio73", "gpio74",
+	"gpio75", "gpio76", "gpio77", "gpio78", "gpio79", "gpio80", "gpio81", "gpio82",
+	"gpio83", "gpio84", "gpio85", "gpio86", "gpio87", "gpio88", "gpio89", "gpio90",
+	"gpio91", "gpio92", "gpio93", "gpio94", "gpio95", "gpio96", "gpio98", "gpio101",
+};
+
+static const char *const pll_bist_sync_groups[] = {
+	"gpio176",
+};
+
+static const char *const pll_clk_aux_groups[] = {
+	"gpio100",
+};
+
+static const char *const prng_rosc0_groups[] = {
+	"gpio117",
+};
+
+static const char *const prng_rosc1_groups[] = {
+	"gpio118",
+};
+
+static const char *const pwrbrk_i_n_groups[] = {
+	"gpio167",
+};
+
+static const char *const qdss_cti_groups[] = {
+	"gpio41",  "gpio42",  "gpio110", "gpio138",
+	"gpio142", "gpio144", "gpio162", "gpio163",
+};
+
+static const char *const qdss_groups[] = {
+	"gpio66", "gpio67", "gpio68", "gpio69", "gpio70", "gpio71", "gpio72",
+	"gpio73", "gpio74", "gpio75", "gpio76", "gpio77", "gpio78", "gpio79",
+	"gpio80", "gpio81", "gpio82", "gpio83", "gpio84", "gpio85", "gpio86",
+	"gpio87", "gpio88", "gpio89", "gpio90", "gpio91", "gpio92", "gpio93",
+	"gpio94", "gpio95", "gpio96", "gpio97", "gpio98", "gpio99", "gpio100",
+	"gpio101",
+};
+
+static const char *const qspi_groups[] = {
+	"gpio102", "gpio103", "gpio104", "gpio105", "gpio106", "gpio107", "gpio108",
+};
+
+static const char *const qup0_se0_groups[] = {
+	"gpio109", "gpio110", "gpio111", "gpio112",
+};
+
+static const char *const qup0_se1_groups[] = {
+	"gpio109", "gpio110", "gpio111", "gpio112",
+};
+
+static const char *const qup0_se2_groups[] = {
+	"gpio113", "gpio114", "gpio115", "gpio116",
+};
+
+static const char *const qup0_se3_groups[] = {
+	"gpio113", "gpio114", "gpio115", "gpio116",
+};
+
+static const char *const qup0_se4_groups[] = {
+	"gpio117", "gpio118", "gpio119", "gpio120",
+};
+
+static const char *const qup0_se5_groups[] = {
+	"gpio109", "gpio110", "gpio121", "gpio122",
+};
+
+static const char *const qup1_se0_groups[] = {
+	"gpio123", "gpio124", "gpio125", "gpio126",
+};
+
+static const char *const qup1_se1_groups[] = {
+	"gpio123", "gpio124", "gpio125", "gpio126",
+};
+
+static const char *const qup1_se2_01_groups[] = {
+	"gpio127", "gpio128",
+};
+
+static const char *const qup1_se2_23_groups[] = {
+	"gpio127", "gpio128",
+};
+
+static const char *const qup1_se3_01_groups[] = {
+	"gpio129", "gpio130",
+};
+
+static const char *const qup1_se3_23_groups[] = {
+	"gpio129", "gpio130",
+};
+
+static const char *const qup1_se4_groups[] = {
+	"gpio131", "gpio132", "gpio137", "gpio138",
+};
+
+static const char *const qup1_se5_groups[] = {
+	"gpio133", "gpio134", "gpio135", "gpio136",
+};
+
+static const char *const qup1_se6_groups[] = {
+	"gpio131", "gpio132", "gpio137", "gpio138",
+};
+
+static const char *const qup2_se0_groups[] = {
+	"gpio139", "gpio140", "gpio141", "gpio142",
+};
+
+static const char *const qup2_se1_groups[] = {
+	"gpio143", "gpio144", "gpio154", "gpio155",
+};
+
+static const char *const qup2_se2_groups[] = {
+	"gpio145", "gpio146", "gpio147", "gpio148", "gpio149",
+};
+
+static const char *const qup2_se3_groups[] = {
+	"gpio150", "gpio151", "gpio152", "gpio153",
+};
+
+static const char *const qup2_se4_groups[] = {
+	"gpio143", "gpio144", "gpio150", "gpio151",
+	"gpio152", "gpio154", "gpio155",
+};
+
+static const char *const qup2_se5_groups[] = {
+	"gpio156", "gpio157", "gpio158", "gpio159",
+};
+
+static const char *const qup2_se6_groups[] = {
+	"gpio156", "gpio157", "gpio158", "gpio159",
+};
+
+static const char *const qup3_se0_mira_groups[] = {
+	"gpio102", "gpio103", "gpio104", "gpio105", "gpio106", "gpio107",
+	"gpio108",
+};
+
+static const char *const qup3_se0_mirb_groups[] = {
+	"gpio102", "gpio103",
+};
+
+static const char *const sailss_ospi_groups[] = {
+	"gpio164",
+	"gpio165",
+};
+
+static const char *const sdc4_groups[] = {
+	"gpio170",
+	"gpio171",
+	"gpio172",
+	"gpio173",
+};
+
+static const char *const sdc4_clk_groups[] = {
+	"gpio175",
+};
+
+static const char *const sdc4_cmd_groups[] = {
+	"gpio174",
+};
+
+static const char *const smb_alert_groups[] = {
+	"gpio110",
+};
+
+static const char *const smb_alert_n_groups[] = {
+	"gpio109",
+};
+
+static const char *const smb_clk_groups[] = {
+	"gpio112",
+};
+
+static const char *const smb_dat_groups[] = {
+	"gpio111",
+};
+
+static const char *const tb_trig_sdc4_groups[] = {
+	"gpio169",
+};
+
+static const char *const tmess_prng0_groups[] = {
+	"gpio94",
+};
+
+static const char *const tmess_prng1_groups[] = {
+	"gpio95",
+};
+
+static const char *const tsc_timer_groups[] = {
+	"gpio25", "gpio26", "gpio27", "gpio28", "gpio29",
+	"gpio30", "gpio31", "gpio32", "gpio33", "gpio34",
+};
+
+static const char *const tsense_clm_groups[] = {
+	"gpio36", "gpio37", "gpio38", "gpio43", "gpio44", "gpio45", "gpio46",
+};
+
+static const char *const tsense_pwm_groups[] = {
+	"gpio43", "gpio44", "gpio45", "gpio46", "gpio47", "gpio48", "gpio49",
+	"gpio50",
+};
+
+static const char *const usb0_hs_groups[] = {
+	"gpio12",
+};
+
+static const char *const usb0_phy_ps_groups[] = {
+	"gpio164",
+};
+
+static const char *const usb1_hs_groups[] = {
+	"gpio13",
+};
+
+static const char *const usb1_phy_ps_groups[] = {
+	"gpio165",
+};
+
+static const char *const usb2_hs_groups[] = {
+	"gpio14",
+};
+
+static const char *const usxgmii0_phy_groups[] = {
+	"gpio45",
+};
+
+static const char *const usxgmii1_phy_groups[] = {
+	"gpio46",
+};
+
+static const char *const vsense_trigger_mirnat_groups[] = {
+	"gpio132",
+};
+
+static const char *const wcn_sw_groups[] = {
+	"gpio161",
+};
+
+static const char *const wcn_sw_ctrl_groups[] = {
+	"gpio160",
+};
+
+static const struct pinfunction seca_functions[] = {
+	MSM_GPIO_PIN_FUNCTION(gpio),
+	MSM_PIN_FUNCTION(aoss_cti),
+	MSM_PIN_FUNCTION(atest_char),
+	MSM_PIN_FUNCTION(atest_usb20),
+	MSM_PIN_FUNCTION(atest_usb21),
+	MSM_PIN_FUNCTION(aud_intfc0_clk),
+	MSM_PIN_FUNCTION(aud_intfc0_data),
+	MSM_PIN_FUNCTION(aud_intfc0_ws),
+	MSM_PIN_FUNCTION(aud_intfc10_clk),
+	MSM_PIN_FUNCTION(aud_intfc10_data),
+	MSM_PIN_FUNCTION(aud_intfc10_ws),
+	MSM_PIN_FUNCTION(aud_intfc1_clk),
+	MSM_PIN_FUNCTION(aud_intfc1_data),
+	MSM_PIN_FUNCTION(aud_intfc1_ws),
+	MSM_PIN_FUNCTION(aud_intfc2_clk),
+	MSM_PIN_FUNCTION(aud_intfc2_data),
+	MSM_PIN_FUNCTION(aud_intfc2_ws),
+	MSM_PIN_FUNCTION(aud_intfc3_clk),
+	MSM_PIN_FUNCTION(aud_intfc3_data),
+	MSM_PIN_FUNCTION(aud_intfc3_ws),
+	MSM_PIN_FUNCTION(aud_intfc4_clk),
+	MSM_PIN_FUNCTION(aud_intfc4_data),
+	MSM_PIN_FUNCTION(aud_intfc4_ws),
+	MSM_PIN_FUNCTION(aud_intfc5_clk),
+	MSM_PIN_FUNCTION(aud_intfc5_data),
+	MSM_PIN_FUNCTION(aud_intfc5_ws),
+	MSM_PIN_FUNCTION(aud_intfc6_clk),
+	MSM_PIN_FUNCTION(aud_intfc6_data),
+	MSM_PIN_FUNCTION(aud_intfc6_ws),
+	MSM_PIN_FUNCTION(aud_intfc7_clk),
+	MSM_PIN_FUNCTION(aud_intfc7_data),
+	MSM_PIN_FUNCTION(aud_intfc7_ws),
+	MSM_PIN_FUNCTION(aud_intfc8_clk),
+	MSM_PIN_FUNCTION(aud_intfc8_data),
+	MSM_PIN_FUNCTION(aud_intfc8_ws),
+	MSM_PIN_FUNCTION(aud_intfc9_clk),
+	MSM_PIN_FUNCTION(aud_intfc9_data),
+	MSM_PIN_FUNCTION(aud_intfc9_ws),
+	MSM_PIN_FUNCTION(aud_mclk0_mira),
+	MSM_PIN_FUNCTION(aud_mclk0_mirb),
+	MSM_PIN_FUNCTION(aud_mclk1_mira),
+	MSM_PIN_FUNCTION(aud_mclk1_mirb),
+	MSM_PIN_FUNCTION(aud_mclk2_mira),
+	MSM_PIN_FUNCTION(aud_mclk2_mirb),
+	MSM_PIN_FUNCTION(aud_refclk0),
+	MSM_PIN_FUNCTION(aud_refclk1),
+	MSM_PIN_FUNCTION(bist_done),
+	MSM_PIN_FUNCTION(ccu_async_in),
+	MSM_PIN_FUNCTION(ccu_i2c_scl),
+	MSM_PIN_FUNCTION(ccu_i2c_sda),
+	MSM_PIN_FUNCTION(ccu_timer),
+	MSM_PIN_FUNCTION(dbg_out),
+	MSM_PIN_FUNCTION(dbg_out_clk),
+	MSM_PIN_FUNCTION(ddr_bist_complete),
+	MSM_PIN_FUNCTION(ddr_bist_fail),
+	MSM_PIN_FUNCTION(ddr_bist_start),
+	MSM_PIN_FUNCTION(ddr_bist_stop),
+	MSM_PIN_FUNCTION(ddr_pxi),
+	MSM_PIN_FUNCTION(dp_rx0),
+	MSM_PIN_FUNCTION(dp_rx00),
+	MSM_PIN_FUNCTION(dp_rx01),
+	MSM_PIN_FUNCTION(dp_rx0_mute),
+	MSM_PIN_FUNCTION(edp0_hot),
+	MSM_PIN_FUNCTION(edp0_lcd),
+	MSM_PIN_FUNCTION(edp1_hot),
+	MSM_PIN_FUNCTION(edp1_lcd),
+	MSM_PIN_FUNCTION(edp2_hot),
+	MSM_PIN_FUNCTION(edp2_lcd),
+	MSM_PIN_FUNCTION(emac0_mcg),
+	MSM_PIN_FUNCTION(emac0_mdc),
+	MSM_PIN_FUNCTION(emac0_mdio),
+	MSM_PIN_FUNCTION(emac0_ptp),
+	MSM_PIN_FUNCTION(emac1_mcg),
+	MSM_PIN_FUNCTION(emac1_mdc),
+	MSM_PIN_FUNCTION(emac1_mdio),
+	MSM_PIN_FUNCTION(emac1_ptp),
+	MSM_PIN_FUNCTION(gcc_gp1_clk),
+	MSM_PIN_FUNCTION(gcc_gp2_clk),
+	MSM_PIN_FUNCTION(gcc_gp3_clk),
+	MSM_PIN_FUNCTION(gcc_gp4_clk),
+	MSM_PIN_FUNCTION(gcc_gp5_clk),
+	MSM_PIN_FUNCTION(gcc_gp6_clk),
+	MSM_PIN_FUNCTION(gcc_gp7_clk),
+	MSM_PIN_FUNCTION(gcc_gp8_clk),
+	MSM_PIN_FUNCTION(jitter_bist),
+	MSM_PIN_FUNCTION(lbist_pass),
+	MSM_PIN_FUNCTION(mbist_pass),
+	MSM_PIN_FUNCTION(mdp0_vsync_out),
+	MSM_PIN_FUNCTION(mdp1_vsync_out),
+	MSM_PIN_FUNCTION(mdp_vsync_e),
+	MSM_PIN_FUNCTION(mdp_vsync_p),
+	MSM_PIN_FUNCTION(mdp_vsync_s),
+	MSM_PIN_FUNCTION(pcie0_clk_req_n),
+	MSM_PIN_FUNCTION(pcie1_clk_req_n),
+	MSM_PIN_FUNCTION(pcie2_clk_req_n),
+	MSM_PIN_FUNCTION(pcie3_clk_req_n),
+	MSM_PIN_FUNCTION(phase_flag),
+	MSM_PIN_FUNCTION(pll_bist_sync),
+	MSM_PIN_FUNCTION(pll_clk_aux),
+	MSM_PIN_FUNCTION(prng_rosc0),
+	MSM_PIN_FUNCTION(prng_rosc1),
+	MSM_PIN_FUNCTION(pwrbrk_i_n),
+	MSM_PIN_FUNCTION(qdss_cti),
+	MSM_PIN_FUNCTION(qdss),
+	MSM_PIN_FUNCTION(qspi),
+	MSM_PIN_FUNCTION(qup0_se0),
+	MSM_PIN_FUNCTION(qup0_se1),
+	MSM_PIN_FUNCTION(qup0_se2),
+	MSM_PIN_FUNCTION(qup0_se3),
+	MSM_PIN_FUNCTION(qup0_se4),
+	MSM_PIN_FUNCTION(qup0_se5),
+	MSM_PIN_FUNCTION(qup1_se0),
+	MSM_PIN_FUNCTION(qup1_se1),
+	MSM_PIN_FUNCTION(qup1_se2_01),
+	MSM_PIN_FUNCTION(qup1_se2_23),
+	MSM_PIN_FUNCTION(qup1_se3_01),
+	MSM_PIN_FUNCTION(qup1_se3_23),
+	MSM_PIN_FUNCTION(qup1_se4),
+	MSM_PIN_FUNCTION(qup1_se5),
+	MSM_PIN_FUNCTION(qup1_se6),
+	MSM_PIN_FUNCTION(qup2_se0),
+	MSM_PIN_FUNCTION(qup2_se1),
+	MSM_PIN_FUNCTION(qup2_se2),
+	MSM_PIN_FUNCTION(qup2_se3),
+	MSM_PIN_FUNCTION(qup2_se4),
+	MSM_PIN_FUNCTION(qup2_se5),
+	MSM_PIN_FUNCTION(qup2_se6),
+	MSM_PIN_FUNCTION(qup3_se0_mira),
+	MSM_PIN_FUNCTION(qup3_se0_mirb),
+	MSM_PIN_FUNCTION(sailss_ospi),
+	MSM_PIN_FUNCTION(sdc4),
+	MSM_PIN_FUNCTION(sdc4_clk),
+	MSM_PIN_FUNCTION(sdc4_cmd),
+	MSM_PIN_FUNCTION(smb_alert),
+	MSM_PIN_FUNCTION(smb_alert_n),
+	MSM_PIN_FUNCTION(smb_clk),
+	MSM_PIN_FUNCTION(smb_dat),
+	MSM_PIN_FUNCTION(tb_trig_sdc4),
+	MSM_PIN_FUNCTION(tmess_prng0),
+	MSM_PIN_FUNCTION(tmess_prng1),
+	MSM_PIN_FUNCTION(tsc_timer),
+	MSM_PIN_FUNCTION(tsense_clm),
+	MSM_PIN_FUNCTION(tsense_pwm),
+	MSM_PIN_FUNCTION(usb0_hs),
+	MSM_PIN_FUNCTION(usb0_phy_ps),
+	MSM_PIN_FUNCTION(usb1_hs),
+	MSM_PIN_FUNCTION(usb1_phy_ps),
+	MSM_PIN_FUNCTION(usb2_hs),
+	MSM_PIN_FUNCTION(usxgmii0_phy),
+	MSM_PIN_FUNCTION(usxgmii1_phy),
+	MSM_PIN_FUNCTION(vsense_trigger_mirnat),
+	MSM_PIN_FUNCTION(wcn_sw),
+	MSM_PIN_FUNCTION(wcn_sw_ctrl),
+};
+
+static const struct msm_pingroup seca_groups[] = {
+	[0] = PINGROUP(0, _, _, _, _, _, _, _, _, _, _, _),
+	[1] = PINGROUP(1, pcie0_clk_req_n, _, _, _, _, _, _, _, _, _, _),
+	[2] = PINGROUP(2, _, _, _, _, _, _, _, _, _, _, _),
+	[3] = PINGROUP(3, _, _, _, _, _, _, _, _, _, _, _),
+	[4] = PINGROUP(4, pcie1_clk_req_n, _, _, _, _, _, _, _, _, _, _),
+	[5] = PINGROUP(5, _, _, _, _, _, _, _, _, _, _, _),
+	[6] = PINGROUP(6, _, _, _, _, _, _, _, _, _, _, _),
+	[7] = PINGROUP(7, pcie2_clk_req_n, _, _, _, _, _, _, _, _, _, _),
+	[8] = PINGROUP(8, _, _, _, _, _, _, _, _, _, _, _),
+	[9] = PINGROUP(9, _, _, _, _, _, _, _, _, _, _, _),
+	[10] = PINGROUP(10, pcie3_clk_req_n, _, _, _, _, _, _, _, _, _, _),
+	[11] = PINGROUP(11, _, _, _, _, _, _, _, _, _, _, _),
+	[12] = PINGROUP(12, usb0_hs, _, _, _, _, _, _, _, _, _, _),
+	[13] = PINGROUP(13, usb1_hs, gcc_gp7_clk, _, _, _, _, _, _, _, _, _),
+	[14] = PINGROUP(14, usb2_hs, gcc_gp8_clk, _, _, _, _, _, _, _, _, _),
+	[15] = PINGROUP(15, ccu_i2c_sda, _, _, _, _, _, _, _, _, _, _),
+	[16] = PINGROUP(16, ccu_i2c_scl, emac0_mcg, _, _, _, _, _, _, _, _, _),
+	[17] = PINGROUP(17, ccu_i2c_sda, emac0_mcg, _, _, _, _, _, _, _, _, _),
+	[18] = PINGROUP(18, ccu_i2c_scl, emac0_mcg, _, _, _, _, _, _, _, _, _),
+	[19] = PINGROUP(19, ccu_i2c_sda, emac0_mcg, _, _, _, _, _, _, _, _, _),
+	[20] = PINGROUP(20, ccu_i2c_scl, emac1_mcg, _, _, _, _, _, _, _, _, _),
+	[21] = PINGROUP(21, ccu_i2c_sda, emac1_mcg, _, _, _, _, _, _, _, _, _),
+	[22] = PINGROUP(22, ccu_i2c_scl, emac1_mcg, _, _, _, _, _, _, _, _, _),
+	[23] = PINGROUP(23, ccu_i2c_sda, emac1_mcg, _, _, _, _, _, _, _, _, _),
+	[24] = PINGROUP(24, ccu_i2c_scl, _, _, _, _, _, _, _, _, _, _),
+	[25] = PINGROUP(25, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
+	[26] = PINGROUP(26, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
+	[27] = PINGROUP(27, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
+	[28] = PINGROUP(28, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
+	[29] = PINGROUP(29, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
+	[30] = PINGROUP(30, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
+	[31] = PINGROUP(31, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
+	[32] = PINGROUP(32, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
+	[33] = PINGROUP(33, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
+	[34] = PINGROUP(34, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, dp_rx0_mute, _, _, _, _, _, _, _, _, _, _),
+	[36] = PINGROUP(36, ddr_bist_start, tsense_clm, _, _, _, _, _, _, _, _, _),
+	[37] = PINGROUP(37, emac1_ptp, ddr_bist_complete, tsense_clm, _, _, _, _, _, _, _, _),
+	[38] = PINGROUP(38, emac1_ptp, ddr_bist_stop, tsense_clm, _, _, _, _, _, _, _, _),
+	[39] = PINGROUP(39, emac1_ptp, ddr_bist_fail, _, _, _, _, _, _, _, _, _),
+	[40] = PINGROUP(40, emac1_ptp, _, _, _, _, _, _, _, _, _, _),
+	[41] = PINGROUP(41, emac1_ptp, qdss_cti, _, _, _, _, _, _, _, _, _),
+	[42] = PINGROUP(42, emac1_ptp, qdss_cti, gcc_gp3_clk, _, _, _, _, _, _, _, _),
+	[43] = PINGROUP(43, emac1_ptp, gcc_gp4_clk, tsense_clm, tsense_pwm, _, _, _, _, _, _, _),
+	[44] = PINGROUP(44, emac1_ptp, tsense_clm, tsense_pwm, _, _, _, _, _, _, _, _),
+	[45] = PINGROUP(45, usxgmii0_phy, ccu_async_in, tsense_clm, tsense_pwm, _, _, _, _, _, _,
+			_),
+	[46] = PINGROUP(46, usxgmii1_phy, tsense_clm, tsense_pwm, _, _, _, _, _, _, _, _),
+	[47] = PINGROUP(47, emac0_mdc, edp0_lcd, tsense_pwm, _, _, _, _, _, _, _, _),
+	[48] = PINGROUP(48, emac0_mdio, edp1_lcd, tsense_pwm, _, _, _, _, _, _, _, _),
+	[49] = PINGROUP(49, emac1_mdc, edp2_lcd, tsense_pwm, _, _, _, _, _, _, _, _),
+	[50] = PINGROUP(50, emac1_mdio, tsense_pwm, _, _, _, _, _, _, _, _, _),
+	[51] = PINGROUP(51, edp0_hot, aoss_cti, gcc_gp1_clk, _, _, _, _, _, _, _, _),
+	[52] = PINGROUP(52, edp1_hot, aoss_cti, gcc_gp2_clk, _, _, _, _, _, _, _, _),
+	[53] = PINGROUP(53, edp2_hot, aoss_cti, _, _, _, _, _, _, _, _, _),
+	[54] = PINGROUP(54, aoss_cti, _, _, _, _, _, _, _, _, _, _),
+	[55] = PINGROUP(55, dp_rx0, _, _, _, _, _, _, _, _, _, _),
+	[56] = PINGROUP(56, _, _, _, _, _, _, _, _, _, _, _),
+	[57] = PINGROUP(57, aud_intfc0_clk, _, _, _, _, _, _, _, _, _, _),
+	[58] = PINGROUP(58, aud_intfc0_ws, _, _, _, _, _, _, _, _, _, _),
+	[59] = PINGROUP(59, aud_intfc0_data, _, _, _, _, _, _, _, _, _, _),
+	[60] = PINGROUP(60, aud_intfc0_data, _, _, _, _, _, _, _, _, _, _),
+	[61] = PINGROUP(61, aud_intfc0_data, aud_intfc10_clk, _, _, _, _, _, _, _, _, _),
+	[62] = PINGROUP(62, aud_intfc0_data, aud_intfc10_ws, _, _, _, _, _, _, _, _, _),
+	[63] = PINGROUP(63, aud_intfc0_data, aud_intfc7_clk, _, _, _, _, _, _, _, _, _),
+	[64] = PINGROUP(64, aud_intfc0_data, aud_intfc7_ws, _, _, _, _, _, _, _, _, _),
+	[65] = PINGROUP(65, aud_intfc0_data, aud_intfc7_data, _, _, _, _, _, _, _, _, _),
+	[66] = PINGROUP(66, aud_intfc0_data, aud_intfc7_data, qdss, _, _, _, _, _, _, _, _),
+	[67] = PINGROUP(67, aud_intfc1_clk, phase_flag, _, qdss, _, _, _, _, _, _, _),
+	[68] = PINGROUP(68, aud_intfc1_ws, phase_flag, _, qdss, _, _, _, _, _, _, _),
+	[69] = PINGROUP(69, aud_intfc1_data, phase_flag, _, qdss, _, _, _, _, _, _, _),
+	[70] = PINGROUP(70, aud_intfc1_data, aud_intfc9_clk, phase_flag, _, qdss, _, _, _, _, _, _),
+	[71] = PINGROUP(71, aud_intfc1_data, aud_intfc9_ws, phase_flag, _, qdss, _, _, _, _, _, _),
+	[72] = PINGROUP(72, aud_intfc1_data, aud_intfc9_data, phase_flag, _, qdss, _, _, _, _, _,
+			_),
+	[73] = PINGROUP(73, aud_intfc1_data, aud_intfc8_clk, phase_flag, _, qdss, _, _, _, _, _, _),
+	[74] = PINGROUP(74, aud_intfc1_data, aud_intfc8_ws, phase_flag, _, qdss, _, _, _, _, _, _),
+	[75] = PINGROUP(75, aud_intfc1_data, aud_intfc8_data, phase_flag, _, qdss, _, _, _, _, _,
+			_),
+	[76] = PINGROUP(76, aud_intfc1_data, aud_intfc8_data, phase_flag, _, qdss, _, _, _, _, _,
+			_),
+	[77] = PINGROUP(77, aud_intfc2_clk, phase_flag, _, qdss, _, _, _, _, _, _, _),
+	[78] = PINGROUP(78, aud_intfc2_ws, phase_flag, _, qdss, _, _, _, _, _, _, _),
+	[79] = PINGROUP(79, aud_intfc2_data, phase_flag, _, qdss, _, _, _, _, _, _, _),
+	[80] = PINGROUP(80, aud_intfc2_data, phase_flag, _, _, qdss, _, _, _, _, _, _),
+	[81] = PINGROUP(81, aud_intfc2_data, aud_intfc10_data, phase_flag, _, _, qdss, _, _, _, _,
+			_),
+	[82] = PINGROUP(82, aud_intfc2_data, aud_intfc10_data, phase_flag, _, qdss, _, _, _, _, _,
+			_),
+	[83] = PINGROUP(83, aud_intfc3_clk, dp_rx0, phase_flag, _, qdss, _, _, _, _, _, _),
+	[84] = PINGROUP(84, aud_intfc3_ws, dp_rx0, phase_flag, _, qdss, _, _, _, _, _, _),
+	[85] = PINGROUP(85, aud_intfc3_data, dp_rx0, phase_flag, _, qdss, _, _, _, _, _, _),
+	[86] = PINGROUP(86, aud_intfc3_data, aud_mclk0_mirb, dp_rx0, phase_flag, _, qdss, _, _, _,
+			_, _),
+	[87] = PINGROUP(87, aud_intfc4_clk, phase_flag, _, qdss, _, _, _, _, _, _, _),
+	[88] = PINGROUP(88, aud_intfc4_ws, dp_rx0, phase_flag, _, qdss, _, _, _, _, _, _),
+	[89] = PINGROUP(89, aud_intfc4_data, dp_rx0, phase_flag, _, qdss, _, _, _, _, _, _),
+	[90] = PINGROUP(90, aud_intfc4_data, aud_mclk1_mirb, phase_flag, _, qdss, _, _, _, _, _, _),
+	[91] = PINGROUP(91, aud_intfc5_clk, phase_flag, _, qdss, _, _, _, _, _, _, _),
+	[92] = PINGROUP(92, aud_intfc5_ws, phase_flag, _, qdss, _, _, _, _, _, _, _),
+	[93] = PINGROUP(93, aud_intfc5_data, phase_flag, _, qdss, _, _, _, _, _, _, _),
+	[94] = PINGROUP(94, aud_intfc5_data, aud_mclk2_mirb, phase_flag, tmess_prng0, _, qdss, _, _,
+			_, _, _),
+	[95] = PINGROUP(95, aud_intfc6_clk, phase_flag, tmess_prng1, _, qdss, _, _, _, _, _, _),
+	[96] = PINGROUP(96, aud_intfc6_ws, phase_flag, _, qdss, _, _, _, _, _, _, _),
+	[97] = PINGROUP(97, aud_intfc6_data, qdss, _, _, _, _, _, _, _, _, _),
+	[98] = PINGROUP(98, aud_intfc6_data, phase_flag, _, qdss, _, _, _, _, _, _, _),
+	[99] = PINGROUP(99, aud_mclk0_mira, qdss, dp_rx00, ddr_pxi, _, _, _, _, _, _, _),
+	[100] = PINGROUP(100, aud_mclk1_mira, aud_refclk0, pll_clk_aux, qdss, dp_rx01, ddr_pxi, _,
+			 _, _, _, _),
+	[101] = PINGROUP(101, aud_mclk2_mira, aud_refclk1, phase_flag, _, qdss, _, _, _, _, _, _),
+	[102] = PINGROUP(102, qspi, qup3_se0_mira, qup3_se0_mirb, _, _, _, _, _, _, _, _),
+	[103] = PINGROUP(103, qspi, qup3_se0_mira, qup3_se0_mirb, _, _, _, _, _, _, _, _),
+	[104] = PINGROUP(104, qspi, qup3_se0_mira, _, _, _, _, _, _, _, _, _),
+	[105] = PINGROUP(105, qspi, qup3_se0_mira, gcc_gp5_clk, _, _, _, _, _, _, _, _),
+	[106] = PINGROUP(106, qspi, qup3_se0_mira, gcc_gp6_clk, _, _, _, _, _, _, _, _),
+	[107] = PINGROUP(107, qspi, qup3_se0_mira, _, _, _, _, _, _, _, _, _),
+	[108] = PINGROUP(108, qspi, qup3_se0_mira, _, _, _, _, _, _, _, _, _),
+	[109] = PINGROUP(109, qup0_se0, qup0_se1, qup0_se5, mdp_vsync_e, smb_alert_n, _, ddr_pxi, _,
+			 _, _, _),
+	[110] = PINGROUP(110, qup0_se0, qup0_se1, qup0_se5, qdss_cti, mdp_vsync_p, smb_alert, _,
+			 ddr_pxi, _, _, _),
+	[111] = PINGROUP(111, qup0_se1, qup0_se0, smb_dat, _, _, _, _, _, _, _, _),
+	[112] = PINGROUP(112, qup0_se1, qup0_se0, smb_clk, _, _, _, _, _, _, _, _),
+	[113] = PINGROUP(113, qup0_se2, qup0_se3, ccu_i2c_sda, mdp0_vsync_out, dbg_out, ddr_pxi, _,
+			 _, _, _, _),
+	[114] = PINGROUP(114, qup0_se2, qup0_se3, ccu_i2c_scl, mdp0_vsync_out, _, ddr_pxi, _, _, _,
+			 _, _),
+	[115] = PINGROUP(115, qup0_se3, qup0_se2, ccu_i2c_sda, mdp0_vsync_out, _, ddr_pxi, _, _, _,
+			 _, _),
+	[116] = PINGROUP(116, qup0_se3, qup0_se2, ccu_i2c_scl, mdp0_vsync_out, _, ddr_pxi, _, _, _,
+			 _, _),
+	[117] = PINGROUP(117, qup0_se4, prng_rosc0, _, ddr_pxi, _, _, _, _, _, _, _),
+	[118] = PINGROUP(118, qup0_se4, prng_rosc1, _, ddr_pxi, _, _, _, _, _, _, _),
+	[119] = PINGROUP(119, qup0_se4, _, ddr_pxi, _, _, _, _, _, _, _, _),
+	[120] = PINGROUP(120, qup0_se4, _, ddr_pxi, _, _, _, _, _, _, _, _),
+	[121] = PINGROUP(121, qup0_se5, lbist_pass, mdp0_vsync_out, _, ddr_pxi, _, _, _, _, _, _),
+	[122] = PINGROUP(122, qup0_se5, mbist_pass, mdp0_vsync_out, _, ddr_pxi, _, _, _, _, _, _),
+	[123] = PINGROUP(123, qup1_se0, qup1_se1, mdp1_vsync_out, jitter_bist, _, _, _, _, _, _, _),
+	[124] = PINGROUP(124, qup1_se0, qup1_se1, mdp1_vsync_out, _, _, _, _, _, _, _, _),
+	[125] = PINGROUP(125, qup1_se1, qup1_se0, ccu_i2c_sda, mdp1_vsync_out, _, _, _, _, _, _, _),
+	[126] = PINGROUP(126, qup1_se1, qup1_se0, ccu_i2c_scl, mdp1_vsync_out, _, atest_usb20, _, _,
+			 _, _, _),
+	[127] = PINGROUP(127, qup1_se2_23, qup1_se2_01, _, atest_usb21, _, _, _, _, _, _, _),
+	[128] = PINGROUP(128, qup1_se2_23, qup1_se2_01, _, atest_usb20, _, _, _, _, _, _, _),
+	[129] = PINGROUP(129, qup1_se3_23, qup1_se3_01, ccu_i2c_sda, mdp1_vsync_out, _, atest_usb21,
+			 _, _, _, _, _),
+	[130] = PINGROUP(130, qup1_se3_23, qup1_se3_01, ccu_i2c_scl, mdp1_vsync_out, _, atest_usb20,
+			 _, _, _, _, _),
+	[131] = PINGROUP(131, qup1_se4, qup1_se6, ccu_i2c_sda, mdp1_vsync_out, _, atest_usb21, _, _,
+			 _, _, _),
+	[132] = PINGROUP(132, qup1_se4, qup1_se6, ccu_i2c_scl, mdp1_vsync_out, _,
+			 vsense_trigger_mirnat, _, _, _, _, _),
+	[133] = PINGROUP(133, qup1_se5, emac0_ptp, mdp1_vsync_out, _, _, _, _, _, _, _, _),
+	[134] = PINGROUP(134, qup1_se5, emac0_ptp, mdp1_vsync_out, _, _, _, _, _, _, _, _),
+	[135] = PINGROUP(135, qup1_se5, emac0_ptp, mdp1_vsync_out, _, _, _, _, _, _, _, _),
+	[136] = PINGROUP(136, qup1_se5, emac0_ptp, _, _, _, _, _, _, _, _, _),
+	[137] = PINGROUP(137, qup1_se6, qup1_se4, dp_rx0, _, _, _, _, _, _, _, _),
+	[138] = PINGROUP(138, qup1_se6, qup1_se4, dp_rx0, qdss_cti, jitter_bist, _, _, _, _, _, _),
+	[139] = PINGROUP(139, qup2_se0, emac0_ptp, mdp0_vsync_out, _, _, _, _, _, _, _, _),
+	[140] = PINGROUP(140, qup2_se0, emac0_ptp, mdp0_vsync_out, _, _, _, _, _, _, _, _),
+	[141] = PINGROUP(141, qup2_se0, emac0_ptp, mdp0_vsync_out, _, _, _, _, _, _, _, _),
+	[142] = PINGROUP(142, qup2_se0, emac0_ptp, qdss_cti, mdp0_vsync_out, _, _, _, _, _, _, _),
+	[143] = PINGROUP(143, qup2_se1, qup2_se4, ccu_timer, mdp0_vsync_out, _, _, _, _, _, _, _),
+	[144] = PINGROUP(144, qup2_se1, qup2_se4, ccu_timer, qdss_cti, mdp_vsync_s, _, _, _, _, _,
+			 _),
+	[145] = PINGROUP(145, qup2_se2, _, _, _, _, _, _, _, _, _, _),
+	[146] = PINGROUP(146, qup2_se2, _, _, _, _, _, _, _, _, _, _),
+	[147] = PINGROUP(147, qup2_se2, _, _, _, _, _, _, _, _, _, _),
+	[148] = PINGROUP(148, qup2_se2, _, _, _, _, _, _, _, _, _, _),
+	[149] = PINGROUP(149, qup2_se2, _, _, _, _, _, _, _, _, _, _),
+	[150] = PINGROUP(150, qup2_se3, qup2_se4, ccu_timer, _, _, _, _, _, _, _, _),
+	[151] = PINGROUP(151, qup2_se3, qup2_se4, ccu_timer, _, _, _, _, _, _, _, _),
+	[152] = PINGROUP(152, qup2_se3, qup2_se4, ccu_timer, _, _, _, _, _, _, _, _),
+	[153] = PINGROUP(153, qup2_se3, ccu_timer, _, _, _, _, _, _, _, _, _),
+	[154] = PINGROUP(154, qup2_se4, qup2_se1, _, _, _, _, _, _, _, _, _),
+	[155] = PINGROUP(155, qup2_se4, qup2_se1, _, _, _, _, _, _, _, _, _),
+	[156] = PINGROUP(156, qup2_se5, qup2_se6, _, _, _, _, _, _, _, _, _),
+	[157] = PINGROUP(157, qup2_se5, qup2_se6, _, _, _, _, _, _, _, _, _),
+	[158] = PINGROUP(158, qup2_se6, qup2_se5, _, _, _, _, _, _, _, _, _),
+	[159] = PINGROUP(159, qup2_se6, qup2_se5, _, _, _, _, _, _, _, _, _),
+	[160] = PINGROUP(160, wcn_sw_ctrl, _, _, _, _, _, _, _, _, _, _),
+	[161] = PINGROUP(161, wcn_sw, _, _, _, _, _, _, _, _, _, _),
+	[162] = PINGROUP(162, qdss_cti, _, _, _, _, _, _, _, _, _, _),
+	[163] = PINGROUP(163, qdss_cti, _, _, _, _, _, _, _, _, _, _),
+	[164] = PINGROUP(164, usb0_phy_ps, _, sailss_ospi, ddr_pxi, _, _, _, _, _, _, _),
+	[165] = PINGROUP(165, usb1_phy_ps, dbg_out_clk, sailss_ospi, ddr_pxi, _, _, _, _, _, _, _),
+	[166] = PINGROUP(166, _, _, _, _, _, _, _, _, _, _, _),
+	[167] = PINGROUP(167, pwrbrk_i_n, _, _, _, _, _, _, _, _, _, _),
+	[168] = PINGROUP(168, bist_done, _, _, _, _, _, _, _, _, _, _),
+	[169] = PINGROUP(169, tb_trig_sdc4, _, _, _, _, _, _, _, _, _, _),
+	[170] = PINGROUP(170, sdc4, _, _, _, _, _, _, _, _, _, _),
+	[171] = PINGROUP(171, sdc4, _, _, _, _, _, _, _, _, _, _),
+	[172] = PINGROUP(172, sdc4, _, _, _, _, _, _, _, _, _, _),
+	[173] = PINGROUP(173, sdc4, _, _, _, _, _, _, _, _, _, _),
+	[174] = PINGROUP(174, sdc4_cmd, _, _, _, _, _, _, _, _, _, _),
+	[175] = PINGROUP(175, sdc4_clk, _, _, _, _, _, _, _, _, _, _),
+	[176] = PINGROUP(176, ccu_async_in, pll_bist_sync, atest_char, _, _, _, _, _, _, _, _),
+	[177] = PINGROUP(177, ccu_async_in, atest_char, _, _, _, _, _, _, _, _, _),
+	[178] = PINGROUP(178, ccu_async_in, atest_char, _, _, _, _, _, _, _, _, _),
+	[179] = PINGROUP(179, ccu_async_in, atest_char, _, _, _, _, _, _, _, _, _),
+	[180] = PINGROUP(180, ccu_async_in, atest_char, _, _, _, _, _, _, _, _, _),
+	[181] = UFS_RESET(ufs_reset, 0xbd004, 0xbe000),
+};
+
+static const struct msm_gpio_wakeirq_map seca_pdc_map[] = {
+	{ 0, 67 },    { 1, 68 },    { 2, 82 },	  { 3, 69 },	{ 4, 70 },
+	{ 5, 83 },    { 6, 71 },    { 7, 72 },	  { 8, 84 },	{ 9, 73 },
+	{ 10, 119 },  { 11, 85 },   { 45, 107 },  { 46, 98 },	{ 102, 77 },
+	{ 108, 78 },  { 110, 120 }, { 114, 80 },  { 116, 81 },	{ 120, 117 },
+	{ 124, 108 }, { 126, 99 },  { 128, 100 }, { 132, 101 }, { 138, 87 },
+	{ 142, 88 },  { 144, 89 },  { 153, 90 },  { 157, 91 },	{ 159, 118 },
+	{ 160, 110 }, { 161, 79 },  { 166, 109 }, { 168, 111 },
+};
+
+static const struct msm_pinctrl_soc_data seca_tlmm = {
+	.pins = seca_pins,
+	.npins = ARRAY_SIZE(seca_pins),
+	.functions = seca_functions,
+	.nfunctions = ARRAY_SIZE(seca_functions),
+	.groups = seca_groups,
+	.ngroups = ARRAY_SIZE(seca_groups),
+	.ngpios = 182,
+	.wakeirq_map = seca_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(seca_pdc_map),
+	.egpio_func = 11,
+};
+
+static const struct of_device_id seca_tlmm_of_match[] = {
+	{ .compatible = "qcom,seca-tlmm", },
+	{},
+};
+
+static int seca_tlmm_probe(struct platform_device *pdev)
+{
+	return msm_pinctrl_probe(pdev, &seca_tlmm);
+}
+
+static struct platform_driver seca_tlmm_driver = {
+	.driver = {
+		.name = "seca-tlmm",
+		.of_match_table = seca_tlmm_of_match,
+	},
+	.probe = seca_tlmm_probe,
+};
+
+static int __init seca_tlmm_init(void)
+{
+	return platform_driver_register(&seca_tlmm_driver);
+}
+arch_initcall(seca_tlmm_init);
+
+static void __exit seca_tlmm_exit(void)
+{
+	platform_driver_unregister(&seca_tlmm_driver);
+}
+module_exit(seca_tlmm_exit);
+
+MODULE_DESCRIPTION("QTI Seca TLMM driver");
+MODULE_LICENSE("GPL");
+MODULE_DEVICE_TABLE(of, seca_tlmm_of_match);
-- 
2.43.0

