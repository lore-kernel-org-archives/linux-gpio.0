Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4711C382283
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 03:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790220216; cv=none; b=qKCKmeoZOaIXg1Z3g4NMLbfdxpwiwDqp3LVdNKk+CIih7Ag2mzX7cduBcgUjqBlZAd2zzdIeGODf7NhzZAfsXpPev7sH8uaJkxaLk1HjwMe7e/LY3Bt0Bqe8c7RQtk6F+aojnqDpZyfazpqyUI5uCKSEiigSTRmOQ1b7ButHf9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790220216; c=relaxed/simple;
	bh=hzuNAx8CJ+lsCFtuAxyLblke2rpISg8Y4pfOmUZDpo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PHDwBwuH1FTIPa6HUwicFG4nEfi9do3SGS6Pt+/no7pb5QKtgPhDlryh0vboefCccxcLqtTLhsnpAO/d5qWTex9EH9GBKIm7JtdKEl7WGzSOLokR2mrzk6+UmxRhpEgVj9QiDSxBhbZvjRC0UpAG7/OWv7jacURbTfRIeac/724=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjPFw5/W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iS0JlSvu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjPFw5/W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iS0JlSvu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O36gTm445600
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 03:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GDB8aUi5KkJk9zY5J8G26shz0WZZaB2C3xR
	ijw902mE=; b=MjPFw5/WTlniDwh3bPJYdVo5JSYpehbGfeUJWpGeVbq5Pl0KKZ3
	YoeGCA+K3VmVXAfmKR+U3rVJhuaRP23U6mGyfkjQWyphwEX2EoQ80mJG+CvIOB8P
	WPWdizM/K94GIgt9xGMHZl4+scJykc8Z98zygzMjBnHEfjkvW4Zoiv1xsGdjZO51
	O3Yx6hp+uEHD7/p42QY/VK+s60Rf7BovOXP2sfO35wd5DPPcOuTWwn+iJNKkC60y
	fEYCv6BqXkeL+D+Sd9p9iMpUz5ZCq1xLrI+HhGOJmrN7ixlegn95mTuqAjZG6Usc
	ih8C/MjxNda0ioU9qTS8ERObK3TKcxZXo9g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr908q6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 03:23:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-338c2e27430so1412504eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 20:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790220214; x=1790825014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GDB8aUi5KkJk9zY5J8G26shz0WZZaB2C3xRijw902mE=;
        b=iS0JlSvukRC/cddjcXFoSxLTwTxF2lDchJDgVedQFgATToqOtcDZWVFYYYXA2eM6cd
         qjZV9AA12jVpZRKr3WLjWQpEpWMWmE3e5cmzBYeyykHmaoxKcsId1LO65On3d+4QYgcc
         DgXNBvb+W54k4TnlhQ89zCw+U8xcfkSNTT+W7//bamX3PfSRPemB7u/kNoizWLwskE9P
         k0E2lARZgqFhfnICEGQikBclabc3x48JN95hcjoc3W3IzyMLrieEaP7aC8UoLN4Q9pPG
         F7bJGvbY2juG6fQz4dJtMYYB33D3i9n6cGLvk4RyehU7JBgL1frcgdhcqX5EAEvN5qTN
         NNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790220214; x=1790825014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDB8aUi5KkJk9zY5J8G26shz0WZZaB2C3xRijw902mE=;
        b=XwOhnPL68XzhnBptju81F9+19fWbX/EZ8xLheDPQfUYktBPx2YLr9zMmup0BEfHtPM
         J5PCnXCzO/2SH5poMpEKb4bz0ZAT4fcMzM5xcMUaesqgjNtedvRnshltaYUrtdFzNWOe
         2ZsOZYp4k0tUKTggUS5xqzSmfJt4OFvZ8Nacxva5DQXMunQyuJAPPKtv+ZKlnwHjf/r6
         zKMSStha6Xt9y53TUXaVxVvc4DTGvh1AmN96swXC1bX+WelW/5tX2Pg5VWfmKO09aTXF
         TYolY/aXp6nACDEnWYQ7Ct4OWmovzI0+4U68WdjzC1hX5ldwm1GmXVwzQYkY8vt5+ylJ
         wJyg==
