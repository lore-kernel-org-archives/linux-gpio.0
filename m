Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8290642123F
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853166; cv=none; b=Ihw/jtQ3lKTbCKedUNrkKUWbf9GQpEpJsvP+K8D/taFGBmI1pBVjkDXL9rgL3eLBE0wFktUiVNEiyHs0kvCl9JxqdWQd3fhT8x3xwXmnY+l3pYz/BMYTpiu5u2D4EXvOmkmX/jVD3gJLMedRGTPNxuiZnpUA/yHqt/T7HzeabZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853166; c=relaxed/simple;
	bh=9FPCV87eitw661yJc7gqbrscj5MlCzlDB1E+PFlfCyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XobYffzZRbNlsQnHAPFjF0/XYx43m45I1HASxwzBnwSb3oE0rX/6ipKK01CbxRWlrDbsu4mYlVTzcWge9N5Y/Un6TK8wZTp4/OdnBLQDVP0qSVHyffYeC5rlLze92bMXUhgeH0ksomJ4GGhMycPlen3u49wyDnG4duspSEms9FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZBq8IFp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=feud1py8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZBq8IFp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="feud1py8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXxcf314051
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XYHgBCRZLEB3XoVwSokcAPnaY99rEFsjH7u+mtUXlls=; b=RZBq8IFpwxbYDmxG
	7Sos25G/67+VZyucyv805rbaSQqzgdPQE0d39PcfnmI3z/qArTK5hkVjx/2H6794
	1GrbWk88RfDRlW3EthG891c65RFE24x0FiyMLDm0h4ffaCMklQ4DQBV/dlQg9fse
	YH9KKETwt1l3TMyFaAIOSvq2P4TyfRH9gPqoX1aJH+l/kn0C8N2FJdGBvIWNqL3m
	B28ppjKOPW/W29h+a5wlddmaQmc7anG8d19YHf9jiiG3AebB7Rnfrz5KsREDPGvm
	UVppY2oZ8eTWzmZ4FVmHwAU0ka5YFvd1QRr5x5gOECW+6rOBt6aE1xr1P1vpjthB
	LDAoWQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gak561uvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:52:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so381607a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 10:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853162; x=1788457962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYHgBCRZLEB3XoVwSokcAPnaY99rEFsjH7u+mtUXlls=;
        b=feud1py8P77nX7sSRUU6GgAao9uXLOjJeJmfLoyAVlNZUGC4EAKyGFq1IA/pNFNka9
         x6+a4frGMmt1uuOp007C+JMF9MsIRprQq15U/9yrL057AM73KyW6fbZaZ/vu0KhmnWuW
         aWtnkAvJrZfq+EEMfz9HYNC2td42dF7OvOi8JNoafvGQFEAESdwZTU+X08DfZ4YQSFoe
         FLlo2uzQ3mYo45Ij5VrSC2fPBMRuz+4sgkBLukixhs0Jm/ydYIj4uAnvLAxMqJubmlLO
         2auEbKoB9xgTp0atP3n6C+kGI72iAV87j36TWrZktZsYm7T0sXRmFYaU+5P8s1I0r6xL
         x5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853162; x=1788457962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYHgBCRZLEB3XoVwSokcAPnaY99rEFsjH7u+mtUXlls=;
        b=EL0CduAJ1HTNlkROhosjuB1ut5QJ6d4VwAFg91+C5Wma2651CDKeppna0pxZgRzDIO
         edgY/BZUivkaCiYOXt/Akn0LAfzgLBVN1n3rsYW91b16zfz3quuXU+GBRE++3xudF+QV
         afX4enKl5yYzchYM5rZqWmNU88m8xoRn4bhgMRWX6p28ubTVX9YweoggS3mrbhOKgdQF
         KZPyRPv73EoRaAn8j26fHmh8/mBj2GZMzs5W/yaoTDU041rc3wfQGjBHcAXeGAUY03dc
         StnVZ5ZymQO2iFFm1zAGx6Kf4Mac6xuPYYCiPaAXEzVOC+adtAc/qk745HI4bFY1Knmp
         F2eg==
X-Forwarded-Encrypted: i=1; AHgh+RqAnka6aGxjpHGolH66TN1eu11LvKRvINIZ7VLcvbjqBwNr9p1VELLfHymEWfiQkwMPzfOs+EHCoJNq@vger.kernel.org
X-Gm-Message-State: AFuF++mPXAhHPwRDJk3B0l8LCa8jKAodI+67B3PzMAUM6YvAkKFUsT1b
	rYgFeiZ7KwTtNUIIgW8zdwK5rkP0ziKhH5MqwqDnu0XpK8YYtuhdubFRLnWaSjjIkkayFYvkUz2
	OcoGkSDd59MznPra7w5X0SJCIEnQXoap4T6xaF8LRGJft1D9Kk4Vz4KN6UT67CY5H
