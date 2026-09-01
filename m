Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5AA47AF56
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258528; cv=none; b=iV0tKSelbA5O86HwkFZYT4AxNgAEWC39FBjg7hjkG2Mboruq0O5uN/n+CqxOkQH9xcQj2ErxWfjPyNoBCrgbtZDi46oEZzeVTJpsH3VjMNwaf70Ro09BELjxwkP2yCSD2GbWMbNTU8KSmyva0tBh5/UOHTRgRD3tpqhr7xeaQRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258528; c=relaxed/simple;
	bh=g5ymiIKyPU9IJATjA+hHPEaVikeTbARumU/p5+o1FRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ak1QaXhIk18GLRj77vZTNtAipq002E6JT9G0go8nD6P08eAbzX3V8qvHyDnsBRC5lE4MBtmkeIuFidMegfP7wFVblAaH999D/CQAkFWMES9FUi2zGTMz/fUG0jUCe0rIRX4ztVXqh1wRIvmyTQEOcUDcMjqZZEhdSnO4c8u2fbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dsLhYlkp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LS3jkvEs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dsLhYlkp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LS3jkvEs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJfLF1767431
	for <linux-gpio@vger.kernel.org>; Tue, 1 Sep 2026 10:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAgkwUE3huAuFwYNoOJh9l147NjqwmOqulSugy1jxP0=; b=dsLhYlkpBBYz0UaE
	oprbaLjcxl3H7HiFnghS2GMUJDmU7DZwHxFm7ona4IABPhJOem1CwASlpCdwsG11
	m5UNbe8M/0qHO5wQj81aP5S2k6wzonwCchBawaPi8URtvLN6DOO3YfNxgT4jW4Ma
	pOgt9RGRu089LP90dF1xoiqKVQlm2PI+GsrEsHBAycC2NY0usfEsWVbOwrP+RwIW
	rVgLF3bvX1fD6HJ+6E1cW7oR/VWXsJuqMsBVPRIiha55XjmVIRBWK5j1npFC4Lh1
	Ic5yvZlGCYYr6a5vvP1fHBT5c9hVfOJsavWvpwVMBumHOZ2lmLOY88XA5SPCInk2
	k3HZ1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx2nfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 10:28:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9382f9430deso156438285a.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 03:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788258526; x=1788863326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAgkwUE3huAuFwYNoOJh9l147NjqwmOqulSugy1jxP0=;
        b=LS3jkvEsBTIyABPblV8FBpTao4pLvkbJ0R684sTG7n6d0BpvS+fz5cc0KkXpef6SHA
         haA691f1RJd1EYpsIYaZcYWhqy2l0ztrmrA2bEqzOClHRHyIABbteGnhpqVqvix0+Fad
         QKImpCaXx/LloVqpZEynCVH2Cpy8CGu1n0DKtj+8Egiv8TYgQwJUOkIc5WJmxHXKpyZe
         gdgUqGy7PT1WSnMHkz5bdCkS4qKxZJbBP/5di8j5rWRQ0hJz+6toJOcBmG/67NEtbSms
         8mz7PaWYiy0E9gjFHEmhHNSMKD7mgG87lLew4pnb3PIUxLkCrOaB3WSqdVLjN8OgETCQ
         jnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258526; x=1788863326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tAgkwUE3huAuFwYNoOJh9l147NjqwmOqulSugy1jxP0=;
        b=KbunYW1ZV4EypmQ9oFBOq5hGxhP46o+hQa5jTYEVtLSOYxCGcRkxsOAkZP6RWe4Ubk
         EubBydgFcsauRoZsN6CaX3MvbIlGnxmXGJipe+6RxO6Ufo9TaxR6dpcMvcqCgXmMoAtv
         ljtM0cy5Ll3CRvxK4zNIjmUtXuZrX6aONxhYISRfEnJPVINOBrz6o0Kcx8wB7Lrxj9Ph
         tiPJJueSAZ4Ao9DAj3XlLGRe6Yn9JoF4bPFIb+dZE44VcOpVI2hfoRew2X/MK6N4ULAk
         V+Qx3IrKCHcyanBv6WTnjaQyfcVCifQA/lDVSL9qwgmGMwNYKZt5RVN1bWDxNcZl775J
         c25Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqrzqlb49L62+VayCuIhZ6n13dOTqnAYOuwXWIiOaI31bWQnTgKSVu18tmfB2ikz0uSqx7M3ffrmKiL@vger.kernel.org
X-Gm-Message-State: AFuF++krnyfeGx4UrX3tsIhAq1P22kTwdqArsBW0sMU34ETcReaZfsyk
	yjQecxZULIKKN/2sCKpQn8QToTAlOH6/JCL5EXNTLz5DPWykW2vzivq70yCl05fA4+m2VuYLMA6
	c61enGjeBLLSTf7fF0OdGPd6FzgFL8c6T8T8GXQxkvKK+/7bIY/+VJqky3pr9QCtD
