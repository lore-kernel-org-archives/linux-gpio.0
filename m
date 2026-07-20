Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3F3409273;
	Mon, 20 Jul 2026 13:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552774; cv=none; b=UCqpMMT6pIMSkE0ivmJZLNfelGcnWD3loDcvK8rvU6nETzTG0zmDa9G2RAxR19m1+orY6TTglYIecXMn91atApD6BTyMcquiCyaqzUVsi9AA6jjpregpRiELKWZUaP4ft8IgQROigsXMaCDScKJGRdHP8IE4liBOM8/gPzc3Sj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552774; c=relaxed/simple;
	bh=wAM+220wyfQ+fNSIE5cGaUErbqeyE+0eHffgUsF8CZc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gvsv3PPCpQO3jG5jFOEN7KFy9Xgg100bM18WwRaYWbtIfthtFv7ORj8sHwgw4di60gbA1VkQ13KDLdsvgasLkMn6KqdPeWpMCSyT9/PBtZf6YbmtlUWQBt1KUsUJpcSWbxEHE4fL31j02W3YO6L/jLdBRDHJdYP0QpONCN4j9wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVEBeu3V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVEBeu3V"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAvmiw2183824;
	Mon, 20 Jul 2026 13:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=e+WNuQnZkS6Wal/Byp2sMJ0jfUErN1iVRZX
	TJ16zy3Q=; b=WVEBeu3VP2N7Eh13ah591DQEm4/RRqFEQRSmxGwXHD1U+3gMiGL
	C2MQpMfqxfqfeFTqQh4nr4znp8THQCy/RGLE4Hi4OU05MfnNoBF9RRhj4p7ha26C
	Blrm1ECFMA2oysMo+fLQibOxhhc7BzUkPVtcZeEsR/fCkmzEczfLySKhX3/HtLz7
	sYUmY3gzMv+siqPGLMESZw6fyRsODksPH8TRmJss1o4CgTzbP6lG1LwxXrGBAKaT
	CCokGTuNN2hksH9X6d/qZlcy1xSRdjCDkA2lh1cYk74+aDHuwJJsjxbbwlGL32eL
	iuyW+kGGA/sU1MqY2ivxIB9SWCiT1trozUg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg96xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 13:06:01 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66KD5vwu002677;
	Mon, 20 Jul 2026 13:05:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fgj3vh9ms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 13:05:57 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66KD5vCh002653;
	Mon, 20 Jul 2026 13:05:57 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66KD5vka002649
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 13:05:57 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 41A15634; Mon, 20 Jul 2026 18:35:56 +0530 (+0530)
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
Subject: [PATCH v4 0/4] ASoC: qcom and pinctrl: add LPASS LPR voting and Hawi LPASS LPI TLMM
Date: Mon, 20 Jul 2026 18:35:07 +0530
Message-Id: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: IyhgQI2V9UNB1EjvKAmtWlb-8_phMqOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE0NCBTYWx0ZWRfX/c9zVijOZm2Z
 RulMDPn2UkRaO9wei6vNEVBhfQkvmgtDtVR3stHVEmHuNqnLBO/kV1RMrm2VjaD6JSZv4QTM6wd
 cl+s9aepxpXbGrHDdvV+MsRiq0NhCGkbgBcJ1I2sM0WN9Y8TVwE3cPXswiia61zElsAAJ5vLW0Z
 /++osmVa4qeEDXbL6SEYxUvRqww7jJ/O3tmh9u/+n/sG9H8JIwQiGBwtBucBbtwIW3HJQmWsEaI
 iuvg4wvmjLLkucZ1PSoI2qVQ5LHGaOjpNlKeJ0n7RV7que3v1lUrEAv+QIiGP/U3AfN9zHrZl0j
 JDwOpRSV8HchI+B1aYbFO3u17Dcr0ZxmdXMLnePNR93RsFtt0m5gNUdX8GNetvA1PeJtkMYp1hW
 hA7NdzetrzIG79I9gcWS79bMZUUsqXptZ+lJIlaDZLmRvsBF0T6FZsWlCZnFqngDhElblZYvkMV
 agYAhWPiztUN0kyJucA==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5e1d39 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=3Vv4hHRP_OtxPK84qJcA:9
X-Proofpoint-GUID: IyhgQI2V9UNB1EjvKAmtWlb-8_phMqOf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE0NCBTYWx0ZWRfX9LlsNYshV8EX
 wNXzmlPDga/uF75saHAKZ2nXISrXA92BLeF79XSTISfiwqAWFqjmwgB0k+RY0e3dq6IKdtBxyoK
 GStB69tr32qPNBkSmIVH314xBpoof24=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200144

This series adds support for LPASS low-power resource (LPR) voting
through PRM and introduces LPASS LPI TLMM pinctrl support for newer
platforms such as Hawi.

On such platforms, LPASS requires LPR resource voting via PRM to keep
the subsystem active. This is handled by adding a new clock ID and
support for PARAM_ID_RSC_CPU_LPR in q6prm.

Additionally, a new LPASS LPI TLMM block is introduced, requiring a
dedicated DT binding and pinctrl driver.

Chanes in v4:
	- Addressed Krzysztof comments, Drop Q6AFE_MAX_CLK_ID from the bindings
	  since it is not used in-tree.
	- Link to v3: https://lore.kernel.org/linux-arm-msm/20260715133243.3170821-1-prasad.kumpatla@oss.qualcomm.com/

Changes in v3:
	- Drop the mutex cleanup patch from this series. Since this change
	  is not required for Hawi enablement, keep the current series 
	  focused on LPASS LPR voting and LPASS LPI TLMM support, and 
	  address the cleanup in a dedicated follow-up series.
	 - As Srini suggested changed LPR_CPU_SS_SLEEP_DISABLED to LPR_CPU_SS_SLEEP_DISABLE in patch#2.
	 - Link to v2: https://lore.kernel.org/all/20260713184549.929569-1-prasad.kumpatla@oss.qualcomm.com/

Changes in v2:
	- Add mutex cleanup devm-managed in LPASS LPI Pinctrl. 
	- Addressed Bart Comments related to newline and readability.
	- Link to v1: https://lore.kernel.org/linux-arm-msm/20260708114924.1069239-1-prasad.kumpatla@oss.qualcomm.com/

Prasad Kumpatla (4):
  ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID
  ASoC: qcom: q6prm: add support for LPASS LPR resource voting
  dt-bindings: pinctrl: qcom,hawi-lpass-lpi-pinctrl: Add Hawi LPI
    pinctrl
  pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM

 .../pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml  | 109 ++++++++
 drivers/pinctrl/qcom/Kconfig                  |  10 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c | 244 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h      |  17 ++
 .../sound/qcom,q6dsp-lpass-ports.h            |   2 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c     |   2 +-
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |   2 +
 sound/soc/qcom/qdsp6/q6prm.c                  |  16 +-
 sound/soc/qcom/qdsp6/q6prm.h                  |   1 +
 10 files changed, 399 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c

-- 
2.34.1

