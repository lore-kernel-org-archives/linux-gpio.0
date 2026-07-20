Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67786416CFD;
	Mon, 20 Jul 2026 13:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552776; cv=none; b=FAAcK/LRJvXtf2BSQm7k2wtPakTonLBmibJZWynytyqMSeW/gaTQLEtDZe01k/UQc6mJRx0SDQ59m7qnnQ74hlEo59ahQGQiwrWZJCcth7lgdmiM1/gRVdGNax+H+oE5VgRNfQaqAcTKib+ip9BTbA37i2S4Oj4PtOt3f62dw84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552776; c=relaxed/simple;
	bh=4dSYVaJ1oPyZcSJulm5PmktcY4Z31A+bK6Rrih+ZK1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gz3b8IlZZuaf4VA+0Y9I9a2NGjDjKo1OZLG68Q4rEaJigH1auG4urnU4s2I0JFu/CnS0XCSkeReSgeSQYbs8Id7iocBG0M1yO6MjixxOStzjT8/vSQdH0d1yCWsFB2vOFDNmn7YRnVWlrZJCKiK11IoZsWtfDH1OIoRXsP6TR1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceEVD0QA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceEVD0QA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KBhx8Z2449933;
	Mon, 20 Jul 2026 13:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MWYPt3WpggV
	OleWnj/kiqyhaVeYob9OpxgwXhUvvMFg=; b=ceEVD0QA0GUP3u3PpxnC+ID9tQu
	P0wEQt2HVDS8rVj46FnpOaUpjJ2j2Zf98UwlxHJ7ETtnoNtjxpkvS7WWuQT+BFB7
	yLY0/7hzbc42mRl060SsrQZutMrCxKezp5TTmjdaa4Hg0rmEsZ/YdkrKpmp2hY11
	Donh9ANzrfxRKiYjDfhA+gtbnV3Yv6URqfMWqUnzoGeWAmnJLYkcs3BkJ0cNYcrZ
	62TNZ7zYVvyOusAEOqxXyoTYnJYuwWcp867+yh8VafrT/7vehSA0PH3pF5VheLyi
	V2XZH3/i68gUIiww3KCNr43ifwZH/dlzXYAdK/5OzGjiI3vEyvuWUF34DPA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhk2f8adu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 13:06:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66KD5vMn002678;
	Mon, 20 Jul 2026 13:05:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fgj3vh9mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 13:05:57 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66KD5vB1002651;
	Mon, 20 Jul 2026 13:05:57 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66KD5v1r002645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 13:05:57 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 4642C567; Mon, 20 Jul 2026 18:35:56 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
Subject: [PATCH v4 1/4] ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID
Date: Mon, 20 Jul 2026 18:35:08 +0530
Message-Id: <20260720130511.493295-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: C09ZC4nQsuXTjiAb7KXJvJptaBB52-1i
X-Authority-Analysis: v=2.4 cv=X8xi7mTe c=1 sm=1 tr=0 ts=6a5e1d39 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=LqfxHgX1jWeFuUILl3YA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE0NCBTYWx0ZWRfX722me+8RnSPV
 TCY7kLwsTwRKi1g6gV+kQHRYA2jz6NzNjAVWzNwJcDYMyvFkuJF0vWVOaYwPFPCy7iznYyGfTMM
 yaMa9iXRZ+jZLuyYjl+tpUkbzTMXUaM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE0NCBTYWx0ZWRfXx6AxLaGfMR/o
 qSPEPGo657wVTpJi8QngNkNSIy49VF1BgNiPQtmWEDT3SFtk4mczKAaH3nDthwHjxBuqJSdkLOQ
 udxmXJnnfy7fDnKjmc5wSqMf2HVBoUcLFg60QaxE2rLIwXj+RhusukY1+wqXQcMaajk4IJnnDoR
 aPGn3+617pWbYDRh4VX82YcR+OCnq6qeojPVyQq4mtltynoV9vN20Yvfgkwrut5InhRqfnegE1e
 8jFLG4sJZo88hUQzlKiZX5d1DrHwSgo1pto213MPGfcdib38fuxhsYAlEyfQPnrHLjLVy6ANHmm
 W2HCdiAws62Ky3MJSVp3aASGfKILXbTKYWdvCCLHEEVq0Fshp073jONEt3xLI7CXG38RbkfeG+2
 hvIyOnDrtLn6jup6hf+kVFIoEXP2zA/pHAypgT4xLuQo/Wdqv8PH4RjGHflE2Ux7yFu3RpWmxG1
 T0LAE+aII4yOwUewZVQ==
X-Proofpoint-GUID: C09ZC4nQsuXTjiAb7KXJvJptaBB52-1i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200144

Add a new clock ID, LPASS_HW_LPR_VOTE, to represent the LPASS low-power
resource (LPR) vote through the PRM interface.

The LPASS PRM supports a resource voting mechanism to control low-power
states via PARAM_ID_RSC_CPU_LPR. Exposing this as a q6prm clock ID allows
clients to request the LPR vote using the existing qcom,q6prm clock
provider interface.

This functionality is required on newer platforms (e.g. Hawi) where LPASS
clients need to explicitly manage LPR resource voting via PRM.

Drop Q6AFE_MAX_CLK_ID from the bindings since it is not used in-tree.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 45850f2d4..ce5e8589d 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -236,8 +236,8 @@
 #define LPASS_HW_AVTIMER_VOTE		101
 #define LPASS_HW_MACRO_VOTE		102
 #define LPASS_HW_DCODEC_VOTE		103
+#define LPASS_HW_LPR_VOTE		104
 
-#define Q6AFE_MAX_CLK_ID			104
 
 #define LPASS_CLK_ATTRIBUTE_INVALID		0x0
 #define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1
-- 
2.34.1

