Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716FB42315C
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376556; cv=none; b=MNj/cZ0cKFXcGItu6dzZbcHXayhqr6J682wKCeSjPDgtsVMCDfShCsPRDty4lnxagRxT9e8Y6NowV46h+J9CE2F+gTWwVP3GXJK7NoN1SmAHoj6FkREt4Gy/qU9d4lpvpKScn85Eq66Sdyt//6vxPnbBTFtvaf598tJOjHL8RAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376556; c=relaxed/simple;
	bh=vDDm9UNNeBZngu98OmnO9mFNj134tAZMEgio5MqFpBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k9RcBEsM+rY4EOEhPiegYRVwsvolPAHMW1UCtH5tyNDUDHdJLZ1ViFQ/Jca9Gm70AN5rqQnx/DyPUn1Df4UxgTrrpZoqNaULDw/gp9JenbkPm11TfkyCuUz4QIp5tmrqhOi/7BpqXvV88DTpJSziUcg+JkpaWkOUIiQ6S19sOTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akwxgGYi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLv96mya; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akwxgGYi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLv96mya"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWNpm2344956
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vKWiI1N+R0cjOLHZF/QZRa5LZDuo/wMrVcjfTjWK7o8=; b=akwxgGYiNPm5S6/R
	anwWFKN6u5wXh1RpndWx0GoZzEvRB9Q4YUuBSeCNqbSLlmREGasCbyNPAFBdnVj3
	OID1TpwEwliR9wN+DOJu4bEHENYrriebnfAzzn15Cn4ZFvA/m3CXwmxk2C3VUL9l
	ZMZwml/RTa+xuu4areXhKv2T2x+NbY0XErjsMYHSnPeR3mdCPveC2YmO5YvbJ6Uc
	xgf/Je96SLn/+j1YOTMFjoUfqhTRBxuLOpvckdPrDQp/x//F6ynUO4PWLSRR2EI3
	N85cahiSExYKnkN7dRtVVMgcqzXFxy1Vwcfj3dZb+hcnmeKahHgzgbq9r8mYQID0
	3KxkoA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xubyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bf321d786so25605581cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 08:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376553; x=1786981353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKWiI1N+R0cjOLHZF/QZRa5LZDuo/wMrVcjfTjWK7o8=;
        b=MLv96myaY/KmEnbDXP3zx2EW31Qy5GXBPAJJOMaLU1bB+MLWbWeOvHXpC/T0Q2jDF0
         cIAPLBu5d0m0HBFO+zTnQlQ6vZzPwPoU5+9TjiOin2jUsEE/GmpEFTjXlygLSXaUlWyC
         yYBiRCuFORwaRBORL/zXVSP7EHM/zPD2+mb8HzxT0vgoT5+etW2hnXor8T8BrbAm/kGJ
         x4jlFx6t1VS6HFjGlfqluCqCz4iHyyAU0/KfVW7ed7D5IRT2WFJPqKwRmBCBDrTEw8RM
         a439xwlh4td0jGZf8q72nVJb/Rn1XdfCAVJJ82MWn4wlWHFh7rm50rOHWT2eGRgDnsEU
         M1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376553; x=1786981353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vKWiI1N+R0cjOLHZF/QZRa5LZDuo/wMrVcjfTjWK7o8=;
        b=I4XGRV2SjHId13/ZFcKS6Gij9hr4YNfDQShv6DekI8OC0OxNaiwieZsOLnLXxqmfV4
         sZNorRfuMelzOcHiQMCnH4hL9i6oL5iy/BmxSMMGniYjDvoaN7yrm359VkbF5mvU+oYZ
         j8pWXohBn+oKNex7z66hUK+qKsNZKatLhsxEPcvEqYQqoITJsSjXopQQyo/qjBU2RmO+
         9u8P3ABSapW6YLXpStoj61r57zsbHjonxjfF9TpRsCYja2kCqMJ0vpb+yBpkLBNf5vgi
         voMVfnrQZKKHYMvLV6WsncC6WyCbavg1U+0oOAR/awGNGP5LJjvI2giZc4CYO6x99/SU
         duMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOVMiDRXiqGhiUnBjPgCCCr4fsSZDW3tUMBZylj8x2dj+hJRnFmtZosDtvcV+NvtXJ6+2Lc7f4MGuN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxueq+jf/JHNqHUKSSgr61ZtQNapbbeawCKrxZO9dJR9yiYwY0P
	L+b3jqk1DU4BxdafbapM8oH0Fx4xPhlO8FlMzc93jTtjLA3Y0hUPw+LelpGZ/m/sn73rEfNsZD1
	ePJw6VAXnfjfltJudA53UDUrqMap3ENizH+Zr8ZuGiG2mTf/147LvaKtOJIdjwbZW
X-Gm-Gg: AR+sD12eIyxrtA+U0aEVInCQgEtldmg5vgiWSsjnIbUW19zRXFw4XrHSXX6dzGYcNHs
	mKTtfanreW/jHh1gg4dpeDIsjDKu2sxnMNf29qwiqRHLe61HkUuWK54r07HaTkXPCocKqWWjWqJ
	JPgC41fp/RGed+9mXeb4e5AzIYsQbY4cYD1k4kDTO8s4gY1DjJpGbVPzpsyjQurG7h0gRdRYNuv
	TSINd0lKvPLThtNC3QnshFr5G3JWorEOfOCjqlSldQ7BZnCw8j2JLZ5xMQyo0WWLsogOXykgqDS
	yofY0/6Pl0bokju5Jbev3bAlYk72jBNLKG9eBvmzGmhA9zuRT8nA4zzJiUgqAaz+DC9XcQPVEKD
	UD0PxYOUzS+zgYEL8bTRAVbKx5rgHa/busqShiAJ4rRZqC3XoRCCA2QlnrqCFtOMjX5ccc23RTE
	E6lCE6wacxQx6xsg==
