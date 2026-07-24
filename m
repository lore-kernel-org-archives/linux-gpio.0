Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2EE43B4BA;
	Fri, 24 Jul 2026 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784902653; cv=none; b=c0RpX1IDQWdFaqysT+PsLeOAY3zdEjZR1l0rNYJ06GHNKp7Aly26+JpaHnB0drPZwDTLQI5iPQyiuPs+vTRhifalzOWouchpBSBDKrQ6dwOqjRrO294CxupaIG9JCyAFKrWc5+/T41Q6OJ+yKnSD+7A+HP3ar/ShlOfgju6VBJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784902653; c=relaxed/simple;
	bh=nqU3yhCVFbjZOwA337O0tH4mQ8U6uZssEnviedpdZWY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ft2bambIDAkJ+Sr0Z7nd8Sj1EJzkafx9uf2l8k2Q0Syez3dqJCA8rkGIyr/SsN0iMB+euLnJmb6z/+UGwXqSAkxi4IRAVNikKuwJ5GUgDRvpicu7kVm3NOGPZo/qlxYIxW3yKEbYV72ljTlXmuduy/jJBLCvwmBJuNQYo4HLnyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eT/P6MzT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eT/P6MzT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbNV82933756;
	Fri, 24 Jul 2026 14:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Jhuue78XGuUMVsydhJoIHBtoQG4n0m49++y
	iocCXNgI=; b=eT/P6MzTpbGrabi/+Aitxv0v1FX9bVUIau46XxAN8YxlKgae1Kp
	fufti4Vhtu9ma97kFKCOO1EuEhDZSmCkPIQi3CI2YdJjfuWJwc/txDuB5qLgkUbP
	cpUUpag+udgnY2FHPUNCFpEeudY6CI71kgAgzq4UmULK4Ghfwr2n1G9RD4AwIHV+
	v+LbuXQA2ZUJBDKWPXRKwYz83h8kxt7UTjAJsY9l0ouOJ0JlFvIq3C5MEw+bIEzo
	dLy7UdCrld18D9UDD2tar/iwQaDcDrJua7AmiyEETJGMuxMC3/NssQ9xAbmSBs7+
	3iLNyIYl27ikESzZZl5xIDhOUiyEseH+zGw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cj8abk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 14:17:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66OEHCOY016622;
	Fri, 24 Jul 2026 14:17:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fm311dgjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 14:17:12 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66OEHBOq016543;
	Fri, 24 Jul 2026 14:17:11 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66OEHB4i016471
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 14:17:11 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 75F64C08; Fri, 24 Jul 2026 19:47:10 +0530 (+0530)
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
Subject: [PATCH v6 0/5] Subject: [PATCH v6 0/7] ASoC: qcom and pinctrl: add LPASS LPR voting and Hawi LPASS LPI support
Date: Fri, 24 Jul 2026 19:47:03 +0530
Message-Id: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GJE41ONK c=1 sm=1 tr=0 ts=6a6373ec cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qAj6p2JtHKxc3dnxLcMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEyOSBTYWx0ZWRfX0cS3Ih+0rT/T
 HM5iw8TKjX1tr1xkU6CZCtwrrYvXJhC8HNcRm3IW3pyh5rR1ToyE1qdPsxofWdopobSJJuLoKyk
 wvj+6sb0IQmyXulqRHwfkszL6QT4eJnBoVGd+HdaU/QUBcfJfpNSg1Ib4H1mFiXNh5ObE50Qcju
 LxrF+WEJDDtP9t6I7/jwCEcHNYe9tmtZq+8dykpU40KjBrdgRDhwdUYIHP2VOYBfOqHm9QSoDaz
 Fs9KtlRKWZC1ZQQ5fofUot1bhDKeb701XaV9dI2gd33y93SpF0tH/HEPpoh1nWSWigmccQrlmaG
 WroW+XFy6Sj792BnMKBRSFU8FbDJS4E7pWV+X8deGDGiXxq0SI5WnNNaUaTbWfaAUPSQLPgsAlJ
 nXttZcnbWkizi2j5nPI1wBhgOC67J8NuAZXNG5f7vsXgBPRj5GLMyQheFZGXWmWuq5FVYD2BvUb
 7usBZymTbUKbmb1E6Wg==