X-Forwarded-Encrypted: i=1; AKwUvBwshpKmJhhGOVh/UTJpADjZBgGlsuvcZdMMae/3/nhp51HikJgauC2SBIsL+wm7OUSIVlxcQz+CqTOK@vger.kernel.org
X-Gm-Message-State: AFuF++mqbWddZmpwyDlR+ATYEuDq80UU9Ix6gG9rsnAyb08+XNdr4+b0
	IyLdkSuVjmqSr3A4odwPP78u31DiYTN5PMlwD41HOU5JIF5OWbZ4UW9xSVLYxmMmYShXA4GfGqi
	ZZT2OaYyM+TONDkyCbtUegJOMQCc3SLtOHNjnZ4MukKzI9hQZq51WBM0tyN0/vrCA
X-Gm-Gg: AYBFou2pnYM6JwXGhuPbbSPLJ9ki6pnxgeJQ0QPTm/ESeMLUGGLxemWTnJ9pVZIb239
	viKhBKrXpa1I2OafobxefT4SkWSL1PzskyPquz/8SfYEtTzpL6Y7ejl4ZeopIe/9/3NnPEo4S6t
	5n/CscF8PCibVPbcqPeGfEXHoEG63LxLeubxeR+UYm6914TjEN6+ho/LbyAe3ecKhoCwe4NeWQY
	sD5OHRg1c0Ti3fBwRyLZiB15eK5Z2ifinWoev1SmqU8sQGPjLBoFGPYphHk1Sz0LFdY0e1WuVzJ
	BBXw+vLs8jhb+q7lILIh5XSMOo4qlmP8A+9UnD1AXm3XrPqBFglZC3z+j36Nlu3oCvzanoIvT21
	Orc2KjIL90gp16bajtOZu8cZB5D3i0Lm5PFRw9c03jDxLuHSnSWfKBO3dvV0=
X-Received: by 2002:a05:693c:621a:b0:322:8541:48c1 with SMTP id 5a478bee46e88-34000c2d83dmr882982eec.19.1790220213560;
        Wed, 23 Sep 2026 20:23:33 -0700 (PDT)
X-Received: by 2002:a05:693c:621a:b0:322:8541:48c1 with SMTP id 5a478bee46e88-34000c2d83dmr882961eec.19.1790220212910;
        Wed, 23 Sep 2026 20:23:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684ed70sm8714388eec.19.2026.09.23.20.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 20:23:32 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] pinctrl: qcom: spmi-gpio: make direction changes exclusive
Date: Thu, 24 Sep 2026 11:23:14 +0800
Message-ID: <20260924032314.948638-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxNSBTYWx0ZWRfX1R8vxwzs3pAm
 9MUwSUy8LTfBWZ+WM+WSbvvg2qnirs0mtoj3cp3txaSpLs11+g17j/wUI47eferBG8ntWR56zqi
 p/lkmYsGV2WxWdYFLq3S/ks7z4tJoc4=
X-Proofpoint-GUID: cBQqaTOQKkQKuCzvwhhU2v23X-tDyXH-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxNSBTYWx0ZWRfX+ZT/5tWZq/dN
 ojHJz63yFukxGDg2EgHpRylxHq+HyaAtm416y/3g1IYORZzvQ7Y2zhqgRJ9LTAwZ2iuR7+eLxb8
 y6cKBf9qDWsnrM5MCIWjoCGpKBKx8Px8X6VfFmgAxu+0wGJGWkfMZiO486rLesjm2vFFuyhOV9S
 Ockjd/vGX2c1D/R0wJm1DepfaKbG8bmWtj1iWUypCykQkYzZMIQii2hYT3gNeTGGoiswdyNcDM5
 m4CSv7T/uZe2U3rAIRDdQ8H+nXBnCg0jsG1iiBySk37TBy/3bY7QnYQKWqk7v34BSwkpmAM7+k0
 OJg688tQ35E63ULEuBnaFZNCpXnyOtjsIrsd/fC75Eq++zUUIXZQLcdJrttUEexlikyf65NNW0V
 jugQI/m9LAuuP1c0QBMcoPIW6BjdyWLqwz/rfPvP+NcDM2huvVPCRAVFP6Ty20/zGTOeD5XDm/8
 FCrDGMiYEBPOHKF8EMQ==
