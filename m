Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FAA3B3BEB
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376548; cv=none; b=oLPKLUFybB2eDXlc66aOapbK7z1tO5CWYqAXlJUMgtZehnERBLlaj0WktD0nU76fLCZK9liWNSoomiqh6pMbYHD54wNtijiLWYVW+fxcMB2E14JotqsN7B+q8R/LcVck8+Zsj5efmPNLk0uVvEjaAfOC5TbzGS4FLuV96XJRATM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376548; c=relaxed/simple;
	bh=W5fwrw87A/zYMZyvs0ZH/Ywonomd67B2W25bvL7eGxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Prq3Wez7/iwGw7rjGlhfvoUgapnZvgPRmSxTIw30A6Teo21rk/00i7y43XSmfqhwzbxHNipd7w8PidqsBRRPwjoaJZMTF2d6vTqZwABMhtJkILx7FcMjN/uBQOsiGCLsuEjeuxEddTozv3j7UjiLBKI+GaYoMCedldsZCiFZf4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c09Tmmx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6ypL9TS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c09Tmmx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6ypL9TS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFW4SB1694201
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCrGDHyDrQa95r9/bHjjtu86fmQgfeBAEBBhKsMFLXQ=; b=c09Tmmx752QBOxka
	QruGFk8j0cco/ou2TFU+r7Mm7vIHwXva7N1cvwsrPPeGtdPb2Zx4QX6jn/z+rRGe
	lmTJgrJ+BPzUYNHfzazialSmqEOsWI2pxPE9gzWPN/WH9+sY1kOxAbxUQAOYMX4f
	mJqcQ+HoEW5dfQYD79VOxrTrVIr03RvSOiv0Bk3E1NVGH0H3+UsU91aiGWqrZrY6
	h1bCL+top/z/VE7fmcWdhdeOf0WXZXjVTGfb8tNA1+epGVvZl8LXkwwHU3VoYrQl
	6YCUdBnITbwlKAFlklcM2nstm3hGhzxLqbzP/8DqfBVb3FiWpkout2iHX6b9rskC
	zyZ3vg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccqsee1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so21752731cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 08:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376545; x=1786981345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCrGDHyDrQa95r9/bHjjtu86fmQgfeBAEBBhKsMFLXQ=;
        b=c6ypL9TSg8zDFj27x7R2r415/Y5aFP3NdmYO03jZLRpPEkUCBTLVZRpVPKMVl5BXep
         Y+lgH/1bLruAb5JXW0SUgxDHBe2tjnN6IcWD527TMnJQPXNE9cZV3xtnSSESvd1g6jd0
         B9bnlHk8ndc+76C3yIREAhkh0O2Tm8u7rPkJXVIbnX+5+ROO/ExJIe9abld23C+6Kqiv
         JwOq8G1SrJ9jmi2gQTXibSjiSSawZCI55M+2MQYoyuYyhVDIlJhtzQ1B2fFZ7WRZQDx/
         0SUCDA5ZYGgrC4XZvBh9g1MTJtARb+EHv4XoomXh0wsthf8VMIMVmpiSKPVZSMfKikpo
         1zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376545; x=1786981345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCrGDHyDrQa95r9/bHjjtu86fmQgfeBAEBBhKsMFLXQ=;
        b=FIRzFWststbYK7doZ/Oj/bAkk1I9LgkDoiRTwnWuU6aINiH/JQhlbzdpoL5c3IaQSf
         8rCB57FhI3wgJLUMdM4Ejk9hcB69CewJcvG33Rr4EfdP2eivRIChPWVKixNhDfh5hCAI
         udsLbj2ybTJ7/4Gx8Xk23lOygYGfYZcAKzVWVA8C0dnY6zmtmSZM30c7jNgbrScskA8T
         bda9O1V9xuDaYXn1Kk2XoWeuThJELVF1SH/pIFGAnmZdV/wlPVaBoFJbEixao9ienx3f
         gOafWPUarmGUC7P2oJeGWO6lL0ufX6xhtfeXyPoF3mVGqmDnC3y4R8Qyp6OKTlpPhWVW
         mz/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpaubYeVIbYCf8/PsTICPI/pvgFOsG0oWeFZVit8JY2nItYuGoivJfFZMafYZZ2ab3m+YTxMAo5qiZx@vger.kernel.org
X-Gm-Message-State: AOJu0YxPaEhVmfcdZakGfjW7iLH+//+7qyazvBQ9cI8ABGYCf+nNVETf
	n5Iqqv0jV2EmGOaEbg/H9I+JS2agvyYhBgpYI03MzsqLuiRdf7wteWmJt5i36dMjs+2n/VVF6Hh
	i4lAy1f8qeIfrCEcW8JhmmNCQpRdO7tk2XhUb+4w4F01G8/Rx6pXzfnfOMkd+ROep
X-Gm-Gg: AR+sD13w4rQWcSPuG0+C8M289QNKRNT7iIC0129KhEnupxMG+FOwG3dnu6TSJHXqloY
	47Ijc3fFMY2/t51mVoQAp/+m9scP9qiRwfLO/lDOyxFAKnuIyHWfKToh0zMISe6eCnl/FYfsRPb
	Oft+sz4EudIvl1YHAPz3zUljuYn6ZjGcpLQvB0YPHEoASfrZk1jj08AF36EGjunsi7twQUSx467
	5kTMTj9YV0Cn7YmXqu3qD+ruUjej/UBUGOnfXBn6DHV0gqaudMHpicNw6VQ0p43MaXY+aoj6xkg
	dqwUedJ5TTD93k87TUstynbdrcFr6VkuJGDnnMTMTdByabKpmlMER0O0DPH4Mve/kF2qvgfsHFu
	2aieJ1rr7ycur24eB2wJNOmnyiMTpjiBQjymJeo9fHDamNznvgrVj8S/ry8wonhVN6kNRMipiE0
	TYdVpAXq4Rx0aVAA==
