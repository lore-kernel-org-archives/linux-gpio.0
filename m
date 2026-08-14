Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0EF41D22A
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692766; cv=none; b=ryIz2rh3arYKrvXI8r47GPlIuXbPcS7fMoG6MBRshbx/57dbD6kAHC9mwn31CFfAsxFn0D6noFkyqIRAnR03LlP9h7C8cZhElKM29/YOoMvroo1IbaOP9A30xVQtGIwh27Wp9udvTTk2XPcySv8l9eerdmnT191bjg9+5YXiExA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692766; c=relaxed/simple;
	bh=YcUBetlcsSXeTFWwHSGREMaHV5BuwRS6tuHjLEZyQ0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngbr0BJkrLPdXGKAnKFmgdHI/Qg8b1XNAKal0In6L8ZfZZwZS6I8n5s9o3Qh1TLHMmVAs2w0sPuGEbCCwpqAIBRVXzTBYd1bRkWUy/8gMC07HPKmP+7z6OTmzvx3IT2/qw4/VM7lCHQBe2djdQWK+brF0+neeX8kz8JL8ngBzak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnISA80p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ceCaKSnE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnISA80p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ceCaKSnE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4Qes63614508
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lEdztFo2bCdgvgq+SmdX/lBDeTodlOJ5UoO+aB0wLTE=; b=lnISA80pp0MtFeSl
	U3EVZCDo3EyOfVDx+/TsveQ+mF0Y80K29xOXOoWi1R5pdsmvKV4nWFDlMdiAPt4E
	GMt8xvH/Q0S3H65lQSunJmrYJRwxhsktGq1WjVY65fbpS3u3xShbRsjdzi1fg0Ms
	bShujkqlCcPu39FC0AhkncONkQw7VNMeuegIvYDp5Z1CUXh/c85OEs4O3FK1E/YA
	llm4S3UPMlKy7CrbyPw4RE0GXSv10BffY/lQc9pgYzxnQCrZPPG51DIN/PB0u1pz
	LaYeHglputGmjijYFnQsjyMiblKDbZVOtqFhF19RwOyHVlKC0HdIjvY2/8oEggSf
	Nt6I5g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy32nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:32:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so20211385ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 00:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692756; x=1787297556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEdztFo2bCdgvgq+SmdX/lBDeTodlOJ5UoO+aB0wLTE=;
        b=ceCaKSnEttv/XlCPurC5I+bAMghWymXVtTTKd/L8XNmYE/ndGpmnCu9liQgclQlbvr
         BkoRgsSmMr5kW+8gIyujlW5k83GCQ4ppKI3KrthoHgm4lgbsRTfUGAiVI755ssHv2+Gv
         Zm5NBFuXy7T30rowT6hQsWEO4uIwvdvB9OyikdctgxGw9lncP1To/ab217B9NqpkUGQZ
         xLKDFRx7zRjin20Plh7lwIIkHbzPiVMxlQeXV2zFg65sLJWUSam04aTrafQSGONNBs1Z
         k7oICbRujASh4ODnWOER+ZDGj2fe1prtSP26mDq3fHPAlIM1CG+1kxENN7yar11nfv6w
         qZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692756; x=1787297556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lEdztFo2bCdgvgq+SmdX/lBDeTodlOJ5UoO+aB0wLTE=;
        b=LzLJE5KlW8ZVwo6J/0qceZrheywyfr30uu6ebmc29J7JhycT8F3HZUSZFLlWQgrBHA
         dhylc8ZH6TWwI5L+CJTdzBJzJNYwDy4azeGUKIhFcOKaGdMBMbEihJpMNbevNbdQ4IM8
         T8REXbz3UkLexZ2M3WMUn00TtNNZY/p6KvOeebbaextDp9mYXDAdD0CsXzHj2npHCI4/
         rqNeuNDqAkG4e1BQG6K6EujRSTxgxm2zGdmfhUXaxcXTU8RvuNUOp6g4RYMFsPM72YV1
         HzmqOsHDKVUDUiZEAq05Nl+Bn5cSP6H8bUbiozvudHDjVoGfV5fpwy4BeYWLBx92zs0j
         uWFw==
