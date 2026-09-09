Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B284577E3D
	for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2026 14:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965825; cv=none; b=mZ5OL6TS8wDb/TRVNVv/Okt2tM1xRKPp2OcqRidvW0hbCxNbQ0bSGccU3rnV+wBcUacXOQI+EBaZjcvvltAqwhClmXecgDblgN6Chuv+ulBkpg3r+NTAMxzngeDFIova+S59rIFRKV20HJrUSHej2ueWuVQB2aKK3ARsnyR67bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965825; c=relaxed/simple;
	bh=t6Z5sjaDxX6xGekJGOZPq41x3m5eNArj55TVt7VRYR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r7uy/vHiVa2TvTE0XGjt7Bt7jGTWjAu7T0vIBLAVdjUFbidBtINEKgN3VSRLh9BsZ4WCA0KVgkBIRbUJuASrsVLzz3JVqURvLevdr0qcULqn0HsI+KsC6fc225zRXxf40BRIKE/JPrAaAz+X+vk5dTRq5uXaGfDPCuIxIlvs9f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jezkmouK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/Rtgurq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jezkmouK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/Rtgurq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BoVTe2698515
	for <linux-gpio@vger.kernel.org>; Wed, 9 Sep 2026 14:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5SDhJCZBKrKqnQBt/dW/LAOkN1QohwQG3Wjy6HEB+M=; b=jezkmouKYdKVWsrW
	5p3M86b7+nyzQQ0zG7luy57QSfdD49sVal5pxJqErkq5mxqKUrZRbx9GiR07Tnh2
	H7xomHL/0oejf9KreNQK4GaoXCvda3eb1u0stR4z7LoWP0Ntat/scqOGiRjKi4wd
	mUndH3auIeTc65m8hk1NkF8XNUHgr4s1/H1sAqnYCiAk2u6msEJH3yklevOGH9F9
	BFQ1IkSH0Gt4q6V8Lux+9QH1kUKG92Zu9uMNUV0QhJMmo+n/9BVx40xFowMidS6a
	I2vTIVH/42XLOqa5BTXwnBRXeKn43H/v+rpp0WIB1JK3NZsUms/Ttkiqx3kAlJ7S
	Ha15Cg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh0tnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 14:57:03 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-980682ebf05so610438241.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 07:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965822; x=1789570622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5SDhJCZBKrKqnQBt/dW/LAOkN1QohwQG3Wjy6HEB+M=;
        b=e/Rtgurq7F+QH7fo2Zlx3B1ntMfpkHhAx+vNgdTgTv/LOz8d2TXzqCPqV2l+d1wEQU
         rffN+6GDiuIOG1zQ3ZXe7Fxbf4azn4H73C9os5dBhBRo9voilTlon0XxQM3k26MzTtTe
         NFT9vOSzUzeSO8ZHU5KFchB32rJs6ah1zuLJjkYrJzhi5DAx8xzKUWVvA2vi1OCD7R2n
         F50DIMkFN9PN/8zovuCaMmp9bqqTLhpIdlxSNTP6f7oVCwzjVKWKmh2viEj6WrnH2NUq
         Ev73qyIrV8H6M8JXioxXz3RpFk1ixtxj2KN1G6Gpw1jZJX7zKjcvii8I5fdoK5IyOYtv
         Z5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965822; x=1789570622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5SDhJCZBKrKqnQBt/dW/LAOkN1QohwQG3Wjy6HEB+M=;
        b=tVcT+wYDUKX8IhJFH8awx3Y9D9yFRbyP4SH6dqjxqendFVgAw1n+nzL7ecJ1zUSpmi
         pxo6steXkkPswuNyupNEuNqlx6J2JFdCQ4nvmQUDIJzNJSjZeiF5ZpxP7eC03JOHaAqC
         uqxLND0xPUzDk3gc3NbK/o71Gu70zQ4lW2FqCPf05M+QJduB1nxEe70lAbdwZP+e9Fbb
         7/zGhSoxI0blY7VTalkqwRs1U5sjN+O5Ts3hvJUIjWHYO+jC8SXYnJQlkIPyx8AmVfQT
         NOuRo/SZF2NEwBQXZi4V++RLU3+BkdjY6RA+/LzSHYSFLcJOhmeIfL5n0b2XCT6veCfR
         EswQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfHDuGH0bq8bpD2RgtXf3hfwo2aReTku6wBxg/w1sFnacg1VC5MfjrbgSLEMG+qIh9DXFfXLAO+HxP@vger.kernel.org
X-Gm-Message-State: AFuF++m/27qTF+oVMljkB34nT8rH+AbBzB5zQXTPreTl/CBeWQPA519g
	rgqi1pPT81u9huJsn6dOKjoNhAt8MoZqVwyCpTlR+4gesNj7mVpdePmtwGT4azL0QVzCVTUxDjw
	jB/W9J8U/MstpT7z5Nmjulou7wSRY++1P58HDLGYvc4dEunO1BbnSR2eHXo4nVL1l
