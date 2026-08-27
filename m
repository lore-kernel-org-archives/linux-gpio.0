Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0686C48F825
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848814; cv=none; b=bUBMFtjJhDTAFKsKzYo912kaVEp5a2dUqqZcSS+Bwka7V3eDQTV9uMt4vYby2Mq3MZX6wS6WTCZDx6ddDfOFHmMroOKcSKFUcV7bGkmwD/d/ZFpGNiFV2zwBdGHCE8N540+uzxr5H01OsR00hGWeBg5QPGLlu9hqZXwSzP9GA1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848814; c=relaxed/simple;
	bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdTng8WHgQcFy1BT56OJ4T3MDXvHtu7fcnmp2mkmbiR36ALpSX54Sg9ZVio60DspoNKfZy3iK0Q4/1tKhJc0twcFBzbNds5v4YVopnIS2CLo/J25cg3X6QD2Q1a1WU4BPp4sIscucpm/lomFpyBVteSwmMtWq5fPRiUQqgkhfv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0YYt6f6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DoZBTrwy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0YYt6f6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DoZBTrwy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RGIfuf708588
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=E0YYt6f6HIevJsBd
	GX+u8SCGPuzsdlWqvB+D6oHOcH6IqkT4tR0SrbSPCCZUrzxSyz5FCUnziW4PMhFb
	GDCb/MeAroaXuVKWw2H+tHiPO5lIMnJ4UoInLTLJcLJYf5PdDGheWJ0qYtL/e25a
	0n3AomPNFaJ7Q3Xk3bLt49KAdWA4PhtB5Pic+Wzy+nUp85lLqqFGEALELmgEP4By
	LQ93fZwhV2Aew6E7RORb/QGVzi0v+BzLvO45c+99GiDZeR374uexa7CZetNACcWE
	mdPs95IYFGJBkZaZpVHLiYTRA5xsNVBO8A04kn5MEhi6kP0oqxnzdOkoKhu/Ut6l
	8jSAPQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garn0g2rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:40:09 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4519fdc5145so289266fac.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 09:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848809; x=1788453609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=DoZBTrwy7hTJKXTtWFA/tNaLqfN3pNhCSkWALgBY5fufdELrumUOhSVJhNb3XZMNha
         P9tq5sX3OAIs0LF16jeJp7uiLameFmhhjVNgVgBfvy4nfu5AE1UNhwQ0kJrYjeL/U7YE
         TOVlWNARefOehAleK8n3lHUT7nN3wznglWby/mbDmsrzSHXqtxZAypiSqKxhhhU33O9I
         nef2MCOBKRtk0DFm01Qs3T+1dzQUdnfbN7Q376s6sYWpGzA0bKaMPXVvt9LGHf043D9t
         DwNRrCezWDtqMUY3HwbbX8UIQVFMRxfINzFxXwsLYJenqKxsPoP5DMcgXLZ9m8B/MYe3
         Huhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848809; x=1788453609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=c/o9uUpmV8cwRckW5QU9dl4XJdSW5B3kbaQNZMq3VDsG/B92ioFqub0aXFlqTlSkRZ
         BDGsq5EukwrAFlggaiZThroOl3O64pjw0OBh6Q3I9KR/Rx5QeB6vQQlEmpGJkuNLUvP+
         5Iq43BHarEEcTpEHhFClIZ1te3vBAhY0nzYg5cTV5cblWPlZMTSmIFchRkw2tUqFqHH1
         ATU6eihsN/9TwlG/XRFzVeZIEQC8hKMLcyH/NYjJik/pADkBU/CgY8FGEg+As3tdavLl
         ePaw84DAM30dSeMPwhfhhVp3OovpbpOstnvsjyKPlvZsImX0VJPvmh3avFFa/ORcVmwz
         JIeA==
X-Forwarded-Encrypted: i=1; AHgh+RrvG9+jzGJPMK+H7wHlUOarU2eZGvREcjA588MTfjbL9ghhNmXGrGwcRzK4OrYiVgfL9Dn7HqZPmeJs@vger.kernel.org
X-Gm-Message-State: AFuF++kIRjjoHq3I1wgTN095r0SFE9XyRJLmexXtAwuAPvKJ7uHxGtv9
	IlytvlgQ+YkMCmHpv1Yo0dLgnBdsI5l1lwLotWrPndKIdy75IM3CYKn99RxZnGJcd2vUsGoGB5w
	UM0iDc+cPtBn1byRNJmSbvsZhIavdfjcf5Uu3aDOmFqdQylrwd7Yib2M6NXiDVZb1
