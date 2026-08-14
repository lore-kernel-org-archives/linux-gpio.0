Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59F3435A88
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692859; cv=none; b=BpotRKDRCy0CVmTvylMdvLOBksyz7ni9LZhrdUlQ+Xz4PJ8u423MDUVLqET72wJY5OjD15FXedLLERA4judNl/mXR1bLcnv7vpw6zSx8251rYIHhp+zA39EVAK/z/IdiZ+sumKSmtttU9RosdAyLPfxZLratPj2b3Z7bcFjIv1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692859; c=relaxed/simple;
	bh=n8GV6PoSXN4cpLFiEq+a5b/GV3P0P7iPA8E23y6lTkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KyPwkAZ2uZeRPg1vqOY2fjCXQNclSNvtvd0swN/21fZZtoIYTwuybO1ZwVfCr6A9XcyWoK+7PC3D2WvC+tHCP40bgH+uQfSq1HXPO2iV71b5MlBxHnnG9Q9I8q+akWczs5Ugd8L3mTXb+YNTdcD7SocPo1pNHPsC/5VtLd6Mrpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBM7qggQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J+ExaO0X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBM7qggQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+ExaO0X"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QgIW980084
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GDi5NsGbxyIFciNY6O3JO4DjZ5N5Ti4JWxUyYD9feU4=; b=iBM7qggQJH6GlKGE
	RoyM7bsCwwIW23yScNYe/xWWIj/gDcu23CbE53thgM4y24K2Y+dUxq3fLUrIW4Ol
	2/B+94aXS/6ztYwEA1xXBQv20U/duE9iazZdH1i9d6MHg8qx6i07sAAovTFBYuqy
	FYA4zh+gVEYRd87S5KlMPMKQFBWPKKl/BJ7Ax7ibnBg3SGg3glA44SW7bD1bz7Hf
	MX/HKi09+wKRt5hOkcKQBN2k5xBVTJvdi4cH8NSpakoJfWL3N1jABYX/fTo9AaJw
	8xC6aGfi40IoR3JzMLCAzubsvVOj7rmEqU5re0neIn+UwI3oxjl7u417Yzq2VDM2
	cL3tVg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1pea1qrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:34:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc73f47bdcso10869475ad.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 00:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692839; x=1787297639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDi5NsGbxyIFciNY6O3JO4DjZ5N5Ti4JWxUyYD9feU4=;
        b=J+ExaO0XR7HqT4WnggTZglBt/66LCaIkhOqj3DXDffSs6oZlga9bTsZQ47vhSaw2ng
         UzX2d8Vevtq5Sf/uf7m9ZSyNmnj1plPY7aAIkUxydWYRbHkbDuSP8Qh5SZLacca4wNkR
         ERelbQ6x/p0bsdP71RqX2TDGijP833zruYa+kbLacCuaEaob6pE9AaVWo5hc3kQQJOcA
         HWTRExkML8y8d91S3RRoCciObkhj5GLk4AZKnoK1pnJel4pGpCtODXTqbPZCzQW3wu1u
         ICcLnejO/lpKXz1vG0uJ6xhpzN/3IeQiSRRsg7xEkoFc/aZGPGspAnt528Dv7mx0zgnx
         eusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692839; x=1787297639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDi5NsGbxyIFciNY6O3JO4DjZ5N5Ti4JWxUyYD9feU4=;
        b=kfMmPQ+dCNULJE3R/Td6zNluyzZG1JQdxUbpKNQMMN6pt9jH9RDZIRmCUz7FnrV0aD
         oaSQy20MZ6S57Q8Zsei0GtYgLmhhand9J9hKIlFn6yAdYehIZBXztCvBqXLmmOrOxnaw
         4wx2CgJRaLK5+o4AdQoMHXMrnP4iVIs4HX9KoT9H15Je2uAfC2fB6VAkIG/URaZWeQCY
         f3CaN39QeSa+ncqb9rffgOEWvpe9L8OrtSji00+NeuKWFXu851+cNlpehvExOBoD0ZNG
         RS8mH8i3rDa/f6zUnlxsySCO11AzoBVBRtyYoZU9KYFW+1UuKFyp+/ch3diQCubiob6x
         oPrw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0YtmdoR5a41y7cU4KAQpCC1Axlt429t8/jfyLIWQxGLkqSoCEqtl22OWEB88ZF3uoJ1EtTSidJV+p@vger.kernel.org
X-Gm-Message-State: AOJu0YwtBtZP3ipopr0yK3NYsWkduDOmZgIT/LydSDmJZo729aSI5BCT
	nr9Qr92A0HcEiCq4+6ewJf/fDMa212ZxbV58h1P/xIDKiL5CUZZ3pGwr1eiPAPTa4OL77EYdz1i
	zCmvp/scjizG+EpF/L5ZGmJG4lNk8HJ7+LavPgOVr/03Rb7RM5zp9ZS2M2/njOAxn
