Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5796749218C
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328572; cv=none; b=TK7XAVFUvjFSW0rmmX4CVRGk/RSHPpG/CSemkKxaII+LEaXE1dmHdA9eOfokAB14ErBmzxL6a81ebvnW381hZjgFUcp/D+gSb2NMWLUJYGlvbCJ3D13yCqOm6ojhldrcc4/HWdit2ilxZdviF/jNwxc9UqR+4j6jpEzhFNWNkYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328572; c=relaxed/simple;
	bh=ZHsN8zM/JbhignLDIxWKpOEJ0dJLsvtVmGGylPc0eUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gDyYbzg1BCz/rpAPcW2vlj7STZbrqB/BBFNortYTeD5EfJkwsI7HVMVc7jHWHHdWbmapsUbgXvTRSSkx9Qfp2S5P6ZcXWP0jBtToZ+vh5PGZba4CG8SKYeVM+dyr8PjfSPTOAXFgYb/W+OVjFAvfDD/zYZZkhQKU7n60sZvFcTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbSuQsMA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFGg6a75; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbSuQsMA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFGg6a75"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmJNx2322958
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 16:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=; b=FbSuQsMA9sGD9voT
	5IaGH3EiIi/OTZuLG8vKc9zA4Z3DaeBixdMWvdfTUEKqdd3PBGdpFpoyXc8qweAf
	j1E1tKFeNxV7yiIAAKb8aJY5yynFbmyqh8/hAD8mIhg8e/ECvma5Xi0+b9IMCuwr
	MoMfkp6t8zUU6ZjglAnWs/EWYaoGV9vuc94oO8z7nCIq3q+SxzwgoTso+ZQidL1Q
	ghSVox4FohOz3TE5pUoJQpUMWIPHBcXembkdVC9J9z80zg/np0ucA31A5iJa2yRJ
	mX9BcyO0fqbNpifGjlGE0UydBnMgXaQsFzb0+eD9AjB05Cl6bgwj+zxj9juCHPop
	nz8DcQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fbwajr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 16:09:30 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a41f46d629so2096581b6e.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 09:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328570; x=1787933370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=RFGg6a756xYLlFgMmr6POeUQGP7xjfe9hCVYpiZUCdicqiGB84tRgoSluUvbeHXodk
         KTrQ03IiH7yLN3qBoqc0zXHoFHS2f1ERDRHhYPYimcqC0dVm+pFGCxR0adDHTS7HRJG1
         21L+eepo7JEE9fz88BDEVFGy4RivDWeMW2R9LjMmBE/Ro6J8/McILjDY0H8GzCD3PIAV
         8NDTqeId5zyFvlmEboMG7x7FYz1aptR6hKFysgaXjN9HL0nFl0DWgq1Zh49enrKjiIWI
         gc/KMcJv+kvyXCyiU1IZjjh3I9Njvo5KdC608D5JhDXzBBH9npqZ/zANP3QKHUUo5GOY
         93DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328570; x=1787933370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=Jjj23gVnguRm2lbgbK9iOxaLooXrFDRuDWm2AEZROuhcZLs4sc5C3BZ4Dh+cuvUbSL
         SKsk0AT1p5wbhWWn8XhbLHxu6fTVGVxpBqDWsmEMcl0tVkztyXS85KLAsdEFLff/6NfE
         Jv1EOj0h18V70id0EdRHWp0ZAFfm4DJrnNs10/pr4Nkrl8D0PQ1d+IQXMkerHrO/KxCa
         ztLP/1M2WhyEVFTLMHgvhpQ4q2x3j4BA/SpRL1EqtAXcDI4Oy/BaZaKdjoflZpi+8VlZ
         yyocx5y4TVyN16/qv4FD4gUjec9rwLMAk3U3uhHPddVSto3CXiKZDvraL6CP6vn9kxL8
         V6FQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNaO9HH5jgMeIJJTcGWBQrCJMzPgM19P82Q8Ny2z93HkFIlVeoOicsl+AI5I0Srqcm/pR7Ntw6APzy@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg9SV7QnRTmmKhbjQYvJGPe8Bd/viTnt7jSTaZ/z4L6W1LZYfR
	m35wA7UFo1b5oyZIDyADyiKI42wUE2+ucvrCKA6hSBuKETDBSODb49ae9y1c3vgzzz4koY8xN1l
	YuyOvBTxcSGNLgyiUxJdr6qiMrI8KsnrOsk8rk97vzD2t8S8OJcx3FjvrcM9uWdjG