X-Gm-Gg: AYBFou3B6Af1TayDK3oNJQAEKYSDPQh+SPtEbimufk+KmYvsPTAXmno+IWjQZIYpnua
	Js3Q8Y1QrIMvq97vpUIKO6f7mMs2Ttfq2tf7Yw5+QKJShLGILrbqPa9vLPOomDwgEwA2qGLVqxP
	1/RYPs+Cn18onk3S5WK7s9ItPXPodU0yPqSqvjDoT0KOWTfh1/ZDkjMtC0TScOsMVmqXpiOalnG
	i/zz/mFwAnL2BnAVFwo0d2I022u4ilnFmncbaD8De/XO7SyayZslLNbHRGFKrdDLrUsqIX9/H+1
	0cy1Y6XRDd34CO/rv8HYjmbk3Z7b/ajVrblQuqq3ALLSfJJB5oUQ34z2HsVFjOE/Es9mU4cZAao
	NQFubR7Np+xQxTg==
X-Received: by 2002:a05:6102:808d:b0:781:210d:2897 with SMTP id ada2fe7eead31-78a4aa07b1dmr13405771137.9.1788965821949;
        Wed, 09 Sep 2026 07:57:01 -0700 (PDT)
X-Received: by 2002:a05:6102:808d:b0:781:210d:2897 with SMTP id ada2fe7eead31-78a4aa07b1dmr13405749137.9.1788965821478;
        Wed, 09 Sep 2026 07:57:01 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm633757915e9.5.2026.09.09.07.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:57:00 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:55:57 +0200
Subject: [PATCH v5 5/5] arm64: dts: qcom: qcs6490-rb3gen2: Enable TC9563
 embedded GPIO controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-pci-tc9563-aux-v5-5-c9b33f56c8d3@oss.qualcomm.com>
References: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
In-Reply-To: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
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
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfXyZaY4i9VTvbY
 dAc1Womflku9KHqRZ1mrF6Owaka9Nmop46HCBhClsX5EM+V45LNwfTUvOvGdRiNEQVspTIC6nVp
 amUfYc0M9Dpg0nCnfdqSH2L1HLSUHV28UOsdzoNCNCApQ37wLd+4aBoc23Ziyg4eR+8/k93UYkh
 mNYCAgRmbuT+K80IeNcNcesY4iCh9m+wEfB0N4XZmOBOWsmgqa8ESzlAqXOxL/KzJbp0WzMXJtG
 +eJ8rURjt5kC4/0Ft/79qFKk8h/5f2+nSvvXBzVnGyVmOfPGX1q58UNxnKHWd16QQuWnRc84cfQ
 apByb80BSYpGbah+XXc6FlTGhZmhNtS4SH56xAQRUtDRhz+C/qI3CHR/NyC219YMJQYwtQVU5R9
 OpscMG9Fs+Is8h3CJ/Pyheot1BVyv92MgHzr9t7G972n6Lhhqd/MwEMz6gJttcZl8VBxGUoshJW
 zawZxwq2X0Siy8kSSAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfXxWnWJEjAxN6E
 LwwcnRdo/7o/u0LKKmd6kJe99BnUk2+T47kfxEG0SdKyVJsQ6EumFI0bfhYf7IyErsIUPv5NRpy
 IWp2O56vmjnuFv7XlqRdqgbimF9dWfs=
X-Proofpoint-GUID: tMbEsaa1ZlHsN2-pqPQWSuuwbWYAzKgB
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa173bf cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=kuerolza6ZzA2jZXMEwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: tMbEsaa1ZlHsN2-pqPQWSuuwbWYAzKgB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
lines. The controller is registered as an auxiliary device by the TC9563
power controller driver and accessed through the same i2c device.

Describe the switch node itself as the embedded GPIO controller and us
it to drive the PERST# reset lines of the two external downstream port
(pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
switching to the GPIO descriptor API for per-port resets.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb0..4da7342ca90d 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -867,7 +867,7 @@ &pcie1_phy {
 &pcie1_port0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 
-	pcie@0,0 {
+	tc9563: pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 		#address-cells = <3>;
@@ -891,6 +891,9 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		gpio-controller;
+		#gpio-cells = <2>;
+
 		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
@@ -899,6 +902,7 @@ pcie1_switch0_dsp1: pcie@1,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x3 0xff>;
+			reset-gpios = <&tc9563 2 GPIO_ACTIVE_LOW>;
 		};
 
 		pcie@2,0 {
@@ -909,6 +913,7 @@ pcie@2,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x4 0xff>;
+			reset-gpios = <&tc9563 3 GPIO_ACTIVE_LOW>;
 
 			/* Renesas μPD720201 PCIe USB3.0 Host Controller */
 			usb-controller@0,0 {

-- 
2.55.0

