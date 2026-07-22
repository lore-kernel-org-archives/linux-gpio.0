Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5E2385519;
	Wed, 22 Jul 2026 12:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722318; cv=none; b=OtQVQ4b0GJSO3Jwgf0K3lVcDGFEwGSm/by3m2SO18VjnSf+KL1L6330BpXa1o1w6VSccTcnnCixmwvK8pufEjLX6mTM2XkFdinvLXTMT3yq4PZ6n7+1uGxiB3kLIkhUoX2TJ1aiyTueWh1EUcRes++gDV41jHXMeq1ZRWxJpovM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722318; c=relaxed/simple;
	bh=xeY74yIuN95oNgg+HjxKljz1BYRswJcV8rjWYDfWGyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DuThfy8gXL6vew6Bxh7hIGA0LiYRJ6dgEmE8O8FfCZfaSuq7i6aiPOMCoht82ixkep5QP93bD1t1aUXOQiP9H9ulB8RbTFiX79DqTkFNahCT7MA9SbKTSjI0TcCfe0Y0SYL9hK8itu3KcIBd7T4sVtrle+9D7UJ84J2BbIxa8fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/BX5Pd9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/BX5Pd9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MA7ROB512829;
	Wed, 22 Jul 2026 12:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FQwMd/UZezLzj7u9QMKAiEmzTsyhKak6xtO
	3fqx3UoI=; b=d/BX5Pd9tkMp7Wntd0dhRWwZf7DOyuCDoJ6SN7dMhIH5Vot99iU
	n7xGRnjC/xxWP1e81TwmeDwtzb/YaTFxNANbnojQmKpXdkdAJPD6uky2FLIrVmjo
	13/dcoHI7O9Kr0qIjc3SfEDQmrS9th3S/Xtbk6xOrpKBlPYBrICayPK3PotxuaQb
	ar8JS7GoZPaazYQ0znHhgH5MfxoUNQkE086rGs02rAxAy1CcHuVs6QTFwB9fjxn7
	NhqSN9U8mihERHp72i1J5CdgzQkhxrEXUxiUcvBLj2ufX9fin65REDguDR8aRyF8
	ivSVxnnjT8mLL/GUwFSEggqnzvM5A4ZHvxQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu78e4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 12:11:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66MCBhTG015003;
	Wed, 22 Jul 2026 12:11:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fgj54dv4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 12:11:43 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66MCBhBq014978;
	Wed, 22 Jul 2026 12:11:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66MCBg6j014971
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 12:11:43 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 7BC39C05; Wed, 22 Jul 2026 17:32:21 +0530 (+0530)
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
Subject: [PATCH v5 0/4] ASoC: qcom and pinctrl: add LPASS LPR voting and Hawi LPASS LPI TLMM
Date: Wed, 22 Jul 2026 17:32:13 +0530
Message-Id: <20260722120217.3609506-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: -rVn0TcVwgNB4dNySUanitNAZZ1kQ7_-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDExOSBTYWx0ZWRfXzXMmhm73CP4N
 ibViCbAr4VD67I8VByEUcNorODS9z95Yl1cawJJrHqzYjahhg6SyzNrEjEJ+FttXa+zemOy+JBx
 tFOF2XAeMIGQykEoWFIefyHRuGAYhk8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDExOSBTYWx0ZWRfX+PxAKXnyvsmc
 6dBoznoNftL+3roElyChlfwvMS0VfghtkiOmn+pjWWVJjt3Dbto/tbIsgkr3+KgxWh8657C3N6r
 R5Fjc6Bkjz/uig2+z3BCXjjotqR14EXh2QffLqVs4ICZjZlUwiOpk3ceMP1QOlqrWvMbUJhB+Dy
 ox7fuxcD/ZnYgqTipoyqKR/aLpThztRvG4FND6xt6asA/3h3quudtJBRDfUTvO6FrK5o+aClCtU
 Ie0tHxDDI9b61kvsN3FXPlxluSLxEK4Mw7UU5b2aoqScqW5uVYMyPGYeOkhl+J3KPEfeuipWBlP
 AYLdEcoKm1YPuyI2Yl4JX4/9f2xxyxCu6yBcb/zu6e81t1XEzN2hdVVqaqbZxBD8PbGOaa/Gyez
 PwrCUeGV5a4KAJSZDnoUIuRS6uSkC4IV3h0VaZ2f+sVdp9oEKg7S44c6xbmznGZb+lhUpzbaNh2
 M9HznZUcV2Fc3JwbrSg==
X-Proofpoint-GUID: -rVn0TcVwgNB4dNySUanitNAZZ1kQ7_-
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a60b383 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=l57HxYVpV8yVoDQca2EA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220119

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

The series introduces a new clock identifier, LPASS_HW_LPR_VOTE, in
qcom,q6dsp-lpass-ports.h. This clock ID is consumed both by the ASoC
LPASS LPR voting support and by the Hawi LPASS LPI DT binding.

As a result, the DT binding header update introducing
LPASS_HW_LPR_VOTE is the only cross-subsystem dependency in this
series.

The intended merge strategy is:

  1. Merge the LPASS_HW_LPR_VOTE definition in
     qcom,q6dsp-lpass-ports.h.

  2. Merge the ASoC LPASS LPR voting support via the ASoC tree.

  3. Merge the Hawi LPASS LPI DT binding and pinctrl driver via the
     pinctrl tree.

Apart from the shared DT binding header update, the ASoC and pinctrl
changes are independent and do not introduce additional build-time
dependencies between the two subsystems.

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
 .../sound/qcom,q6dsp-lpass-ports.h            |   1 +
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c     |   2 +-
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |   2 +
 sound/soc/qcom/qdsp6/q6prm.c                  |  16 +-
 sound/soc/qcom/qdsp6/q6prm.h                  |   1 +
 10 files changed, 399 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c


base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
prerequisite-patch-id: b466b07ba380317b33b3ef98e3789c4a51aa96c1
-- 
2.34.1

