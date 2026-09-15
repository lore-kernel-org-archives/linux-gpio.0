Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657912F8EA5
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 01:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436706; cv=none; b=GCImccLGAF3ao/xh7fpof8p8d0BDedVyaMS/jSCsyP+1QecCEi+Vxk7ekkTec3fXgwlqnncHIcp8Rme1yg7DRgna0nC8Eb4NMKWPQ9rScPV9E7wf4zatyoDJuqYgqdJ9OP8hX/W8gAWFeeaP0vqlc3ZWYlDPD7KPvX3eXuDkySw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436706; c=relaxed/simple;
	bh=8Xx39gvjAdBP5KCPHnpT8nFQ4HEoiyju0OpagmBgeDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jAcHbPs1bwmU4HB+AMlPVCc3WVYWmvdvS8PJ4hhKBIpYC9CUVX7/m9Su7o4zANc0W/twbaD4uPvEQ+BtNJKgfZxDNawe5ZQ9KisfyvuyTbRUelvIlYN58D7I4lKq7mJWfpEDdK/7DrQ+gendBA/k2byAwweR30jcQ8u4sXnsAec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgmyXduq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RVNAUs2k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgmyXduq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RVNAUs2k"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxeUP3069981
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 01:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JIf7ZLgTwR+
	tXJDOSnsUFYSDR50wgvOhy8cyjzdZAws=; b=SgmyXduq3xJU0ZwlYsLCiGP5D+J
	Bj0gFQsnEJke4vig+230vs+NQtTBey/oJ2rFLxRXzMO0J3bC/wI6NxNMO52hW03U
	Xft/E9Kcaa2Z7WiTXgUlGRhoDtPAsDH5NQGdyDK2JAYnJpvs5xzPKISHjzhHnsWF
	2wzFENh7PNiyKJVDUIsjemL+7mCnKWYj0oNYvoXOjDrmfo7GyFfKyUdeePder+8J
	AiSTqtbIu4oU8Nnxx9d3ngO/AZybl+RtQDTAqvN8UalLx0tWQgTrB5NxYuHxr/tm
	SWXCNcTyQfitHipSJnqIEmwM6/Bd3jDPsPljHul2rdJaWwG3qaVV09aEdCQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeexbdye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 01:45:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so2429697a91.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 18:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789436704; x=1790041504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIf7ZLgTwR+tXJDOSnsUFYSDR50wgvOhy8cyjzdZAws=;
        b=RVNAUs2kvRThdSJD6tQ2d8CZLFreU6yyiHZcBbtWlgdmSmevuRSke9gRY4C3d4HRWP
         crrbf4r4B8gTvzIaf594nOoEcNvVLiSpYHZr3YLTsCsk5r3z3ZoYsPufV8b2Vp1Delz0
         0c08RQyZKqqWYi1wqcxP9UHMEIL0MhCb+OeUV4PIM5F50dkuH/Jz7qXztR4mtwHLn85p
         ksYopwt8yhrlwRhvDjt8flbkQI0pwGsg5Olv1INCoW1rkAPbxhfV5OzEwG5OUeqvMjax
         527gYQnASp/HwQqfa0yKEK24gpDT2W/EFBE2tsfj5EYbEasecgW7xVApGemdVnD+++ri
         gi+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436704; x=1790041504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIf7ZLgTwR+tXJDOSnsUFYSDR50wgvOhy8cyjzdZAws=;
        b=vIrqBeaVEBOxhxqY12nakUaMyqKv+X4n2pyi8Wbqme1x9bSDnNV1GSsrfLRdt7eCRH
         sZxu9hKLEwv3kzqYQhzyp6MfIcCH6OxvzDih/X6jaHRV4u4i6/4oDEO45zlUwysk+NsC
         KqKcyiFz8Fi/BUTcGpyMUPUe4x1tMVGvvJDp2JMIHDzsdKXOQKiY6BjoKNsn/FVz49nX
         NatBzirfZLwiSz6q/FX0B8S1/hWwKwNFCu4xKf4wN6wNTlM9HfWaKU15dMdmK3sCuw/u
         Y5hICAMTwXTMLIhqbLAkWQo5EEVTzbKjY/UnO77eCsND8dD7EOUQmJeslem+lHoav9KX
         NjDA==
X-Forwarded-Encrypted: i=1; AKwUvBw592aulj6iKsitcJv4cPw73gb0mSQsr2PNMn8ATd9Vm2h9kHrHXfYsTP4YXg5Ni+8F+3tyR6XeCcHM@vger.kernel.org
X-Gm-Message-State: AFuF++lvfabyJoRU+9enLCvMx7cnrQU9OnCuMx4/3iqCX1ArUWY97Dt+
	aAlI6866yziZywabIVDIYQ6DA7XVBrkCRlxr+XODFP15WYY4DE+35HPK03JWVjXvqkO3KUJUGrl
	jTQMJJ7YgAZsG9PIKjkCciH6NkxaeKwXle6qHjuiqJ10pHdWsG3gh5RmGr2im8ytV