X-Gm-Gg: AR+sD1280+srWZaWgMof1HLb/dWPItf9Lb4Pe49vwdg4HoshckgerIcHE4CKE5ppYb8
	kfvOzBYWAqZlhpmbTk0lsBXVd93vGiO0k3kjvcFXhASoJigGfOINHmQP4VHzf/VSszH3wTYxQv+
	64XrtLW8+ftjXpfEs4rKmuWIsjjAesii49s7uUkyz9O7dHnYwuBhpls5Uf1x4VNkkAb77tA4+FL
	QdjkZ/VskPjjKIlQDJz6PhMmBrnpaWa4XAx6D0rpdpjCF9GpBIq2g1QLMYqa2j/UckzV17sTTHM
	/CDYZFH0O+lid8Id6/DkUTNxu8JcnwZHSpHYJsyNWiArYW3gyFQLt0n8TLXxgg1N3NqA09hnqwc
	v9Au22nK7dLk1Xg==
X-Received: by 2002:a05:620a:5230:b0:939:c45:80ea with SMTP id af79cd13be357-939139456eemr3111271985a.29.1788258525637;
        Tue, 01 Sep 2026 03:28:45 -0700 (PDT)
X-Received: by 2002:a05:620a:5230:b0:939:c45:80ea with SMTP id af79cd13be357-939139456eemr3111267885a.29.1788258525265;
        Tue, 01 Sep 2026 03:28:45 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c192bbsm3875508f8f.0.2026.09.01.03.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 03:28:44 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 12:27:57 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563
 embedded GPIO controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260901-pci-tc9563-aux-v1-5-dd9b80738e70@oss.qualcomm.com>
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
In-Reply-To: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96a8de cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eJG0Ch9LUBsamovDncMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfXyzUWM+geZCAU
 fGhNkvhiM2XXnW1EJTAQwtxC8XZ+635V2jNrgaS0/ND98lFhLWznRNK4dKzbfgwDNzbCgA3iy8w
 ZuVNAg0AguajFoIy5kmJCgqbNZzBvTE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX8g29lY3pGPck
 N99atdV7vJZnuQoluHkLFmwHgrmk78twAwbt5B1RdW2V7F47DMHaBY3vOva939UHtbl8Sw37J5c
 MjzF0LsxbibBtfBcAmiPA3VtCogKS2KUJ6ctA739GQcOFYqwIdR+qrk1LgtyJH7f1mvDH9P9eM2
 EUUyFb4Kyv3QOyjlXEYGIH3h8jB+AW2udOWvNwaElvxON+g8bodgnfBqEmOP6YlSCHgYZm0UEdE
 eACFJGISqB7ZZ1/qvp1tIBZiOWEJ2zytewZGeUFO9wCRCG7qWX2Ym3zywEVrE43z2UyOHkX2l2c
 weF37WCn0EN93OrhAv68bdiJ5ZOje+M9mtEOTRUOzh57Nf/PBILrrJ6PEp1d9crKyQr/vOmYTHf
 gjrnuXDmbP4bocba5PVCeRnY9oQ1RlolW0f+xZXD9l2HWijWIkfl8MqDo6tKOu3weJZor4mD6q6
 QyyHt9zQ3uWgr0+vNiA==
X-Proofpoint-GUID: Y6UPdJQGiVXCoxXLJ2TyDY2j387jTYw0
X-Proofpoint-ORIG-GUID: Y6UPdJQGiVXCoxXLJ2TyDY2j387jTYw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010091

The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
lines.
The controller is registered as an auxiliary device by the TC9563 power
controller and accessed through the same i2c device.
Describe the controller as a "gpio" child node of the switch and use it
to control the PERST# reset lines of the two external downstream ports
(pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
switching to the GPIO descriptor API for per-port resets.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb0..8670c4243b10 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -891,6 +891,11 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		tc9563_gpio0: gpio {
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
 		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
@@ -899,6 +904,7 @@ pcie1_switch0_dsp1: pcie@1,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x3 0xff>;
+			reset-gpios = <&tc9563_gpio0 2 GPIO_ACTIVE_LOW>;
 		};
 
 		pcie@2,0 {
@@ -909,6 +915,7 @@ pcie@2,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x4 0xff>;
+			reset-gpios = <&tc9563_gpio0 3 GPIO_ACTIVE_LOW>;
 
 			/* Renesas μPD720201 PCIe USB3.0 Host Controller */
 			usb-controller@0,0 {

-- 
2.55.0