X-Gm-Gg: AR+sD10pL1xCbLMd/9XgEZ0NAeG/gYN6+yLLqz4um92x29PuAOMwHhkQq+aSDIMlYu3
	FsVOUdjCopuLI/+uxPukgNCJ+b7+Pojyj+kFohgZr8iwW4UVn++lRhJiPkfYBgO0xUsIlL1VmFK
	76PZYcIBwk/rt89sMiyHyvMFHyCLXPT01z26lcSA4JgG5hNbZXrdlbMd8iBt66pOL04MeKlHtD7
	o4OrS/BdtYmeTba7LTzbqW5pvGKiawn+wbOAWG5EjIGdBuZS58EmvgKzUny1doBcJOXHCYL1QVH
	6Q9F97XGHNJ640s9XhlylHoR6DIvDnuV9j0xbjGsFWgz4vzprd2POGrAGVEEGCZclE6UZHm7hPN
	SCpG73y6psC4u3fNcITJB7Fr0q1UWmf+bcHSBEiwu6ryCDDfDiJZ7vMLq0W38Gq17qmejUY+imW
	o1R9qEvYwkGr5MTiFjCSNyx34=
X-Received: by 2002:a05:6a20:6a29:b0:3d1:be60:281b with SMTP id adf61e73a8af0-3d268ef9eb5mr1275249637.15.1787853162239;
        Thu, 27 Aug 2026 10:52:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a29:b0:3d1:be60:281b with SMTP id adf61e73a8af0-3d268ef9eb5mr1275086637.15.1787853161631;
        Thu, 27 Aug 2026 10:52:41 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:52:41 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:13 +0530
