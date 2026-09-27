Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5021E29B200
	for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2026 01:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790471368; cv=none; b=PAziKWmg0sSGp1Dypbhpk/nQVTyoq63LxzgpLycHtGzXUEUh6W2fk66VmTOulHE9GBidrrJHy+Q2KpHEjRMRIDxJQqCKA4ghJ6l0Lk5NZhR84MFMc9/uioYFN+74X4/0UF3cfnmwTUizhn/myexjLk01mRCAkewv5SpwAh30B8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790471368; c=relaxed/simple;
	bh=wbWx7cqpz+d/C1Q8z2j058LWkx/w8+P34KhcuFmTNF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=erOk4T6jSKwP7v6U5bjvs6fsgdREUAUjXad4eaaLRgIvR0b70apDbqx7Dzd4YE5CTT1aWNl8oVBU0cBTi0/vU635fUSNYcbm0ALHqgYaw6/FksMP2EgP22sH1TwdOUR7pN3A5nHPGV+VyAEGH3zGvVX7w2J6vPyoRmZDfk/JnHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J38xDBoR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QY9s2xvb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J38xDBoR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QY9s2xvb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QMEa7o875533
	for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2026 01:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NhFYFspFINY9mlzAMXB4sTHoh3lFjbG0haA
	vg4EKcn8=; b=J38xDBoRIdBEutpNK/gaokhG5QVUcozBgviMVb3T/gPrhKzSCBC
	O2pfamWDRyT5hJsHek2MVKs46v9Z5V6rA3CYmcJSvDBJ2kHEzR3a49t30+Utg1Xd
	/yCOPF6s7u7twvQSaFJPabcpx+oP+BLyK9mxoGBvaShTjxhg4pFPVgm3ih+sbsjl
	VBc3qxllA/7ob924WeaSxIQoxRQQh19n1Nca1hllU9K3422jw/ltL8ZzH1dwJq4+
	K1BtRjlDJPgggU01o1idxoaT9y8YLD14LNmkaWeEH94VEpr2nbMOmoe6dPkjgthi
	OQcU4YcxzBvLMm+eaSFfYEaauuYDH75Zbww==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp2bwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2026 01:09:26 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so2397541c88.1
        for <linux-gpio@vger.kernel.org>; Sat, 26 Sep 2026 18:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790471365; x=1791076165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NhFYFspFINY9mlzAMXB4sTHoh3lFjbG0haAvg4EKcn8=;
        b=QY9s2xvbzfCj5Ra5x/yoVYBt1UGa2YqVetJGbYxiaZavl+lLad+CprNNsCE53Rwg/I
         GxbdsyhuKc5GQr/RJQKWVaRHHJH+/fCaH7ZfIM3N8U3Nk9xaD99JEX6MhRgElCe64MPz
         v7IdBy90klvVDDRDJF+4uwdU70Kq/cUFNsb/ygCQ5dHz0nIsE989W53Jr36gF/AOCP8Z
         BemH4jE5G5/PNQBhG8KZqWVesO7lbgZ0A+DpsACQpYjq3H1XUx7+X9IFS9uSLPEKv0JR
         AWix6bZu+gpnYoDHEw7+4BaFGTVKLsZBdIn6sqGVMvPULCaVGa9JpwV9YVvwErZVTyp3
         9+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790471365; x=1791076165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NhFYFspFINY9mlzAMXB4sTHoh3lFjbG0haAvg4EKcn8=;
        b=SYdrhLcFSVmSwEnZSpkYcwj+X3+S/cfj8hrqEzkW/VCuKv27/3o+y+ZKW6nWk/n12V
         hIr8mc92VylrjBnC9jx5MMJwQ2V4BS8FnYJeVCUr8/RpsVG4UJ5RX1Gtiz+f1PhFzzGy
         GsCJwIPxxDFVKMtFh8MRZmieuvwd2Y4QcM2CrWSe4diZehvGZ40cYCpdvR4B4pzZHnaj
         GgEqOswASxHqvKatgA5xVPc9BDxLhsg0m/dz8cDIopycjkyAsbdbqXeaRvcdL7zwLsed
         J8ZnftWbklOdqFlE6Lu0xKlAGesiFdN9GtEiFPSmLfLWfKrcUYQH08/l+nbtcE+eCPv9
         PYuA==
