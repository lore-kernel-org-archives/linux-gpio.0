Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981764;
	b=nn3P3dDduJXkdC5Qxtj7tN+5WVHrUwCQ9aeWrVDmoosliTC/2qkaitCNtJjI+eTEi0lJ
	 2Cy0sshUfj0KHBziyADnTzQM45NZj3xoJ8lQuxMGt1yNFpRbOAk3KtrTJj/yob6wM/K2C
	 RRvAUDuKL27LAHDvBS5NU0gE/OYHr5c+6GLN/rqZ1BZN5sMRkzvlNsRcO3VdRCIj9xQKY
	 +pf5PBOooLOXr3lqypxngr+s678JnNlAC6BqS+FBzb354jZa3PubUfDg1THqwmXRcCRi0
	 C+/1z0YrhZyskpPVTo/KG4x+4MnAopABP008vAyHciCJsO16AQHatCG3zLvGLUIYIEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981764;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=D17HvPwn7mDck1Dt1HtFj3YompRsTaqBaJD/AohEDDY=;
	b=Hh+pDrWkIeP0r3k8bSGnWrE3FkTvgV2gHfngYG1r7PdI0Piv0nFcpp7uZCO4QMntQlAc
	 V73D5cq986c5GH8U00H0h3ktPMnCwT1itsLJ4BWr53qgskl/2GqTwOxanyxIehTiQHtQ8
	 ZwGNHpLvcarquigDgb3l2ACI6fi9Ltq1Asykw3WgPPZsW7lmxZqvdVkBZnrT9eSQSagRA
	 lc/HHbWf1QWGGbzOx0EBgFCxSQUFJiqXz4QIAWAwP85xqCqYCM27KmfmfdCcOBIoLx4Wf
	 L0m7a3OsXFp0LCz3z1eEcmUlfIbsWOzuM8vxuLOpXGAShP+QBRD//lh/cnVpdw13TBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+ITdzay;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cB/JEdTm";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAB1606A330
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECAB1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+ITdzay;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cB/JEdTm
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3YW2106389
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=D17HvPwn7mDck1Dt1HtFj3
	YompRsTaqBaJD/AohEDDY=; b=D+ITdzayM+s2wKHuDSXbK8cMjnpDTmzflD85/4
	7TItZOOytJgZ9SBAgBDc5GT7lWdjCi9h82mb2FHplgGKWH/9oJpMOSRz3YR3l29J
	oTEnWdbgLYwknsazq8jPHi3OuksbvdH0AbjxfGaOalgFlcctYA52q19pvjfPzV1w
	Vt4ZgfFqWMKQRxFP1rd0SS5lDvV/zzvj4cftAKZjYiu8YUsiXlPgeBVGEvU9+BCb
	BBcEu4Em+UykCAwPPg7qgXOsrsOFnaRBUE0Fnhvk9MLkwAct+JlB+q/IVsA1Nm3B
	sbA4JVNq+wJtb01huP8yrK4aSfAGOakNAsh/YDBWGEhHU9oQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8se4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:02:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eb5375cd68so6465735ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 22:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981762; x=1795586562; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D17HvPwn7mDck1Dt1HtFj3YompRsTaqBaJD/AohEDDY=;
        b=cB/JEdTmAcKMGdEIJAK2EP/dhzizK2NaqhyIyWy3RdyaGwWuw397bkO/Pl9mubSz17
         /9f1G1Ug5m8u5k2JrXHxPz+Zv0DqtnVPZgJoRuvVim44PcuIt1R6UyynZQEqAxeSuF5k
         6wB2JYBezC33xYKvy6Z36wEMibthW9xg/PrGdcWTyZT9DmDNn0eQKJ5U6doQkZNc2fbf
         mV0OsIelTOgenBv8iikfj77JEgPTlwc3pJbhltn9o01CgwLk1R53T4La/NGQeP87FU/c
         EJe+kk7BK4h1TUyTglmCvlomV/5LS275O8FmnY3UJe/u83HGXsS/SLYUpOmAJrshV8Z2
         TImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981762; x=1795586562;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D17HvPwn7mDck1Dt1HtFj3YompRsTaqBaJD/AohEDDY=;
        b=DrOMRTGs9UBwOQtrdx3QXjBnC+cHzcmHPjqzOav1py+FaAUD4KRIvhWgRbyam1QiAk
         2M8nJVT6NOVsIjAfilQTN3xl1kzWfRLpSLQhMCezuVXZbdz7JFYXFhYzi4s//6//s4qi
         S9DXRZoIAR3PcOsgxhKNfaqH79lOes5H0z2bq7wOvV1tqAqV70zqRdfT/AkFfTp/0Spe
         IiQPrNp4oKvhRascuqVZNfnh+4c5xtZP12dMWlPz2LGBw6V70Tc1/TOYSJa7wo2gqvf/
         2/pxZdZIfYi0sT+gxGMMhdyCCJUyGhmYvizUCsxlycfg3CPT/9UnFnePpV7RpdTWoMME
         T7gA==
