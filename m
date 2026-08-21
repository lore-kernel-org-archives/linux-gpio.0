Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345BC492505
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 16:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328591; cv=none; b=It6hAFPvU2x8d4c0sksYL7CdVnn4CyjaAP3mSriomBogtV2XIZ5A26cYfwksrP1/BAV6hB/PHjn16hR9iIJoqMg+u2OsIxb6yXtvexxyPHto0coR//SpjyhsTJxpyMzYHxj4vLXxPcyX6cZo4sgD7SCDHTekvB2KUJHHBykyjcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328591; c=relaxed/simple;
	bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZw9llH2qLumHuq1xVYKrnRUOImP+0LwMwm0Kfpq17RLLXIui23aPlneQmHuMCasZP2ZZl57in878LDERKbwBpudAaiVNQFVzIIdaGkDlf6bZNeXO5c3aGWqyrwjGuvPaOmrOVKiohFz6IqNw9PUZxfd7ZzKtSv4w1fbQRtY8nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HvNWmG3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YuoDbA+k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HvNWmG3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YuoDbA+k"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFm9Vx2832717
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 16:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=; b=HvNWmG3cGQB5SN1o
	4S3jxthaESGU+fyHigSOwfsTnZbKqpVnpCTbUecz1r5nSNMMinJgUXYolTR6o3ie
	8wT2ApfQ5/PSaP1GxDXac/14trJvUBgn9tAO7dg+OphPz6xc3jQIVWU9RdRzFIeJ
	ScK2Pz+RmxS2j1IK1IQfxdtwJTHNET+gP8z/o+9WwvZ/uyBRlg5yyMDl5RZGeNTn
	hiQjUdmKJb+cX8SYYCx3s1v+TjYuRbNCi5Fj736JNVVo6oqkrkthuws5OxUXtszV
	inVG5sRuw6mgdK9RC9i8TLgwY4HKQtOJXGnh/1YWyslE4VuCjkxDatf9JN/Dd55W
	10STMA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdsk5jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 16:09:49 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab7bb257bbso1728007b6e.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 09:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328588; x=1787933388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=YuoDbA+kBGEX1SK3s2wqw5gVIWf2hmDIjuZwyQhXv89OYTxJLQrbisIWioOQCW9se6
         0SDNQerYTz+rXyuqOYjeDFxWUdVLm1mK8MyiGhytjViDjIcEb694Gl2B5EccGgUyAHMG
         jr56RcJX4njTroQW2XfKeE4ayXEYeWBjjPt55MSABCCmZJbaN6f2LD1sNYXspd/HdU0b
         k6+WXqP0zjeZrtz3eYhMPX2HVnp4zMcgPXJFV9sEGk0bgRaXgsMwkaKEVFN1REvZ6KWm
         0kQAdcxODnMMOl9D5SwNiToMIL5EmIXljFDJF6/DzyGBrGTt9809xjFsshzKNIzRbfpY
         KRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328588; x=1787933388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=ESulTl9WAe2/W2wFGkYRp34cid3xlvTC73l9A97HMl1iVCvpUEp5wnKFN4OMLJAR9Z
         yodBAm2/lJeu6uMnXKdKpd6pMHzOMS7cWRh43KZuuys6So3AboXE82gytsrr6WhA4UY5
         FpjVAlm92ABKGCRV1a3buKbxH/E8yF1uoJ85F4L//B1CnqoCwfEbSEjWvVPSFR//ebdp
         fFbAo0HeJdTzh4dBmERH3R3p68sRsVBOvEdxmuWtzF6LiD5HqlmTB91pFvHOAzMsxihQ
         rc2o+80lxUIZbY1nwRVXCv9SgiBCNvAVRrs9ECVCiQSesgtLky/GEc55nnUo7lGm2U8C
         e9ew==
X-Forwarded-Encrypted: i=1; AHgh+RoSnYc0m1rwLBkWNqMiN8MdF0KeftoXIpYIYWZ94yDV8YBA7qQnUDL89aufLDGAhdcTl2hBzNKU5Sz1@vger.kernel.org
X-Gm-Message-State: AOJu0YwpaQXPjUBECqM9naO53c5kOU3+gSTluc/qjkUUkrbs9vjG2rUm
	b3vikLxlZicECChxzhAVeKwd/yPs0cJY6KZAAui9yjOW3SxsqFCaWnrLAkLa0gheoOu58pnniDE
	SaDmZMzrml0du5MQ1BhqFdBpXJCTnbOEw2WSviT1lbrzmfrFuBC1bJLj7Lq+P/Kv3