X-Proofpoint-ORIG-GUID: glR4g9LorWYcQBwJy61f7_Td72AzEfzm
X-Proofpoint-GUID: glR4g9LorWYcQBwJy61f7_Td72AzEfzm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEyOSBTYWx0ZWRfX/SwiGS5N43vr
 /yQ4F5fDtSiUs7uwO/paKJUKSsqy3n13NXIo6BryHdryp0b54ZuQBdrxL1EqppWYlwlvkTdJ4Hq
 YoD73Re2+4MU77pQRZgbObmWuacvKH8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240129

This series adds support for LPASS low-power resource (LPR) voting
through PRM and introduces LPASS LPI TLMM pinctrl support for newer
platforms such as Hawi.

On such platforms, LPASS requires LPR resource voting via PRM to keep
the subsystem active. This is handled by adding a new clock ID and
support for PARAM_ID_RSC_CPU_LPR in q6prm.

Additionally, a new LPASS LPI TLMM block is introduced, requiring a
dedicated DT binding and pinctrl driver.

Dependencies and merge strategy
===============================

This series introduces LPASS_HW_LPR_VOTE in
include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h.

The LPASS_HW_LPR_VOTE definition is required by:

  - the ASoC q6prm LPASS LPR voting support, and
  - the Hawi LPASS LPI DT binding.

The LPASS_HW_LPR_VOTE definition in qcom,q6dsp-lpass-ports.h is
used by both the ASoC LPASS LPR voting support and the Hawi
LPASS LPI DT binding. As such, the header update adding
LPASS_HW_LPR_VOTE should be merged ahead of the dependent
ASoC and pinctrl changes.

The intended merge strategy is:

  1. Merge the dt-bindings patch adding LPASS_HW_LPR_VOTE to
     qcom,q6dsp-lpass-ports.h.

  2. After the header update is merged, the remaining ASoC and
     pinctrl patches may be merged through their respective
     subsystem trees.

Changes in v6:
	- As per srini comments: Split the Q6DSP_MAX_CLK_ID update
	  into a separate patch.
	- Update on cover letter merge strategy.
	- Link to v5: https://lore.kernel.org/linux-arm-msm/20260722120217.3609506-1-prasad.kumpatla@oss.qualcomm.com/

Changes in v5:
	- Keep LPASS_HW_LPR_VOTE addition separate from removal of the unused
	  Q6AFE_MAX_CLK_ID define and move the cleanup to a follow-up patch.
	- Clarify dependency on LPASS_HW_LPR_VOTE and document the intended
	  merge strategy in the cover letter.
	- Link to v4: https://lore.kernel.org/linux-arm-msm/20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com/

changes in v4:
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

Prasad Kumpatla (5):
  ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID
  ASoC: qcom: qdsp6: Increase Q6DSP_MAX_CLK_ID for LPASS LPR vote clock
  ASoC: qcom: q6prm: add support for LPASS LPR resource voting
  dt-bindings: pinctrl: qcom,hawi-lpass-lpi-pinctrl: Add Hawi LPI
    pinctrl
  pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM

 .../pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml  | 109 ++++++++
 drivers/pinctrl/qcom/Kconfig                  |  10 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c | 244 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h      |  17 ++
 .../sound/qcom,q6dsp-lpass-ports.h            |   1 +
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c     |   2 +-
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |   2 +
 sound/soc/qcom/qdsp6/q6prm.c                  |  16 +-
 sound/soc/qcom/qdsp6/q6prm.h                  |   1 +
 10 files changed, 399 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c


base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
-- 
2.34.1

