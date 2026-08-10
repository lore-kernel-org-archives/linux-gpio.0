Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2912E418372
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376548; cv=none; b=pv2FzQEz9tGiCd9NkPA3crURDtXR5R94+BGRD/Q3E1IMIXYnbUOnfnGskc/8QbISrYqRKkAJeAiuxPelzgSyOfzJE3i56QiYc/tyzo0wZFFfagc5nExsHDCu0xIKPed/YvH1pGWIJEmNGb253fwt7UKvxa1Ve+BeVexmo2IaR5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376548; c=relaxed/simple;
	bh=zF09fnAjSPFGZsQfp4IpqRrDJjz7DPLi1N/LYmSBNLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uEKuaj7V0XxvDTvmCFTKWPVJKGmXyqByYjxmDRK3/I1tS9Miv4g+j4a3b/rUnBBcSivKBupXtD96XU6wI7/m1V16coN8QifbR22r5wgfB+QSf4wGR3Ygfx9mrHMOcCd1IRWpU3GQd04VSuzv+eAkM7g/Dfnk8DvcMUUj6nTdy34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOLHK9R4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHdHqG6d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOLHK9R4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aHdHqG6d"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWEea1754185
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykiz7/WLXu1Pqam7m96oprgwnXnPFLvlLQkcUT1pgeA=; b=UOLHK9R46ffmVQXv
	ZQwEq0a8ewE8eq3tOwO3f74Jy+opbpXLRpw0AfxuMocVObs4gccOCaHSC7B6KtW/
	Wu4wxcdUOPOLna37bl4kE36gdF5UyjLY5PMj7iT2oz68GvPmS0d+J3wz4QjujuZl
	KLCMRFs0OnwbyLeg1XSEnuIA21OO3dLet1Tc3BmgZGqN3Jm7LPh05V1Z0NbkLZWh
	I6Ku4DNJA07pPrUr179BdqnHp68BQwdIlvZtDxzmjQrhGuQiMoV8ynniqzX1pFaq
	j2KelKK4eBONxuHXtVIdgI6Ars/v8WGxfuu9gb5bIovsLeNt3M8y0vMPWyqUxrKe
	VF55QA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v4aa99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a236220so18125571cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 08:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376544; x=1786981344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykiz7/WLXu1Pqam7m96oprgwnXnPFLvlLQkcUT1pgeA=;
        b=aHdHqG6deltwfwRNa3zvXZStRtGrjTX0ZJpe++f0QjS7yv1YXf+B6oZpgqIY8Sam2D
         HaZ9+POPKZhFto2n+8DYOCInph/Rl7mTn/AyVoQYkXN6o5GEpihTb4HHuP5eaKgSEa1s
         HRi9rKhr43ZgtB1eiS0t6HW9TDxfQy+4tBAFU87lxkhCe2tlAULLk7wvksA8rmz3UmOx
         0WAWt5Sjl3tB+/0/0++Io+yCOyZMzo1nImpAPHF0A+xr04TWHcajQWlRuMAxn/rAVebT
         PMmeVJtjh7zgoMfDF9MTiImyzwO/xAHsDFxsG9OY/1eje8UBp4eG23Wm3J2IRT65HJcM
         fpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376544; x=1786981344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykiz7/WLXu1Pqam7m96oprgwnXnPFLvlLQkcUT1pgeA=;
        b=NGnGrv29RY3n0rHPFInMNPNSPnI/l2CmoXV1+JMdqxCZGpsLC+kSNY6pXKOH7DFAJx
         mXy/oEfT7f7zsJz+Nq0gGhN6MRcrxL6NNCjTSzBZA5jO6ps0NXLkoYInssEX0mWdskIq
         7Z2ZS8lWr9cZOHUOI2B4FGve9XEJpVgHD6ep7DOnbCHLciq2zwLnr4LSPJ45X9OHukXA
         M1GoZroIzg2a8ajn3gtkenu1Pe84PmhwUX3MnY9HhVPBAo2PD3dHknSD+yWmET0iwQk4
         mHWiOy6nnPw6eXmJMoo01+o6uVd78xaSp1w0HCFByTE30r+5utYKWjrcwV252bwA3RCI
         attA==
