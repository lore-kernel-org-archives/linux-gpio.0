Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E135485CD6
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848711; cv=none; b=FkKtG69m3VFAvKvae7Vbe4LK49+EXCMoYUd4ywunCsF+HVHcWcc4zvJtm/TTspzYCCdDEJnDah2ZPjlJ6VR7BASb1LMaqdWS6XfvhFenUmaZAIc81wdDVKb639mR82HYlDYO3FKZuDpW68R6Wbb4m2ZkIi/3OFcMgmumKDdXeOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848711; c=relaxed/simple;
	bh=iY6li1N8aOWymAjX+i7+r5/1IUwgJvmB/19fYvr8jWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNotinGC8AYaYJRdhjM0CB3fEWp7EH23HHgjZqAtLtGSok8Jl81Gb4YTP5d0BFufP/MA+kjQ8e5oH/lXqCd0iA6y+q/w0Gn4A5yaY/qF65bppfUQ+/c+3mqNcaW5RJ1VsweunJPgbWvrM89TODXaXbkUpYdKfr0HRKBFJaNb4yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4Q5j3AK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apANsr9N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4Q5j3AK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apANsr9N"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbnob866304
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=; b=l4Q5j3AKKRZ2xjcb
	DdI/bb1qo09wy4ufoGY1y6PsHuZqDmmfvh+rrDEazraVOzLzKatEzaLg5vX6+5Bm
	1L5+wbuOcd/Cx2Cs/Y66hrVLD8E4EipNFo1wnedrIwC6p3gLEN0sDIzfw3sHDsoV
	g+qdMSK53JvglVdmaiAlTMRNVoZOXZURZkYopgtqEuQHET3B1RvpyZOULKEkFQN3
	0ioRtQZ80jy/NIwJ1waivcsfuu/pFLCgkHK4rvmKGomz+AzM7ONKoT27Bp8BI17f
	B+vMGjzjsHOGcNgfVwmITtvXKMcLgNwXosQl3G762Z1ar1/z4mU68VyAw/W6/RTb
	HtrtqQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gapgv8r9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:38:29 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-448d51840c4so197738fac.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 09:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848708; x=1788453508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=;
        b=apANsr9NvJb7GqYxDC1KXR9CRtHeSQUFUDAHuQJoNcn4L0SvOumTtsaswMUkpgA1qE
         LQ4b7+8kYQrMfEfqSdRFT+V4966liPvMF2VIobVRK5ARN5yWJNp4r68JloWHUqYlyuMc
         pnjRDC6/fHu3nsArI1fFKSAE2r8d4VT73OMVg5f1aHJI5pjOTsCiQJhIyAsJoTWzxtp4
         ETAo4NeoPiFwvj1ilwtrn06yvv9rq772iQB3lP/mpmT+nij1i80cTbJpSOiwxoDnBxsH
         rOFn2d7dLQX6t0M7qbqZqXLQPQCUN1qZ93nrXNK2SwpttKF4S0/6sR0W9SzJbyDT1a7i
         BxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848708; x=1788453508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=;
        b=d2LjgdfyMFOo9XSlQFeyd6cL8ouJi7ToduHrNPdJOOJeEpOyHW85xpB5pCMqtd0hCt
         PrUxcU5MxAia/3XC+MYIqOKBAaX17UR4AH6Hp2vhxp5UILa7YvbojjZ9hohiBNxxWRSk
         UTnl8tbRDtyBR4AF8K2Ru4UGgREoAvusC8qFXfoKrY/vyB9jMATFhXzKSzFP1Wzl8nos
         CKJkf/sbPgaKmIxdDupu3ytrPLuD6W49NbAhBqCs4RJB6ayfELstnDDKJVM22DLIkC6w
         Rodok68tJfNInQpwdPbm3vRAFaHKDmusTXHQIgWB2NrpUcZ1sU3btKCgWDBxSCqNAUw6
         IoVg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/o4Yt6a/5+8sWEum0iktimJKJUUziPOHVP5o86a0GxIqIfQUgXR8DJkFw3r10kEDf6KXIgk5LNb0Q@vger.kernel.org
X-Gm-Message-State: AFuF++lfczPXZZtkEUwI5D3tZuaG6ckEdG5rj8YDnSVrCyxiN1dALrca
	L1rWCkIMl6Lz/tihzJIuFds9K6zB17otyiP0BWVSbOylBN1+hgzAl59RvCTl3P3Hf49G46cfZUT
	noJBGuBD2XGWe5t390V/gZLq++sYnaFEI5vXGOmobvlnf7QBgESupfqV6hgHJiLUyDVcJV3Xs
