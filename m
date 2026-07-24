Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8AE43A7FC;
	Fri, 24 Jul 2026 14:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784902650; cv=none; b=u3JMu/RTG2XTPj0NyI4aysYTlnvfKWU+38dfMaqC6Sc8CpdRmQ4lhAe1hvbuOd7SxSvqcppl6dEjDDNPGpkOnHlMM+mCQuQRWrZ/X/MvyzLaNSdxQjvbfZLKkeUo8X1yk+/jLpGJ4mO72cIzCWhA32revVAbl5MVcZsQqS4xGS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784902650; c=relaxed/simple;
	bh=7VdLG4sulK0wHJipRc+gL5nKtImpvb5K++A/lPfwPBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lw9wnbAwUdZqVXsMYS/mD/SWkiQP6DWtbS0G7Jcms2ER6Zngjbwt/VS15+21EmOOIpQIUaF3L9S05wzLy+7BqxdFbMOfJ9fSJ6dcB92F3KlAyBs32DxTt84Tf7xxIuyDeamiIrHYTXDns8kxg7jbDhwICvRfZnY/I14l2gB22Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1Ifxv6h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1Ifxv6h"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbBJW3089353;
	Fri, 24 Jul 2026 14:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lbAZmDI3D3Z
	Lo2DRLlIvSjlyeew+S1X7k80XA4PmG1Y=; b=D1Ifxv6hLnwUZ2Res1YzRnWVs4H
	48J1fPqnryMVVjWt26vWNM2nuxHOAVnvwpFkhXZKIAhbaLJY84Lfc2+5pwEjdUqE
	r46dBkn0UgkN1afUhz0uzP1dymqwJOqQQBAC42JmGxHmNE0TFSbImtmRxMOQqRjS
	uoP27CaDZvnuWFxjEBntd9/d7GlXX/z6DhC2hXBkKoNnzFTxz7k4G6B384x3bV2z
	D1aDaqD9BgxmweWGqNue1YnB/RpnGOUqIyBV9pMMmn4u5ml3J4eXSicM0XsCtfqv
	Hr+P1j8TkhArGKaPfNKfDJHIcuAUgmBFf/jV07Wed0YrArcj0HOyWi+E6+w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cggaua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 14:17:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66OEHCSj016643;
	Fri, 24 Jul 2026 14:17:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fm311dgjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 14:17:12 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66OEHBln016558;
	Fri, 24 Jul 2026 14:17:12 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66OEHBiv016472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 14:17:11 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 7CDE4C0A; Fri, 24 Jul 2026 19:47:10 +0530 (+0530)
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
Subject: [PATCH v6 2/5] ASoC: qcom: qdsp6: Increase Q6DSP_MAX_CLK_ID for LPASS LPR vote clock
Date: Fri, 24 Jul 2026 19:47:05 +0530
Message-Id: <20260724141708.2212057-3-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEyOSBTYWx0ZWRfX3q9t/TV4b2ga
 Ho6GBxth5Uc1R/lSJQM5eVh2JfzxU+Mnk7bU5ADAkCSfewLmNJga+EP37Yx1OqjOC5q6Uv1z/96
 mWbPpZ4QHKIw8QrZ1N02wqLDNz1q4z/dYl0rOm3lE3Cy+kpQCV748419uaM5Eb9Jk4+mnj0aye0
 4HBgAKOT4+5fvx86N3zf07tHZi6WurcvpNK+vs+Wn2G93yZEeNZKAC3jznSULu3cBSFhvqwLoyK
 nyotqviWeVQ7YjMXPzduU06BkqrjV50JA0SmVApLQdIjEJEF6iSv8YsKCPFjhKnDsiYwwmkw8g0
 XqTKUjiVW9ETK8RyOzG3LndKXBEBt/X+sg0jH/qpGLzVSrD7P+aQ4rpgaxaLBIZUnvA5P7Z/vNJ
 oBdXpRD35KmfeMnqJjbv3eYtJxlwdRpaPXwefa0o+5fl/b6DZh9u6+r5Be1s0ZWYDjja1eDhpVU
 gk9/lRirXba3gcGa96g==
X-Proofpoint-GUID: iJ-Np27FynAo1vyZ3ZLKovUj1TFATATY
X-Proofpoint-ORIG-GUID: iJ-Np27FynAo1vyZ3ZLKovUj1TFATATY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEyOSBTYWx0ZWRfXzMyL9YTGblcq
 0eaCOrL4zNMpB+oANciKYigKzm+Il59K6oh1cL97/ItfkSG0So1TikHgBDtZue8mJ+6XixdWMx5
 YkK3j8bE0QXNk5rknUD1BNWs+Wu9ETk=
X-Authority-Analysis: v=2.4 cv=P9sKQCAu c=1 sm=1 tr=0 ts=6a6373ec cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=1tviZh7S9ikaHnLX3a0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240129

Q6DSP_MAX_CLK_ID defines the upper bound of supported clock
identifiers in the qdsp6 LPASS clock driver.

Increase the maximum clock ID value to accommodate the LPASS
LPR vote clock identifier.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
index 03838582aead..ab7d20580638 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
@@ -12,7 +12,7 @@
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "q6dsp-lpass-clocks.h"
 
-#define Q6DSP_MAX_CLK_ID			104
+#define Q6DSP_MAX_CLK_ID			105
 #define Q6DSP_LPASS_CLK_ROOT_DEFAULT		0
 
 
-- 
2.34.1

