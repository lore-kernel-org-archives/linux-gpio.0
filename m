Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC45C488DA0;
	Fri, 21 Aug 2026 11:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312176; cv=none; b=eJywdHKyyguoVN3YWQcbdJVJKQPP4t2jpXC+ghaBB19CbHlBUoIkqWHVLloNs6J8uzg8MRb8EX7HZObewbNxNudId0Jn327CsklMoKalUKs5OzWuBBoH5UHgazZLfZlQTCKZDRkK6gycCbpb82c+gW76NkBEStuo0YW5fEe4/Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312176; c=relaxed/simple;
	bh=LB7hTxQdLtJmXEKQGuECEcQC7rEI52DeRDO1z1dt+k0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s7DqblAFZ6xP/2+VSnAA72E1FetVI4/SCOY7qUfFQQkIFwVOZ5OhFYHrYJnlaOVx1ERE9jSlqbitaIdHou2WIHXjvVVjylcYZTBoaND1YTNbN1ES3R3U7XZL6/QSChx9uYUc9ZlWD5GsCTQg5Wq4nfYeYE6o+xHF62vJ0qee80Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UcnXSJq9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UcnXSJq9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9Lxrc789835;
	Fri, 21 Aug 2026 11:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0qn0dajDH813DHisXYHwrfbTda7RMUF15+7
	9irDTZyY=; b=UcnXSJq97XcKRrrL4QWBz8utJF6wtUCYNxwFekStVj7hu3OZusK
	N4GdWdbz3nfmO9eyt6VbLgUOhnlzv8S6KRqohAsELtfbd9TsCWHpDLJsC3pKE92z
	iLL2GuJ5FKiiPFDvfGLzDw0VkWinMLp6o1o2hIzhVCaUYacHpAM+vA0m0MxCkVIF
	H3KEUp3oTGOlO0e45HhGYU8Z5POmGUjkXMjt7vIM4V4LkUw5SbDWMX6EnHwMPCXP
	eivZK6T3X06MNByIyQ7Zk0qzWObzzYawMNQoE2uCCdsnCokuKl02f9iVXXcGbd9P
	k5thW/qx/t+H5rq8CQfHxiT2XnFAMZIPxpg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ebusqfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 11:36:06 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67LBa2sr029383;
	Fri, 21 Aug 2026 11:36:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4g2h6m45pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 11:36:02 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67LBa1tk029364;
	Fri, 21 Aug 2026 11:36:01 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 67LBa18q029357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 11:36:01 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id A288B63C; Fri, 21 Aug 2026 17:06:00 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] pinctrl: qcom: Add Hawi LPASS LPI pinctrl support
Date: Fri, 21 Aug 2026 17:05:46 +0530
Message-Id: <20260821113548.2686650-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: pvVkt0X3dcoNr7CWrh3Xzmpj2ahOCLgS
X-Proofpoint-ORIG-GUID: pvVkt0X3dcoNr7CWrh3Xzmpj2ahOCLgS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4NyBTYWx0ZWRfX3zZzO/pCJiLX
 /TqAlHtmnukMHVlp853oeazuQ+xRUDK87zhyhQYIxdA+s+fbMKWGe2mF/X7CDv3Gfs94zir203v
 1pbqOBV6ekb0qP4P3gfaa80jr7swUio=
X-Authority-Analysis: v=2.4 cv=QJlYgALL c=1 sm=1 tr=0 ts=6a883826 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KHCDqudlxQHWin8w944A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4NyBTYWx0ZWRfX90BE98ROVQ1C
 8pxIUU+JCQV0cdwkfh9xTaK3lLTkeMRSaXXeMigOlkwr/TDd33lprIdwKp65TjnZSjnil7DBuED
 MYazIE4LzQTVKiqSKw2fblNSJtyLpG4Uy9TRBLhXJTZK5hRaF9WBtS634fgX9dfJM6jqBI6NU3I
 l7dhZKDJhDqrqkPlQYk1sli8Zd+3M3Y6vQTR+xZZatLEBoblh/Ok6N9gs75dZzHWVIUrNrJ/e3h
 gGYevIsPdAuKpYiCeBdFt2o6x40gp3lRV3n9Doc+yHO7AFMR3UKECJY8wYm5tZKW2SSCsZq9NdX
 HgJRVhspSs7Glz/Ji8jGkEh3SVNv5kmxw2BjPHgShKQonl/ioCUs1+PTpXQlt/v3tWwRJpuC2nH
 C40oxsHktmf1AepsEK23Doaaj1/Dj3phX/BT+K6JcJJpdUzpcO8rdjLITUKoAUyNDbXIaBWoVVL
 DcmSdgergFfDzHhC7AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210087

Patches 1-3 from the previous revision have been merged, so this
revision contains only the remaining Hawi LPASS LPI pinctrl support
patches.

Patch 1 adds the DT binding for the Hawi LPASS LPI pinctrl controller.
Patch 2 adds the corresponding Hawi LPASS LPI TLMM driver support.

changes in v7:
	- Dropped patches 1-3, now merged.
	- No functional changes
	- Link to v6: https://lore.kernel.org/all/20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com/

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

Prasad Kumpatla (2):
  dt-bindings: pinctrl: qcom,hawi-lpass-lpi-pinctrl: Add Hawi LPI
    pinctrl
  pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM

 .../pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml  | 109 ++++++++
 drivers/pinctrl/qcom/Kconfig                  |  10 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c | 244 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h      |  17 ++
 5 files changed, 381 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c

-- 
2.34.1