X-Gm-Gg: AR+sD12Cfz8HeZ6g2Rrsv0VcjxJvhtXLP8w30Gng9fRnNH9AwORhlp3ZNyIDiX2MWLz
	p0u3xDagTYfsZlf92icv+iGlsdqInD/V5nTNInDO2Kb05wSvajPQvWWedcmUVfldOkjyG0GHHGd
	yHizBnPi+lWIst5lW64/6zT7Qk1koksXV6ULDE8QYhzBrwIOYziXdmxkkSuEicwUaD90EPVOz6s
	oIX4opCYGuvbEcWhelQdS7IHwX8rcEDSklQrQL6TnwVNVOot9KCHzJYjSwgJlMlfoBEA7VmFeP/
	14oS51CoEPUBr0JkhBKUc2mB6saZxuSkMrW6zfLoTZ44U4idM3JZjMv8izxTz5g1jdnwMVDzosT
	o7HxC1Lm31YtDzS/mWTGtDSQiI0eA40Fyouv5GvnzD3GThTg7oXhQ9dvGhTB3765C1k3eDUMYzu
	yvZUohYZM3eypmZVqNejmfcH4=
X-Received: by 2002:a05:6820:208a:b0:6ac:b6c0:2c09 with SMTP id 006d021491bc7-6b1a035992dmr14794084eaf.1.1787848808674;
        Thu, 27 Aug 2026 09:40:08 -0700 (PDT)
X-Received: by 2002:a05:6820:208a:b0:6ac:b6c0:2c09 with SMTP id 006d021491bc7-6b1a035992dmr14793990eaf.1.1787848807924;
        Thu, 27 Aug 2026 09:40:07 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:40:07 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:13 +0530
Subject: [PATCH v4 12/15] dt-bindings: interrupt-controller: qcom,pdc: Add
 Kuno compatible string
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-12-dd34f235fc1a@oss.qualcomm.com>
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
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=922;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
 b=pBrBLzP9TMaCVUrFowgcMyIoJfPSjcRKOakAZG2f0A8c5CHxwMisU/O2fCHoDFLEHgcn+UTEU
 fPRnjvgpBYyCB7YGXQ7XCauoSDwHWyfAeGfsWsob99y6XN4Y7qQhGLh
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXzyoZb+DpekPl
 9VB8e3mwLklF5olr9O5fKUIlutPa4kDS7cIpZB2cJorjdUQRA2bUI42GWGJlFzz2PTjun5i42qG
 2LhrM/7Mk1lsl1ZqTdLQ0kA7iFcK9BY/oDHSwkhMvT/NAv4fk6BCm/DPVx2ytRWM3sSS7jCWwJQ
 hDELXuflN/LUul3w5P9/P6QdPKAQ4GK7GHIryZmtjnlKgVTL0AmLuCZF4tFWGq+MgRfPAO/jRof
 TzxYwIaZmyJpjjhkQMfsMonP74pZ9ZKNxmDwoh+Rjkn7iCcBf8nrLD7Pnr7e3GCQQbOkEW09h7k
 ndpV/peVrRrO7WqtE+C8cWX+3p60SoRyTLMpzrMxthvA46V00dWPF5yJK1LCW9LuZQRR1zpn8aN
 +26aMJbeJnF0y6ombIEFnri52uVi1QYLZu4ru51hlavSRWaFEcFrR4mCVDqnFQszCY4J+hfCqQ0
 6hlDjRg1SrlWLPY9aXw==
X-Proofpoint-GUID: ScJJItGH6dEdOpIC-q_25Evg-A-j3Pjd
X-Authority-Analysis: v=2.4 cv=C+3ZDwP+ c=1 sm=1 tr=0 ts=6a906869 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_KRvd0mH2JNXacczCDAA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: ScJJItGH6dEdOpIC-q_25Evg-A-j3Pjd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX0Yc58iD7EomP
 V9Vpebg7fFNG7FNr6ejNPLjsUOgyMcKD3EHqy8E9sQNQ3AtzrTedG3hK4BrI26d21h7is1yCY7u
 Kvv+mBcioAumu97rZVk0NxWYWsrpuaM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Document the Power Domain Controller found on the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..518fbf6b2761 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc

-- 
2.43.0