X-Forwarded-Encrypted: i=1; AKwUvBw+CorVVCL1W8cBHj0hsw3jU/7dkIHnbTE1NydzyARGomEFqQFufYCem8q+RmyW/N3uq58NsZmavgkK@vger.kernel.org
X-Gm-Message-State: AFuF++mMH3VLpcLDuFwSGpw+aPy8n+G2y6kwVJxiixdRnEO9l6wKe2+B
	2jLeWYEnvHoOSpOunFYtT7eqHzf+1f+blhbFB/1j1FVDiC7tO7gO4IwYxPF3pyUEZPPlbsXirwo
	QbHQCtLdXa9JStL58Dl8KIx9TlO+XKHZjN8VBBBnpxB2ihC5fo5nXdQq7eNB44in4
X-Gm-Gg: AYBFou1PARuD0DY4U7s5hmGPB/I0b8kK6hOJXJpPt8Fk2SViHRLbuQuHJkJhKQvtQez
	VPe4kQieGGFmR7TIvT2Q0RmRyBnaWUwt61S2rK9r0jRtgSQ2cXjL0Zm3nELY/ggX5k8Mec1Kesq
	ID2ZCBluDhQVjUYzcqWhHfVNFiFztboxkYTL2SP/7nptZxdEZ2kn+eqk+QyRMLb1GnaGu/5Cldh
	09KmhBBU4Qm4aaq74u3zCceiIua1PjAM06STP7iP6tmKvhZc1iJy94jDoBSxA4kx77UjjkYPJGG
	D+WKs7XRtpVNQWaz7rtDXd+lSn3hxMXDs//O2gpvBn0R236stfv5P72g8W84uR+ZzxtHrqsSc1S
	YzlYvhtmpDLiza6z7vAsPwxnKcWjmZhuL9GLYGirDMHSilRoMT9x65+RmTSU=
X-Received: by 2002:a05:7022:b0c6:b0:142:d676:146a with SMTP id a92af1059eb24-146ce1aa654mr4807850c88.9.1790471364869;
        Sat, 26 Sep 2026 18:09:24 -0700 (PDT)
X-Received: by 2002:a05:7022:b0c6:b0:142:d676:146a with SMTP id a92af1059eb24-146ce1aa654mr4807816c88.9.1790471364201;
        Sat, 26 Sep 2026 18:09:24 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm15564028c88.4.2026.09.26.18.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:09:23 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5] pinctrl: qcom: spmi-gpio: make direction changes exclusive
Date: Sun, 27 Sep 2026 09:09:13 +0800
Message-ID: <20260927010913.1212600-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDAwNCBTYWx0ZWRfX1yw9DXm9AeFb
 W6va9HY9GuEGPr8VF8sPXxUIO6BUQtGNoYsy+0zDLEFzr789hHO9/ZVLf4gO/N+R9cdWkS2v1PA
 sHYY+2N557cR235wXr/5Wbd3mNuSVekPO7qg50JxnHEq8m04agI9EcuFLkCDZZbgZOVaGuQ0JSt
 L7V9CZCfYBOFsrLtVLv55WX04j+RM3e/MU5MB8zTvbfu6c1pPNTyuG8GswpmT7ZdIFTju7foIYl
 rf4Out6qM1jrmqIX+leSCkxRDRunc8nr54c8ZuVj4DPIzhMQL01cg8v/fA6PQlvGPrUmCsAVB+/
 szNwdPxWrRH06NknUq1Yb+/s8ak5L7NB6zR3rX9yU2X6AUqmX7gxRo3gFKAC7SthraNbXzos3/m
 qBdKycAM1yI6Ek0eNQe8aFxx5plnhlECEgF5v4ADWxg5hTVJ889TQhvkiKM52HzuLs9TylhWc6k
 RFNKaFSXBo2vwyL7b0Q==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab86cc6 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=p8A5mclyQkRvBDaFiD4A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: hMME1R2SWfWlyKfMZRG8AeUBucWgDIVq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDAwNCBTYWx0ZWRfXxluSUT1AOGok
 Zwbspzxs0+nQ5LJ8CDn/CU7OSuMUYsOmPX+VmGzukHs6qlJOfqjmxl7Bx0LEl87F01BPr+6s4uO
 sCoi8Jtrpez/yPlN95x1DnNq5fZNz18=
X-Proofpoint-ORIG-GUID: hMME1R2SWfWlyKfMZRG8AeUBucWgDIVq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270004

Neither direction callback clears the opposite buffer: .direction_output()
only packs PIN_CONFIG_LEVEL and .direction_input() only packs
PIN_CONFIG_INPUT_ENABLE.  As pmic_gpio_populate() seeds input_enabled and
output_enabled from MODE_CTL, a pad left in DIGITAL_INPUT[_OUTPUT] by the
bootloader ends up in DIGITAL_INPUT_OUTPUT whichever direction is
requested.  That leaves an input still driving the line, and makes
pmic_gpio_get_direction() report an output as an input, which breaks
consumers that read the direction back:

  reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
  reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO

