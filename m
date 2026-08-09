Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EDB36A363
	for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2026 07:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260444; cv=none; b=KTROHVIwkd3xNXaHqZjeYuPL1x0vwcAWJE1bZFJdc7e62o2ZKDhWZInFJ/k6uYZm8Y4GVvZQTjyM7TiXFPVj37nUhKbHHBR3X1S+/CBjJvDG87XAlBxpSW4533eiQFdh8fT/SWmdFmBbmUpLssUZD911dLhJdYmxZBQO2bBUczo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260444; c=relaxed/simple;
	bh=/Jsp7P44tLtJOlnHOneqYC259MeEKBIH/k/fg6ZZKBA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N+XjxWckKYvBmzRvh9mY48s4s1JajpNFc9ZYWQqOk9JQc7w/oCzEq1D7kV1/VJJDNiVCt7938XpufNSG/wA63XaEG5OqEROXOw7bZ4CNlrp145ieNVlTeu/HdtlWW35HW/sCfWpI9ukvRj9JIc1IVVnISGOB5z4A4JI6yw7RMds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjJfu6rT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eP0somao; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WjJfu6rT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eP0somao"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795d1AG1960069
	for <linux-gpio@vger.kernel.org>; Sun, 9 Aug 2026 07:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cBZ+eLbW1mlGqL9Ak7/OeV
	MlOtNX8lTY6pwi+siJQYQ=; b=WjJfu6rT3IfIim8qPqnRzM8pRgViPU4Pv7Puld
	noOhmsy1OYzKVqpNNOlCWXuQf5tZKPJhGd3MHqp7wWColXJc0f3+m4DJ1nx8bvfk
	6+bBTr1LUrDINesgm8qQN5RgFPNGwR4F/kkVAGq7BTQSSTdUFSpaeiKzhEjr2zKh
	ZtnJyU14mei15W8jZb+Lgod7mDEt0Wm1dJ/oxcm55RsV5l2d6hNPhXAwdE4KxiTG
	goCeGDtz9uaAmlS2eZGNSrMyCmUD2w4/KbZxD9EB+Qp6ssWP27esXkGr2O4STeLS
	wZSFN4yGEc1IkoJiOUJQBB5jAZGDfNj14A4KAB7VdtR+Civg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvp1jenm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 07:27:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e6d253330so1059741a91.1
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 00:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260442; x=1786865242; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cBZ+eLbW1mlGqL9Ak7/OeVMlOtNX8lTY6pwi+siJQYQ=;
        b=eP0somaolbhMK123TXir2vmlyQtAxmHM05Fx6qvZQdaNU51yck+gRuJ5guuNk6tFeh
         ufzb3Tcjt3/jMQQa8I9zdWOhA2BjwZL5fLyfD+l+hl3lve4WdJstEB7bC7D6dNbaEH2p
         NaIHai8mWwHUeIu4oaSJROSdBrNtqHF9Cne4jJu9URacdCRaUh37o7ntRHCVv0SstRD+
         uxSbFVM4dW9eja6kLWYytVSEmP5aUOBhR0ycA5dZVGIdxSC7wT40zGZACQwAUTgbMs0w
         lYVP+aUbt4Puf82I2+loKrcH5MxYTwN/j6ns6lb4G0D7Se/VU31x6nWwUx0x+0D8OD8A
         /FYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260442; x=1786865242;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cBZ+eLbW1mlGqL9Ak7/OeVMlOtNX8lTY6pwi+siJQYQ=;
        b=o0o6wtwf5dSkaiTgMzCHXMclsVy5BnTPPcg79Epcjhjz8MWzjTMJPPm4jUHxs26pCY
         7rz/5xL/6DGYWGHjwNvR5gFqliRK1zjInKJfS0j6VvJpQJKRnpszSw3cLO7yeZI0YZPo
         WYY2Uh4i2570yxzl0GXw/3mYao4U0+Ac5ZabVME2xOHSXOqHWzWhNvtnu4nE+8j8ke6j
         rZAw8scO9khd8oggfsdLC1zO+OtzwN0YN3qNwhfWe/+bxNoh2Y828rMr3BRF9ofJX0fM
         edpmoSf7tW6zSbxzT+9EPBmdmJbrJ5IMQOaoAxQ9JPcWbpHk82T08Zd4pjIKJpPNSn4w
         +VWQ==
