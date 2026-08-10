Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9CA418372
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376545; cv=none; b=uL2PWXnUsC0j4slV8zyBZgoPOfRcjHpCqcFjPtIfedX6HUb8o17uddc2bXlM8ehA2Zt28QJ+xvJa2XvA4U7PLjQfTG6RpN7t6ovlS4DTyZBI4lTcdLxXgFAkBbp+m2pg0LFX2z+GTnh37qf4HWIURanxB9gQZVT3f63KFBiHIi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376545; c=relaxed/simple;
	bh=TkrMMSM5qDrBbFDzv/+VaChi5RjS9zkmjtBE4vr35Do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZ1WVnlcVbOgkRK8cHuhipP/V9peTWrhMW/ulQAiO+5tAPbtJoACXZSOW1KmqGksvjiuiDJ/waaugVRZRpyqelDyLnr/2hg/c0/brDQHa3as3Q00gS6iWLXa/lkowlSgvhBYhZLX7iMteU9kN+qJ+VntupjkflPQyEomPjYvFCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AeS01/Ct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIpjQuXD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AeS01/Ct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIpjQuXD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWEUh1754172
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Ol8WpcEjj06q3ha1b2ZdRY+l9xpEFrE+uyJaWfhLJI=; b=AeS01/Ct5gaVVxuL
	BGhfFfceoK4d/rRNfiK6ZSBPbIpCmCzbID+VKl8ITCe0wUSneI9auDdnRDDCCxnL
	qWwlYHDL5E9bwviIOlH0k/YWs17jIxRilWjf7FFiABa5ps70gB3DNSl6kqjyICT0
	42xgyUXtCx19u+YkHhjfC/+SiHf6UQJmCQ2yGgwUuCsrQ2ACF1pxLEna9abtBIMC
	fWV/IyyDRRiI5M0aZgOb0HaYD/J7lIK2aha2Dik8zf3jWDjf27XBW0bmDFH3mMmP
	r4la1VhTPJ53QWl8P6mgI+hRNBfeM02sX5PPWpygAtInFV94rLSqqAgBHRHhryZ/
	UaF/PQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v4aa90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52cd0374265so39782401cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376541; x=1786981341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Ol8WpcEjj06q3ha1b2ZdRY+l9xpEFrE+uyJaWfhLJI=;
        b=OIpjQuXD2oVjibNDNjZb5aFeg7LEYm5UJY3rdPzMLNIBDQoHv51y4up3cQkw3q3NDF
         fhbciJ6c8jV9HzU79dHaVu1Bw1dTEvEEGTR5guvkCGNaI4bsvhrGd8qF93NNHkWbImzj
         uMFHpOwncS10JOSCHywRct5zAhNL/PZpQpa6WEKcDdWjOcuo9bLfO6wc0yxnFjqfqUVP
         ODrVgzl5pxrNkPFireImN8JgArLlUviIHGTIjYH5tR9WBvDOh4AV2ihrjvvAX5aYV1oP
         vPGctcfbkQe5CcoE0gqUbyRKMayq2QE93tZtCnZmRUBEfLOYPAKGD6iPwchyu2mnbAXw
         l7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376541; x=1786981341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Ol8WpcEjj06q3ha1b2ZdRY+l9xpEFrE+uyJaWfhLJI=;
        b=fqrSUuElV9O1DOFT0z4LTRix60Lgo7FiE3BVQIvP5ycgbsFJIxS1xWwSFLX4hvtQ3+
         T0EFQCZokB0RWEq8WP6C2Rd+mJ6V5pOOC3SWc1XHuEwt+6mrhrRWfFRllaatqWbBJhOR
         wKQPhxedt1vwNucJZo2jVFW45Eu/49awM2P6sJHx5U6mKK97xU+uI5nruLEZu0dAE1vk
         KmcfOSiBdtkvDtKEgTbCasL47omftYsc8CGFk4WzHQZbPESomYaqwiCkTfThf1/TzU9Z
         DklJW0spQgMq9v2F28feZ9YWb7OkWT0sFzPSC2Imotc3b+oRiVC/Rp2L76X8iH85CxkL
         Sgiw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/Ve42YjsZiOddJjVSC852t9iBkSKtjRQ/EKRc0XQS5lsuW1KvzC9srK77Hec3LVEOhHGcBq2N4Vxn@vger.kernel.org
