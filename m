Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8E734D382
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 07:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422034; cv=none; b=PyWesMI5v3bg0ZyCbz5oIQnIyxh7a8p0nydYeTqiU2kPh4zIFz1rQqVA1eRNxwmFQ+pwdXL+peRfnx3RWuU2M/o2iNnjKvQZchidfv82VwYuHfMoSEGHn6YJAkHvBtejU3SQ2Mpm9mrZ81TrDiyU1N08ULL0B1dFP6b+myenaXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422034; c=relaxed/simple;
	bh=at32knaWNCI4MK+ZgXm4viSmUtWJZmXLxN5xEjZMDrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SF+UzuRD0dKks4/SUxbRjmbSYTAbYmSvkN1zMxNFS61HmdUZ6JPh0/XdUSSNschagXUNECVsgEnFqcxbHI+2176f1A6j55Lb5R5RA4V3ERVFY9cXVC39TNkilDlV/WomclW5nPRNtgNvAOOkGE3fgzXoh+Vve+sz58jpQalEXro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAkQ9M/q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+ldrj9J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAkQ9M/q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+ldrj9J"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835mYs63178313
	for <linux-gpio@vger.kernel.org>; Thu, 3 Sep 2026 07:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wibuWzN+1YhKv9Jd4E2FJsvoSQMxMG2ONq6pDF3AqKk=; b=RAkQ9M/qq2IXHG3+
	2KZzDBRG3DZkXBdKPgxqERg+lz12EkQewnCTwTCbRmezsMYATCNKELiM81WKCLvY
	jJ35JldVfdPpSEy1yXhsO4JPu3wfEiWY4h2JkQQMjFlpQ7FvSP9s4Riz9cJz8sLl
	33dwyRyzQwBXsKTOxRlKLISlE5+yoGLfckys5bCOG2kUREE2TZa7KMtkdeqwT4ic
	EP7zSCB3d+FOdXv1aL+5sjDEnva/SvXlJ+0l2l4vA2kVXCrf+riNKPvtsFMVLBWn
	tVIBxs6E+A/y9/t7vFKrQFxwsSRkANsit6ePbyIyHV5P767z5HDOP2p53jEk7JRq
	2y9Chg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4v5hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 07:53:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939281526e1so108144085a.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 00:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422030; x=1789026830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wibuWzN+1YhKv9Jd4E2FJsvoSQMxMG2ONq6pDF3AqKk=;
        b=E+ldrj9JlaA2lkATL/8lOT/yfntBWRlrhbaqn2R8pMm9oUpEJeaLjpq8gJm6/sDjHa
         TZIJ2LiV2qr4wU8ukhKFTbN1kCqz1iu1f7/5Khc606rHn3yoZu8dXBWLtNGs9+NdqZ8i
         NdUYP2yexbbgEzrkbYzYrZ07dMwIkTLC3EjO2/lQrKSDTNLgWZ5OGGt2d9n9gt1PF2KR
         dEiIwV8k4nENwZ0Sg7uzPy+tuwFCrRTEe0gR7QYU7FQjN7tlYRIMjanvsTR1Pb+1XTU0
         3aETSLi/UdVhGXKgWTsQkCY3eHRSLHIbUqAUX4tEw/StuWNjapv9uYOsGk7JfGoGS4XW
         fc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422030; x=1789026830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wibuWzN+1YhKv9Jd4E2FJsvoSQMxMG2ONq6pDF3AqKk=;
        b=smvyRn+izCccsPn7vBybZRQVZHD8yv0LfQ4pq/zTyw8orgqUM4B7rAsUFopBfaT0xQ
         3rP6Eh34TvxvhMxfYxrgo/QiWPojOAbu9OBmHVrQypmKnakHOZAqBndIs6AfH64YPxJc
         8YqkDuLrXU8bDmiEqHTGyWI61FNu8CPOT6SN0SNbIeHmK/2+mVtPUBVYjc/7G1Hl/UX8
         sJ9lyIYx92M5tcN8JqMdc/UgFDx+qolpQS0q/AqTl/tXxe7rbFdKiHCY319RSzQIdV9p
         aEO5AcY8P3CJi9iKLLRhFYqMikdYaxHneLPhvF+9XvNWQoc71YHP7DUdXv2qQ7o7K68m
         t6tA==
