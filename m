Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1733A59A2;
	Tue,  8 Sep 2026 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854346; cv=none; b=OD+yYSBbJCXdG/oqanz4PAOflX01j6iJHBP9XKFg/IWylRcLx5l1yWfbXYd406C7jEHr6SEZ2XjN/RCaM7wo96wt7+igiaHU/tbclaL1mjP4OJhanSDh1Pvlormautzf8anz2r3Sk3nONx2H0PgHGj9wagBYF4NsnKoA3CQoOvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854346; c=relaxed/simple;
	bh=eTPH2gRiVebDTV6aKVpwEgVBwge2OxSkNnddqJrGw4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dtJan9HowHkvgTzleYYACVij8JqpFjlkvTeGHubB80WHNq72x6kwnwwbPlIcu2MjCAvaoanGme6b1F7yAb4lnIB28L5lVtPId1mswYKBGCMFECJ4r996EHkgX4/Z0qsBW7lMndrRLuSntnGTB4D2/zb2oPlwCwWVBBaOEOfI/kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pva6ijvn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pva6ijvn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M92S1521684;
	Tue, 8 Sep 2026 07:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sB7QvgSPFsSgcjLwMoUSMi1kjCgw5FLJoFZ
	OuoxL674=; b=Pva6ijvnjFE2xGb6X6VcId+Mbeun3+qxg0ZsNl/J7IZsAd/r3WY
	aA1phAzXxvCyEJk09D+ne9gTeM065+whIiiLev3qHkjreMcmY5g4tUJgJaeLo2Jy
	0pFmVgmmOX+ZMLDWswv1AzgM5ReyreHwmiVrARBdQcsZTN7UjFS10kuH+7rZQDDO
	mBeLLDUS55dUhGvnC9GjQa6WMaFeV+Y0UPn1Q75r80KMuhuMkLhT5wY/gTmnTFA8
	XEAIorUnv0gK080yYVfCs7OarMrlV+lzqxaEi3Rn7iTy/0L+FMuoBwjrDjYvNS+s
	lxTUUTCwolTnaaodJ5/ZcQNiLKIPBTgWFjg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077jnjj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 07:59:02 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6887ww2Y1372042;
	Tue, 8 Sep 2026 07:58:58 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6887wwYr1372036
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 07:58:58 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id AB2C8667; Tue,  8 Sep 2026 13:28:56 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Karthik S <karthik.s@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] pinctrl: qcom: Add QCS615 LPASS LPI pinctrl support
Date: Tue,  8 Sep 2026 13:28:52 +0530
Message-Id: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX+PcgXWB8fUa8
 CFTFrhuDwU7L6+qv6eRrwQE4ExHmEBQmNkje2zwRgvuftSJFxodpxWDKTesdGwGmzny1MPtvfLS
 xnuCFJOPTYiYiqvhtAmLulbT3XfSYqfqsZzCaWBFC7UgI+1kw2Thp/2vwkxO/D4TGGcw+aCDFBv
 QJXU+SunDh7cH9L+HcqAlUwLTDZ1Gjgumik2kgXg5UpzcFfts/yeULswuJlzBN7drGlHa1BMw5a
 zklGURANla2pUqZnm5sVTNgdqjiDWiqe5kh7wAQTV6nLSFfeReHrh+XbjVkqda5EhKUC7IhODbm
 /v/VMt+Ja4Z093oum851zs3YZVwx7PtWrQ4AUjPYy4htRt0FYAXwepSpjirnDx2L9ltLE1D0FFg
 /yl3Rcnm9wKvk+gQHE4z2EUZYmVMgcX0xhDaAJhRP0MaNhFThmIMrW/RNdjvoKHN1+XhbfTq8oF
 5cYYyeOFYZxI7UMr1CQ==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9fc046 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=PqG24b8GdM_TS5kaKxcA:9
X-Proofpoint-ORIG-GUID: nnr6COARgPmiKIGrbte3NZT_ETCMiyBd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX5xgvUf+crKv3
 Xjx/8tS2SvpAoFp64nmy7k0ClWdNIWn9VsHcovZPp8OpBgY8X2FrkUp2T1sFNV6xJpcmiLjS/Vv
 E97pUxtzU4a5YW16knuG+lBx/aWaDU0=
X-Proofpoint-GUID: nnr6COARgPmiKIGrbte3NZT_ETCMiyBd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080082

This series adds LPASS (Low Power Audio SubSystem) LPI (Low Power
Island) pinctrl support for Qualcomm QCS615 SoC.

The LPASS LPI TLMM is a dedicated pin controller for audio pins
on QCS615 which supports 32 GPIOs (gpio0-gpio31) with mux functions
for i2s1, dmic1, dmic2 and spkr_i2s_mclk_a.

Karthik S (2):
  dt-bindings: pinctrl: qcom: Add QCS615 LPASS LPI pinctrl bindings
  pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver

 .../qcom,qcs615-lpass-lpi-pinctrl.yaml        | 114 +++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/pinctrl/qcom/Kconfig                  |  10 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c   | 185 ++++++++++++++++++
 5 files changed, 311 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcs615-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c

-- 
2.34.1

