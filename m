Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2881D406261
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376544; cv=none; b=K0KHgyQdmPS+tIstGRXva/GBtNUUA6RbfQhl1EuH6mGtgZqVggAJjabwOCAMeLt7/CiLk7moL+pa4aD4EVDiRA/2773jYXzmJ0y+sZm5MyHdE1b4q8ZSzYQejecROqVkkaY/J48nvdh0bRoqSdyOOWeqgmQNkRr44bgJTcDU6hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376544; c=relaxed/simple;
	bh=0CI3mvu26e7yA8lXB+SGW6FHaZ290+w5/6/G0cJEMAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bl3taQ8t5wOMB32qmBtuJa11lrRZlHM38+k2Mvd+k0V2mqm4frUXY0ZKSWOe1rnXsYcH4I85nTRxu90Cnjfhr+8DLq65YV0taOqs3DnWGo6WDtVBrlAAaDK7xPhY4FWambV5kSyZMU3tuN/h7oZ5jMy/q0t5v8aWc8tbLdbe8pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZcV9Mp7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2139EzV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZcV9Mp7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2139EzV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWKWp789064
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wb7qvpUp/pGm2ninxxAE+oyyMl7XsWm9X5sYC8bZaf8=; b=ZcV9Mp7SANLg3D5T
	PWLMytl00vS/dew4AbD067kvdt36FpqHJ6AjCy7ZFwOHr9kt137MO3GgFXgScuoW
	nM3pAZXnEDUjIaql7nTSuDyMD7/PjTIx2pOpxGUcMl4NEU8sOqWls+XAEr65C7Y8
	XaQJpLZpa+y35XROU+5SZCpYp/mEx9h415znrRBtb3YGcnixmxYVnlKoDf7Hvo1v
	GsXXJ8+sqkS2oE+CYGn8J916dKe0t3XNL3mPJ8WxOhG4CTJFc9H13jIL4qiJhGA0
	lv/LSw1yCmWc/n5gEODXbb7NEUvjXCDJhtqXZ71Ur1F3xXNnKBI/CSBOvmjQUuMP
	eG3k2Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fycgese2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52769fc3f2eso27823571cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 08:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376539; x=1786981339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wb7qvpUp/pGm2ninxxAE+oyyMl7XsWm9X5sYC8bZaf8=;
        b=g2139EzVk4c+Dh9HKQTF78EbgMDgEkt3njcuBnUnLR0kKjxLAMrS9QCNvbrSeybY5n
         moJKNJ84f63g+g203h8CT4ArS+WhlmRhBtQ2a9qVdVOjapRUzQr3wSPNoXdUgC2VX9bM
         woIzDLt+/WAHdpS066nUEfmFsmAn8XLetZScA9rf9WskgFDdvMHL68yLahpVh/1M8Mp1
         I5tyiPagsqEkCQaA1wMs/ZnNrJh6hIrJzHMdxRh58fxW8i6D5zeLSmv1nV0ExiPUgBfb
         b6X0q2IVKE9SYWPi6iUJX4N8AcKw5ZbGuU36sg2kigrbQRE2yVvcqv4PU1tmeZNEi8YW
         zuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376539; x=1786981339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wb7qvpUp/pGm2ninxxAE+oyyMl7XsWm9X5sYC8bZaf8=;
        b=myYL+kzSZUHnFHGJ2AaJdjKlpnTyG+QpiUHB29dX3pmsYDSNQ+YfJLbtpJX1q7o2G5
         Xp1ZCfD21MSZ+MhmuGmECqxUWcZcWrR0SHXvIAZvMoqJ6FFnJcHVMb0gd7CIFu4motHp
         dhI9QGM1oTUh/A3IhhsJ3xcC2r9aDoFklT2c1Hr5Lm7+Qym0K1I0REdkRHcXWhasoVoO
         swHeQ98P6KsC9vLJXoVD61xh66Q/UQDhkhTwtEI1225EHDhxK7pu1E+pgKDiWFJ/1sz0
         kqAQIMP43NIZnQh2wVC/AMGwJ3aYZrn+bWyZic/RmrSHHEYAHGhkI7wHJmQZMWXFyVZ1
         npGg==