X-Forwarded-Encrypted: i=1; AHgh+RrMytfl/kWWkPUcuc5r74o38W6e6J4wXAIKHcmvgzyVocm/JrWxrKr9NEIyepWWR56HOMG1EhlUSqHl@vger.kernel.org
X-Gm-Message-State: AOJu0YzjTkOkz+5hg0kacBL/HOBBGRbOLWsepNXdkyxBvlloxbSDgpgz
	nthNIHrGd584mEQe5Y4jhqWlrV7QD30BL30xX1UTYjzYVsORkIIukDlq16a79p8+XwYiDgNDq+m
	TfZRAsRK3AmzdJDBQnc4mnf4H3zx029wAiR/7y0Rp/4kSkOogpCnKUtETWsUXOVI4
X-Gm-Gg: AR+sD10W7oWQcsEimylF5O+WBjSmKuWk7Xio5U3eHBJhcYVM36q5aYzaP/+gbudioms
	VzK3HgQ5ym+lO073ZdQ8TcmsdcuTYUszHCzOSI1i6O6Zkhbi9MhN1ywpXkiqr4F+jHjVw0vHlj8
	VWJX88YiY1gi4mBalMRarajoekvHNaIESkPu8WlVUrPpF8oYjXNvxIqjIy+wR/Bfaegh9X/7fxd
	qprPGTrYA5lDxxuKQxxdyUJd+G/fgwzYO+g+cEJnldV94f+JX+H4mav8BvM/KQLHTrfRmwe1GJO
	z+2VzWvRcERaQZzfXfOQ4PTbWmHMmE70rvH5Y1fSJbc0Kg3pMZoTo02TGJAu3SLPeFAba5ecRVw
	5i9EGlLJ3xAx36WUCElM4PIdSXniRCK24h1rCVVgBd9RC0ilLgOQs778xEy81KMo8adFbHNF3RU
	hhgwK7sTYceLH+baRp+r5J3ic=
X-Received: by 2002:a17:902:d549:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d3b0c6832dmr44861725ad.14.1786692756413;
        Fri, 14 Aug 2026 00:32:36 -0700 (PDT)
X-Received: by 2002:a17:902:d549:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d3b0c6832dmr44860775ad.14.1786692755732;
        Fri, 14 Aug 2026 00:32:35 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:35 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:35 +0530
Subject: [PATCH v2 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh
 clock controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-4-3079794f0f73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=832;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=YcUBetlcsSXeTFWwHSGREMaHV5BuwRS6tuHjLEZyQ0M=;
 b=m2FUOtKrBcO8lDcVtLcayWa7nyzy59baesSptJr8XNM0Qaura5kGzPtzto+lk9HJK0wo93r8l
 uo738BHCf4uAPc/1tAGHJokyJx9v32/xEviKMqHgfKVtEhcUdhQDE0+
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX1gZN+HnscPv1
 vSfY9aAjoqkCvZaMzPe+s2VLV5z1tyIPJplF9VE7lsBstVxM059By/HchaYL0BOjmzNhsDTJae7
 JQfNN7bRlZbLETDHUP3pRoH4wtGYcqHDNxtu6HOMo9H/wPRdQOoA7hC2Zmf3+tUXMPjJz1qIKF2
 G41vLj3AGlUm9Olczg3Hdtp+XJCC5rHqyG8hMER0dm7Uy+Kd2F+MUfS07uv0xtCnrKsZmfGm/VR
 C5aB7i+vitWMMeSAABpsmrilU8eM7vVZWXcakb+2YDgpttYWek8D7Rwi4rJnUOpd8xLwzPlPYQL
 rg5/PBLWu/o1QEnGGBmT6ejpzbYVTMb5E0+N/ZqWF2vRf16zXyqYkIRmoxsbWkFtBaVpb6j90p/
 oJ8jjIKx9Zht9zUl0eCLJRWL/i7A81MjhupYj8Ogr2y/Fjx5NYG3MKRmkvvXOQtr6MPDTDsrXw9
 rKzXUxk1OA0A7wyGdvw==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7ec495 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VE4QQHX-7aIn0oL__EwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: LIJla7zTnBR05h7InwBpM7SJ7dOVvcQK
X-Proofpoint-GUID: LIJla7zTnBR05h7InwBpM7SJ7dOVvcQK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX5BmSXsaZpEup
 kbYQFbzRkWP8E7mtNADZMBeqyE4d1Ar/TPydmvT+taP0knYv4ggJ/YE4MGPdD5nTCUDKtpmtdw2
 zpkDsjuk6f8KXyV/xKI2lR4YprLxPlI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Document the RPMh clock controller compatible for the Qualcomm Kuno SoC.

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