X-Forwarded-Encrypted: i=1; AHgh+RrlFqlHXK5dDGQytm8gUB6ZfXjO0mupIIgF48hcD93dVjSE/1WF5JV1ZzfXZRT8163LdymxTw0scaBy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4VlQi2tAd0Hb4XSqk8DI3J1IIo4kYLKcT75zA5Ub9248qC1vO
	Sv677EwE+PbK9xz/D5cUc83fWFi2eKoS6ammRs/ZmZHb2P1M3+jXYsjIirwDwP8f+N2OsGIT4aM
	X9DxkD87KqEGN2GFk0Xy1A2wl5O+QsvGMaAOn8PVQ4viLw0U01Hvc07kMO2f9m1Zy
X-Gm-Gg: AR+sD10SKnyiR3nhIM4abU/OEYsup/XfPgXa2CCRRRwiA1uEIXr5p4jTCtJuqwG8tN0
	kAB3ulrHZty1f25pATPsaUvOrZ9uWH1ea8ryaC663uVoef50i0KC5N1BUAtPDZpYxVuZCL1ToDy
	G4hafbuFmqlghlbvPNjz/huos787YMA0cVDntvrYxESglhl1DHPEoQfvix9y7I37UXsTRXAQfq/
	t03kAR1tUWgV6opFi/qqYvyq+8u/06VM6OLMlqr29izSze2jOPCPg/dyUIMwoRCzqc9bN8kVAFU
	utfjEdf/XBOFpN2HeZVzcSai6NSS84Cy+Rtaa5iRIgEyuRGBGKQVgKNkixy030+WDW7vFKXgnEJ
	+/DrFq8KofpZUK8jNmLVJNUoPtea72+52eYVHLsFmS5cBI4AKPsbhIAS+VD91AGDhzh+cchz896
	pWY+FpqXWkxklu3Q==
X-Received: by 2002:a05:622a:593:b0:51c:21d1:3852 with SMTP id d75a77b69052e-52ce5f63740mr455151861cf.5.1786376542505;
        Mon, 10 Aug 2026 08:42:22 -0700 (PDT)
X-Received: by 2002:a05:622a:593:b0:51c:21d1:3852 with SMTP id d75a77b69052e-52ce5f63740mr455151151cf.5.1786376542016;
        Mon, 10 Aug 2026 08:42:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:09 +0300
Subject: [PATCH 05/10] usb: chipidea: msm: support the HSIC asynchronous
 wakeup interrupt
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-5-e5f93ea76ffa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2640;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zF09fnAjSPFGZsQfp4IpqRrDJjz7DPLi1N/LYmSBNLw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFQprX64U/4DCFpJiS14RtCBnDgkvwJpjJKW
 lTiyOQZ8kyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUAAKCRCLPIo+Aiko
 1W2AB/4guuqVz3+TvJnK5H8xdLnO5BEYGr+vZ7ygvrf0WZfuL4F1BLUJwTmRESF5lD/QlFQZemG
 IwfL5qsbQDRHMZhbNYcrgh1msxLpuSwmO+RCqWlG6mZbMiwHGCFfYq9Xa0TEoE9A7Cwi9x9KDD8
 Tm/0C1wFxNGJf8uCRkSsy5efA8Ijx5smouZxEsNmJrQJ8zyDQ4c/n5UwtyOTl8RG1NwpBV8z//t
 im+bU+E6xQeyEb9oMQ/BOjcG0xg8uOP4bXVCcn9B4pdveKZv3UN3yGCbHYbkK8frrxGdLmJDe8n
 t4bCyvugfQo97me6aPjdAhjJgTH8IhMsPP8mTtvXY4fZmCLL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: W1OeKQr7SynQXW7vblSL4hXk74vA-M_F
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfXzIBVLSFoh6oZ
 hqHUCRjBpaFuQvLCxEeLfDRozVKhtHcExP9AmmjQFcVbl4j6bpXRIkP9SmlJcoMw8gqXbnEI36/
 7sszjYaiKJS0RxDRo7YNJwP2J0EQPMs=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79f160 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=a4gATcTAGDG0ZWSRqCQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX8vZjP1ZvnQCA
 gNZHZ6Wy0gTPWg0qFEOr7pcGZBM5YNI/OCSfpxyCfeBz1iQLaZORAEUydsWD4i0VD+8ZRwQ7zJA
 GjWIJRMCqxwH5FGBgzHenSot9+AgS01MyG0HMy6yc9pSOfqH2j01EeWHSEdi3HPh2pFBtJO6TNf
 c2XcGTc24a84MfIYjOzIbDindMoHkILLdTk2jCWMnOuejlG16aK+U7ylQd5aGUSUGpbOP93JDYI
 z00CLZtSTrXkTOxOswS3o+8VS5dNwhkRkm4en3Hea9cXqH7uOdXWB54epBqR0TsW2Ly5snaPcHV
 FCfLiZRamcqe+os/V4tIltQqfSXRRACt3QkRtwVYP+3swl9aITgpLp7vUVIxqfI5HEFuFdlaZfB
 DrHXGgb8wikr5u9KSQXO3dfS6Bczmf53Lf9e8y0xqtjf9glg/OCYaLWhpEX9Fv/SAEK1I5TRAlV
 Im+X8vfNmU/XaHu4hwg==