X-Gm-Gg: AR+sD13/sylz8VCsmOZuqmJNbp5o/BgYIE/tpLKmBuEyLZCJlbHSDB7Rsllxc7OuhnP
	A8mf9HtwX54wRiOUvs+PjT0IERelLsKxJmFk2dB3+YFFPNlPSke3XlFj6ja797kIRIciMn1fVpS
	sp08jnTGa8mBX2ma2AqaalCSFGKrsgw5h/UApnFXMWgV/3XyDOzRhO+4sodySC3rOb/s3ycExCO
	yF2x0gjeTJxhPMHZQMxoTelgIPuBvw27fRt6+cxTmUHNDdwVVt9dI227V/4wTHePG/4zQ6OQzFr
	Eec5DFpjHlRMfrD35a+fKeHsTa2ti+JJtTJf4Oy8+tmj7BS/sgyvuquvpXciKbotHu4nyEWlfqV
	Iks0fzfs5UA4zcEclGB1KNKMYdD9vaoQVi+tyOJ/VLAtPGue/4r/z2fmZl8zI2QfM+ZzMml9ndU
	fK14Ud/vNXEJ6E8HuXF2sUHUY=
X-Received: by 2002:a17:90b:3fc8:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3933b762b96mr4310494a91.7.1786692839054;
        Fri, 14 Aug 2026 00:33:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3fc8:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3933b762b96mr4310435a91.7.1786692838641;
        Fri, 14 Aug 2026 00:33:58 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:33:58 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:45 +0530
Subject: [PATCH v2 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-14-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692714; l=2175;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=n8GV6PoSXN4cpLFiEq+a5b/GV3P0P7iPA8E23y6lTkM=;
 b=JnS955wsV2fvtkKSqmnST9ZqJcRZDmy4o5dUDkkHBhJd8gneTdqyf4wNaxSCaWi7HMrU16dfE
 hm42/mwko9nDFSCzQaIXYjmVgEsBn0PKq4PItkLcZdtJhhYwrynoaWZ
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=TbGmcxQh c=1 sm=1 tr=0 ts=6a7ec4e8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vXfy1ps2I0IJequeNBIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: hohPUc_EqDxDXKNu0EqyYs2Ryd21yShy
X-Proofpoint-ORIG-GUID: hohPUc_EqDxDXKNu0EqyYs2Ryd21yShy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX7MDTZL3Iu940
 tJq7qHXXnZDhtE3z/AWiqt+hLRBcUJOXibYpqMhbt0bkvKw0FSGjCjhAwfC5DNpNGyxeOfvZ9xJ
 yED9UMoIx4Us8IfynbLmiuxOQeARAWzZSg37D50sZiOh/RyTxhN0DwE+13V3r+73TELyCjFzqgt
 yoFRRoQdZJU1LVDwfeRnKNQqAJrfDZ40izsZOYOA9SXdK2neZlg7ZKJNwFnRzBasAq2bv03ZrCe
 HCJ8DV9aP6dumrE6Q62NsjHX0EZ6wStPH1d9BSaBSmeHLKstLVBqJs01NUNrsC0ubh0YG5ADj8I
 uQBKBrOS+UtHgbvZhbGLOoQh7g/jUrQUMwz1Jo9tehHKqV0s/Qv0D2Zynqmz/MZanNPGPiEaj+H
 fkayYafpoagAxjT4WGf0bQWagIuc5+qW7XYpQ8KarIj60BMdb0dc/l5kRJG2Qvzk5QLxlC/9j2B
 BXmP7OPQnCH/TUwqXqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXzNmsByHhj9Pv
 16gUdOk8dA5TD56AWOonkZLOOGGwemUSwC1wIJ4w7Y8KvKJjqXdEYWWqnJHmwm3gliTiTCd72Ew
 ZMiwDT0S7D+NUHcGq3SGZtiiO53beJs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Document the Qualcomm Kuno IDP board and register the "kuno"
codename in the SoC naming convention schema.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 Documentation/devicetree/bindings/arm/qcom.yaml     | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index e7160b63d814..179aadc86a9f 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -30,7 +30,7 @@ select:
       contains:
         oneOf:
           - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-          - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -42,7 +42,7 @@ properties:
         - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
         - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
         - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
+        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
 
         # Legacy namings - variations of existing patterns/compatibles are OK,
         # but do not add completely new entries to these:
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..ca02a2f0396f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -175,6 +175,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kuno-idp
+          - const: qcom,kuno
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.43.0

