Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B506A42049B
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376554; cv=none; b=O0SmzMxWY9uWeHvPLaDpCt/z9Su5mfsMirY4xoBrBi9t8wLi3o9oclIgXa/ZL53hkJ8rvtkAZ1uDKpzLxtEeVn5CxlMCJRxF/ktXL2NE6TvkqfxSOl5mYog+CxzWIcCgjXJzZGY4qrC6UyyRKFgfK3wNFWuyW+mfdbd2DJ5BjIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376554; c=relaxed/simple;
	bh=AoZJqVVSo+ZoP1B5mllGlVyWEAwh6nCg4CrfFN4+HPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hMouRoYhg7dXyouOS5nBNF/E08Xh07PU3ZixeUMLsZhqMjmvaB+kHQ4yRSN7tLs6UUxcr3KJSkLeTI3b7qZyMpvtHNJa3qrFoMaEtvZ+d9YNwZhKccz5SBa5BaHVdG6RwiHpPqRR06rP48rcYgOkIU6GOVbIPIwv6F4EQwMniQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHfxMlLM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMGpjohO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHfxMlLM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMGpjohO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWbXM2058038
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+hOVlvodWUaHCF6f8ct+3ncKE/NpJynp45drgitce8=; b=jHfxMlLMUSqIKNqk
	RolHCMaBomN8/F0ZFjIgz3uMj8kZs+53IRllyuqSJaYSntJUDOynfw2sW2iDmA4s
	AHNWQbEKcsOpvHfF2KlpsL2zGfFme3o2+gvJzvdc7yc3UwZr/61Vq3TddCuvVWzo
	xu6ZuVez09e6JysCkQsZbQT55ZSi/Q2lwEp/g4/UDzulrP5CXybWoldpzSe3xn4F
	vFzYAqmTqh7hd3Lub26fS0Mlwbwb30zqycD5ckTRuqeat1+CfEcfRLCrxukLGvgh
	Jne7RezkSJpqmfbCW0TT7rvPT7dn/pS/jmNSkkdZw67XrOlUV6WxMP+vVQ4Yg0il
	LqMfqw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v2acst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-526da7e3c9dso17826021cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 08:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376550; x=1786981350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+hOVlvodWUaHCF6f8ct+3ncKE/NpJynp45drgitce8=;
        b=DMGpjohOKqS+NjxU0WQe1yGzceZO+j2NcNt9sxfE+otAlb5AqLaNKpTouqRCWiADEd
         dNBDOErqutc4lDsveGEbVA+/TOfAtsZatDfc62m4NtS14eTzE2mobxJa/VMBI3uTtb9K
         D7o9Ha+IhVxlRo8yofVeLwRTOcngYva86BY2Vz1u/hajeKRBfAESkzlU3vq5WykKir9L
         1JoJRHfMeUo4eKBNlZmpDBk9RsAOismWIxo7i62ocnNJ97M78FzzfIIFXLBLxxltpTJS
         BV1D55Hhao3/l0XohKVUDzUQvQxhBvGN5PdK9mbMUOm+CcNZD32BdYFSnFUg/FEs2nL8
         MMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376550; x=1786981350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I+hOVlvodWUaHCF6f8ct+3ncKE/NpJynp45drgitce8=;
        b=cJQXfA7Uvzwx5aRwyYcUAI2nWSgxhnAKslVzUP6juMT8zdsh4WFWqy4JAjpH9y0hdL
         dQh/xcVftFvtPEBJQJGp4cnhxOJ+gMi1KlhgoTHjGesc2LdeenS+X9IFttXzmpkKKtbK
         YYBEDIwOHXGU3Pz5Ns3XEnAU+cp381+/96o5eo98xp38btUP8XrFNvQX+sSyzzYBDd7y
         U/TshrRUXwP95UqsQ1dC/S3jV3EWMjpC6UIw5to0OC+UBbJOSGBZ3KYx+Q+gh7ySQv4s
         lLRW2blHGiKYaCoeTBBLPy+82QuQCO6/fGN2rON4ifNtNjY2sSJ9tD2D3G/doDztzXXc
         Ur4w==