X-Forwarded-Encrypted: i=1; AHgh+RoV9NGdGzTBx6UgbyLX4pzIDSr2PE/8vRW9drKze04VcQPwAqjwoyCt9RJbxDI2UkiTjGo3Rr4035Yj@vger.kernel.org
X-Gm-Message-State: AOJu0YwZjzJizJ8e1AVA3R8TSiUDDd/KDd+AEJH3Vw0eOue2iEf0sLxU
	GDQgbOMqk18UgbyWGKuLWtT6GDnrkvuaMqkIK82mZq+S3HwkkmwR4LKhKjgbKZ3dan/BEENlkVk
	6ngs7o43u4jzUahHah91534/cwrodenStH5WC6fJCh+w0v4GUdO9iFvcQ+66/kAwa
X-Gm-Gg: AR+sD13ArAg0VUFvo/ZGOkj+X2SAbJWl+cTgygoNTzyi/OijhwHIhavkB7uPEx10r9B
	OBmuAQGNTzXkgI6yatqr52Xy1GLMZ5fYBuWE1RKextYiDfQlYfqarzxy7TupT4BN1o67OK549Rf
	QpyaBmiJIRj2rJTMahN9ofFf8U0UJL6XsPiMww8YsdQ+kot5YgAvxrlc5a50QpqReHQShE2DEMN
	8/CjH5tjqS5sp9tdkEmtRC/6QZTzy7a6jTRzoBFID0cYbaX9FARN+1LAUk46NLTtjDKP/oFyKiM
	ZPhO0xgvE8skYOO/b1LTGpaprhHpT25r5wMKNiCz2l1jxmqQsiFOpPcdPA7X3c6mBaYlz3YQnZ+
	GmV1CwdkufL4kfvEX/Y9M8YFsyewfz0ehpPTCj0TA2y8T5K31ejMzrBkqaSQnSz8VTf/C03+LiQ
	9eGS8kGjQJvgaUlQQwSothSps=
X-Received: by 2002:a17:90b:3985:b0:38e:4f31:8412 with SMTP id 98e67ed59e1d1-3928470124amr4899572a91.11.1786260441908;
        Sun, 09 Aug 2026 00:27:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3985:b0:38e:4f31:8412 with SMTP id 98e67ed59e1d1-3928470124amr4899539a91.11.1786260441422;
        Sun, 09 Aug 2026 00:27:21 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:27:20 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Subject: [PATCH 00/15] Add initial support for Qualcomm Kuno SoC
Date: Sun, 09 Aug 2026 12:56:59 +0530
Message-Id: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMMreGoC/yXMQQ6DIBBA0auQWXcSZGGoV2m6EBh1agKEEdPEe
 PeiXb7F/wcIFSaBQR1QaGfhFBu6hwK/jHEm5NAMRpteW/3EtcaEkjxKzTmVDbswOmv6QNpN0LJ
 caOLvvXy9/5bqPuS36wPn+QOs+sUOdAAAAA==
X-Change-ID: 20260809-kuno-soc-support-1dab826de0bf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=3517;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=/Jsp7P44tLtJOlnHOneqYC259MeEKBIH/k/fg6ZZKBA=;
 b=h5JXYnqQMhEtl8w3fxLi36MDFjd8N4CmajKqzBnD/JHcQsYqMPf/iQ1b5wxO7rVJTTO9inXI5
 CfO4Ma0JMXIApHJk0v98xzk2/Hh8dgwC3L/u9byvG5t0RSKl1u4Ffj/
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX+TZeYIe0FInz
 ft3dY5JmfZTSg5zb+TYpaLeO/lYElhUNzcrhMP75jhexX5I14VSQom86lbOawS34Xqb5ROo3t1c
 8V+b7a9CrPbIG/TsUubtLMzSnb/cR+p230Ooy/etpgdIjJGi0MhkZ9Fd5mSHsWYzzwsQogQO6lj
 hQCkAuGVSzoECc6hpFSQ7LPBbg6bbIxlV8QRFhSqx/C5tIQGtDPYMFhjMZX5Z4rnOpsAIOVfrj3
 6m3EEtRRysjqtwGHM2gDzScojc/5dQ+AK9iMJxD/fdlMNZl26yu1GQtULVSWgIbFOguDWNqQeQz
 Eklyvb+7q425qbSpWW4mkHZD6lNGOWntuJcfYb58McPicmeRdUNrhlkbOso3onLPXOGGG2F8CGQ
 lONqHeWWm423nZ3ZniAFnTY9vgEirpvQhmHSWJ3yzIJYO0Va6BOlbRofidASKJTfERi569Ychbl
 Ot6bHpSp8J8boPYsKAQ==