X-Received: by 2002:ac8:5cc5:0:b0:51c:207f:6524 with SMTP id d75a77b69052e-52d1919e59dmr265070371cf.37.1786376552649;
        Mon, 10 Aug 2026 08:42:32 -0700 (PDT)
X-Received: by 2002:ac8:5cc5:0:b0:51c:207f:6524 with SMTP id d75a77b69052e-52d1919e59dmr265069211cf.37.1786376551886;
        Mon, 10 Aug 2026 08:42:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:14 +0300
Subject: [PATCH 10/10] ARM: dts: qcom: apq8074-dragonboard: enable the HSIC
 host
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-10-e5f93ea76ffa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vDDm9UNNeBZngu98OmnO9mFNj134tAZMEgio5MqFpBQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1blx0DxUsOgB3I8DaoFadt+iH/JjhX68Vl7069yvqQUu
 5qu1bqdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjI2f3s/7OLY/ZetjCx/rFQ
 50HID9O4R5eSlr52Wb7Mjzs9J23y/jCD6xp2O7h3FXfMFb7+PbHfkmXKvmaFGzEN2T0tug8CZuT
 UWchwZxd8TLvSse6Tc6FYxtRZXklLFIOU/Nm4+W2SfjmGp7TGcPp5xByzcc2yKZ9w+vxO7XNuoT
 qry9YX3VkvvviGQ4PV8QPL+VgsTXlmvuhJOV5fHHB+t1t1kC2PQPMRoZffui/Wi0ULG5/7eeHN8
 gZ9juWri/RkO7+HZqWZuhSLLDys3zttx+tPZSZdvGkzhYKCBSJS1xYdXLZ9psj5BMFrpUJ5c9Km
 Mynsm/s/ZteSbGPVVx4avTuav0+5PvntR/EXJ4vqhFIA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX4yrsEJDk9qAe
 wqssa4fXH5OFxCOrERxPBAb8SejlQyERwCVuo0pQG6fV/mu/WBrSNwfIM4hshpZDZlZiHiPMYG/
 3MGuV6zAChvdO3Ii8ddwY6zqLVqDtp8=
X-Proofpoint-ORIG-GUID: 8sf3bCpOo-0mSj6C0_cJfhK5jH6hUf6V
X-Proofpoint-GUID: 8sf3bCpOo-0mSj6C0_cJfhK5jH6hUf6V
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a79f169 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VFyZVMh9rlY2QtTs7IkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX+S27xzJRWpI2
 +1Do0qGzJjMIUuVkwqS9pBwQs5bGrdLzjcUTTgdfxi7tRSIHo4hr373Xpd8Lb0r+9kf2od4cEp1
 uMr4/YyxMD3wlX88fY6mmViXj2iQHxZjpFkehsKYeVCYFgRQIjXi9dL/69nK2KrfcahVwCPskWn
 hEMHs7flXtF1algFxiDwWqNO3CT/hPis+458zu6lWEV6Oq5tvLeHe65i/fqsNupEpjmnbkfovEY
 AEZ1rOHvTqhafEs5tyeywI1D+oISOHib8GrOasj2Q3oNIpRogari3/ZKWCKkY0jNttfNClpbshD
 BkYFD6RnM9OmIt0lJ560rs1mIYYCYv8pj300X5KmBMz8a9LMaAfgifGB9wEFedySoi3kc72hOrl
 1HklMgnqYnW0WX9K8JRsL9REjPPX1/M8zAIzzjveVloRxC60H0J04R8j/08d1OAj01/DVGkSRoe
 4jHfjiWjR1mqa5SW46A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

The dragonboard carries an SMSC USB4604 HSIC hub, but with the HSIC
controller undescribed the whole HSIC-attached part of the board is
dead.

Enable the HSIC controller. The USB4604 hub isn't controllable through
the I2C because of the board design issues, so reference it as a simple
USB device, describing the reset line.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
index 083fd8fa0aea..02183b37ddbe 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
@@ -158,6 +158,14 @@ &mdss {
 };
 
 &pm8941_gpios {
+	hsic_hub_rst_default: hsic-hub-rst-state {
+		pins = "gpio8";
+		function = "normal";
+		drive-push-pull;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_MED>;
+		power-source = <PM8941_GPIO_VPH>;
+	};
+
 	msm_keys_default: pm8941-gpio-keys-state {
 		pins = "gpio5", "gpio23";
 		function = "normal";
@@ -487,6 +495,25 @@ &usb_hs2_phy {
 	qcom,init-seq = /bits/ 8 <0x1 0x63>;
 };
 
+&usb_hsic {
+	pinctrl-0 = <&hsic_hub_rst_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* SMSC USB4604 hub, standalone mode (SMBus config not usable) */
+	hub@1 {
+		compatible = "usb424,4604";
+		reg = <1>;
+		clocks = <&rpmcc RPM_SMD_CXO_D1>;
+		reset-gpios = <&pm8941_gpios 8 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pm8941_s3>;
+	};
+};
+
 &usb3 {
 	dr_mode = "host";
 

-- 
2.47.3

