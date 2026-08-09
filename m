Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B523B392831
	for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2026 07:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260453; cv=none; b=RPkjMY8PoFckmo3zIhLwirtV990yIBZUb61WpiP9q7ING4cd6qnRkgXA5hrCPnoQi6dPyJTVrlXA+qLYiLMww4pw80uaKrP9lgAXHTu7rChbVwW8kdSkdcofwLkHklkgmlpvKnFBGBtcVxdWt88Mu3tIW7H6mhmbSA181VBEnpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260453; c=relaxed/simple;
	bh=78s6XYjaxaQgDZldaFYJHZOhjs+wp1TrYwJin4anK94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GxfVW2keTNrpB3GTVR/r6pz9upc3HeXUWsfKZFWCvbHFMbQ/xuEBhQxR7Dmj611A21y59p1oRgSgf5dDqTvqqvMBaeLY8CMil+4Aw1JKHZ/M9RMpFiuJqvG6pZV62RR3p6N9/ic7s1xQoU7o5R54oFWOndDYT/Wa4f9nBns5ybM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=autKU8v5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZfZcMmIs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="autKU8v5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZfZcMmIs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795cG2Z2224759
	for <linux-gpio@vger.kernel.org>; Sun, 9 Aug 2026 07:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZoOk7PXU7qMowx/CrCzixaN3wBqENHxqiVKmEp1XwKw=; b=autKU8v5t7h3Onoe
	crVdEXshT1qnnvL+nkxvOGUAw77o2NleiultahUhaYSiJpCPYyyWiee9nsx2tJ5R
	MPZCwHvAy29xf70Vl0Fzu6rRn2kNVc101cShOH6Jou3PPWjM9rbBEb5ZBuyYDLjz
	4WF1CdPpuCTR2/FTFED/hVTZ84wJ+k4om94AM5wliyU8w1J+0G1Sbo91sLxEEkaq
	eQPouvk8/De0O9oWKfoUTn6yptkPMDtKIrF9zY3HJZp59CZUzNLJ163iVKt45DE+
	WW2PeVq7ulWpzAtHMKuCiELB/FbmcTzRXFPDIcYPqGATl2/VyFyZInXyPGTqmUqb
	dT789A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwuf7ajt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 07:27:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848544a8496so1037899b3a.0
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 00:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260449; x=1786865249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZoOk7PXU7qMowx/CrCzixaN3wBqENHxqiVKmEp1XwKw=;
        b=ZfZcMmIsPQwfqBVWIAVrj5dNULlQdI3L+K+s3H1AvF1mkx7y76oqQ3miRXozI37rCL
         hgiPk3ar5YbcY/UpZlsHO7bowohRNsf95AB5R8qu4SCqM5QhOxU3MuFE0zLbhlab53Rm
         6wzaM520QdVlCfUV0qJE6oEsOK8y9BjF097Brgx+O+C192hiwvJbj2mhqffR/vIhJii9
         DWpT3TL87QF7yVRU+IXECz71MX3pexkUwXQKMUzWBadwuJ90dM2sz4oLQoD/lF0gdjaf
         EweG/QwqecJt1E+WaglvRQnqCyHxqFuZqDXwcX3VA2bOCLWWiTqGRNgpmmKAyzMXef8T
         kxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260449; x=1786865249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZoOk7PXU7qMowx/CrCzixaN3wBqENHxqiVKmEp1XwKw=;
        b=auwgQYnd9CueW4XzRK8Cr/7dioj8ioCIT+OKA1fFFiWnBb4RpTbnzrG1AwPIeKhJru
         dercBphvN4NenPYkWTc7lD5Nq2F2KkJCyUTt57/qxo2sqxDC2xvJfsrjySwFegXPFw8T
         ilFZMzwXhmzIfl5SoZ8NoIjgQFxbrhigs/5b/iIRRiYXwATGz40pTsk4ftfPGIoKSnLI
         YaT8MfdYXV17Va1iPzUUch0Tsq6yEihZoMwptop3EEzlAZxtYBXlHlIh5PLU5FN2UCgB
         UYzyDt164CNp3XmqHSqeeZmf3SFamqCiZjLDYms9Z5xQ1bCTWcV2wf+BRxPj5l+TrBIO
         Mldg==
