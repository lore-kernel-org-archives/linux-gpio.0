Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B52F29AAFA;
	Wed, 15 Jul 2026 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122380; cv=none; b=L2aERzi+lA6Pds3OSstueF5X/OFr5qt4G4rQS8TJZsFmGD5LbZKlW8PXSrGOyeenAEr4wbs/KOotwbvuV1M+GFJRbsILVW1+cwwpT30xJE/qS03Yui+YrMX/jscmwotDRIde4uxH7t0AV9u6Z++GfeDWG00PeBnmzZLEXAVbJI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122380; c=relaxed/simple;
	bh=4EMHzYSCxZSPRkS2zbA0KVyjlfZv1nEmaS5dbSTXs1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lLTLXF+okhTjR5KMfZAYs7B8bxOvo0HTREyovxXuMpvvInYvj6IqyWPxtV9lcrRRilCS1B2qX0Y5H8OWlToKEYnCNObK7GjQU90sZ4YkMVsf9S8de59GryNNY+afd+6B1gHs6TSCHkUm9gwRG4aCSwZpeQ1l8lbA1Y/yo5gUQ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZPanh4UH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZPanh4UH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FDI2dZ3852485;
	Wed, 15 Jul 2026 13:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BJjbT+HllRR
	SikEjpGpR0/YdbERpF60OieGqG7x7vsI=; b=ZPanh4UHVchmPWRzP56uF+4VB8/
	oRWEPesXl6MBMVy6gapeFZAAVXlbUXkf4KFVOtvyH5jCDOiIoNgDVFrTorQ6LXJG
	FVIOKzZeS1ET660jky+trK+FryM/lkOpygk1KLLqyR8fVsk7Rj3sx+QMFkctPJ4v
	lb4hYjpHjZSJoUkTJ6npusCpjwwN1daFv25DtEbuE13Qvtox4XY8Ps0DH1O5ych9
	o9kKMJTcAoWVqHAFI/5eWGXKEcWc78CMHWByfDM1q8I2UPLscnzSotfsZHsxa21M
	NUBgk9cTky8eod6JYZu4xlM/0GcOOS2Oltprk1fr9WY1ROM9bDphbQf/DyQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feayfg1u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 13:32:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66FDWkLh030468;
	Wed, 15 Jul 2026 13:32:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fbewk39sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 13:32:46 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66FDWkP2030440;
	Wed, 15 Jul 2026 13:32:46 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66FDWjj6030431
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 13:32:46 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id CDC9B5FF; Wed, 15 Jul 2026 19:02:44 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 1/4] ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID
Date: Wed, 15 Jul 2026 19:02:40 +0530
Message-Id: <20260715133243.3170821-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715133243.3170821-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260715133243.3170821-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: cNTfmOZIQAumHmSCmTQRPhWH1Gv4Wlt_
X-Authority-Analysis: v=2.4 cv=WoMb99fv c=1 sm=1 tr=0 ts=6a578c02 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=LqfxHgX1jWeFuUILl3YA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNSBTYWx0ZWRfXy6oUNyXc1D6Z
 bBCCeTiW4gTL6fDP/Rz2iUpvdxN46l3rUJSoPcC8z+rKi5x9Hb7VFajifjyWpR8Dztbinrm0Bc3
 fJnWoTb28aimt7nvdqwFd4N5hf2y4J+NaA/ACyTWmVvBN290MUqu/Nf40W38gHgEnH+I9Iswi6I
 NyOlsUaINRP0eM5L5tZtdNid7E77kNbkLWU8CRaOy51558zR0LtnKpEaT2cooHlyGN8Amnlqq+5
 cuDvL3aF+Yg6JUEhVdU8bdQPdDEuW/IGqfgnzjyBFZ9AW41HE73YdfWP6J5irH+ry17N7lBKJgs
 EdxNsafuS8jCWIARM5Ax/WcGYlZHmkCBSVUu/6sJtJ+1NvQ6pR0ra5sHgqcIsc8mTktwf7I08sS
 ey9n2pOcn93+N2O/fLMhCioBQLQ0ev3L+aKKMvrkzpzsUwHHV2wnev/5kwO8QaXwYStRLubKalU
 wBF3VStIZch5QBa77rQ==
X-Proofpoint-ORIG-GUID: cNTfmOZIQAumHmSCmTQRPhWH1Gv4Wlt_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNSBTYWx0ZWRfX5f7Kl2zU9eyb
 7Ptvvww/mJmjAM4shl002PpqDejlEDzPJzi2TH1xzr3YSxEhDFtwfJH9lS2MIIBodKAH833Ixjs
 DKIPh/hwPmz6Q38P+8SyQ7FotmF99XU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150135

Add a new clock ID, LPASS_HW_LPR_VOTE, to represent the LPASS low-power
resource (LPR) vote through the PRM interface.

The LPASS PRM supports a resource voting mechanism to control low-power
states via PARAM_ID_RSC_CPU_LPR. Exposing this as a q6prm clock ID allows
clients to request the LPR vote using the existing qcom,q6prm clock
provider interface.

This functionality is required on newer platforms (e.g. Hawi) where LPASS
clients need to explicitly manage LPR resource voting via PRM.

Also update Q6AFE_MAX_CLK_ID to account for the newly added clock ID.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 45850f2d4..06ca2c287 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -236,8 +236,9 @@
 #define LPASS_HW_AVTIMER_VOTE		101
 #define LPASS_HW_MACRO_VOTE		102
 #define LPASS_HW_DCODEC_VOTE		103
+#define LPASS_HW_LPR_VOTE		104
 
-#define Q6AFE_MAX_CLK_ID			104
+#define Q6AFE_MAX_CLK_ID			105
 
 #define LPASS_CLK_ATTRIBUTE_INVALID		0x0
 #define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1
-- 
2.34.1