X-Proofpoint-GUID: W1OeKQr7SynQXW7vblSL4hXk74vA-M_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100135

The HSIC instances of the chipidea controller runtime-suspend with
their clocks gated whenever the bus is empty. HSIC has no VBUS-style
connect detection: a device (such as an onboard hub coming out of
reset) signals a single connect event, and if the controller is
suspended at that moment the connect is never noticed and the device
never enumerates.

The hardware provides an asynchronous wakeup interrupt that fires on
HSIC bus activity while the controller is in low power mode. Pick it
up as an optional second interrupt and attach it as a dedicated wake
irq of the core device, so the PM core arms it over runtime suspend
and resumes the controller when the bus reports activity.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/chipidea/ci_hdrc_msm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
index 3ab3daa78e34..e28ea87f9898 100644
--- a/drivers/usb/chipidea/ci_hdrc_msm.c
+++ b/drivers/usb/chipidea/ci_hdrc_msm.c
@@ -4,6 +4,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/usb/chipidea.h>
 #include <linux/clk.h>
 #include <linux/reset.h>
@@ -173,6 +174,7 @@ static int ci_hdrc_msm_probe(struct platform_device *pdev)
 {
 	struct ci_hdrc_msm *ci;
 	struct platform_device *plat_ci;
+	int wake_irq;
 	struct clk *clk;
 	struct reset_control *reset;
 	int ret;
@@ -261,6 +263,19 @@ static int ci_hdrc_msm_probe(struct platform_device *pdev)
 
 	ci->ci = plat_ci;
 
+	/*
+	 * The optional second interrupt is the asynchronous wakeup interrupt
+	 * of the HSIC instances: without it a bus connect arriving while the
+	 * runtime-suspended controller has its clocks gated is never seen.
+	 */
+	wake_irq = platform_get_irq_optional(pdev, 1);
+	if (wake_irq > 0) {
+		device_init_wakeup(&plat_ci->dev, true);
+		ret = dev_pm_set_dedicated_wake_irq(&plat_ci->dev, wake_irq);
+		if (ret)
+			dev_warn(&pdev->dev, "no wakeup interrupt: %d\n", ret);
+	}
+
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_no_callbacks(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
@@ -279,6 +294,7 @@ static void ci_hdrc_msm_remove(struct platform_device *pdev)
 	struct ci_hdrc_msm *ci = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
+	dev_pm_clear_wake_irq(&ci->ci->dev);
 	ci_hdrc_remove_device(ci->ci);
 	clk_disable_unprepare(ci->iface_clk);
 	clk_disable_unprepare(ci->core_clk);

-- 
2.47.3

