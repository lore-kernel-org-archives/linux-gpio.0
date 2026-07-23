Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E19C41B36C
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 20:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784838052; cv=none; b=cYamFeo7NrCnRz3+eTX6CaFfj2Gn//VDCOIm+Wex1874IB9wM2ICOmTH+Rp9/3IwBGRzv7QF2jsvjzTqDOCfAHvZU+bWR3vXPsDvKCWJ5Gmu8B/BHB5EWdaEnaETTZckx82XkMK2jFbUeKtCmEvkjHpWhPDBq+fj+jCJY/gemAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784838052; c=relaxed/simple;
	bh=werQXoBSvPCAV85g1Rt1KlLpFSTmPeL6HrQpurDCBdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=srRgUn8YxglKWIQOaSee9AjbYNvSCCTmrOK6nx2AZ3TBHc+e8D0x462+9/8WWi4iU5NSB1MYIjpE3M4AYC75Fv9mIh2hJiqwE+F6JFfY5StUgDQRvCtYAJhnoNnp0MESxHfkq+e/nbbTd3s5+yTmzMP7SeIX8qG0g1eo/VKoJFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bowmj9R3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IrRABYJJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bowmj9R3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IrRABYJJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NImHia862794
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 20:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5kF7ulZczbexNz47ntZNjJ
	38Fc9p+ebYpTaTsSSzFZE=; b=bowmj9R3KSzBQYt0xeJKXwljSDrLG2KLAwU0bu
	2TOu6YUfsjtkXuCJj7AVZzgUGCIFVMntd7ly7VqP3g4hgko1+d91rrf00PGqh2NC
	vnV4ClBh7hNmtK9BFEEaW+edHBoBBYraRs++nrFQ5a8rYYyeeHhBMC+tFgxR6AHx
	9gPcthiNZ4Fl5Mt+HrrhlKdncfxqQm3QKVN6ozDSGnC+HywJlZ/by2ZiMwRskBTT
	VGq2CCim9qMxMwoBvPtRw8+L09t2xCK29ugqlexe0p+9mBPTuiG+u5O9E8yTxq88
	4Ev1GBwfNdNe3+ARgo1VygZ5/HiWlVg+XantPlvBhYaBlhIA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vh2p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 20:20:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so1911513a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 13:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784838042; x=1785442842; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5kF7ulZczbexNz47ntZNjJ38Fc9p+ebYpTaTsSSzFZE=;
        b=IrRABYJJ0zlzuIxZB7CxaR06RKIe4+SD3LehSZVdNLT7RUv80ZkAUg3d5xI//Bhl0N
         k36KNZcTfCaJY+GZNEBy8SXFdVGfSSa/zGntArKQ97+R+djT4NTk+J27X3TlUCeU5BCc
         umLDQI/3ngL9zfiRlQYOMbwrlp/o29bqDcfrCGyzR1EopeBTrHukLt2tFxa2ntGHDpJq
         qN88tF8/BLNAi++x/qTQoiTbztAXnkUm/2t56W2ygWh7XDUe9AC6V8fgbPXb7mBAlzbo
         Ubt/cAS1aFulWPvaN/5Eb6VQZ2Tk89bT042uQ7s1bOSrc+gt1hKxRSbcJLfl+SfluqPK
         srPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784838042; x=1785442842;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5kF7ulZczbexNz47ntZNjJ38Fc9p+ebYpTaTsSSzFZE=;
        b=B1RVZhMldl1IQZGJla7Q6FzhpJ/Xe6Nyr2v//8ix2Ockj7fszX1d+7o6E/n7D9XU7P
         wM4ZUSIjOaKVgt9SUSpgAM2RPDjX1WVvwpYVbf1meF6KHYohUyqh5S2FNPtp1pQDLzQE
         2pvhjiq07ih41dpwf94Hc7M7WPuaYJ31KBBC8SKZQfc7jSsQQHO6tUoVCcuRIN5J4Vra
         scAGI8W+4roVA+whwa8YCSHvtqTEVF0Ee8U8qjy+fUs5+TJRBknvY4RKkdfWwWbLwmxv
         k/qFclY7U0/Isw6cysOxyhdJgEfAVYcR5eKbT2Qvi77mtesLYZInZyeeuQRKdZP116EX
         A0nA==
X-Gm-Message-State: AOJu0Yy6c+8lCPoSi6/ogetRnGNQ5K10ibOOnUyaoQTgzlIR1veGTS4M
	mGc4FAGr4W2SefpDT+HnoMsy21WF/I3vR7+oVhs2yWRRrWeD4XJf+pCWhW7d6e2jqQcJl/ssWgz
	BLA8OZ1QAXOoah0AnCrlfIkdxnfnbKCOyncxpM0ZtDti7w1+sfKLK8vY8PL7iEntg
X-Gm-Gg: AR+sD129siUzeRtESZsSekBigMjmP+eUJGGxCCSZ3ZyZCWOHNaDnze8NdCkMwKxsgrA
	lmADbc1xKLG5dsF+f+qOGSJcFzEPYA5Z071dLXsSeuPB9PLKBog4WiT01RpAzLGrCkXNK/BwjUn
	S3KSVKVAieSaI59OTXGTycKv16jDqfNZR4C8Txz6CGQO7KnX6ri/4/iUmxmNZjN5h8Upc1cPMiv
	YdnpxuDs+SijilpNp0y2kWZ3zNfoPcJlXppV6yWE/F+Z9s1/HKGDze+AgFiQqbkXLjtV6Ni4Mc0
	MgLbwcYrV0iAfKH7LezmhKIlZByzVHx/AnBzVRh8ENdczHBXEt/Ad0QGl699Ban7av++xoU9I15
	dn6RqvkYuQB6/xbfG7OLdde0oiRMKXHC3Uyf0Mf3Y1/6RXSnp7g==
