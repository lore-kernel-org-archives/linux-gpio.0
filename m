Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6604772B7
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848829; cv=none; b=oEqw7q+3ssFryYgrp33JmXGYP+z3KkxxKHtEQOIwJulCvZPFkIB1dBx27fH7Os6OyjQPez7k07nZ0l14lgP8Zgg7iwhzRP4CwAk6HI690hADI5NUoiRg2L8oVI93Li3LMZ1XhVj9f0YoxJRZB8fAzspV1eYGwrsVOGElT7viS+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848829; c=relaxed/simple;
	bh=ItYoLNnh/itsBdfqIb42AjjkJMdlnXNAkIHidF5zyeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJk5cFhwkgXGF6iCZ9T0jAw7EGhXRPLjubpRzQIuNlTVUniO/1Z2+jypLDzkCgDg3IGoYvNvJri7wUc0ymY8c7o3o34hugcNkS5+w2kwljfxav69wVRsAVagHv5M9xFoNaTJuO5D4Q8z7WD4Fih+AREiXqv2ePivbAswOdZAWEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqZLxvK2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IF8qNu5R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqZLxvK2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IF8qNu5R"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbfUQ865932
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6e0CuKO+gMRclt1VJTiG7s7VdbGf2b3bc5vZVAaf7s=; b=UqZLxvK2vO91YEUi
	pJZnqFrtif/Sbdlr6t6TuICOpwkSgbdXgQ+/OLP7JsZwqsX3aL5SzqHIEeALUdlJ
	AG5hY8cl7fg2lpLy373f2qCApuqXqgTSLOYAnszoNadgMgKliyrvkUaQzKui+NVQ
	iw3cgKnn5is+D70fa1MM5InWm9/Yh8ZmqJMhXRF7dCwNeMrcKS4RpzdxIN5JNoO+
	/iQodhKyFHYTul/D5tehAjUKxrDsHDzuTo4d+YiPVvq/MTvMQJI2flei/dQS0R0B
	xOC3cIuB7K/9wJ79jwwQNPmywFSK33dgwGltmE6WT1a0NNL1RMsPTldsIxoXMBXE
	sIbhbA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gapgv8rjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:40:27 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b38ea4c6acso148828b6e.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 09:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848826; x=1788453626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6e0CuKO+gMRclt1VJTiG7s7VdbGf2b3bc5vZVAaf7s=;
        b=IF8qNu5RODMtGQkNV2H9KrY87DxoUY3t9KB7wBwMkAnABzcHV43gCofrOCUZDw/w9R
         yZFmK4lpQ7mkDqRF+kvyeVa4m/fWVvM8O/Ags1pc9xNqp1/pDaLKWGSDH9zjMczUSSbb
         PAApnnYUzv4eqpBWOMS+sZnIJen6Zc5dohOIPzI8WfxyWEPc95SRwx+NYvPKyPyPdAWB
         05X0F8NgALivfnbRt2cvl5B6L1pnaeXUZOF+g0qI6sqzHPEpT/XMG16fKp3bSh420lkN
         VZoxmuEJ61nkpiIh3Fm1HZV/X8l/VUKcbos8oWkAAxWsKOAohA1RHgtmrpQiBBjaLlDZ
         gu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848826; x=1788453626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6e0CuKO+gMRclt1VJTiG7s7VdbGf2b3bc5vZVAaf7s=;
        b=P2PrdAaAbPgALhPlg+mPH5w53ZUhCLjZPGVEONc/Z2XFB0c1ifbPFqQYqDqiyWX3OS
         xLizjh4qccZK64IuK7LrMfcGLzPb/4BFQE/zZtQsiQkIe/Oo1ncx+jITWxbkjRRxOOj+
         hhGjSIr3idOdqAfC+1bEhGdg2PCTTHpmAFKZYTuRCueNp9RnFe9DdRn7Hxj5bkxDWEUY
         3mNfA/MSPNfn5YoFiVwAGvAxik9Ht+IgtIZz4CNfhl26+/Ims/fELXnn4D/ynPDIFv+p
         E1VEGeJVyIR2T/7NQP3jLSFcqfCU29gakBcE0mo4IVCUgkC5a+yZdJP3GEXmyZQtr2f0
         +trg==