X-Forwarded-Encrypted: i=1; AHgh+RoqEKV2+VAQyOb8jebyRBHO3QLv7nZpZcBnIOmxaNeeKj8uTIqt4CiBRkZgLWYvKSt4F6Q5eSSD3t4H@vger.kernel.org
X-Gm-Message-State: AOJu0Yw37XmDHngVH4LBAa1icdGW/4G5cNn6hvAyziuCvHbSU9Rj/cNA
	Vqp2hxQ6Sl87oyQ7i6nnOkISI00ZFPettK64MQ2jYG67L9srpkcRy5rMbWP6bSN7hNiTEcr6lde
	+jo/6SV6oCUcdo0QGebhz7WREvPP/K6tdADFYI30Y9llAbDQ2mk3N5Y24L18/WicK
X-Gm-Gg: AR+sD10DOgi/o4ifFUyDkxEHhvbGT8qdG5aQqDc3hR3VHH4YF4zBpZNiNm/tjREF4ln
	Hv/n4T9W8aGa7pHtyLSp6TVhiB3dQHyPTe/gW6xssUCelTGjHUs+teY2/ywZnZzXUR7CYCRm4Za
	YGfq5UeuPhZZXu+WExyJj+VVBgTPMPTLYwYvqRxZJDgDtd267btgaCmXxJHesjuTzhY6Sz83gI2
	iKCtPlv+G+Y9azCIjAF0mVJT+6KapdzJREfqwG69VyT8fqKIg0sHHFCasC502j6ctxN9vciqB7u
	KhGto5QXV+v8AH778NIBczip3u6jffefJlpq5KJ56xtag7bTWHq223xEJ703TapkN+TtBdkxwUD
	y1wYH/LVk6MH4+purSphyHdr+L6WSuQEu/PmhOr9+WuayQe8+LmDJ2jiwgZzXuW9ns/etZSWMrv
	GVQ7sntyjVM9aWsg==
X-Received: by 2002:a05:622a:1f09:b0:51c:167d:b328 with SMTP id d75a77b69052e-52d4c251541mr32256451cf.40.1786376550344;
        Mon, 10 Aug 2026 08:42:30 -0700 (PDT)
X-Received: by 2002:a05:622a:1f09:b0:51c:167d:b328 with SMTP id d75a77b69052e-52d4c251541mr32255431cf.40.1786376549857;
        Mon, 10 Aug 2026 08:42:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:13 +0300
Subject: [PATCH 09/10] ARM: dts: qcom: msm8974: add the HSIC USB controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-9-e5f93ea76ffa@oss.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3085;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AoZJqVVSo+ZoP1B5mllGlVyWEAwh6nCg4CrfFN4+HPk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFRg39N0tUH8uaZmrJ4GFul6JSkWDtgH3bqy
 rr5MP2jP92JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUQAKCRCLPIo+Aiko
 1SiVB/40EuDT4bcTQdsQdEN3kOWqySmkpWkj9bLL9kuiS+NlkLln6QGcFc13/zxSkQSk16yZEZ1
 h1K+H0irtCBFzFGTidDD9UA/gadXnkDrAwxrO363i3O2rr0HPV0bwmf2pZO1vsEyu2Nv352E0I8
 SzD0FflaDxjAJw11WAHgly1oyJq176j8h5+3ONtci7mAV+2N9m+zFJtVrNxz2QmZoMr5VrwgqgS
 qU/4/Pg/4oEKd790sT7a2LSAXiIrG961BRz8xhsORLvADKhfalwb++/kX9yXPjjgGq/FXx0uFxF
 ML67h1d8LFVTGKXfnticFrcAaXfHw5Gcci0GGDf6IGAZqsl9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a79f167 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=SNm9lHMw0LAWI6_J5M0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 6dfgNqVxHeisgz90r5NWuzAIt2mnDQz3