X-Forwarded-Encrypted: i=1; AHgh+RpiueyrmW/NePzCbWFlWnSAsgfgrb/ykr+n7GaSeFYwLD33yZPefWPReWjKfgCjDd9t07oKrn1BNrnx@vger.kernel.org
X-Gm-Message-State: AOJu0YxA7GaVp2WO1mw+ju11JA0khJCfxq0EbwJ/mVeGLh21+0TjQ11U
	OM3B9DYNP3NpbLHxOqACMAEQwMb23EFxMaW3F7jJOZcbUNCjR5VVr6qIjegWmH+PGwLY+zz3IX/
	ZSdXkK3rLVDJ2bJ3dO23nUSNMEccmJXmFlw4Xx8bccj1/Sfy3czojqPa5GnuEzd98
X-Gm-Gg: AR+sD13u/u8NaxUeVG5Xe7GBoYSHji8N0piIf8iOyv06qO3OeWu2lYAdOIKdkSvy22X
	pyGq5m6w4fwB4raOVP1XBnYewyXAGWua0YxGg8eiGj3RTehYl60RdIogvSx3d3l0fmz+xpdFy7b
	I0dHN7EOXIHR3ZyaHInx8BOeupd+nqJ4Bi8rTiTRO2RaRs6B7dUMvXJyq4bqodzVcrFjxakpkRg
	873fW7YDZ6ovsH0ZuqK4q1RwOT2HZ1cGY5ZKMiluRHSPYbCpRZ2NfbpY5S4xTyevv8whdsA+zoH
	xPL07AkxMxizBkSXMw6wVBDjCTpwIm0rxdvw28e/Hu0B1mwcPrUdQS8ndVLtzyxGlkR2pgFPREn
	NqNZj0EeGVGtzmVY43Xu0f3wfec0N5QI30eyDeFVhhBcodB2VWZ353H701iliHlibZUJBvtCz8e
	L252EZ5g+jQBO6fg==
X-Received: by 2002:a05:622a:c8c:b0:51c:19af:6341 with SMTP id d75a77b69052e-52ce61d2d25mr497523571cf.36.1786376539174;
        Mon, 10 Aug 2026 08:42:19 -0700 (PDT)
X-Received: by 2002:a05:622a:c8c:b0:51c:19af:6341 with SMTP id d75a77b69052e-52ce61d2d25mr497521651cf.36.1786376538133;
        Mon, 10 Aug 2026 08:42:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:07 +0300
Subject: [PATCH 03/10] phy: qcom-usb-hsic: do not run the sleep calibration
 clock
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-3-e5f93ea76ffa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3001;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0CI3mvu26e7yA8lXB+SGW6FHaZ290+w5/6/G0cJEMAA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFQE6VzvzxQPylH9ol+I79Tpmlw5MGkv8b25
 1iWSPmFw6CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUAAKCRCLPIo+Aiko
 1XrJB/4k7QGxbIKLgD8fuU+VZfJP2y/wpC+a0n4C6NJVVqJBicGgCy3AQ8RQPMNajILbjcTmnxs
 42Um3fhKY+5SXieGB3CFYJEOjlA79/KNfLs3M9M8Tqy/OVFOG3m1xDW7BCK7urRoWIVBu7kSbYn
 4QlCcu4hYZ4rVVDHGgBhXtsV3Ke4vXH0fpEWTn3rvqTf7hU5BbwX4Wu7MMhp5R70vbXirrZcjXv
 nI3gVSk18M6Zo27KaVZOf8A19KNnRvRSq++A9OuCeo6MhNWEK7/46RwMvafaMZdu1utqdf24XCk
 XI0jmDgzo5lFr620llmYyMLV77/QUORAmmowPAq9SCJ394y0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: afOfjtWrt-7GviYXwB5dxIa4BXLBf-Wo