X-Proofpoint-ORIG-GUID: cBQqaTOQKkQKuCzvwhhU2v23X-tDyXH-
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab497b6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aVD0O3Wdv7NXD0OD_tUA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240015

pmic_gpio_populate() seeds pad->input_enabled and pad->output_enabled from
the hardware MODE_CTL register, so a pad left in DIGITAL_INPUT or
DIGITAL_INPUT_OUTPUT mode by the bootloader starts out with the input
buffer enabled.  Neither direction callback clears the opposite buffer:
.direction_output() only packs PIN_CONFIG_LEVEL, which sets
output_enabled, and .direction_input() only packs PIN_CONFIG_INPUT_ENABLE,
which sets input_enabled.  Requesting either direction on such a pad
therefore programs MODE_DIGITAL_INPUT_OUTPUT rather than the requested
direction.

That silently breaks both directions.  After gpiod_direction_input() the
pad keeps driving the line.  And after gpiod_direction_output()
pmic_gpio_get_direction() still reports GPIO_LINE_DIRECTION_IN, because it
cannot tell plain input from input+output, which makes gpiolib consider
the line an input while the driver is driving it.  On a board where
several regulator-fixed nodes share one PMIC GPIO the shared GPIO proxy
reads that direction back and rejects every consumer after the first:

  reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
  reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO

Pack the opposite buffer's PIN_CONFIG_*_ENABLE along with the requested
direction so that the resulting MODE_CTL is DIGITAL_INPUT or
DIGITAL_OUTPUT, never both.  pmic_gpio_config_set() programs the registers
once after walking all configs, so this stays a single register write.

Open-drain and open-source outputs are the exception: such a pad only ever
drives one rail, so DIGITAL_INPUT_OUTPUT is physically correct for it, and
pmic_gpio_get() needs the input buffer to sample the line rather than
return the value last written.  Keep it enabled for those pads, and key
pmic_gpio_get_direction() off output_enabled so they still read back as
outputs.  gpiolib applies PIN_CONFIG_DRIVE_OPEN_DRAIN before calling
.direction_output(), so pad->buffer_type is up to date there.

An input must not drive the line whatever the buffer type, so
.direction_input() clears output_enabled unconditionally.

Pads that are genuinely bidirectional can still be described that way
through pinconf, which is the interface that has always been able to
express it; the gpiolib direction callbacks now mean what gpiolib says
they mean.

Fixes: 263447532463 ("pinctrl: qcom: spmi-gpio: implement .get_direction()")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
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

 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 35 ++++++++++++++++++------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index f6dc43e27b38..dd9c212da6ee 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -734,29 +734,48 @@ static int pmic_gpio_get_direction(struct gpio_chip *chip, unsigned pin)
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
+	unsigned int nconfigs = 0;
 
-	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
+	/*
+	 * An open-drain or open-source pad only ever drives one rail, so the
+	 * line can still be sampled while the pad is an output.  Leave the
+	 * input buffer enabled for those, so that pmic_gpio_get() reports what
+	 * is on the wire rather than the value last written.  gpiolib applies
+	 * PIN_CONFIG_DRIVE_OPEN_DRAIN before calling this, so buffer_type is
+	 * already up to date here.
+	 */
+	if (pad->buffer_type == PMIC_GPIO_OUT_BUF_CMOS)
+		configs[nconfigs++] =
+			pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 0);
 
-	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
+	configs[nconfigs++] = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
+
+	return pmic_gpio_config_set(state->ctrl, pin, configs, nconfigs);
 }
 
 static int pmic_gpio_get(struct gpio_chip *chip, unsigned pin)
-- 
2.43.0