Subject: [PATCH v5 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-10-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=5749;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9FPCV87eitw661yJc7gqbrscj5MlCzlDB1E+PFlfCyc=;
 b=TY+V8SFVuEX+OQTKe4e7vYI961JtP+1FaDJZvDP3eLd8vPdFaIU9/VXdgz/qjVw2ALhuQ2IEm
 h6Syujh2JvoDrAoaczWfiqajzvI9Uj9OatzbmK3WIOBVqlxUw9NYmGh
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXzeiHTpoggGLn
 WkCezehTvmYN1/G7f8JPgq1gNRkWm6lbpUBFk3t8buT94thbdCKN3Vte08S7cdSfaDQOSeravxf
 mOeT0RlNlrWIMskCRbyV+Y+Q9Ea4Hl4=
X-Proofpoint-ORIG-GUID: WH6qf4KsSjG8Yf6pwBOA3Oa7BpuoJ7Oc
X-Proofpoint-GUID: WH6qf4KsSjG8Yf6pwBOA3Oa7BpuoJ7Oc
X-Authority-Analysis: v=2.4 cv=G+Ms1dk5 c=1 sm=1 tr=0 ts=6a90796b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PKuh8qK-LUMqOkA3WUgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX3aaATsE+yf5c
 uF0PByCWrGOv4x2VvL4Gs4Ihpc304PiPydNe3JlS3XQbzQDCAJOQ1pxlnwhUhTEMigNORpAzPke
 DqvnfW99yEMYRNtT+rkyHPrl1eiBO8x0DKE2Z8nAQvD84ilwe+TbalAp0ekaJiTuPSE6EBW3cCW
 o9h7Et2Y8xugj1ZkqejoF0plNjuUEnLW9LVIJ1DMLYMnPygIpVreSgb7qLlOmjchTwt4+hSoCPP
 POcIbaJCQLRnZMK47a9UzoQlHvlVirgrOhwUwoSb5c6YiXlnr78NHFoX21NKbPhtFYMaNrflEIJ
 +KeWqKM0snLpOwegeiFvbcgYL5KclzXPD5G9fCPrU2NvwO9r19Ra0xPetttfNMqvbCf6GpuID+4
 K9fCneHFdVZcCUhwA/NH16DXgD/4CaHGBeYp3EXbR7eXNEwoJxWNLXKGjlRGLohzOPHRpMGQuKt
 f85DcVS7OoFKY5Ml1Jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

Document the Global Clock Controller (GCC) binding and associated
clock/reset IDs for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   |  52 +++++++++++
 include/dt-bindings/clock/qcom,kuno-gcc.h          | 100 +++++++++++++++++++++
 2 files changed, 152 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
new file mode 100644
index 000000000000..7ae37033a1af
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,kuno-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on Kuno
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks and resets on Kuno.
+
+  See also: include/dt-bindings/clock/qcom,kuno-gcc.h
+
+properties:
+  compatible:
+    const: qcom,kuno-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active-only XO source
+      - description: Sleep clock source
+      - description: PCIe pipe clock source
+
+required:
+  - compatible
+  - clocks
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@80000 {
+        compatible = "qcom,kuno-gcc";
+        reg = <0x00080000 0x1f4200>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK_A>,
+                 <&sleep_clk>,
+                 <&pcie_pipe_clk>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,kuno-gcc.h b/include/dt-bindings/clock/qcom,kuno-gcc.h
new file mode 100644
index 000000000000..a237b25a061d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kuno-gcc.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_KUNO_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_KUNO_H
+
+/* GCC clocks */
+#define GPLL0							0
+#define GPLL0_OUT_EVEN						1
+#define GPLL2							2
+#define GPLL3							3
+#define GPLL4							4
+#define GPLL4_OUT_EVEN						5
+#define GCC_EMAC0_AXI_CLK					7
+#define GCC_EMAC0_PHY_AUX_CLK					8
+#define GCC_EMAC0_PHY_AUX_CLK_SRC				9
+#define GCC_EMAC0_PTP_CLK					10
+#define GCC_EMAC0_PTP_CLK_SRC					11
+#define GCC_EMAC0_RGMII_CLK					12
+#define GCC_EMAC0_RGMII_CLK_SRC					13
+#define GCC_EMAC0_SLV_AHB_CLK					14
+#define GCC_EMAC_0_CLKREF_EN					15
+#define GCC_GP1_CLK						16
+#define GCC_GP1_CLK_SRC						17
+#define GCC_GP2_CLK						18
+#define GCC_GP2_CLK_SRC						19
+#define GCC_GP3_CLK						20
+#define GCC_GP3_CLK_SRC						21
+#define GCC_PCIE_0_CLKREF_EN					22
+#define GCC_PCIE_AUX_CLK					23
+#define GCC_PCIE_AUX_CLK_SRC					24
+#define GCC_PCIE_AUX_PHY_CLK_SRC				25
+#define GCC_PCIE_CFG_AHB_CLK					26
+#define GCC_PCIE_MSTR_AXI_CLK					27
+#define GCC_PCIE_PIPE_CLK					28
+#define GCC_PCIE_PIPE_CLK_SRC					29
+#define GCC_PCIE_RCHNG_PHY_CLK					30
+#define GCC_PCIE_RCHNG_PHY_CLK_SRC				31
+#define GCC_PCIE_SLEEP_CLK					32
+#define GCC_PCIE_SLV_AXI_CLK					33
+#define GCC_PCIE_SLV_Q2A_AXI_CLK				34
+#define GCC_PDM2_CLK						35
+#define GCC_PDM2_CLK_SRC					36
+#define GCC_PDM_AHB_CLK						37
+#define GCC_PDM_XO4_CLK						38
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				39
+#define GCC_QUPV3_WRAP0_CORE_CLK				40
+#define GCC_QUPV3_WRAP0_S0_CLK					41
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				42
+#define GCC_QUPV3_WRAP0_S1_CLK					43
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				44
+#define GCC_QUPV3_WRAP0_S2_CLK					45
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				46
+#define GCC_QUPV3_WRAP0_S3_CLK					47
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				48
+#define GCC_QUPV3_WRAP0_S4_CLK					49
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				50
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				51
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				52
+#define GCC_SDCC4_AHB_CLK					53
+#define GCC_SDCC4_APPS_CLK					54
+#define GCC_SDCC4_APPS_CLK_SRC					55
+#define GCC_SNOC_CNOC_USB3_CLK					56
+#define GCC_SYS_NOC_USB_SF_AXI_CLK				57
+#define GCC_USB20_MASTER_CLK					58
+#define GCC_USB20_MASTER_CLK_SRC				59
+#define GCC_USB20_MOCK_UTMI_CLK					60
+#define GCC_USB20_MOCK_UTMI_CLK_SRC				61
+#define GCC_USB20_MOCK_UTMI_POSTDIV_CLK_SRC			62
+#define GCC_USB20_SLEEP_CLK					63
+#define GCC_USB2_CLKREF_EN					64
+#define GCC_USB3_PRIM_CLKREF_EN					65
+#define GCC_USB_PHY_CFG_AHB2PHY_CLK				66
+#define GCC_BOOT_ROM_AHB_CLK					68
+
+/* GCC power domains */
+#define GCC_EMAC0_GDSC						0
+#define GCC_PCIE_GDSC						1
+#define GCC_USB20_GDSC						2
+
+/* GCC resets */
+#define GCC_EMAC0_BCR						0
+#define GCC_PCIE_BCR						1
+#define GCC_PCIE_LINK_DOWN_BCR					2
+#define GCC_PCIE_NOCSR_COM_PHY_BCR				3
+#define GCC_PCIE_PHY_BCR					4
+#define GCC_PCIE_PHY_CFG_AHB_BCR				5
+#define GCC_PCIE_PHY_COM_BCR					6
+#define GCC_PCIE_PHY_NOCSR_COM_PHY_BCR				7
+#define GCC_PDM_BCR						8
+#define GCC_QUPV3_WRAPPER_0_BCR					9
+#define GCC_QUSB2PHY_BCR					10
+#define GCC_SDCC4_BCR						11
+#define GCC_TCSR_PCIE_BCR					12
+#define GCC_USB20_BCR						13
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				14
+
+#endif

-- 
2.43.0

