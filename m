Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D453AEB29
	for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2026 07:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260553; cv=none; b=sblV2ASHhLzdxm9iLGYyScb7Xmu00B4ew8vCtwY3qi3MLsk5PjZTTz1lHhqOfxKLSSEeqL9ib4+pfhyM+3fEwkv/xHtrz6k9VYAHtNca46hq+G2aZh7fcI4AcJ/tns9foJyw5XTPEu2iBAqQubQCaQgGukYppXTMFWpk5cW1Xfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260553; c=relaxed/simple;
	bh=yDpptoQ318yeiKfxnWYGidGQj1zxMMuKvU/iB4nvzIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r3FynBITSYXcEzNvJyAF4IhAOiG6weQrQCdZ/ZZd5k280M46txZH+gvNa+1w2FVBAMz+1yugvyUw1OCbusvNyUqm1BpaKm7QH6j5J4abFuqAOfGrxAPj2XM/30aII/6EHO0PwqZfECZCjSpkp7piFMzEyvGsEEgLuVT0qvhsVoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctJwLSET; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OPi02dT4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctJwLSET";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OPi02dT4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795c65T1556973
	for <linux-gpio@vger.kernel.org>; Sun, 9 Aug 2026 07:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXPd+43Dh8ydYhJdKmNR5tHhtLLvvzjeXJ3yyeszk8k=; b=ctJwLSETjF7l86tS
	pbvFkFId+/0N/cqd+m7hp3/Ggv6/aLKx03hnTwJDaZsk1tDr/geyZmDg73hfFLbA
	mpm9eZNh6iIZf2PrZPOkzaJDNd7hhVOS1KjONrFWGUil6L1c7gs8yku4J7zR0VFX
	bIUR5JvrYzWK1gOTOOFhcXsayHX2pWdezknqvRM1R48/wdRK2ZITB9Y2LWCIdeAl
	Oy2puPinlKPNTOAm/EZFy33bS5AMUdgf1k6rBSNAI8rOAk4nUoKzo/hUf8hOlhqe
	cKHEmnfyl4W+3rhGDmaJybu4FjDs9qc7vzOIWisQIk9exyAe3SLlLiLbBHGrMh4I
	L4z7wQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwr9jbxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 07:29:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1045426a91.1
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 00:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260551; x=1786865351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aXPd+43Dh8ydYhJdKmNR5tHhtLLvvzjeXJ3yyeszk8k=;
        b=OPi02dT4hR2UdSbQx7R4ZMq6Bgi944kmCq/VHsAOFv0Pqew2xu6gs1qRm565ljJZZ4
         LtnhTivfgbkgKnrzqcHf2fRmyssxDFHZX16nZBjX3cVCziWrwKm+rw8jsWq+iG9bdLJr
         MsOEhKVe6nqXCOuuz0tyHwClmyg4LGxEJjEfEa0z1hWZ9Ysa+IMN4TVHinQIOrtls+PI
         6bETzGEWq9+VF4WgZPIPBwp3Oru7LYTrbNreK+XuBn/kg3fcgO3da5QPU1SqdXah0d7t
         o2SPirp+J997j5TvTD6n++b6mQ9sqzHm/oKDCjqCiH3HcXCG+e2GC61wEhiPFdwsbtvP
         MpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260551; x=1786865351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXPd+43Dh8ydYhJdKmNR5tHhtLLvvzjeXJ3yyeszk8k=;
        b=UEqOFip/3BqVMo1lcrVXn6BRKoVEaceiMvL8CsMGeuki3RaET764PuEwzPnYhctpbg
         qqep0JLnGhygR0QU/Sh/GF8s8FLjwBn60U4/njWroVv7F2C2FTAJIes7Nf+PlvGuj+9n
         5J76q/DfgmAnRZdrUb9Cp6otn3EU6lOKv7yc8g9KmMkTam+y3ljGdqF97uF0kd00NpN2
         rltbcf9pAe/uSc6P3xCYXrFGyAMwyKFXt6kq++Ihnh/8FFVgmiFjSP1UFsrL/iwouL1M
         FoH1Jjmk/oNcbA4Dqq+AOm1mgvy6+cryE+fr7S2p05fdsFoaRoKgwkEofoVuo2DUl6Yi
         eF7Q==
X-Forwarded-Encrypted: i=1; AHgh+RreyOPyCuvjb+MBEZ3fdjtytv/TmBbN+bmii5s+ytVUqyWrMpwHmgSsjAFaTxjQWVSLOa1nhznJdQ/e@vger.kernel.org
X-Gm-Message-State: AOJu0YwRQ0U3Hmt7EPY5NGt6DuL1vnzzl41kcMFhcpcFkUXbnjIHy9O1
	8aCoic35G1zFAZM/beCLYoAki2nT1W2PCajnpG8mnAhS4pM8Tc/CCnOySqq91Lb8meBQG9l/ISg
	ajt0cVd43mplKOcIsdZm/jxMkqIQ6m9xMfmmP+XIzKlOKRkWmPtwwRHVN0EPucQ3A
