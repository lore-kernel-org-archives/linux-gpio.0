Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7321C41D642
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692752; cv=none; b=sznjSrs4wQqtX+AICzJtyUM4aQ3HT4EYXQQlkcy3Bp0K52Vy3B5EA2mvy9X6M1TLvu0DjBhZQ7z4vEA0FJjBRiSGg3DLU+LEXSnvLTkV6ZJL/US8oMzsD2WKZp8LoHuhPb/qg79hDBnq8PbuL/0q8UeacZIe84sBBxcKxJAFJ5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692752; c=relaxed/simple;
	bh=lLT782FdZyRPskpp4opbNA4IOV3INNb0OEUPXEsUiSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lAzSby4wQvKYCWzCS8YASl3dksAA+jBWkI6DWWWb7CkWEv0VdNjD74Jp5el+c9lodvyFUBF6CfFmtduSDZLdJoKg2x34t1n1PRcopRj1zPqcXXTa9z1MC3lQw/8/WefPC8f3PX0XSKBYNfh8nWKNtNhWz8XxV35LW7yLJedjK8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yk7TcyFX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Isqemrlm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yk7TcyFX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Isqemrlm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4iGTM292013
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Jgmi8wIPoCDQdyFphlVzecqrFuQqOuAqeN/auAyVgE=; b=Yk7TcyFXpfXHEiYM
	OKZWAYRpq7iwBqV8Xw7er2cFPE6P/LnOQJb/1rWdgXG0punTGdfUKgL8O1Bjr90V
	JEiuciafApLfSAM/NitwRI4j1MIlcapFGQDxhnruY1q2dQ47kBROGW2jS34p6PKm
	2Ku8lRQ3Xp3xoGXR/Ki0lfbPwQmPeSPngRNk1dj4qStwtwefNDsMXKiy/M/qWUIC
	QEOblOOU1/Y9JDUUwN7bF3R1jHEk/2f52O9UtHQ67YwxjZLhHKJFZI9KdSmtBHDu
	b/AlgJR76mHiCTOxPcB+tjgoW9onz5COgRuoOI69kICnnAuEpdqy8UKo/3AF/BlN
	meNU0g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1v8prjve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:32:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cccfa32670so8304135ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 00:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692740; x=1787297540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Jgmi8wIPoCDQdyFphlVzecqrFuQqOuAqeN/auAyVgE=;
        b=IsqemrlmQiWkybnmOflgTXVnYyZz66Pqrwx56dDWMtBtHRQRvenUH/AASRcPGnRNkc
         OWUs+REAVLmUa7bXn9Zcy2oB3L3mQ2ysXBbW/cX7iesdtDs6qC54NaRu5uP60dOifOBl
         Fma3Okd14KZA+4fgeg47PS/LSlICoSLIOAJ/ViTrqG2F3OJ6sqTUHGrOZdMKnHFH3f5S
         mDJjuHvfWaj2BCiRE3FDC0dx4si2jpVDVocBLPByvl4sIRgGAEWNE4uchAv/b7kiwkc3
         DF5N40xdT59GvylmqnBlJWCVWSqnDMb8zf0kJ5grVWWSlkE/pvD7W0La3JPD5LPa0DU/
         2esA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692740; x=1787297540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Jgmi8wIPoCDQdyFphlVzecqrFuQqOuAqeN/auAyVgE=;
        b=gzT35fJE++cu0g5JbOHgxB91duCwY3iHVfMrOhTiRV1LGBglfrIz2ah6QCK3S8mQZM
         pKGKbQLdSCRx+1hoPLB3LPF7ZeH2VHDYbpQc3njgEjK8n1nXqKle/83nk4JfgV7TcT5W
         sQqzZcNTNc7fO1PZjILDsJmKF/mDKKFezqObblXOcOV4qZuTj1hB24sSkOWlXtN0KVbU
         3WpvIx/u3MUppqclK/0UVRCm1o5oVi3cuBCpm/nY7P9C1exDl1c6UpkByAKm8q8JdMEu
         TRc4xQfTyhlRysy1T1x0PGe/TbDXGYDdWGem1MNgD4RFuc8M7qPNx782oLCp9sIagrFU
         SFCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUiWMNfZw3CfEnLxhiurbr0FPUBOHVABMN3LLbFnJip2tbnw8ONdRRsgxJC7cWswu1guvjtUllKwE4@vger.kernel.org