Pack the opposite buffer's PIN_CONFIG_*_ENABLE along with the requested
direction, so MODE_CTL becomes DIGITAL_INPUT or DIGITAL_OUTPUT, never
both.  pmic_gpio_config_set() writes the registers once after walking all
configs, so this stays a single write.

An open-drain or open-source output is the exception: it only drives one
rail, so pmic_gpio_get() needs the input buffer to sample the line rather
than return the value last written.  Program the input buffer from
pad->buffer_type, which gpiolib has already updated via
PIN_CONFIG_DRIVE_OPEN_DRAIN, and key pmic_gpio_get_direction() off
output_enabled so such pads still read back as outputs.

Genuinely bidirectional pads can still be described that way through
pinconf; the gpiolib callbacks now mean what gpiolib says they mean.

Fixes: 263447532463 ("pinctrl: qcom: spmi-gpio: implement .get_direction()")
Assisted-by: LLM
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v5:
- Update commit log to be terse
- Link to v4: https://lore.kernel.org/all/20260924070323.983528-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- .direction_output() now programs PIN_CONFIG_INPUT_ENABLE unconditionally
  from pad->buffer_type, instead of only clearing it for a CMOS pad,
  so an open-drain or open-source pad whose input buffer was already off
  gets it re-enabled rather than falling back to reporting the value last
  written.
- Link to v3: https://lore.kernel.org/all/20260924032314.948638-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- .direction_output() clears PIN_CONFIG_INPUT_ENABLE only for
  PMIC_GPIO_OUT_BUF_CMOS pads; open-drain/open-source keep the input
  buffer so pmic_gpio_get() samples the wire.
- pmic_gpio_get_direction() now keys on output_enabled instead of
  input_enabled - required, or an open-drain output reports IN again and
  the -EPERM regression returns.
- Link to v2: https://lore.kernel.org/all/20260922065908.477523-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Drop GPIO shared-proxy patch
- Update Fixes tag (Thanks Neil!)
- Link to v1: https://lore.kernel.org/all/20260915014447.282121-1-shengchao.guo@oss.qualcomm.com/

 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 37 +++++++++++++++++++-----
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index f6dc43e27b38..9163bb14d703 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -734,29 +734,50 @@ static int pmic_gpio_get_direction(struct gpio_chip *chip, unsigned pin)
 	    (!pad->input_enabled && !pad->output_enabled))
 		return -EINVAL;
 
-	/* Make sure the state is aligned on what pmic_gpio_get() returns */
-	return pad->input_enabled ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
+	/*
+	 * An open-drain or open-source pad keeps its input buffer enabled while
+	 * driving, so the output buffer is what tells the direction.
+	 */
+	return pad->output_enabled ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
 }
 
 static int pmic_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
 {
 	struct pmic_gpio_state *state = gpiochip_get_data(chip);
-	unsigned long config;
+	unsigned long configs[2];
 
-	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
+	configs[0] = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	configs[1] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
 
-	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
+	return pmic_gpio_config_set(state->ctrl, pin, configs,
+				    ARRAY_SIZE(configs));
 }
 
 static int pmic_gpio_direction_output(struct gpio_chip *chip,
 				      unsigned pin, int val)
 {
 	struct pmic_gpio_state *state = gpiochip_get_data(chip);
-	unsigned long config;
+	struct pmic_gpio_pad *pad = state->ctrl->desc->pins[pin].drv_data;
+	unsigned long configs[2];
 
-	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
+	/*
+	 * An open-drain or open-source pad only ever drives one rail, so the
+	 * line can still be sampled while the pad is an output.  Keep the input
+	 * buffer enabled for those, so that pmic_gpio_get() reports what is on
+	 * the wire rather than the value last written, and disable it for a
+	 * CMOS pad, so that the pad ends up in DIGITAL_OUTPUT rather than
+	 * DIGITAL_INPUT_OUTPUT.  Program it either way, as the buffer may have
+	 * been left in the opposite state by the bootloader or by an earlier
+	 * direction change with a different buffer type.  gpiolib applies
+	 * PIN_CONFIG_DRIVE_OPEN_DRAIN before calling this, so buffer_type is
+	 * already up to date here.
+	 */
+	configs[0] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE,
+					     pad->buffer_type != PMIC_GPIO_OUT_BUF_CMOS);
+	configs[1] = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
 
-	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
+	return pmic_gpio_config_set(state->ctrl, pin, configs,
+				    ARRAY_SIZE(configs));
 }
 
 static int pmic_gpio_get(struct gpio_chip *chip, unsigned pin)
-- 
2.43.0

