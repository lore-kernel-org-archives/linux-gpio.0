Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E947440B6E9
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 07:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233437; cv=none; b=ahZg02ts8nrQ09GH/ykVVFBCbZ980ZyDouxHd8927DoCl30bLwMRBi7rU5o0z/xVbf8N4ApGc3CFpvzShATHXbi6h4ST88r1i5cWgprStQa++snZ1b8Sg3G9ZZCDo8TgKfVVDV6ZQc0Xpoy60toKbPqMf+5KZQtXe3M0I3f3JJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233437; c=relaxed/simple;
	bh=HThu999JdrJsgMHwqzxbZIWm9oNlifMrfJOz7Lutz6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z5mPXG+Uog3qFP61dfYTHcbMLAEaM9qNVLgZ6Ch9f6ek8OFKFMYh/TPwOwxQQe+1tl1bz1VLcApeCDH1O8aPioNDTSCcJ68H92hj7+BUSPqNZKG5J+y9LfY2CuinX/N43oNsjuY6Zjdyo6zYvPWlpM/J8t9U5AXS9ZqAI3+pzm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLs3Z1Y4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PP77nBnG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLs3Z1Y4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PP77nBnG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eEET4147360
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 07:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/fJFsThCRy735OBr32VrOnDr17SixmR1mu1
	90oUUl6I=; b=WLs3Z1Y4cZRfEeoiZazWeki9a+bZk8LcUjbcX6YndjZyvEZ8R4S
	jmb2YFDfkYPbRx6EzkJJ/cPFTAiLqKpHgYpc2laF53BXz2a4HPqBYih+dAiZEOdk
	TCSKO5htqjTUkrnDaCYB5EIoJgejdWJ49tuwcwr8MFlm6M2LC41c4kH692U+bMFt
	2MfRMDQ8dTGr1HwC8NiHIKcL6xUMpscssqVpBtKzxV8fURZIxnUoWKwgcmHUJxAP
	wPdA4PMhbn2971Mxh4KBduZ2Uplk1bExpXORIUm9olHj9jYfAKiXNZD3ZdQ1gFjl
	Gwf/iGpzO/QCrtUA2Z1MVGQo26kzMvhw11w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv3s18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 07:03:46 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1416f32fe11so2541977c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 00:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790233426; x=1790838226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fJFsThCRy735OBr32VrOnDr17SixmR1mu190oUUl6I=;
        b=PP77nBnG30IZQnh6RuInOjG7xTi4AZ8ySC5qSJ3zYejU6V64hbwTuIwhgvsDxSsL9U
         D9v/+1Bjiiyfe+e5TdFcayotiRCj6EmgxJE1dGB3R1vmCp88nttqZI7sINaS31i+pe2R
         hDbOtQqQv0VXSHPV8a2LQ6+zL4oI1OVd3dbOuBqNScJXXPPM4XanQdz3QDHzR90gMxTF
         mzcHbJ95kydMy22DcXAncZsSKYOlC9ub1QmLnBO1thHKoETkLalHHWpPqKbikhkxzJKb
         ZhOcPj+ldMdqLz52ibElTXib9QYlbpLZhnQRXLLz1ZkCPAB9wt/bEQLwbf4U8KHk3sYU
         ffkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790233426; x=1790838226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fJFsThCRy735OBr32VrOnDr17SixmR1mu190oUUl6I=;
        b=uCPY10MDL+qaS+wJJMxdSwZHytX4NpyBBU38pZ9JZ/+u2T+QR03y2lmHOih9PllGKm
         tqrGEEP6q0sNqZF4qwgDC1FSd80em79jeSyRjN7L9qAjXruxEAl5ypwcn/tRQfdLFbhH
         tILHIbUUlAWmzbdBbQWSkJXt1Mri1gqhPJiaX+67fntp7zsipGf0T18T5RBv/UZWFo17
         ESW89pO5KenDJ6cVNXKE8bMxxTcQFTRwcDEkic9s0jZD43LXLkHobYOmFp4CSvZ1QrSe
         duQGgdj/0RX/U3kdL8nl33B+Momouoq2zZ8RR4TZmWZyGYBGY1S9kSJyYzrJ+Q/b0s3x
         Kkig==
X-Forwarded-Encrypted: i=1; AKwUvBxJHaSitmYeZ39aVbS5ZF8taJkBT25cuhyMsXkuA0Qxw4GiSnhsu2nBwgDz3E9FiYXRj6heCpJkhKU7@vger.kernel.org
X-Gm-Message-State: AFuF++kV4UPp8Ev2FEuIgP7LnN0ApXNGTDAtFZB0VtjnFr62HikRMjXM
	DQXtJ0H/PybyOlBssS2W5PuntvO8XjOPGal6x+0/jtbWLNfvSBZSLp2uPtfnwIeIC8XcfBfe4n+
	u41wR0ijTRUnu01+ux5YvM6jqCrUaxc7k3RFt3/hhOH9FGrrJnzpN+bjuNjvTWRT6
