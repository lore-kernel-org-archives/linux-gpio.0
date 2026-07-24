Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8801DA62E;
	Fri, 24 Jul 2026 14:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784902649; cv=none; b=n/DNdDClff0D/cl+02TAMCL/A6WT7Cqp9xRHxRC5JSJgVmPJjMzzmDavWdwNBNBNKChIRP1TR0dvvHmOGPWzCfjyMrPebDn2OoMpZx11a4PqhnwpPY1vxFGBkcJv7NAPkIVsCyJn5SKey4ItzsouaIGlgtLdBd0/bFiXBSBxcPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784902649; c=relaxed/simple;
	bh=2u3Eaqs+rFXT0LnJ9VCmi7N0vS99oba8i889VUvjQfE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nR/t2ft6l+0sEip9E2p5PQDyznqwhv3vUTgPV/n9YZihXFXvjciXM+picudodTfS6WAnMW5Nlkqb6lNfdiE7HWdnFBKXKqK0StswbfhUV2Fud+3kV/LhZCZsWdnMUfPOYCws3L2jsSZOXVhgYuOFS3l/lza2rHuryfSuBoKDtXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7UEyh4U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7UEyh4U"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbErB2710201;
	Fri, 24 Jul 2026 14:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ejpLQgxm604
	oIufHOrAB83JK/JKBf06LSPjnRb+/5dQ=; b=g7UEyh4Ugslze0Yg4QSNpOAu+du
	xIRadPYHjUhSL9mmIFA2U1qPgGwyg2nkTZPA29ae6IWz4JcSb0R4e9BKtlg4tmvB
	Ko7TVl1BKWPTCg48KdooIRPb0IFZRfcZetFFXbbxbz3IYU/WlFBWyn51UDScywQG
	pNRRmhyrMFmEogn71BFbSmU0pu4oFsyooSWFKDCg2sbY9JBwVQCGWuiVU7IKcGaA
	gHWOKmpobMwcSzAA9uTBgQU7/F3Sanp4DjFzBvPC28RmAgaU/URG9u5JS6GIxJmF
	1LMXelTwJC5XP48JxDVgTfuf/MVS6AnltiAcwUuofqFhKAlCkCFE0B1tSKg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cggat5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 14:17:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66OEHCw5016616;
	Fri, 24 Jul 2026 14:17:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fm311dgjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 14:17:12 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66OEHBEl016542;
	Fri, 24 Jul 2026 14:17:11 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66OEHBCX016469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 14:17:11 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 78B4E636; Fri, 24 Jul 2026 19:47:10 +0530 (+0530)
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/5] ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID
Date: Fri, 24 Jul 2026 19:47:04 +0530
Message-Id: <20260724141708.2212057-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=JOMLdcKb c=1 sm=1 tr=0 ts=6a6373ec cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=LqfxHgX1jWeFuUILl3YA:9
X-Proofpoint-ORIG-GUID: 15fi5fZeShM4gONeDaDaABEqsIU7b75P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEyOSBTYWx0ZWRfX97aTd65+OKbr
 IWX0lYqoGFSBjliaCXONL2p9Xvge4rHLYHH690D32kQ0TqE1ERSU6ZQMdZ6d1Qoe2A2VvIvktym
 0uszOIsr4VRPmoYLngIJRbkLmbnih+Q=
X-Proofpoint-GUID: 15fi5fZeShM4gONeDaDaABEqsIU7b75P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEyOSBTYWx0ZWRfX7PtYRFMgNGpg
 Xav33nsPOMeGZWA43hvA0Wkhs5NJuW8ExOUPnIla7r9nWZ/xaDm9oZbw3SldSfrLOMLLBqPaHr3
 65cu7eWc5XjwQZA24yrQlEapSUR8h5+gol+OB0cb9KhHN/BS/O6eEGZI+YskrFLpWVVoe90r3su
 pIO4fnMHmz2izxUjiusAGnANHBe5A7mVrfG7uu3NsHJZ01n4Rc3PieaIP6AreoX26RIiCyJCq5O
 MRrIWltV1c4K2vqkSr21OUmMjSd2LmvXpOewaSGQHTaJekelhh2GsekjBFJVZzA6unu4iz9hto1
 3/BgJt90EOc2MKmc2O5fEi7RRx+FAXK3hmfq0AAD71QYs++ecx9CpBFePL3uzyeyHK8Qq7SnnBF
 oIaGiCtcge3fSCe2Su2lEY4obFF3q6w0vwOmh82/d3IvB3nSP7S/dSCfsCRJjbCqKKUlUODRvwM
 540w1gzdMpwHLR1pKhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240129

Add a new clock ID, LPASS_HW_LPR_VOTE, to represent the LPASS low-power
resource (LPR) vote through the PRM interface.

The LPASS PRM supports a resource voting mechanism to control low-power
states via PARAM_ID_RSC_CPU_LPR. Exposing this as a q6prm clock ID allows
clients to request the LPR vote using the existing qcom,q6prm clock
provider interface.

This functionality is required on newer platforms (e.g. Hawi) where LPASS
clients need to explicitly manage LPR resource voting via PRM.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 7b553a73bc92..8e04106d48be 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -236,6 +236,7 @@
 #define LPASS_HW_AVTIMER_VOTE		101
 #define LPASS_HW_MACRO_VOTE		102
 #define LPASS_HW_DCODEC_VOTE		103
+#define LPASS_HW_LPR_VOTE		104
 
 #define LPASS_CLK_ATTRIBUTE_INVALID		0x0
 #define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1
-- 
2.34.1