X-Gm-Gg: AR+sD10s8E54eq74q1tAbRn5f+oGVftR0ZDDplq15VmIsxx1WJTi4y++1wGrikEDsQg
	8g08/OPrIsuJxYEIiAGXgf5uhavtDVzSSKTc8w8j6s6MsPCU/H7IBgF1ccaj9angThM3qDrvbTm
	fWN9X20/LXr+5dSzRdD3b8wfb4CZCOY5ds4Vga+sRQO0iBMhysza4kuC9w6z43fSoiCh2WaqlEc
	3D8N19pkFJwsjYXfhn4VVeBUHvHFpkyjBW4iv6So+mz9ZQp7zeeuj18nNjA56daE6HKz8g5wNEY
	6dmZNyoTYJ6DUPSEyZGVMPiAF5BLGmECq2PqK+Rt0S0mfb6fBveOzWA89AisfbUTzMwLtmGSnLv
	KXrP8NZgUnZ7HXqdqseKeshW+lDSVxOOcnQR1wlYsJDlulNy6YEDf8tEWSEudzRBXtTad+wCiRY
	LeQmb9TeUdNJYsnJ8dRv3Z//Y=
X-Received: by 2002:a17:90b:57cd:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-392823c808fmr10796678a91.14.1786260551120;
        Sun, 09 Aug 2026 00:29:11 -0700 (PDT)
X-Received: by 2002:a17:90b:57cd:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-392823c808fmr10796652a91.14.1786260550644;
        Sun, 09 Aug 2026 00:29:10 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:29:10 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:13 +0530
Subject: [PATCH 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-14-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=1098;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=yDpptoQ318yeiKfxnWYGidGQj1zxMMuKvU/iB4nvzIM=;
 b=ETosO0NaDHsTNsvQjh+VYCy2Raw6ZBUH00eLt9FfB9gT94ah2j8+qp8WWnxesCJ18renWtQoc
 pC1IdC9taG6DqoPET3Djr3vAVJoKDkfpUtJEFWxtKZETGDyNy+iMvrA
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=d73FDxjE c=1 sm=1 tr=0 ts=6a782c47 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RWDngw_kE3xeK5VWhnQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: dYab27jdDe5Jnbfn3oyGNdstbbamsD50
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfXxyer8Cj1RQPD
 tAlhXOaCtYuTcX8Ok5B4MLtiEwgL9RxEK856fn5O/A6hwYPc1+OZ5c1DUuOeCwxKzIitOOFpann
 wjyWzzqDXkrGS6Gvj71GC2QsTsSBH46a3NaAXAFOUpZOVVxnBWYqXo2uXf/X/T0TLJd1gL9NdGY
 ElQY6G902f05sXt2C7jKFSCX0ZJdZrGyKfv7Mf2aEqTgOSJdTqPYr7Szx51fX+PJPYJzN+Zxf3n
 ZsJHhWCCaqwuzjjzfWpFws7iSQZSgYusDwWvdZNCWwriWbzXSST32E3ExKM0ydevqHgcQfqDDhU
 tqUwI6thfhcvOIGwxd4rAnKivf4C7/mG47sG56uIdZjp8/cZKN9BHPKlSBkUDAkk4tdXCLbfqOR
 9nAE9SwDtaUOO708uDhHBHZ/gix8KiXjzTdri4djgPSNqC9p+/wnOJ0sxGn2lL8vk1wCZnBbKCO
 sJ02Pu7lujWPJOeoHPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX/i0ucwrtCEu1
 1Q3knJaEtF0ZZBjKajBb7JG3zG2XngDsLATN6iA9ARfTba6CssQ1Vfca1JBwsDGC/BLG6MlYGv2
 EzFDV0nUIwJ/qg6TcW3weUt5VIqwVVA=
X-Proofpoint-GUID: dYab27jdDe5Jnbfn3oyGNdstbbamsD50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

Document the Qualcomm Kuno IDP board and allow the legacy qcom,msm-id
and qcom,board-id properties for the qcom,kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..f87ff5d923f8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -174,6 +174,11 @@ properties:
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
@@ -1322,6 +1327,7 @@ allOf:
               - qcom,apq8026
               - qcom,apq8094
               - qcom,apq8096
+              - qcom,kuno
               - qcom,msm8917
               - qcom,msm8937
               - qcom,msm8939

-- 
2.43.0