X-Received: by 2002:a17:90b:2d10:b0:380:9504:9780 with SMTP id 98e67ed59e1d1-38ec6631fe3mr4579869a91.29.1784838041610;
        Thu, 23 Jul 2026 13:20:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2d10:b0:380:9504:9780 with SMTP id 98e67ed59e1d1-38ec6631fe3mr4579841a91.29.1784838041129;
        Thu, 23 Jul 2026 13:20:41 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130cc5ebsm24259171c88.12.2026.07.23.13.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 13:20:40 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:20:25 -0700
Subject: [PATCH] gpio: gpio-by-pinctrl: Apply initial value in direction
 output wrapper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-gpio-pinctrl-output-set-val-v1-1-ed4477dcd3e1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIl3YmoC/yXMwQrCMAwA0F8ZORvoInbDXxEPs8YZGW1p0iGM/
 btVj+/yNlAuwgrnboPCq6ik2NAfOgjPKc6Mcm8GcuTdQEecsyTMEoOVBVO1XA2VDddpQT9458a
 TH3siaEMu/JD3b79c/9Z6e3Gwbwn7/gGPBCabfwAAAA==
X-Change-ID: 20260723-gpio-pinctrl-output-set-val-676008568122
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784838040; l=1704;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=werQXoBSvPCAV85g1Rt1KlLpFSTmPeL6HrQpurDCBdY=;
 b=PP6JmI13xYSqh8XSAvhJEGwcjhBBLuLx4Zl6G73h1BdpTcaZ4qGUi31UPAsxpByrkB4FdtwNn
 zkYyc2H8OifDwiMXpZDAAFn+LbQ4iOaeJ312aGPzvU2HmbjvIIH8/SC
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE5NyBTYWx0ZWRfXxrrJvDwXTNr+
 9RgStJ0bYUltUvgQATC+9Uzife2U1EUFHmP2WybdoxNSdsJNGVvFFm/GPYCE3RQqyG6jPORabP7
 ncrio81yMsXxWm8G+bN6LB/EAMzYcpQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE5NyBTYWx0ZWRfX5z41DkPGaMKY
 3fTSWUqHV1Ckk+8/tRle35QyATPHlBImL4qdo8HpZSSHg/pYjSndl9qg/zttDfpZ4w7ZerILaiY
 TRv8IvRy3Hr/A0M9zLSRYnCnPt36gzgrPaxiMnQASLJNJKKl1bcx0fMuNkyhUmepSYTWSEp7s6F
 17u8gKfrDmpu2X8sbzXxAkY286EP7HyJdGP6mfSY2o4cnW0tv/u0n1ThGYw/9dCl1aSHrJpC1NR
 Udi2J46v4dSY7tszwNvRDJAVKl/aeBy2rqosaKmnqnuVf0TAhtFJxWn+qP7Vahq+SkOTzQDbZEJ
 CTAUx8S9UD7KKsiRPuhkMijKC8mABSMOxAZocGIDaluB1UWX6dl1WVUZ2raIGcFC5n/3Mm5PmFa
 x31p9Nl4H4Ta1+jdfkKhHaDor28pXoZaPrym3y5Ou1H74quqPU8WLP+vsOdRhmxU8DP1RLLqCHF
 LFMpbC31actgHlLMjIQ==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a62779a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4txQ9jBOQmeeBeq4O20A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: UjaH8X-qSgS1dWQ3XGdWvKwXHqiQcG8t
X-Proofpoint-ORIG-GUID: UjaH8X-qSgS1dWQ3XGdWvKwXHqiQcG8t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230197

After successfully configuring gpio pin as output, set the
requested initial output value via the existing gpio set
wrapper, so that the pin is not left at its previous level.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/gpio/gpio-by-pinctrl.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-by-pinctrl.c b/drivers/gpio/gpio-by-pinctrl.c
index 7d7c48ce5163..fb8440acb31d 100644
--- a/drivers/gpio/gpio-by-pinctrl.c
+++ b/drivers/gpio/gpio-by-pinctrl.c
@@ -27,12 +27,6 @@ static int pin_control_gpio_get_direction(struct gpio_chip *gc, unsigned int off
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static int pin_control_gpio_direction_output(struct gpio_chip *chip,
-					     unsigned int offset, int val)
-{
-	return pinctrl_gpio_direction_output(chip, offset);
-}
-
 static int pin_control_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	unsigned long config;
@@ -55,6 +49,18 @@ static int pin_control_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	return pinctrl_gpio_set_config(chip, offset, config);
 }
 
+static int pin_control_gpio_direction_output(struct gpio_chip *chip,
+					     unsigned int offset, int val)
+{
+	int ret;
+
+	ret = pinctrl_gpio_direction_output(chip, offset);
+	if (ret)
+		return ret;
+
+	return pin_control_gpio_set(chip, offset, val);
+}
+
 static int pin_control_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;

---
base-commit: 4539944e515183668109bdf4d0c3d7d228383d88
change-id: 20260723-gpio-pinctrl-output-set-val-676008568122

Best regards,
--  
Alex Tran <alex.tran@oss.qualcomm.com>