X-Authority-Analysis: v=2.4 cv=R4cz39RX c=1 sm=1 tr=0 ts=6a79f15b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=h5QO6Q66eTtlMCYmI04A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: afOfjtWrt-7GviYXwB5dxIa4BXLBf-Wo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX46sx0YOk0tT5
 qnWkTm1sCp5VmSyXqMy1Xa4MLwDJtbygbuyyWtGHghvZMZccXWempQjNHWWNYp7ndda4Icg2q4F
 xhEh3WfQ8Eep4we0WvnIr8dNuAzumfM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfXxyPJ8eHCRo7M
 5WBBBAIxJ0C3WoD1YXqt6+MfXihgRhrNR6RNpcsjzew3WKRq8M3jzpHDQPW6TJV8EvMRIseRaPE
 3fxez4agVAz/zVEu3PVCLLzrEnEZjsOOzWuj49aC4rhVcfOcfJOJtqZe7WPggmC8EvNxx+D4K5B
 5JA+s7yNEw5TZEm0of8gEWmMjmy5FNwuFSJMc9R0Ck6p2imexhBGMPa6YpDOlPYrJ3C2gjOTwVT
 8NZmfAqNaIc2rZWvHYTs3LStZhIXP3Cvf4TLU6k2zbpwFxXcUtHoadVb1tJFUUnrfF+WaY2ZL5p
 UZqkO6ViHe0NfjP6sC8ZaB+a/ZmFI7pGiMZN1oMcjHq/eEh3Uew25EiJh7J2GF6BEHqy/it8LY+
 2oUY+48rT61h/A4JguicouztUvXiqXW45l/IUemTHWUKVCA5phVlCRe31STnrlwJh5d7hhqQMdQ
 rM5NqDhdYNei9jQIr4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

With the cal_sleep (32 kHz IO calibration sleep) clock running, the
HSIC PHY engages its sleep calibration: the strobe/data pad
calibration converges to different values than with the active
calibration alone, HSIC_CFG reports the sleep calibration state, and
the port no longer detects a device connect - an onboard HSIC hub
signalling its attach after reset is never seen (observed on the
APQ8074 Dragonboard against its USB4604 hub, by comparing the ULPI
register state against the vendor kernel, which never enables this
clock: with cal_sleep enabled ULPI HSIC_CFG reads 0xab and the pad
registers 0x0f/0x0d, without it 0xa9 and 0x10/0x10, matching the
working vendor configuration).

Stop requesting and enabling the cal_sleep clock.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-usb-hsic.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hsic.c b/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
index 20f6dd37c7c1..b670ec364a2d 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
@@ -20,7 +20,6 @@ struct qcom_usb_hsic_phy {
 	struct pinctrl *pctl;
 	struct clk *phy_clk;
 	struct clk *cal_clk;
-	struct clk *cal_sleep_clk;
 };
 
 static int qcom_usb_hsic_phy_power_on(struct phy *phy)
@@ -38,9 +37,13 @@ static int qcom_usb_hsic_phy_power_on(struct phy *phy)
 	if (ret)
 		goto err_cal;
 
-	ret = clk_prepare_enable(uphy->cal_sleep_clk);
-	if (ret)
-		goto err_sleep;
+	/*
+	 * The sleep calibration clock must not run: with it enabled the PHY
+	 * engages sleep calibration (the strobe/data pad calibration
+	 * converges to different values and HSIC_CFG reports the sleep
+	 * calibration state), and the port does not detect a device connect.
+	 * The vendor driver never enables this clock.
+	 */
 
 	/* Set periodic calibration interval to ~2.048sec in HSIC_IO_CAL_REG */
 	ret = ulpi_write(ulpi, ULPI_HSIC_IO_CAL, 0xff);
@@ -76,8 +79,6 @@ static int qcom_usb_hsic_phy_power_on(struct phy *phy)
 
 	return ret;
 err_ulpi:
-	clk_disable_unprepare(uphy->cal_sleep_clk);
-err_sleep:
 	clk_disable_unprepare(uphy->cal_clk);
 err_cal:
 	clk_disable_unprepare(uphy->phy_clk);
@@ -88,7 +89,6 @@ static int qcom_usb_hsic_phy_power_off(struct phy *phy)
 {
 	struct qcom_usb_hsic_phy *uphy = phy_get_drvdata(phy);
 
-	clk_disable_unprepare(uphy->cal_sleep_clk);
 	clk_disable_unprepare(uphy->cal_clk);
 	clk_disable_unprepare(uphy->phy_clk);
 
@@ -125,10 +125,6 @@ static int qcom_usb_hsic_phy_probe(struct ulpi *ulpi)
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-	uphy->cal_sleep_clk = clk = devm_clk_get(&ulpi->dev, "cal_sleep");
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
 	uphy->phy = devm_phy_create(&ulpi->dev, ulpi->dev.of_node,
 				    &qcom_usb_hsic_phy_ops);
 	if (IS_ERR(uphy->phy))

-- 
2.47.3