X-Gm-Gg: AR+sD10SoG6DaXVlUoNaUfT3s+mX6E6ge0hHa0VEDdt5CiKdkwwmffiiGtAwchvgavl
	X2hGbu2/wo41SE9dDzWHawBi6biI3yQJTH9iLIqxU11SmIrHFzzKI+4MoKqyxr9Pk5IL6iEpWry
	OrMhijx7qwLYXgn9QPh1md6swW59Zha1ziAKWTjGIlPGrfcdalExVi4axv/WHNk+l49wZJTWU7s
	uc+4tvJDncBUG3LgXruFV0A95F7rMzcY6pyyxDRXU5njq+UUQq6w7j4lJEUJ7M5/Ldnb/I6/D1i
	yE5yGtavMQdZf1/rTSz8R7XhEvefOv9fSmRRfeSJ6Lx/4hAg3OEfXe4qzZzuKT1hQd3Aay6IBDL
	G5bHeA3AI5/kekvfMF9ND4BO9rQ1s8NieKX7wrfDRr4TadHK27tVzzYAT0ntWVhjDePtBGKCwX7
	K0oJNPJGI40gkM4+rGSFcwHMo=
X-Received: by 2002:a05:6808:192a:b0:4b2:8e51:91fb with SMTP id 5614622812f47-4b2ef38cbe8mr7352824b6e.16.1787328569753;
        Fri, 21 Aug 2026 09:09:29 -0700 (PDT)
X-Received: by 2002:a05:6808:192a:b0:4b2:8e51:91fb with SMTP id 5614622812f47-4b2ef38cbe8mr7352770b6e.16.1787328569363;
        Fri, 21 Aug 2026 09:09:29 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:28 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:55 +0530
Subject: [PATCH v3 02/15] dt-bindings: power: rpmpd: Document Kuno RPMh
 power domains
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-2-196e2b306368@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=ZHsN8zM/JbhignLDIxWKpOEJ0dJLsvtVmGGylPc0eUU=;
 b=ZQq6hRuOT3Sv/p7Iga2o5Z4xvQ9K+e6HZ+qa9CVj+pK4W5CH8S/NVmAjuwyych0jxhamOfo9l
 Js/JNZDemsPAg1fxECd3OG7G21mKItHm9LrkYx7HK9DBgMn6nY1ZEKT
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX1WMbU10aO6fd
 yXz2c3Z++fq4dvelgtGXL6JHkZwZ8R2DNJeIN1sRXWLR+3+djqjMm3gnVtCw8Kh4bFRrGnM4/l/
 fwm1BtyvSLvunABhO++hlKJTxRmhy9c=
X-Proofpoint-ORIG-GUID: kFY6MAl_xH4Y2AW_Jk2Hf1b8hw6OwfKT
X-Authority-Analysis: v=2.4 cv=L9AtheT8 c=1 sm=1 tr=0 ts=6a88783a cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lHgBgSUrZIjjmBdF2hoA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX5mwkdHSwo18C
 juFK/Vk8sHrosbYb/8ZFML9ow9CNFZlGHvPbwO8yV/AIhxqSmORWAOtdW0iDYyAECYPfc6kRfdV
 +EMGdA/nCTvDZtwWZekhhUSYPlWZX3i7jp+xz37xucylduA6TBlsq96P94spWvW2mE2/e+DHCZ2
 yAogzActKs1rcmt+m/e+sk4V1RK+t7jzIE07rU/7YQEbkmYrYroFNC5pCttk6lh2jKOuEx9nLz2
 K+QNSuwpV5dYfr+SYPdqVdpc/Pt1PfyGtQg+bxqD16NCAxk4YEEo7vZBNn+i8bA3m2C/34fPGGq
 ke1qcTYKQKhwlCcfKsUL2DCxbzpoHLJqaQmGPduO1n5sEi+AjxEq4i8wFAEtp9CQzttAoLQbszD
 wy8g57ezfW03NTFeX/82jp2PkZ5AzbIs1GzEj7/VsRHjRVB7LtVn7JziGS6NzPjG3CldAgubBIM
 wDl6Yxw+6QoE84cVG0Q==
X-Proofpoint-GUID: kFY6MAl_xH4Y2AW_Jk2Hf1b8hw6OwfKT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

Document the RPMh power domains for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