X-Forwarded-Encrypted: i=1; AHgh+RrMIXx7mah8lXyQtHW5JvKzVEsCJx3hFrWRi5T+lyd8rlzpSTEu+1Tz209El1R2fCapIqH7m7nkDi1p@vger.kernel.org
X-Gm-Message-State: AOJu0Ywedzfx79YZeQt336RIWDT1h2Ho3I8P7J19dMylSY7GTQkFAL64
	60hBTVJlfVOWqirh2JXlQhCOHxDUji2yH+LjNeZGKYtD1i/VOuiwNJ8FiUkicTZo9723sb94rbV
	IrlFcw/hE1L8zMhUmrhLpQcJtRPa2EqJ5I0QLFJmm1HtlloIT+FrStH/UPq+XdmrJ
X-Gm-Gg: AR+sD13X0DByJwt01z1eF4ygKuKBAxFIjWoEp7/E4YvURjM5yinR2MIUgg1ggOCZPnz
	BZygRfvlU2CM0O61M8HLCTzLd+zPEOwMud3vfaG6BVt/Jq/GY9z0jCeQFpi+mnkBcJJJFwv8w3s
	Yx7lnksHdqr3T06BFXWccjfTiYPLbH4+4brtETfj//rIiOsM95hMpi0pQw69iPtQlGU8uFx21Li
	f1Pwo1Y2Zt/wOcBJRlDbIpxnwtmJsOmEl0lfqrx81U/QFKEZXBot1MD4Ql/cdlLVRbVHxcL3/+t
	M+LeVzuPe49ojUM8pov/1ZmDJhaGrvb95vupNk2imKAgjW68nZwIOLzfsikHWkB/ngOHbEysGTf
	CWx4gKIpFoWchM4urrOqeQOtz9iuPcqTpxvKecIEmAYLo0EpD5Jh8b7izXLALZY7TgrwMXmunGf
	CHK4iYnh5Zln2D/7cG2R/3CLs=
X-Received: by 2002:a05:6a21:3946:b0:3bf:63af:85d with SMTP id adf61e73a8af0-3cbadc108b1mr26695669637.18.1786260449564;
        Sun, 09 Aug 2026 00:27:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:3946:b0:3bf:63af:85d with SMTP id adf61e73a8af0-3cbadc108b1mr26695626637.18.1786260449091;
        Sun, 09 Aug 2026 00:27:29 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:27:28 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:00 +0530
Subject: [PATCH 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=997;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=78s6XYjaxaQgDZldaFYJHZOhjs+wp1TrYwJin4anK94=;
 b=8nJNzjuVzNRziWXvzxETun4Cbdn7v2ouual9OMd5EyVzJkx5B0BLJEpWzaqu3bxUFdhnuq9wv
 9ksADNvcAOZB2DZJKTEAWJFG4mU29OKjpvnQUCJ+i90LLkVarWXsLJN
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfXyAVz2IGjekWn
 l2wrO9OuHnjgZNbZIKC9spJ9wlixIDNh8WLTi+hEPpcFoZfU4CUuuxCacgCDQP4QJ7r5KR4XcaH
 zrwAPC37Cp5U5fzS1dCzX1Ejt4/rbpA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX1gYiAz0KZqQ1
 Gh4PyqHaR4WkfCQGop9hi1nOOSfj6WDPQt2Bs6Qy0u8P0KdkKIDMy0BpkKZYrXdz6uKrGVoEGpv
 qyvsQl6TEEMfadcZQn4OECZ7dPGC6YFOPYaEI30M1yWsjfk0aZoudKYzk+qfvdOE5AWqqj1bhdy
 JtUWDsrG7eMGo7QM44ZjATFXde1xz8zmcEgyBJonGWTa665/BGY+5rQLtdR8WqzNJGOQEcoE1jq
 rV9XOZ4G8a3rkp9mOwv4LJB4i6NDJpe3z1cqdli3P5xNaQpVylIqXcfPy5qx5KsI8d1/ixPLWMV
 qJN+Bnulu1XNTYZK6VOZmxBqScGlfnUGMx0eJjietjCju3oVDoZiOMR2/1GjWsoHWDCs7zzgU1e
 2iNDnDmhxScpbydZMlkhFrTsAWXS7Xc9phhqgWXKS/j3ZnB5nKGPMOkuKnuOdunzURWhad63qxz
 /Yl8dBqMohgGDCNXD4g==
X-Authority-Analysis: v=2.4 cv=ecENubEH c=1 sm=1 tr=0 ts=6a782be2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6oL2udKUJD5iSylYoFoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: yVxKe89vf8LtzG2wnLfFis0_4xrAOWGg
X-Proofpoint-GUID: yVxKe89vf8LtzG2wnLfFis0_4xrAOWGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
hardware.

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART, so this assumption no longer holds.

Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index fd4d4ecd2df0..5b3c9d31fd7f 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
-	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based

-- 
2.43.0