X-Forwarded-Encrypted: i=1; AL+hErF+b5E5N9meDxWIZyzxbrnJzVikyFweWSAUbM4EjZczk0gvDYUlbew4H3GOz9NXyproRuh5TTVPoJ9O@vger.kernel.org
X-Gm-Message-State: APuU4Z9JPTErlQd1u00zTxz3WipzUz5J42CJw8rvHzFcvqzqD1V09Ua+
	up7k7eauXZDBrn8wC6A1owWWTu4v9F4xtBfz1elkPZOublo2V1yEHnSik3sPn++R+y+O5TA9hD6
	Z8cgbpw9LJ4cJbPx6U0RmDY0UKOT/w63kBgwd4WjT0DwX06+0utoczZJdL/TH0uNQ
X-Gm-Gg: AZFdTZd3HRXv/qYx83MaLMXEL1wi5IWFad1Rkk5OCeqZmuNCGLMN6p+a6nkD9go+GTm
	QS4dp5yxq6Y24sBgRpMnCYHnIZhZxX+wtKKMU24f9Mypn928qVDU5hlcpVx1bMcc7bV7bU84mrU
	ceuUM6rk6P+M+w1Na7rXxm7qsL00GuTxUBIO4DU6MNTs6xdmZ80kJoFERTfY/sLxB1plfU4uEB2
	IrnbhGF1GiCqXXXiJpHSVXrgWAq5CpFGsM106F1LUXNZIveoKtAepaL+PO7OsggzDFc21NOy0Qo
	aDafmnKfxsaqnjdv2ZD0QvNzwEGuQcXmASBQhrRnRGmz009YUBZg0vp+OuyQgfgEZmi0MQ2ozhM
	MbTZ2vZERYcBlnHIRzEalJMc/3kNSqZuqWiVvQr0ISLPfr6jtabj8BP8qGItM7zBED6XJf5R0uA
	==
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr14900895ad.63.1794981761628;
        Tue, 17 Nov 2026 22:02:41 -0800 (PST)
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr14900605ad.63.1794981761122;
        Tue, 17 Nov 2026 22:02:41 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:02:40 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 00/18] pinctrl: qcom: add gp_mn mux function across
 Qualcomm TLMM blocks
Date: Wed, 18 Nov 2026 11:32:31 +0530
Message-Id: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHc//WoC/x3MTQqAIBBA4avErBOa/oiuEiFhYw2kiVoE0t2Tl
 t/ivQSBPFOAsUjg6ebAp83AsgC1L3YjwWs21FXdI+IgNieNlfEwRobLudNHgbS0lVYNdo2GHDp
 Pmp9/Os3v+wFffdrOZAAAAA==
X-Change-ID: 20261118-gp_mn_tlmm_support-1ea40fc3153f
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: i69uhMRN3Ca9agoQyeWp6R2vS9diQs77
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX/45DHcHXz+EL
 8pUc7JYCnBZi07yFFZRwrf2OtvtqE4LNyFgqM1aTF1Q/09TegPsFqsBdPIexCrinN0XeMldRUPW
 RkA0mwZRc/sbzgyXY6NnShOy0InKDJQ=