X-Proofpoint-GUID: WoiCd9Pi8UNpUZr4-z65AUF6SMyo8pCP
X-Proofpoint-ORIG-GUID: WoiCd9Pi8UNpUZr4-z65AUF6SMyo8pCP
X-Authority-Analysis: v=2.4 cv=ebgNubEH c=1 sm=1 tr=0 ts=6a782bda cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=o20KKycpbvKjA6q8TgsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX0soM+E7Fgr5n
 OV+kygDi5N+Vhe1q2fWkkfoAVXhae9Wh9z6TkGHfypcewsC4pybxRHrfeVAiZfF39kijlH7kXJl
 eRZuAdiwSGzoiGrEwZzYc2gfA0mBm6Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1011 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

This series adds initial support for the Qualcomm Kuno SoC and the Kuno
IDP reference board.

Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
the essential SoC infrastructure required to boot to a serial console:

  - Global Clock Controller (GCC) and RPMh clock controller
  - RPMh power domains
  - Interconnect (NoC) provider
  - TLMM pin controller
  - PDC interrupt controller and SCM firmware interface
  - Devicetree for the SoC and the Kuno IDP board

The soc: qcom: geni-se patch allows the GENI serial engine driver to be
selected on 32-bit ARM Qualcomm SoCs, which the debug UART console
depends on.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
Hardeep Sharma (15):
      soc: qcom: geni-se: allow selection on 32-bit ARM Qualcomm SoCs
      dt-bindings: power: rpmpd: Document Kuno RPMh power domains
      pmdomain: qcom: rpmhpd: Add power domains for Kuno
      dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
      clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
      dt-bindings: interconnect: Add Qualcomm Kuno NoC
      interconnect: qcom: Add Kuno interconnect provider driver
      dt-bindings: pinctrl: qcom: Add Kuno TLMM
      pinctrl: qcom: Add Kuno pinctrl driver
      dt-bindings: clock: qcom: Add Kuno Global Clock Controller
      clk: qcom: Add Global Clock Controller driver for Kuno
      dt-bindings: interrupt-controller: qcom,pdc: Add Kuno compatible string
      dt-bindings: firmware: qcom,scm: Document SCM on Kuno SoC
      dt-bindings: arm: qcom: Document Kuno IDP board
      ARM: dts: qcom: Add initial device tree for Kuno SoC

 Documentation/devicetree/bindings/arm/qcom.yaml    |    6 +
 .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   |   56 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 .../bindings/interconnect/qcom,kuno-rpmh.yaml      |   72 +
 .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           |  109 ++
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    1 +
 arch/arm/boot/dts/qcom/Makefile                    |    1 +
 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |   25 +
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi              |  423 ++++++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   15 +
 drivers/clk/qcom/gcc-kuno.c                        | 1438 ++++++++++++++++++++
 drivers/interconnect/qcom/Kconfig                  |   13 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/kuno.c                   |  978 +++++++++++++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-kuno.c                |  796 +++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                     |   16 +
 drivers/soc/qcom/Kconfig                           |    1 -
 include/dt-bindings/clock/qcom,kuno-gcc.h          |   95 ++
 include/dt-bindings/interconnect/qcom,kuno.h       |   89 ++
 25 files changed, 4161 insertions(+), 1 deletion(-)
---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260809-kuno-soc-support-1dab826de0bf

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