X-Gm-Message-State: AOJu0YxIFr6BDxer8gjCiCLXNoaccB7iNu3VQbt6QKdvULoAZph03LGl
	AbLgrj0BmkK1AHxWWS3EXYNQ68xowHnC9WMMWuKESpUqqajW3eX4kbGg3GiTX3I0aF0D8pB8eKG
	hbd+yEurATEzYHmt/NqqX8g12AEkZjZ4HkclLgOa36UW3+68aLryNEkWb9g14sKwW
X-Gm-Gg: AR+sD12m/6MxL26uz+CcITV85dYndSygWz2MFWzexprLNtxxs91zVoAhmSYttt83PsS
	CIA/TZ814HDVnByxTDbhRteU7EBxd3Z0nCJmehQGNsq3TnzEVcBnkmcKIMnzKVFrLGqVIzPZiHL
	+jwJWQG70h626zebRiQPVXGxj2GyBT7ox9BfSyy/c+4MsLVp8beCKFJtDvRIW9O8eQJsOaJ2vcL
	/Xk/lEgt4xBdxE/LKds1hpyKn/zOIg8VoCzBbukcdQlZsHEGydoyo/7dIL3TPaV6mRT4rUHoNaP
	BBfD0UMMeH1BWe7HSIzTReimdmYY7rlktj4sRvTXjpL1wUKduNBzDFo97Mot88LFQeOnjbyRxo3
	w2NFSN+naSY/3Pq9BW1KFeubW7ZQE1lBo1bGX32QUDpvtbHFQxlC6eMq6jFs4kd23SUO2ETvs8v
	gE9ZpjkvaAnxO2/bMu6sznYQk=
X-Received: by 2002:a17:903:4b50:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2d3b0eec2e4mr44891185ad.13.1786692740058;
        Fri, 14 Aug 2026 00:32:20 -0700 (PDT)
X-Received: by 2002:a17:903:4b50:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2d3b0eec2e4mr44890695ad.13.1786692739653;
        Fri, 14 Aug 2026 00:32:19 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:18 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:33 +0530
Subject: [PATCH v2 02/15] dt-bindings: power: rpmpd: Document Kuno RPMh
 power domains
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-2-3079794f0f73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=801;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=lLT782FdZyRPskpp4opbNA4IOV3INNb0OEUPXEsUiSs=;
 b=jDdmD78RpRBpRWF34hMwTuXF0ZnrvD+D2rjqsQjw/43sLItFVbt4tdFC24drYcgzLI/5fzvfY
 fwnnvkQ/oibBSN8xWcqibqoln9lMeEGWd+kpB6pUZSv6OpNSU6jyRXv
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=K4MS2SWI c=1 sm=1 tr=0 ts=6a7ec484 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lHgBgSUrZIjjmBdF2hoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX1BmdSzEdDIGp
 ElWfxRZmtcmlh3R4KA/+ce9QWY1NhtKsbD5XahK9nIPZoABQLmYqK2ireWhQ9PCEOm/Dx4+B5q0
 GfTYGmhx9a7k9DqVGrqxfSDhZHZTu467aoVgPgX1tqg3EgT0evtbAT+hz7wehF69gzuRhe1nQv8
 XmhJLyAObUm1h++Jgckn/TGXab2GqmR12p/HVUBuFjhdTlfD8n9z1HLLkdW8XlhzqJUujiu4hBu
 VMewWcIx46B2F7FyDDF33V+M06skZZiFXBpBQZ/Z0stQXJa5be6RCx85eBvPSEs1d41IHDlLbRt
 xZMfbteHw0z0DBba2PCHop3ktMvc4bdtHBO6xdOSJ1gkNGOXvVszC6DgtUfPgZWP8N6HNvdRBKu
 cOWTGaNqhbe9F+zab6iz+sNtCJPEMu35ZaK8qQirrfFNzSUY1YH4iXd8Z1HlxRvO33ZdeCjnOd4
 IA3gJB9Ip3T6ip5AJ0g==
X-Proofpoint-GUID: 4-rZuhaTDnuVYC61okHKabLYFwT9D6mI
X-Proofpoint-ORIG-GUID: 4-rZuhaTDnuVYC61okHKabLYFwT9D6mI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX7eN8ju75FM5x
 KCn2Tr0cXfZ4rqUAkBgfRPE0sW6Yl4MAGdrl69ncqc56/0HTzjwSfZBbLDU0ZuLLer4XnQ5UKcA
 hKrDjaav15ELYV5KZIQ5wNn3/1Rqz1Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Document the RPMh power domains for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55062..7fc3927efa27 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,glymur-rpmhpd
           - qcom,hawi-rpmhpd
           - qcom,kaanapali-rpmhpd
+          - qcom,kuno-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd
           - qcom,msm8226-rpmpd

-- 
2.43.0

