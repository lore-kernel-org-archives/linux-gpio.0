Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5DD30C16D;
	Mon, 13 Jul 2026 18:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783968368; cv=none; b=Is9YQ8wVcL/pelP8dCfsOO/uKxVY5ozNDmsEeC5VOwsQj2LBbcOwHCyV6Uh0WdsQfS/IxYjF3kd62Cdc57YMSxB36qA+KRbdIaSt7IEQ9zENyGLJujHNbEQ5ToOupSiOxQxNfCWb6kkGuItJgwKiRlWi7OhAYNSXJSkhjvEP1Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783968368; c=relaxed/simple;
	bh=4EMHzYSCxZSPRkS2zbA0KVyjlfZv1nEmaS5dbSTXs1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j3/nhe1qqxcWHcC6KcEsPxINjseHYuKks/80bhnRirdE2dMG8j1kcVPsG0BoGZJxYyppCk8E4Dgd82WtIPSxRKP/hQ9sHgGSRT9CocchYteVPMWmWucc7QOhmOWY3plunQIyp1huauQR2FA0siMhUPsCuS7NpTbefAr7j8eNzM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QV3JL1g2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QV3JL1g2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8keA1908342;
	Mon, 13 Jul 2026 18:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BJjbT+HllRR
	SikEjpGpR0/YdbERpF60OieGqG7x7vsI=; b=QV3JL1g2XRM2x35vPSz/RrN3MMB
	zBokLtK57vgMi8bVDN8o695r1317TRRHLp1LvH5Eu7jR32am2kHFP/2Bs0llYkMg
	DkHoYTCUZPSg0PajomO0/ztIjEwmFlfzkSdsVKWJIxVP8P8CFGNCMYztUbAdFd22
	pk6bNVHflkACOxiriVYuwVc0h8EHIFX50NPTTi1jvFmZXxtcFTvIdmfS5EE5OsQn
	FwnmJxrl9wQF+dRoIIUJB6ly/19iRdewSmRqXaKGn0u5GaxdLtnf8tmXtMkQ01sc
	1bCLVPVFbAUf1Os1BrM3GslJBCmBoG3Erp9Me6mgUoLR1q2MxGguH8Cdbzw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda272n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:45:58 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66DIjsbi010054;
	Mon, 13 Jul 2026 18:45:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewjb42c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:45:54 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66DIjrX2010025;
	Mon, 13 Jul 2026 18:45:54 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66DIjrxl010021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:45:53 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id D82D663E; Tue, 14 Jul 2026 00:15:51 +0530 (+0530)
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
Subject: [PATCH v2 2/5] ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID
Date: Tue, 14 Jul 2026 00:15:46 +0530
Message-Id: <20260713184549.929569-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713184549.929569-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260713184549.929569-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE5NCBTYWx0ZWRfX16VmtjpnqU2N
 QjI37F/8oosx0PvV1WSVxMpQNTa76gPHR3caGu1rl9TcQuOstvutQc5j/zQOr7qhPy6+ewkfLM/
 oyxlJIwlrZVzJVsEyIUfuthm4YLJdak=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a553266 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=LqfxHgX1jWeFuUILl3YA:9
X-Proofpoint-GUID: RrfBYdPXxftF5R6gGG5m06aY4ev9wXvU
X-Proofpoint-ORIG-GUID: RrfBYdPXxftF5R6gGG5m06aY4ev9wXvU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE5NCBTYWx0ZWRfX7r5HvKsPmuhZ
 +T+QDsSNWt4At5Ubawqxx8eT2MRxsk8bR13WLWozT0D5JNpZpe8cULBCBeH0oNAOhmVwFC7i8Xb
 NxSxxRsdhmCw7qh4RNf3rfIpSvdVwh3w8HLfedNXsWXA3jMaNA3M5WrhikukeHr0bk1tl9NE6vg
 NGOEjZrmmhbvch755vwCvuBCnUUKuKLI7ovecRXM15XG8EFh65dRQTRy1NKonx6QDQwnd7DoQcl
 obadeLKu299k1uH4zlokCsCUNlMhfRfy6ilYJJ8XkmtQqsCIs7RXWodWN2hj2KaxSkpK7WPunT5
 kfRe7JlrgTaKy00iyZji7fm9XX5aE+YepanNAsOmJgAI9z+zYR6DWPmigGwGwA2N2F8SSercVle
 VbqiO5txcnJ4FZyBGRPlubDIvrx9H12jT/Ofo2HlBGSm+7IDOk2vUGAjOesrI/cUclXixrUmLjY
 jkNfzKTrFUZCn/kEPvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130194

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