X-Gm-Gg: AR+sD12xM+3zoKDqQCVWpk7XS2kGzVqLaHU9paqmr+J2tvFNRp6rWJjONul2sM88Ulk
	S4qItxH7XE44v3pdvHGXhp/pL0jcLzEusYBHVSoR4ccrpEGdNjSvwauD+AqiqZpGvE+xhQdwrAe
	+80YyzB18RZdumdxTQ69SfIZNQ/X2vRN4TjRnIPph+AaosHwUVkgkrhp7nXySe/A7dUibUYu/Me
	7m17uJvy9aT4mNkEZzzPUxM2s+pNYcnaZivpk6TC5xNgVYXt2waTztt7TrxQLpeRJ+38R1HNr93
	n2qn/y+fx/wPO36HijP+RyATYHGw17XLunn+UeTtwOyrC4EhRz2PczRrqPodxn7krYQG7H5UgY9
	aE9PLi3XICPSu62GGpbUKwBl7i5zFrTELSuB25bDpoCQhN9TP5IUPOrNMwD6GD5qDALZGVcqIof
	nRjBJmYoWV70NQZ4I9Vb8eY+o=
X-Received: by 2002:a05:6820:c3c4:20b0:6b1:4250:6a43 with SMTP id 006d021491bc7-6b1a048bfccmr12513261eaf.17.1787848708205;
        Thu, 27 Aug 2026 09:38:28 -0700 (PDT)
X-Received: by 2002:a05:6820:c3c4:20b0:6b1:4250:6a43 with SMTP id 006d021491bc7-6b1a048bfccmr12513200eaf.17.1787848707822;
        Thu, 27 Aug 2026 09:38:27 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:38:27 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:02 +0530
Subject: [PATCH v4 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-1-dd34f235fc1a@oss.qualcomm.com>
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
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=1026;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=iY6li1N8aOWymAjX+i7+r5/1IUwgJvmB/19fYvr8jWE=;
 b=PITaWUSVe1ILdfSWnJT7MDHlrRiMajI8441g+W+TvDdCSITcQR5NuAOzL9/YNAEalt5NJrhL7
 ymArXsolShrDh6ElsdGabQEGbJvPnBuA2O1CruX3+oBz/ThJIsJCF8t
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: kHvMWDgeoEk2VzNjfl23-aQTC-DJxv65
X-Proofpoint-GUID: kHvMWDgeoEk2VzNjfl23-aQTC-DJxv65
X-Authority-Analysis: v=2.4 cv=FpU1OWrq c=1 sm=1 tr=0 ts=6a906805 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=I-wlBW6BsxmxmlAWD-0A:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX7yS+VRMxPFg8
 2OGSuNqnzVCanrJhpF+M05CcPMvsUyAh7uhjbg4/YLNnJLmftVvPCLZtOl9mjuZjPSPTdnnLdg4
 HvH/XGtOrjnJ81SvO0WrO53qek03FvKQgTc/4pA6eHZgdo86ny/fhxm2d7tfCkx36tjUjj/KV2z
 C/bpZ4ySIuWNOb0aVSlU3rTgX0tNYJsJ3kQ7mqHZmMjJ6WiWruLSSYvIhqNaCkgm14Tvgg+DWDB
 EJrGN6JlebG9HtOsjCfOfRZsTi7Hccbj5W0FUlsjKvialZTKo62PP/3QQhmz5aA7CixS/hGcJre
 Py0k6ZfLxEuGA+AJloRPxkmE8h/onoj0BCan8Y41GhWZR36aax4m4rvptRug3MQ29An6HF45wfC
 2S+CEsb92vKjqv/qWxS/uG0bQ7TeKbCAa3iE96kBMo/XxgctFXlD5sWBWxR579zZsggyl/LGr+Z
 gaFbtzDFEj43J0RLrjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX0DoNbyQUe3s2
 ec2kSc7dgKdlAOrLMy+gX8VPJNWicm6+1MimDkFr02mGn2YQKKiV2+8T5wXB6jkQKAdlzEkQFb1
 v7tY1XtncQMmXbG7w8xOJElZTSRmbPk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART. Drop the explicit ARM64 dependency so the
driver can be selected on 32-bit ARM as well; QCOM_GENI_SE already sits
under the QCOM_SOC menuconfig, which is gated by ARCH_QCOM ||
COMPILE_TEST, so no replacement dependency is needed.

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2b524154d9fb..9f703261d7ac 100644
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