X-Received: by 2002:a05:622a:58c4:b0:51c:963:cafc with SMTP id d75a77b69052e-52d20a814eemr255581911cf.41.1786376544498;
        Mon, 10 Aug 2026 08:42:24 -0700 (PDT)
X-Received: by 2002:a05:622a:58c4:b0:51c:963:cafc with SMTP id d75a77b69052e-52d20a814eemr255581111cf.41.1786376544064;
        Mon, 10 Aug 2026 08:42:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:10 +0300
Subject: [PATCH 06/10] usb: chipidea: msm: keep the glue device
 runtime-active
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-6-e5f93ea76ffa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2213;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W5fwrw87A/zYMZyvs0ZH/Ywonomd67B2W25bvL7eGxM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFQhTQDcU2q5OpKlPcQt9+901ij4/eO0pNy/
 HSEWtd7m3iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUAAKCRCLPIo+Aiko
 1atgB/9L0zN0A8qyBtwd82vNyEPK5KczZuUzbj/WjMLPPb+4l0Q3ash4UwV7mMg5NN/ewuxYNK/
 lL6Ywgcv+8x4aToz+jDBwPPDYjmzgBezMgBtUW22NvPUG6+efLudrkNisso2Au+ATDaxP6BAcce
 kkpONMN8GRn9mrLWwGCMmROlJslpvJSeGzvc4nFbtku9clhrJKi2mHQFeI2lBzBIaGBH+K12Mk+
 Mn0hmMZCBnyZ/bvBGVA20M9wIuCyJXgRDwIpFTldc0FFhhwuoSRIB8HE1wWVoVzMZ/Q3twkGmxR
 76E4RQOFwkp4nJdrNElE2LUMNEJzBT1hBg9xYM0eSRC5B2qH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: F3p5GDEQctAn2jjDGRMOS4ocaFIrYSNL
X-Proofpoint-ORIG-GUID: F3p5GDEQctAn2jjDGRMOS4ocaFIrYSNL
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a79f161 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Gq4z8NyD3fEPJbr1v9MA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX4hfdQtoLTGd8
 ejaF3cMYgYCVFWg424NgdN9BVI85MZ41At40p0RAikF70/0+eHzJ2srlCyPwqolC2VV47dFuFxC
 qTdXzthivPhwWm2nFeqTiZhdoA5LRmEGXvAshUWwMdRisSjRRzBb/lMzyVfTgoom6NPxxZmjFzK
 NSx+J6yr8y7RXb/cTGp2bGzwnc1/+6RZcl/DyXla+S1fkxHp61cVe0cQLagEejgfdhBvGKOdQEQ
 +J21PL8DZGW5wRBVDBm1wSiNVV0z3ONaMTVyRuDDxeQff78CsCnIbZll1/OidCMSnUKpTWgI3vK
 Cnh5rrAhhFA5oJl7Bh24pcu2gbNdIculADFQM07ptI8Qe1rCDRZfPKoEiXnateT+bE8XUvEpbod
 oy96KylsYLMgh3weIYN9+vqAs9MM31ptLlcSPIVII8OxgkC3E9VI99UXMyPlYsqTzCrAIarElbB
 xp+AWAGwuCuxMnOPLsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX2EuBKAABIcyC
 yb/o5s8aB9npkbJmzkG9UI5ZNbEWa5gW5YXknvz7X1Wxnkxt4UOcOEW/JBF5d5bB4GQvOebBeN3
 O/0wLI80yKB4dehmj29GsVxsYMthzec=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

The msm chipidea glue enables runtime PM with pm_runtime_no_callbacks()
and nothing pinning it active. Right after a successful probe the
driver core's pm_request_idle() runtime-suspends the glue (the ci core
child has runtime PM disabled, so it does not hold its parent), and
when the glue sits in a power domain - the HSIC instances live in the
USB_HS_HSIC GDSC on msm8974 - genpd then powers the domain off
underneath the running controller. The EHCI register file reads back
zeroes, an onboard hub's connect is never seen, and subsequent bus
accesses into the unpowered block wedge the interconnect, eventually
taking the whole SoC down.

Pin the glue runtime-active so the domain stays powered for the
lifetime of the controller. Proper low-power handling can later be
built on the child's runtime PM together with the HSIC wakeup
interrupt.

Fixes: 2d0cdcc5a0e4 ("USB: gadget: Implement runtime PM for MSM bus glue driver")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/chipidea/ci_hdrc_msm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
index e28ea87f9898..9a9410a814e5 100644
--- a/drivers/usb/chipidea/ci_hdrc_msm.c
+++ b/drivers/usb/chipidea/ci_hdrc_msm.c
@@ -276,7 +276,13 @@ static int ci_hdrc_msm_probe(struct platform_device *pdev)
 			dev_warn(&pdev->dev, "no wakeup interrupt: %d\n", ret);
 	}
 
+	/*
+	 * The glue owns the controller's power domain (the HSIC instances sit
+	 * in a GDSC): if it runtime-suspends, the domain is powered off
+	 * underneath the running controller. Pin it active.
+	 */
 	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_no_callbacks(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
@@ -294,6 +300,7 @@ static void ci_hdrc_msm_remove(struct platform_device *pdev)
 	struct ci_hdrc_msm *ci = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	dev_pm_clear_wake_irq(&ci->ci->dev);
 	ci_hdrc_remove_device(ci->ci);
 	clk_disable_unprepare(ci->iface_clk);

-- 
2.47.3

