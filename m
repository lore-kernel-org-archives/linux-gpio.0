Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901871;
	b=QL564X7IXgRfNCgw3ESfRllXp3fxMka9dAwCMVLKT97lwvgwYThZMscAxSSdh/YtSfxl
	 jbB0PmsMA1nlRpU5G9/2TYiKczJqwWNagtbozQGGbXYtAPecDJwJnIs22JwtXDSfQjv6I
	 8NYZuIW146qR6hEo25gHBCO+tgEPx7tzpD+IvmsxWgg3HJLsQzN+Yx4X+oFKYhe441pHC
	 9Sjo/HO44f5MDFLbUoM2HY2oyiXbgzIOk2QEv4D6c9iw4sR942908v/kdo34iJm4GSzCP
	 uqbvY/UIIdy92EivYD+4Uw1+hDSwukybe+oiETZY/p+nmEttxsFfCcL2O/cwYwi8B3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JBekSXPeE2kkFloTCHrYuurV6ha45mlz1h6UCzS4Uco=;
	b=Z+/PINAoJHNUfSKd9GWKco7OMcUderXjx6s3PYyLVa9UBD436VLF8ERNYDFmCfViMT6n
	 z/R57yWe93xvtcFa5yCa+ziYy1/KW+JeF4MEp3Reyh9eVcpJ/YU5TTshEZKK8Fyp/2/C8
	 LMwzXxmZet/fOZmUemcoWu9OwEA/VmtQnZqu7nzz5ZEL86NA9hh7iuDcJJdiWy/P/qQ2u
	 /fv54Nb7t8Ebf+b680bbGwxnylGWWr4JOGAqaOCuEVNtJdMLm4Q9YnLMTXn/gVXYI13Jr
	 AaHAfeQXnYOUc8pbqjkKTUmWnBKSXGC0vl9MOtiiiWpO9/cM5M127jJfiBOyeRgcXbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ol2vrooV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551B3606A330;
	Tue, 17 Nov 2026 07:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 551B3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ol2vrooV
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aGh93624321;
	Tue, 17 Nov 2026 07:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JBekSXPeE2k
	kFloTCHrYuurV6ha45mlz1h6UCzS4Uco=; b=Ol2vrooV9bvGutXpsKLiBv7nwMR
	wnlJt3V2ZdEXd2h9nMVT+A4LGmjbZnlu8ORkXB+SDjUHxHnH13dRYHB2cJFaClmk
	cln1HzE8qQEIfEihOdVfw2n4kN6fbhmNqIQUwP7rUeop1KtfhsIQf7cqY7YkinSw
	/rgn3vfQ8diL5dToYq0fwMyegVQeCfhknjB7xok4LSXOdl4WCbsHbZ4teyTau9f/
	BapwmJq3BlskseIDwp4MQfrbFgRTXpvD98a8I1r21QioOuRoQMImAYvfYa2waggz
	GCB+S2e4fDWPzX/9Bvh42b5HRwe40DtKKEKH096EBm9ivlXGthwdr0UY1aA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rejf0y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 07:51:09 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH7p65j128992;
	Tue, 17 Nov 2026 07:51:06 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AH7p63Q128980
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 07:51:06 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 8E9A9682; Tue, 17 Nov 2026 13:21:05 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Karthik S <karthik.s@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: defconfig: Enable QCS615 LPASS LPI pinctrl
Date: Tue, 17 Nov 2026 13:21:00 +0530
Message-Id: <20261117075100.272535-4-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117075100.272535-1-karthik.s@oss.qualcomm.com>
References: <20261117075100.272535-1-karthik.s@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMSBTYWx0ZWRfX1KqS85nuyeM4
 o0ntk6xo35JTI8U+MKaoK0q+34qV8qdJjLlFXoILOYg4JGwNnZMsJ2jsFedPB+v1N3AdO2xYNjA
 hFh89cEMW2RiLWqVkts6GcXE7C+OGH8=
X-Proofpoint-ORIG-GUID: 4bjWcqcQKNi2O3RZ3arEQ6wjETEYoAxt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMSBTYWx0ZWRfX2BRFV3oCA8AD
 5XPsZKIRU2qowfQgAANeUrU2/mMDktM0AGSDLdry0RJTW8G+TChcOmA3ziO9KoGJtN/DtlXKetL
 T6kjbI9PShMNbYx58Mw7TWMO6aL9+MU3bc7NG00i1f1OEWJhH8yjG3yd/nzLcavDqqFndXtuvnW
 NGhmoV3br1FbAUsKyL/ljgJIpDQsCGRwo0tWhTFemmsb2hcPdaObAAYrKgwJ333u8yGZtCdKfkj
 6Dk2CTW6Rw13jG1UxbL5F23RfcYq7Sw/M7xbwUB6bULxoVnliUZtCQH0jHBZsxX3LMpcQYz5YmL
 4k7K05IqTZ9DymDMh4qM3Twu1nPMCl4BfZPTx6QQwsCQreKqAT7LBEBRls3FFcFYqBsuEFYYI5z
 cWsEPofvS5kBPmqau1jrMbXp/Rfa0VRHsFHVZZaR4TXHgI5ZILc++RuIrp8FEOaIla2HydLJVGB
 ruCrNgx4bcR1bgNLv5A==
X-Proofpoint-GUID: 4bjWcqcQKNi2O3RZ3arEQ6wjETEYoAxt
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc076d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=6dl9xK7RzcSlF3uxdvAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170031

Enable the QCS615 LPASS LPI pin controller driver as a module.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..e27a62f9fe29 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -706,6 +706,7 @@ CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
+CONFIG_PINCTRL_QCS615_LPASS_LPI=m
 CONFIG_PINCTRL_MILOS_LPASS_LPI=m
 CONFIG_PINCTRL_SC7280_LPASS_LPI=m
 CONFIG_PINCTRL_SM6115_LPASS_LPI=m
-- 
2.34.1