X-Forwarded-Encrypted: i=1; AKwUvBywc27fw2Q/HP5LkgCaEXgQdcSn7zKX5J/H4IdeGp0OMnt8R1gl/LXxxwF8RGAumZRBa4zphPMnw4GP@vger.kernel.org
X-Gm-Message-State: AFuF++mOQDWkK5ocMI3jZgimLdxu8D46qITNQB9zSkSU6HZvQT4ZVu6c
	fGhdI46zg7tgXQaKzfyuQAoDB+J8NFjeBnn6I2mKBWS1xnDQg/BqFwIj2I3/zOq4hehjRv/kufi
	yniMQkowubgsska9gNa/IW2sqD17+DoXqB1w8y8zxSumuJ/Kmr+xcL1Aq6P2O5lRn
X-Gm-Gg: AYBFou3QOgcfvo+lN/T9ctqVPAm4Q6T1xfUivsiGFDKA1nQdjKnAFeq3eBEB1j3ye0M
	D5GVErkM+DlLlGcjn9L7Pn91/dmDyEUR05dtwW6POS/Zqya1RzHcf27gh0EUCtY0I3uG0s5HiWB
	KX/rmT7Ywx8KTVYLgk/R1OY7D35dwUca7fz/RXg8p/KiloU+b3/u1dqC/FZ8vG75gi1M5N07TOB
	7e6JA7EvqMkyuloqK5Qha75QHXqc/FMQfSZmeRoLpeRK1oe8vCJgLRyQFZnJ3ZfFtxfa2+1nkeR
	EMgtn0nNpLIz4NcK1G2m/Cb5Re61g+zS4d9ugv2Mtdzoev7fHzeGUElQYaBRsFynK2CD9lP/xey
	5PHWPIQVYdl6qZQ==
X-Received: by 2002:a05:620a:45:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93960f88048mr1029254185a.34.1788422029739;
        Thu, 03 Sep 2026 00:53:49 -0700 (PDT)
X-Received: by 2002:a05:620a:45:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93960f88048mr1029235785a.34.1788422024450;
        Thu, 03 Sep 2026 00:53:44 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80388sm13415622f8f.14.2026.09.03.00.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:53:43 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 09:53:01 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563
 embedded GPIO controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-pci-tc9563-aux-v2-5-34c625b542c1@oss.qualcomm.com>
References: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
In-Reply-To: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
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
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX8W7gHp2gvoSq
 Ced12d3GXc5PCZADiri23okxbApn8ghZGC4jiRxUwsc/FoidHeeh1Pg5wfZz39j09P6Ij7b1dwC
 ck/YAmM907FpqBHBIfClK1ghsWinPxVdOn1Q3j+dvyHkPEV6fF7+o3dHRwSxPq7ZDZY+GPjcUUj
 Ax9q1B3AileZEIBAsCPahwSXXhvV9OJfWLyk+ivEUZv7FDReMwTYuxhAKWWUe2m7ufWaEUTFtGr
 DMOoKOBc3CDgnGzSbOpTqoVkYEWbUG1CHm/+smipCTpcudUR8PZ5yBsTy7TumWnRXrLa1W+ascN
 koE1poNesgiO0TVC9Wx+wgk8Y725PBYEJBKgZM9J64HBSxRkJjdC4Efh9Y2EQGTEhU+rNdj6wL6
 NUrA0+yUTyE4LgLfK0Qgl1VvtA+qI2c2E1bvKLboY+VFrR/ppwSHmXZr8yljfegMTxyCI5k30Jp
 zaBCFuuTQdgwSNn5n6g==
X-Proofpoint-ORIG-GUID: CBum58-ePVTTJcsS4bNs0NCNU5tV3bxl
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a99278e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eJG0Ch9LUBsamovDncMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: CBum58-ePVTTJcsS4bNs0NCNU5tV3bxl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX2HFzBJxJADyE
 zAcQiJB/KdHyCiB+z6h311JsQOgqdAS39yBNmCzHaUJH++2d4XM87BBVigtdmRCD7ALJCmzwGX+
 DQgdjl1ruK9CaD1/HjTledAavO9o+Dc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030069

The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
lines.
The controller is registered as an auxiliary device by the TC9563 power
controller and accessed through the same i2c device.
Describe the controller as a "gpio" child node of the switch and use it
to control the PERST# reset lines of the two external downstream ports
(pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
switching to the GPIO descriptor API for per-port resets.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