X-Gm-Message-State: AOJu0YzjfD6zSH74JZSMEPZl++iW5VONGiqxrGfQFqA3Os8tnlI+GhKe
	VRckMNHRxCWJdAuEEXkgszSLtYfwfqw8nYZDHm2oSy5eaFWu3ujvCPTvkO3ohc4bTxFpHu95H0U
	CCPujnnr9XaMRlugKUIgramZEN2m/4o1SWVFc2HepBcQ4MX0XxWFUqHgahLv67bIj
X-Gm-Gg: AR+sD109ZYIKpcplohPCRg4bdxslwjDRtf5MklH4R8nQgmfVPnMjrgxMENz+8LpeuRB
	0iSX0OdGpO9pz0/UrOirP5dVbU0mp0lwS/Q5fnFZN8/eN08/GQ5x2NlhLl2FqDsj6vfgvKPSZIt
	tYktnlFKHEYotjWwvEonXXv81pZig0PbGj3KsfXLS1yXOPN950yo/R2YvTNaALM+zEF98F3pySa
	/JlH1bzRFIRQ3FChaxzmSycAPaLpw3n/n6LfS29kaIf0ewVHnxmUHYs+YyR3mfVCInhsfLD6tZA
	qxzuSShtz9F44n8diZh8+lXX6Of8/8ykrWVkf2gEfGbCo3TMNfmFKrDKwn2KlUM1ol8h+BrO7Zw
	wD2lrSrdxyxv+tw4xR8r126F33hTqKX0Wa3wuyI0CtKcsKf354VBs2Wv2xL7ZpWezuedV/Vv/Ih
	rhwGWbpQkbCmY9Og==
X-Received: by 2002:a05:622a:1f1a:b0:528:3142:d466 with SMTP id d75a77b69052e-52d20a920d3mr252033361cf.41.1786376540607;
        Mon, 10 Aug 2026 08:42:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1f1a:b0:528:3142:d466 with SMTP id d75a77b69052e-52d20a920d3mr252032531cf.41.1786376540166;
        Mon, 10 Aug 2026 08:42:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:08 +0300
Subject: [PATCH 04/10] phy: qcom-usb-hsic: engage HSIC mode from
 phy_calibrate()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-4-e5f93ea76ffa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2853;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TkrMMSM5qDrBbFDzv/+VaChi5RjS9zkmjtBE4vr35Do=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFQhLz1oU44aOjR1xi5aFB9HrDQMTdOWypAd
 O9oOzFRa32JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUAAKCRCLPIo+Aiko
 1WzIB/wPUZAdSQaPXXJvH1bFmntgi2oxFK1T9jsaAfhtC18IWwtDkzXwfNlhfk3AR0XZmGY5UiP
 jjQmoXwuwt/VtjrilmmUZx+u6hDAXj0Zr9EXcb9Fo3CzLGNTgRNxoXu6V3Z+7f95saFMXWBPRS1
 iFeT+5aDaRKCydJtyiI83UIVsC5DaW4p12w/1A8f3yxDD3KZayrQ57H5az4GkXml707CRQxLm4W
 pJ2Wp+9PXIMGEA9EuoqvAdtxrvhMdgmAz7JqCU2sd/YbFJO0ls1bXVkQOmqcuno1MxGNGc6qfXa
 nyCZ/v/i0ylhMp2Z/RBbFkaPoFNGFX930//CM7CRhxNKITVX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: bG7NPLoqQJw0jGRBdMelQOSabFTHIxeD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX1pfNRwBnj8L4
 fSnihlKZ+V5QYPsGDfcK1O/pF0Z8XNx25hcEQwukMNAxyk2EKJvAMHAIgYYTHMlHgvp1iF93mWY
 6kmL1dCOWZTs/AtR/jGQ+M+53JPErCg=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79f15d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0xrA-bSJ-g1zX4FYa4YA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfXw/OAlLCG9RWh
 cUexNSrulLeHf/TOHeMFRWxHDPTOWM1rzICNhUV/m5oj7h8XV0hihwJX/PI1p80rfhMmDUQsLBV
 VEfw/Y4x3rc2yiaabNG43m8nQp5uMbz0/U/W8W5rfqlfmDbMHt+EvT+0Y4uwrcqdrEhx1VhlsuL
 wzvpzhu0mKew8Bom6pZUM/c3xH+fR9t4fe9G/gahDb++dcfVRg8oaWEv34FGsejlxS8LGMGYYmf
 JJNf8Ez26ZpGlBEOrs9VVUe11/FQINkfkM6t9hCHRy+WlF9/Sianngy29c+AuyfFo74GdsMeLAv
 sPNkjFJx9Sv3T2Ijbj4hTVzU+qH3oPlX6omRPNL6zLOlsdq/93OA6yLlGH3qyWrkgkGRPsazitb
 flpDHooWM8AfkcAMo5YZGDO60hDfuKjEiSSKcWKMWnTaWE00jrn8QxCw5GWkbh5pcMG94fX+sls
 JUYxnG1uR2Ri7ssfk4w==