X-Proofpoint-GUID: 6dfgNqVxHeisgz90r5NWuzAIt2mnDQz3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX+GRZ/ZezEK2u
 8Ag4MN/Nd7fuxZ9Rg5w6lxDmWVzQTiBhs4R9XVVxd3iptPXMgCVnRlDVv/pHWvSFyWQTmMX5IJw
 m8LO0sJCllm38Vp91wWyHdjl0NBnPZO3LxyMIgXf/kdhBReH6aCd5HbxjGjcoPRZVXhnG38HttG
 EDdsqtTuCLVPycMMm5/xokNF8NvdvclS5zdw7ZhM5IBUQVSYYH9iOX2xXJsOHu719Swmum+Bask
 iCjjSS9P7Ho3YAr/DdfGrsbC23bmNSEQxU6569GNlTJY04J2R1psRo17A57fjUIeB6ASwha4hl/
 SdGY1qaEgkmdVssQ/3hMEgR+mRYqHupAepRgc1wtyHjZei8txfWMRQrK7+9k86UU3u9zmJf1OWU
 EvIDtoMz6Z6XeIfZRYjgrcp7jXdv4pBl1bb2BB+O5jDr/jcB9uK3Wl5Ri1Ns8vbbBXvg1/naPjh
 AqpFitSwXGJ4leRWMug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX8JaeYToBNh3C
 9pHxKnqMEaN3lVYfaLJEEYQviqMpoXYwc9bZFFQ5yGdGG6o2vXYIUaCdb1J/gkcL1L13v1fvfjg
 XA1e6pcZSYuTTivZ+z0XLtG2/QtyUFk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

The MSM8974 HSIC USB host - a third Chipidea controller with a
dedicated HSIC PHY on the special hsic_strobe/hsic_data pads - is not
described, leaving boards with HSIC-attached hubs or modems without
upstream support.

Add the controller and PHY nodes. The PHY is a ULPI bus driver present
inside the ulpi subnode.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 71 ++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index bac3c8772e0a..72cd369927b2 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -760,6 +760,49 @@ usb3_ss_phy: phy@f92f8830 {
 			status = "disabled";
 		};
 
+		usb_hsic: usb@f9a00000 {
+			compatible = "qcom,ci-hdrc";
+			reg = <0xf9a00000 0x200>,
+			      <0xf9a00200 0x200>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_EDGE_RISING>;
+			assigned-clocks = <&gcc GCC_USB_HSIC_SYSTEM_CLK>,
+					  <&gcc GCC_USB_HSIC_CLK>,
+					  <&gcc GCC_USB_HSIC_IO_CAL_CLK>;
+			assigned-clock-rates = <75000000>,
+					       <480000000>,
+					       <9600000>;
+			clocks = <&gcc GCC_USB_HSIC_AHB_CLK>,
+				 <&gcc GCC_USB_HSIC_SYSTEM_CLK>;
+			clock-names = "iface", "core";
+			resets = <&gcc GCC_USB_HS_HSIC_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc USB_HS_HSIC_GDSC>;
+			phys = <&usb_hsic_phy>;
+			phy-names = "usb-phy";
+			phy_type = "ulpi";
+			dr_mode = "host";
+			ahb-burst-config = <0>;
+
+			status = "disabled";
+
+			ulpi {
+				usb_hsic_phy: phy {
+					compatible = "qcom,usb-hsic-phy-msm8974",
+						     "qcom,usb-hsic-phy";
+					clocks = <&gcc GCC_USB_HSIC_CLK>,
+						 <&gcc GCC_USB_HSIC_IO_CAL_CLK>,
+						 <&gcc GCC_USB_HSIC_IO_CAL_SLEEP_CLK>;
+					clock-names = "phy", "cal", "cal_sleep";
+					#phy-cells = <0>;
+
+					pinctrl-names = "init", "default";
+					pinctrl-0 = <&hsic_gpio_state>;
+					pinctrl-1 = <&hsic_state>;
+				};
+			};
+		};
+
 		usb: usb@f9a55000 {
 			compatible = "qcom,ci-hdrc";
 			reg = <0xf9a55000 0x200>,
@@ -1677,6 +1720,34 @@ tlmm: pinctrl@fd510000 {
 			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 
+			hsic_gpio_state: hsic-gpio-state {
+				data-strobe-pins {
+					pins = "gpio144", "gpio145";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				ctl-pins {
+					pins = "hsic_data", "hsic_strobe";
+					function = "gpio";
+				};
+			};
+
+			hsic_state: hsic-state {
+				data-strobe-pins {
+					pins = "gpio144", "gpio145";
+					function = "hsic";
+					drive-strength = <12>;
+					bias-disable;
+				};
+
+				ctl-pins {
+					pins = "hsic_data", "hsic_strobe";
+					function = "hsic_ctl";
+				};
+			};
+
 			sdc1_off: sdc1-off-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.47.3

