Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901871;
	b=r952WIGGM8ybsnIVnAkMBlfFqKCrYLmkv657D1n3FQqBQrye2mC1qIXneEfncUvSxQYV
	 WbHesa8N6bcxHa/oBFch29h0hc2GB4HknFGCK1jvAnLOIthk0RRe+X9gp+LuxK21PXy/b
	 0Xks7KYshCXWQQJfFXPAgdUUJkcaq4Nl51/crVzdBXoJ2HT40IR1auxRRtsKD956FqusK
	 jNGYclA6yXZ1BXd5spVjiMY7PsOJI9x0Pix82+qB0JFw4aDxhHDZUgY1ujmOs0W1j9hlb
	 A5b7s/toqFJVO2prfrHSq7UqydwAiklw7DUJiBGfnjM9Nlcx/Oxr3oDgpW4BxZea11A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/mAS3fCA1J4k59HYYCZ66lkkBnbONZz6zHLIx9dLCWQ=;
	b=5EEcPIeHKmqcSEBNykNEuW+x31ME31IHZhfFVwVOhkAM5DswNFySnjgfKWYdQz2vwUQ+
	 tM5yDDKr/DWJd0ygLdP92ExIkDohWKsMxQPA1klR0hVZBNC02t79DfqOoIzWldAgbcJMC
	 FQSSMk25VYKecdL/W5fJWgqak0ABNOe462NXL5ZF+i4zaRB9wAVoC53IJTMQt+ptZ28yI
	 CNQ5hDI5HAKDEhpvTlA52HaoTKNTx2xQY7UqJHQULbjtUQSm8zenmttOPdmwkFp3XZ8lI
	 JyV0UokPNk20+tZ4ToG5y/k6OZAH2nPWlR++DF9h3tg4Zo/YBNjqMFgQI1LO5sPuHVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RbuIwaxM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A313C606A31C;
	Tue, 17 Nov 2026 07:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A313C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RbuIwaxM
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH535aK3458009;
	Tue, 17 Nov 2026 07:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/mAS3fCA1J4k59HYYCZ66lkkBnbONZz6zHL
	Ix9dLCWQ=; b=RbuIwaxMU7Vqs0DwLMAi4Tj/3ctJvYrH9FSaB58bjwTHKLYJWhE
	8N/AR26B9QZ9s/t94K7/+3wlzx6/BP+ZhjlDs8bnq0ywKWEUXTjB5u3+ed/GaA9Q
	0XpsoSmwy9mtR9iFHN/CHpYVz7+A1/5YIoRRLnm4g5bgdNsj83ZUSQtFOO3/I+ei
	HCeh3KUFZtG6KIUVXBh6NC6X3pTImHkW3P0f9LjfGR0Evhl3+rKgevjUiuMApt0F
	lhoLUDFMmCktGrio8+mhDXr0PR2ruQiypVFMOzyKIAt9tPUjbTDPaNTCE7JuJGIZ
	4rmPP87WYbxadYTaqffa4a9qhaF/ggNKLtA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh8jfx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 07:51:06 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH7p4gT2335637;
	Tue, 17 Nov 2026 07:51:04 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AH7p3XD2335631
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 07:51:03 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id B11B85F8; Tue, 17 Nov 2026 13:21:02 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Karthik S <karthik.s@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] pinctrl: qcom: Add QCS615 LPASS LPI pinctrl support
Date: Tue, 17 Nov 2026 13:20:57 +0530
Message-Id: <20261117075100.272535-1-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: aHW8cXOxT2II1D5eG7CrdKQyR_pHVU-0
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc076a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Mw9ciAu2lmQUcE6dV2wA:9
X-Proofpoint-GUID: aHW8cXOxT2II1D5eG7CrdKQyR_pHVU-0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMSBTYWx0ZWRfX0Tnh5R8zRq4z
 3xQH+oBmJfT1kIgl+nNx5s7qVqGVycJDjX5k+cQcKh1J2RYd+qYKGlKeSquOdZ0E/LLZoVWPySN
 duGcbALVKDVH6MftkrhIMltoKBd342Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMSBTYWx0ZWRfX+3R/1dmKqkoY
 20FzM5lwI11KiqsHFYOeDGis9b4B+5UI4vLjAAyWkxNAWNIAd9DC52qaG0vUKxQ4i9wgIGGzyaX
 rpAaPeu/Z5iXHFI9NhodRXnI3JGwUoxuSsyabJKnG65/AmA4WeGgjyHz050urUM70+b759i8YP4
 uzmnSRld/Hyt00pGIq0AU8VFaWumy4t2kFSmpGz8c1PpZJLBNcsq9m3z+pGEkIhFa3AUREHBO1a
 gHKx3dNvaMud+chMYeVLM8czU/e67RpDwDs0Y1wKvfmUb+SGevJCVwJktk6VYuOHhlTkJ987kU4
 jBGvyBOIm90rsgCXUjUx3/KpHGgdj8vM3i+8+iCHnwWOYpkLYncgCEKFdpBTInwIk98h1x/iNQU
 JIx+h5ldW0/Sa5Ew8X/S8pA2h6e03H7kfu9gs6z5TYOa22E/Qzz/mne+lr32JwVY4QIo62WxrHC
 tW6yiobijhZxd6zDVnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170031

This series adds LPASS (Low Power Audio SubSystem) LPI (Low Power
Island) pinctrl support for Qualcomm QCS615 SoC.

The LPASS LPI TLMM is a dedicated pin controller for audio pins on
QCS615 which supports 32 GPIOs (gpio0-gpio31) with mux functions for
i2s1, i2s2, dmic1, dmic2 and spkr_i2s_mclk_a.

---
Changes since v1:
    - Retained pinctrl-qcs615-lpass-lpi as a separate driver rather
      than extending sdm670-lpass-lpi, due to register layout and
      function mux deviations between the two SoCs.
    - Added i2s2_clk, i2s2_ws and i2s2_data mux functions on
      GPIO23-28 to support a 4-lane I2S bus.
    - Removed unused gpio*_pins[] arrays that were mistakenly copied
      from the top-level msm pinctrl driver.
    - Split defconfig enablement into a separate patch per subsystem
      convention.

Link: https://lore.kernel.org/all/20260908075854.3015560-1-karthik.s@oss.qualcomm.com/ [v1]

Karthik S (3):
  dt-bindings: pinctrl: qcom: Add QCS615 LPASS LPI pinctrl bindings
  pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver
  arm64: defconfig: Enable QCS615 LPASS LPI pinctrl

 .../qcom,qcs615-lpass-lpi-pinctrl.yaml        | 114 +++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/pinctrl/qcom/Kconfig                  |  10 ++
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c   | 161 ++++++++++++++++++
 5 files changed, 287 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcs615-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c

-- 
2.34.1