X-Gm-Gg: AYBFou3B4rvSBMcUPXGOn7ksAatiaNF8JhYxElMZx2upS4AvLYEmAyfPMz2Y6ZgQjXK
	zALEbHbps0AqDJDtLhRhX1xKgPVWEog0FHSIHvVLx8N3jPCMmB5Gmg7nyaxP8d5r1g0tYwa/y2g
	cipKinfw8f4xYzD1Ki2cGjZYGclA20CbuerEPgD8o3VL+IBo4e3SkPDEC1OlvrKBpFuh7l1iLyE
	ndl2cEQZpBvp8IyetuiwC3odAMf1kMMZvsLTzzQ7Cod4fLRH2dLZwf2ZF32FTayFP0Tu7BftnHv
	+9MXjfRJo/bbDuy6jC7b0dxCVFQeOopWunKeCNN0BJdOnrw1i1KtkS9vE9XwG9zRnYtSwyFl8zL
	a14TqgU0Lz3JBbPrinfXY5ov9O/dBMnHc3E87Lgxza7RnQQbnxfmzayYaQUjj
X-Received: by 2002:a17:90b:54c3:b0:39d:fced:6fb2 with SMTP id 98e67ed59e1d1-39dfced700fmr4411670a91.5.1789436703549;
        Mon, 14 Sep 2026 18:45:03 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:39d:fced:6fb2 with SMTP id 98e67ed59e1d1-39dfced700fmr4411632a91.5.1789436703070;
        Mon, 14 Sep 2026 18:45:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm33104723eec.28.2026.09.14.18.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:45:02 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] pinctrl: qcom: spmi-gpio: make direction changes exclusive
Date: Tue, 15 Sep 2026 09:44:47 +0800
Message-ID: <20260915014447.282121-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyMSBTYWx0ZWRfXzNzRgaHQeoJi
 BEmrv2ky6rRrTt6bC90fJTaQi1ZzqpTkIgzAPHamSiEGqTyIb8LHigx0kiyD3c+AiYBflpyTPoD
 kY6nvfyo8/GL6fiWHUpVLAqL8FjSsovTtb8HqF03kgebxGvjBqJRrBkSXV+RlERNe1xsc8wQiV1
 +moGeNuzE84TtocRu7TtzO0NBBwd2E22vaHfL2btbK3hnvKzkfWA+Yd8mA7cwuhesa/vAAS0yGv
 zGJn8avpfqIeZ8sPhCoifg7fmSkkFTta/x84Aa3k8k7Q0JxVjREF56RB5QVBi/XfJKPgBefznV4
 g+EletWRB3u+XwPMbKoVE8WJgq5uhngF1/9D3yeAmuk04ukjp2J04/mCA/XVhu/bhD3CjI2deaj
 CU1k9TRiUj/RM2h7X5R8pBgdMAd0GTbytf2MOtKtOqsXT9+m/ZwSN+CoU93DbZgVCPTH3CDKU3k
 DHoJdggalyVJNVKXAfw==
X-Proofpoint-GUID: 27NMftNbpAppDLZq_zQPmAgimNB-7R-2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyMSBTYWx0ZWRfX/cVhn6tO9eVW
 E9rWlHDxGbXO5GAhuzRedwa8yCtlBh3AzfDjpAkGFqeA6kSpHrfglzcJ6ySu2nKdmRfmLRCj+TG
 PQA99ACrBFLYLwo8dBz1Xip2zzL8kG4=
X-Proofpoint-ORIG-GUID: 27NMftNbpAppDLZq_zQPmAgimNB-7R-2
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa8a320 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=jHABHta5L3jSstw6_KYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150021

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
pad keeps driving the line, since the output buffer is never disabled.
And after gpiod_direction_output() pmic_gpio_get_direction() still reports
GPIO_LINE_DIRECTION_IN, because it cannot tell plain input from
input+output, which makes gpiolib consider the line an input while the
driver is driving it.  On a board where several regulator-fixed nodes
share one PMIC GPIO the shared GPIO proxy reads that direction back and
rejects every consumer after the first:

  reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
  reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO

Pack the opposite buffer's PIN_CONFIG_*_ENABLE along with the requested
direction so that the resulting MODE_CTL is DIGITAL_INPUT or
DIGITAL_OUTPUT, never both.  pmic_gpio_config_set() programs the registers
once after walking all configs, so this stays a single register write.

Pads that are genuinely bidirectional can still be described that way
through pinconf, which is the interface that has always been able to
express it; the gpiolib direction callbacks now mean what gpiolib says
they mean.

Assisted-by: LLM
Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller driver")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index f6dc43e27b38..eb4431591331 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -741,22 +741,26 @@ static int pmic_gpio_get_direction(struct gpio_chip *chip, unsigned pin)
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
+	unsigned long configs[2];
 
-	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
+	configs[0] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 0);
+	configs[1] = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
 
-	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
+	return pmic_gpio_config_set(state->ctrl, pin, configs,
+				    ARRAY_SIZE(configs));
 }
 
 static int pmic_gpio_get(struct gpio_chip *chip, unsigned pin)
-- 
2.43.0

