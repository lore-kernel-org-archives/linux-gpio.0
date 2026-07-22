Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731C940F726;
	Wed, 22 Jul 2026 12:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722320; cv=none; b=bJxs4Ek9GD0hdN7CGpWQptDxQpSYlNL+KygcjTK8+IWq8tRIh+DFG8XGe4HTqUPgI+z/kZ0lScDzhnCpFDAmeVSAoCFDhDJfjnqfQGOj4ktVtYBdApN+HuaxZbD45r79PoNjLv3hTmC3pH+5lQfsp0ceqn2w4iGBq54CYdxntoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722320; c=relaxed/simple;
	bh=nxvoC+le9+rt7IFXbQQQPJssctzjS/wmYDlR65Hlx58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gFYt0I2NHptOdj6ZivEkmRiRTHs8fKHGFrc+x7tkBTgml2ypJh61wzhNJ/wuhtK1NHx1PkIBLKFD8Gliat7NnRgYGte5d29QLG1GiYiA/nZrk/Qq0EePh3+zmyQi23diEmKXdBautpnJFGIQuDiLdAD0Q/WGX7fCWUS3x7oevQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftuLtI/Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftuLtI/Q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xaO6269720;
	Wed, 22 Jul 2026 12:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SbX1kBbMO6B
	aebsrSoyRoO9SHkmceGWie9SS3R10Xug=; b=ftuLtI/QorEwXiHTkVoo9TzTf5a
	wA8omqR36V9u3YJXZs2lZA5cVrR4DQt0syp3tFnmPgHYo1udAdt9Rr3Z9JZprYZI
	+DV90NWy7vegZojjhGoElyuHMHbvO5opmDnqfXnjspdod8vQKe4LNbWEMnbDE3G3
	QbtCnMwYmVUgwuqRwbSg0kp6febHHjP43xQahOKMEKalhpblfkpQK/8q7o9vXuCH
	A0457iaLKEinUlafCKQJYP1Xc8IZRU4DRpcekQ4nqLwFnjzIceswc4d9WTjapast
	wG51+GysLEpuDCnYp2YYnb+TOANDeqFBf1HcarLNzjmySyGiKOOnUAoSHSw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6abwmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 12:11:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66MCBhEu015004;
	Wed, 22 Jul 2026 12:11:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fgj54dv4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 12:11:43 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66MCBhaZ014975;
	Wed, 22 Jul 2026 12:11:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66MCBgj4014970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 12:11:43 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 7EAD8635; Wed, 22 Jul 2026 17:32:21 +0530 (+0530)
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
        linux-sound@vger.kernel.org
Subject: [PATCH v5 1/4] ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID
Date: Wed, 22 Jul 2026 17:32:14 +0530
Message-Id: <20260722120217.3609506-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722120217.3609506-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260722120217.3609506-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDExOSBTYWx0ZWRfXygz6q89GJ86I
 P379MO8Pn6XBjstkokKYJa4IuJQgIohi3f3lTn2/HeysZLOvRXps9HWBK+2nZHhlMacHb+ev2tI
 c/OZEH2Yl6S1EIuYWMJFMkR/ljPnQELWdM40Vhjm1TR22MuVwuycNI2+34lSa/qTJ6dHsiD15k3
 MILfudQdmzNnxMCZwYy7vF+IfZz4ZNNntth8DS7B9plcEnxcNi8Hyi4C02iYJh/HF2zgbqJgnj9
 tgMvop7h9QwCRFYgQSGCj1q6LdtdenXpwBe+clPkNkoDpSSiU3A1e+yHMCK0A8sCI11FQJ9N6Xy
 AFYjIBhvDcVhU6l/N3oYRINLahbxqLGp63rH5ve8y6CsajvOgPB7xSLfhPvISVydg2MLHhQIv3x
 Aw0L0oncr3Y7D43V8ciZSNWMgG6gKQaQgq75uv4p5APyBLuQjbB7JMfKP06UR63SiRXSTA6e0Tc
 lVT++OqqQHqT8q1P2lg==
X-Proofpoint-GUID: usH_DGnlnciTXsXLHF91HoWAGDv1AcM_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDExOSBTYWx0ZWRfX7GcBE7RF0T6u
 BhQc0ObNuztagxFBj5vLwUrYUvezdQqzVDDs9dF7xroY/tL/mnZuyaB4ZFl9Eqm0INZEBSg1U5f
 2CR3iDedZsMNOrMloFS7NlTO8d7dVAA=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a60b383 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=LqfxHgX1jWeFuUILl3YA:9
X-Proofpoint-ORIG-GUID: usH_DGnlnciTXsXLHF91HoWAGDv1AcM_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220119

Add a new clock ID, LPASS_HW_LPR_VOTE, to represent the LPASS low-power
resource (LPR) vote through the PRM interface.

The LPASS PRM supports a resource voting mechanism to control low-power
states via PARAM_ID_RSC_CPU_LPR. Exposing this as a q6prm clock ID allows
clients to request the LPR vote using the existing qcom,q6prm clock
provider interface.

This functionality is required on newer platforms (e.g. Hawi) where LPASS
clients need to explicitly manage LPR resource voting via PRM.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 7b553a73b..8e04106d4 100644
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