X-Forwarded-Encrypted: i=1; AHgh+RpPgUyvWG+g4uhAmaHzHkizlfwQGcPmBw1pG98IKi6aAT6YegT5z3TIstIc+wmNydC0x6VhKxhT/IFL@vger.kernel.org
X-Gm-Message-State: AFuF++lWrO+XrC/p+iWZEiGGbcI9X9jDoDvk1CEFsB/5bJiBuBhYT0qA
	fHUyI3eEqnAh7g23uFcTTyD/YXyHNlW2urkmx3S7rHV121L28yQMTVRmz8MFl62ghbYgjSxuBDq
	6HwYq7QwwpQ68z+TZU4juzR66OyObNPlMyRaGdOxJ51IAo0pLpjooazTRufbrtwc5
X-Gm-Gg: AR+sD12ED8HZfWDulRwZtDdL3plBpDLB6i21P2TX9hbGXNCvzHOBQDiYHfYPkU9Qs7H
	G8yeZkIro46qkcTdMuMCz6UJaT7UBWUwLRrF4K0w9QJndRlyYxH0hZ5sN8KWoaSPqddYi8jD5xe
	zY84vUnbUx9E+MkfOflK3IJR8XINIKu/fWt4yy2q3GE1xgGw6YPVe7TVWM5ae2HWx/yIaOsrYoA
	0eWsRjGcjAfOOX/L3PJrSitNrdJFf1sPTOE1sfiNoDy6zZBoIQzQAiKfp6nP0KbuZvLRdo8cK5o
	eaLPabycPSgNmBR1V338HzB2Rc+NIgWSNabez+2eBx3v5Bf3JMQWjRgtehLVMALSLaip1wHQEPv
	l+fRHKkKUETnVxeNij52CYuCRzyRyekQ1hxbmCrl6BtXLTNMdrSx7VhPJhQeuANdWda454duHP6
	VqkaHgOn7IWBFfcdQinS7Q4bk=
X-Received: by 2002:a05:6820:708d:10b0:6b1:56cd:3aba with SMTP id 006d021491bc7-6b1a049949amr12074793eaf.18.1787848826565;
        Thu, 27 Aug 2026 09:40:26 -0700 (PDT)
X-Received: by 2002:a05:6820:708d:10b0:6b1:56cd:3aba with SMTP id 006d021491bc7-6b1a049949amr12074748eaf.18.1787848826104;
        Thu, 27 Aug 2026 09:40:26 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:40:25 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:15 +0530
Subject: [PATCH v4 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-14-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=2321;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=ItYoLNnh/itsBdfqIb42AjjkJMdlnXNAkIHidF5zyeE=;
 b=87A7RM1KwSY1nYcjjTADj26yrttlOs8VbML+sC4mpHS4sR2pDHR62sHHEgj/sbMN8OGieqOo4
 BGSVUijMSaLD/SZXRClKti/MQbD+R2FJWPXbUf62hOHrYAp4gB3IEMc
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: PlRtU33LMY4YI6nAvVJnM583lNHmzETt
X-Proofpoint-GUID: PlRtU33LMY4YI6nAvVJnM583lNHmzETt
X-Authority-Analysis: v=2.4 cv=FpU1OWrq c=1 sm=1 tr=0 ts=6a90687b cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vXfy1ps2I0IJequeNBIA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX7WOQu7nUJKjZ
 FSfoGRmDZoVM95uX5d4HXFfrWsPBdL997Qxio9KMI/Nlfa2FjxKQe4gZRDPtqMuOLG01c+dTfjM
 atyiIPyjPD5cPyZjecDuaATdRe4qaplieswyNxMdfikfxel5W8/aRU6rynuURF9MG7p62lPve/g
 qdy38C5KrkLWY0kuARimypddUXZSDu9nNciHSGKnUeSdkeO4qa6F39A6tQm5mQbLHL5HbtVaBRU
 6Kdky10ruvSjW7Vsi+wYy7ftkOD2st0DnvaD9f0bf2TMjVdcAXp2478mMSB+p8DNgdwNdBGcD2K
 gUxQI7QpC5WLCoOpWUz4RNbP5Y4o6LDuDyoyEbiIoBex9kMLQIBe+6vW1qBTJi5/vzfaxs2atwe
 59VaX5uXsGnmpx6wYPtQqv04vWA2afscWI1SxH0zbb88j69rENuzOwTFErKVb9sVO6zuOro3n5p
 d4Wf6Yygv202IylXGlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXxHA67mu+6Ypt
 2SqXB6aD6pwpzhjMFG35kK0b+RjcKO3delKGqV+hi8vh5h7/81BvwDerOGSlnIaaaai/1EYk48s
 DA1IIMntxXp3hIwZT1ADi2dfOnrQR6M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Document the Qualcomm Kuno IDP board and register the "kuno"
codename in the SoC naming convention schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