X-Gm-Gg: AYBFou1U8NGokNsK+pVRet/bLOOkJAcC58Ga7eKkvihtFqHWvnL/xNNbj0qpyYXQTp0
	s3Yg/vQC8rm4+pDloT9nLmBff5ItVD/l8QzSb2WtzlaPz7WdNGY0MNINDBKHbbAbEjTDQ0WeqMV
	Et/wVGBAxffbOIv7NsoBdF7+KoQ3Z59L1rICpGFew6+8pEjIw2/wxgS+f474BG0XSZFm9rwx7Zb
	VYYnKLZKLl0esk+H4jeBj8sEqQ0DipqjiOW3rgj4f/vz/JYKvSr91cOs5coMkO0x83iodRf1duG
	wdu+T5s6fYPe41Mcoo6Ko768QlnGrdHbK5KOcyiF2RMOjz6jEV8yNH7UT+wNjSg8kiu0y9LccKA
	sQ27yH/QR++bQz5w6Wv0y0TxphWsmpIDMqWpiKudWSxGnpMP1IvBYOaiQN0s=
X-Received: by 2002:a05:701b:4504:20b0:144:fdf0:9d91 with SMTP id a92af1059eb24-14504031b58mr1138279c88.24.1790233425591;
        Thu, 24 Sep 2026 00:03:45 -0700 (PDT)
X-Received: by 2002:a05:701b:4504:20b0:144:fdf0:9d91 with SMTP id a92af1059eb24-14504031b58mr1138236c88.24.1790233424620;
        Thu, 24 Sep 2026 00:03:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm14289599c88.6.2026.09.24.00.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:03:44 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4] pinctrl: qcom: spmi-gpio: make direction changes exclusive
Date: Thu, 24 Sep 2026 15:03:22 +0800
Message-ID: <20260924070323.983528-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyOSBTYWx0ZWRfX0xZrVRJPX27w
 dFQ2WAYaXlDBgGhg8jyun41KNY52y2wZ1LvU/dzT0jc9UG/BpCiGg0/s7o43F55O86WuEyUS0Ko
 /fSVv76RhlEla6nNziYBNJVTecCfu9Nfxk5fAKygthO0JrvgJ2V3THX/VDo0Mjh6kHHnovNw1QN
 fL23BO/L+2NP92PX0+kgwBpAMdQUHYTQVwgH3OsUDln/rJwoOAfvOw00EOCjULCj3IOXcnHFxz7
 H1iByp1D2L5XEpEVDSPkbcY/lQVHqvKH0R+EWFhoCVxxcQhPdhL4yS9nsAxuHv8gcgt3UyIjz4G
 YKnoxi1rXtkphsr9mWFeXfIaIEvzk4PIe/1oES8Zi70at+YbiLjRnF7h5E2rmz3+t9XEphMLtrS
 LBuQDDsBS9F5gyzmH4ubMNgkdYTAHjONyfmrXL8t75CDVqUsL1DaRFelZR92eR5spwDEUCXovJm
 rH0ysKphR2ZhsakfSvg==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab4cb52 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=E7y4-Cke29mXp6t5dL8A:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: 8LEOAxfqaXnLHnZKSnjeIRUJ27015CB5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyOSBTYWx0ZWRfX8Xo+/OA7D5Cd
 HMUx0p4aWR+P0GLtZtiBWLbGefiAtuEabNQY2Hl1VE3JxmTwLVL0wtbhDyjCZze1cwRjWAROE4W
 7kBZskiFfCWOCPB5n8iV4Ff1/R7DTyg=
X-Proofpoint-ORIG-GUID: 8LEOAxfqaXnLHnZKSnjeIRUJ27015CB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240029

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
return the value last written.  So .direction_output() programs the input
buffer from pad->buffer_type in either case, rather than only clearing it
for a CMOS pad: the buffer may have been left off by the bootloader or by
an earlier direction change made with a different buffer type, and an
open-drain pad that keeps it off would fall back to reporting the value
last written.  gpiolib applies PIN_CONFIG_DRIVE_OPEN_DRAIN before calling
.direction_output(), so pad->buffer_type is up to date there.  Key
pmic_gpio_get_direction() off output_enabled so that these pads still read
back as outputs.

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