X-Gm-Gg: AR+sD13B6erbCEqZy1bBSX3lCqPcGdkEHtne/f7Ljh2tm0kCOzQ17Em0VKWpYyJAFFi
	2GmAcw1KDUre3lafSOHqNp1kyReZT1EQs/3OEZO4MsRrLYXB42dDOAKVPZqIds55tVkKHN+kjxL
	y55WaCJ+3XuYl+0APTEWcd7GMeARFyBITk9IbBt9rs82HltA5e87orGT8bIOvk/IttJGRRi7VAx
	5SZqzdCng9ufO7+IyUC9u94SDD57V8yjC+CUX0bKDEFeN9D/VgPrUaNQZZ3U9x69lB42Uy870L3
	IOE6lKQpsdfuV53X49bTveFP/fDUd1fdP6lYQXuNtFplNITxC2yV26G5OqN982TSxdliohZBMS/
	HkkbRJEfqgGqDLSOk1uYl5+wxsdL/lQDKfQNxMG96jDrVOTQoDZ1xlYmfO2pRLqHB40Rpjh9e85
	ob46GNnyKxUIRQj+prAkUCs3E=
X-Received: by 2002:a05:6808:c40a:b0:4b2:8ea1:b9dc with SMTP id 5614622812f47-4b2ef175630mr7078443b6e.3.1787328588581;
        Fri, 21 Aug 2026 09:09:48 -0700 (PDT)
X-Received: by 2002:a05:6808:c40a:b0:4b2:8ea1:b9dc with SMTP id 5614622812f47-4b2ef175630mr7078344b6e.3.1787328588130;
        Fri, 21 Aug 2026 09:09:48 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:47 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:57 +0530
Subject: [PATCH v3 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh
 clock controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-4-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=902;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
 b=9IPV7eFcmcQy3YV7XduUDzVOHCb0O8TQeRqyjO8MMMACqn9sPoWMnZYcaAMUrzKUCuPu/vqFO
 PVRyy4d1nvKCgSpIwfSYSyxpTfHjH7jkE0NF+jGaoQYV7MN4Ry/ukC4
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: pxQxZOSC-iVKs56YC-yai3es-W7lZSit
X-Proofpoint-GUID: pxQxZOSC-iVKs56YC-yai3es-W7lZSit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXyJyf2Om5DEVJ
 sME8xCucFIrP6aFQXZ2MsgDn1rOh14SXhMnpHHDH9712WwUc8WRnUl7Bnl2IHZGoACSQnwDuMiJ
 ElRWC2Jb5wFg8IO1Nbbs2lmcuOLe+BQ=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a88784d cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VE4QQHX-7aIn0oL__EwA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX5bywo8shoBBx
 nDseXJqlZg5Fiom5xLRRfUCXN6/T4Au/D8XXCxuN3ridXAMTBcHxJWlXowtvGjeGAzSa+4fhhpP
 bltk5CvMX2pu/u+LTxpmnKJZk16smDobm85rhUK1vXLVMM1PWnYRVQe88cbjwpLcYUA5L0WRMmu
 BA+30Q9/a3SEe8GbIugIrrm3aW/CF4z9IDKtlBq0QlF08a+O1ICsAjlAchFhCR+3ruoY0KMl5QE
 u81llpn0j+uQyPFCQTpMIw8U2y+pJfZqGa1qI3v0UQ5aZW+WzKDr9LncVUGWAwUlBUEeSQ5T08A
 Z5ypT2Kq6hrt0pzT28Fm8+bXogb4IGqWgc77XgOQImM+SBxrkHo8ESyWKpTy/A6YvrcD1dxTT3j
 hhMbyGuyo131CFQYeqwaA3VsEhqGxI81FLMwgVefBS25iwhH0/S+Id2hTzzXRs9N2JZ2dQ5QAQO
 FHkJmeQEi8Hg0RwTXPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

Document the RPMh clock controller compatible for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5207..9d521ac9c33f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,glymur-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
+          - qcom,kuno-rpmh-clk
           - qcom,milos-rpmh-clk
           - qcom,nord-rpmh-clk
           - qcom,qcs615-rpmh-clk

-- 
2.43.0