X-Proofpoint-GUID: i69uhMRN3Ca9agoQyeWp6R2vS9diQs77
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX3j1XicvPllxv
 RvmdI3CDReF/20j/llZ6OPS0uThpFPGp/N1Sa+iC8SjtyFzxVy66bgqcGBcOc/x6ZUKoDkOu5uF
 kJe0B8/jeGJk/Js2/SmPh/5azBlKKFPn4uOQBzVPnX8lHfgWQSsbyqNpEG38xhAPGA7GKODHadP
 U3ZRrV2PoG1+x7moTm6Yc/ib90V9GY003D8P5gc12thns0LlXU5F5pnxsP2V1YGhnIrYFrn/TlB
 dWO6/xjFsoV76lOZauCZYUIYBuJPV8pmpNcgpXW7GNvG0LG/DyKZhzNY9CT27YTvQsq/cWW0rge
 +OUHT440gNY9+OKi+hXE4Y77ZHAlfp/mgZfaaDp5TdiRA7HDcppQsQCtPB7GUMYZmByW5LGLEpx
 jg4Tiyte1mvpMDLTpcnJbAzxWbfA5qgNAJmTrl7ZGk5/mN/QI+GjiRStOFcccUxSURHx9CYm2uK
 VibXAxFzyfiLWdPeM5Q==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd3f82 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=tUJcrGGC8pjJoxVLki4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

The GP M/N divider generates a clock output that can be routed to a TLMM
pin via the gp_mn pinmux function. This series adds the gp_mn function to
the Qualcomm TLMM pin control drivers that expose it.

The driver changes for QCS8300, SA8775P, SC7280 and QCS615 were originally
part of the PDM GP_MN clock series, where only the drivers were posted.
This series adds the matching gp_mn entry to each of those TLMM bindings as
well, so the binding and driver stay self-consistent. The remaining patches
extend the same gp_mn function to additional Qualcomm SoCs: SM8750,
Kaanapali, Glymur, Shikra and Nord. For every SoC the gp_mn entry is added
to its TLMM binding enum first, followed by the driver change.

Merging strategy: this addresses the questions raised on the PDM GP_MN v2
series about how these should be merged [1][2]. The pin control changes
have no dependency on the clock portion of that series, and Qualcomm pin
control patches are now collected and integrated by Bartosz Golaszewski.
They are therefore split out from the clock series and resent here as a
standalone pin control series, intended to be picked up through the
Qualcomm pin control tree independently of the clock and DT patches.

[1] https://lore.kernel.org/lkml/CAD++jLmA65GL4xxFNSHr-j=Xo2o3dNmEcKjpNEkECXb5bOX8TA@mail.gmail.com/
[2] https://lore.kernel.org/lkml/CAMRc=MeK=BV6WEQNVC5wXo8giAgnrjtdROswXF8Py3BMDLZa2A@mail.gmail.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (18):
      dt-bindings: pinctrl: qcom: qcs8300: add gp_mn function
      pinctrl: qcom: qcs8300: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: sa8775p: add gp_mn function
      pinctrl: qcom: sa8775p: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: sc7280: add gp_mn function
      pinctrl: qcom: sc7280: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: qcs615: add gp_mn function
      pinctrl: qcom: qcs615: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: sm8750: add gp_mn function
      pinctrl: qcom: sm8750: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: kaanapali: add gp_mn function
      pinctrl: qcom: kaanapali: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: glymur: add gp_mn function
      pinctrl: qcom: glymur: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: shikra: add gp_mn function
      pinctrl: qcom: shikra: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: nord: add gp_mn function
      pinctrl: qcom: nord: Add gp_mn mux function

 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml  | 2 +-
 .../devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml         | 3 ++-
 Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml    | 3 ++-
 Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml  | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml | 3 ++-
 .../devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml         | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml  | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml  | 3 ++-
 drivers/pinctrl/qcom/pinctrl-glymur.c                            | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-kaanapali.c                         | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-nord.c                              | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-qcs615.c                            | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c                           | 9 ++++++++-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c                           | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-sc7280.c                            | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-shikra.c                            | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-sm8750.c                            | 8 +++++++-
 18 files changed, 77 insertions(+), 18 deletions(-)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-gp_mn_tlmm_support-1ea40fc3153f

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