X-Proofpoint-GUID: bG7NPLoqQJw0jGRBdMelQOSabFTHIxeD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100135

The PHY power-on sequence ends by engaging HSIC mode. With chipidea,
power-on runs before the host is started, and the HSIC connect of an
already-present device is latched at the moment HSIC mode is engaged:
performed before the host runs (and before an onboard hub is taken out
of reset), the connect is lost and the device is never seen. This is
why the APQ8074 dragonboard USB4604 hub never enumerated on mainline
while the vendor kernel - which performs the whole PHY sequence after
usb_add_hcd() - sees it on every boot.

Keep the calibration setup and the pad mux in power-on, and move the
HSIC mode enable (and the auto-resume disable) into the calibrate op,
which the chipidea host now invokes after the host is up and the
onboard device reset has been released.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-usb-hsic.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hsic.c b/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
index b670ec364a2d..e0637522eb82 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
@@ -63,17 +63,6 @@ static int qcom_usb_hsic_phy_power_on(struct phy *phy)
 	}
 
 	ret = pinctrl_select_state(uphy->pctl, pins_default);
-	if (ret)
-		goto err_ulpi;
-
-	 /* Enable HSIC mode in HSIC_CFG register */
-	ret = ulpi_write(ulpi, ULPI_SET(ULPI_HSIC_CFG), 0x01);
-	if (ret)
-		goto err_ulpi;
-
-	/* Disable auto-resume */
-	ret = ulpi_write(ulpi, ULPI_CLR(ULPI_IFC_CTRL),
-			 ULPI_IFC_CTRL_AUTORESUME);
 	if (ret)
 		goto err_ulpi;
 
@@ -85,6 +74,26 @@ static int qcom_usb_hsic_phy_power_on(struct phy *phy)
 	return ret;
 }
 
+static int qcom_usb_hsic_phy_calibrate(struct phy *phy)
+{
+	struct qcom_usb_hsic_phy *uphy = phy_get_drvdata(phy);
+	struct ulpi *ulpi = uphy->ulpi;
+	int ret;
+
+	/*
+	 * Engage HSIC mode only now, with the host running and the
+	 * downstream device out of reset: the connect is latched at this
+	 * point, and a hub that has already booted asserts it right away.
+	 */
+	ret = ulpi_write(ulpi, ULPI_SET(ULPI_HSIC_CFG), 0x01);
+	if (ret)
+		return ret;
+
+	/* Disable auto-resume */
+	return ulpi_write(ulpi, ULPI_CLR(ULPI_IFC_CTRL),
+			  ULPI_IFC_CTRL_AUTORESUME);
+}
+
 static int qcom_usb_hsic_phy_power_off(struct phy *phy)
 {
 	struct qcom_usb_hsic_phy *uphy = phy_get_drvdata(phy);
@@ -97,6 +106,7 @@ static int qcom_usb_hsic_phy_power_off(struct phy *phy)
 
 static const struct phy_ops qcom_usb_hsic_phy_ops = {
 	.power_on = qcom_usb_hsic_phy_power_on,
+	.calibrate = qcom_usb_hsic_phy_calibrate,
 	.power_off = qcom_usb_hsic_phy_power_off,
 	.owner = THIS_MODULE,
 };

-- 
2.47.3

