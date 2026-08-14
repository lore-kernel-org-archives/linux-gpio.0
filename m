Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABDC40B6DF
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692744; cv=none; b=Dx+mLpiC3QhocvPW4F9HeivwOh08uG5DIN4WIwqkfX8RrO1Yxp7q1JYpYDyxeOCxRR1Qmf3Ur1ACrr8yLCbcKToZVpRSj0zwrFgE2+NSQeum+JO1FB3qR6s1y1mPDX8i7KNqmsFhayilAUeKZmiBqSXIohY8YHnJQRlDmtn/gvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692744; c=relaxed/simple;
	bh=gHxGYWhnicYORaElGwhsc1d3PMvje3as8cNJCACI2hM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kIAIs3mG2D1Dm4Hthqr3aHhUhNgJUHM8zTyMzRJdPfQSzGwswCrte1dL0/e+Lt59c/sS7pcd7JK0azp0nLmdV5VQ/8ERGUbLm0ChCBg3/F+/2YjVlaEjKpF31C32zRLCXQOgn5YZ/NpI70ENAoC5Ru5YEKDYFY77vNplFedjazI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZqyQF3qY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=biUsmutG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqyQF3qY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="biUsmutG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4RJSH511772
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=; b=ZqyQF3qYsoI0iga1
	P0dUrddoNGW/Ab0986gmxFI6kCZjk9D4aTCdcl93gkZ2gOTsEG6zttj+vk3n3sHB
	yUvoH3WK4ACmQpd0rPzTZ49Sq1QiErQrMef5rdf9kgWxLaNU2+lb/iJezrienF7i
	i8g503thezTB+pMyNyqOu3rcpyv+IFNrNZrbpjVstKQp0oDTBsaaB9yL/mFzalz6
	C8V9gcQnN1b7BIZl4McYrwLCnDa47eZgfZwEtiBoImeoOqnJQuCnuoDybPbU9FMo
	09GAHagxNwe4H5BATQW0FFiMJ+VQJ2l0JFX2lUGIoh+Cvz4VCKD2uMmkBKbIllAn
	85WIJw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1fg3usag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:32:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf6acd760cso9202515ad.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 00:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692732; x=1787297532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=;
        b=biUsmutGWzySCJfQ8FqlX7Xo4V07x5LwsyNCpoG+jfuacZI5uHHc+qZxgl2LTIMIiA
         3H0AY4zpSLSMjAzF1YJdbflBnSpuQNkMyMvmCeS0nXJVJIwAk1qULnE2kD+hsYB+VNHY
         y7UyONEnjMGPlxiYV/jh0N3eCulvETaY33CO/wJGmkg7c5nyBpP3W6Fh/xV1r8jlQTtA
         256wsbDvZ9ug/1Jim6k30u+z9HMA1N8qk6P07nny7PmQIICLZbftwzbC/bXq2EftWnFy
         E/AR3OIzMf6I9bXSncv/NjosefxE7++0nS4nS7OdmVDFcDEz7W0Hn0Vhi0fH+0wiKeAh
         M27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692732; x=1787297532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=;
        b=XEWDBUGkpY11Kg8dmQ6YfnpA0UpYowIj9RLnYsC2jTjKDc7dYz2LKJ57ytO24DTZIL
         tBqQsWZi3x/54CMwt6BMUBgYkagGSzuBHclxpg1r4N9CwBuGlLSwnyootWVnhxi7gWyp
         za/9uPwaqocjcpIY1AB3KETrP1M6rXOj5K+nGOz59VXQig9eayaujMySOG+0z3xNuF8E
         jKvnT96iQS5ZvX+qcC+QPDFzWd6CGwcX10qXeqM+9rC0l/jToj06Bwi0QaeNuabZEBMX
         7Er1+Vzu+uFgF4hlQeeoW2KaV9lZ2aOjuFA/aKNR1VgftKKEOV3XuQ4YEU1WcnXFdaWg
         3evQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1uQjV9H/cRlWHQyBaLbRVarNdKjTNsAxu2l9aimopGT6Ly9H7Of18+xhQa/r6tmR4hyU1cvzCTLNb@vger.kernel.org
X-Gm-Message-State: AOJu0YywU/d03qD0ybbjMUWFeuRr+O+Fn2443iwUBS1trKXwtp+zNRqM
	yY1VCypnKt1mJoXfFFnvqJF8Lc6HA7s1PzP/+kXmSpmYGwqUFPe5N7LkHPTsxqfO4709AsNZFmU
	v3CX8IyRkp+M1ay4FryrD2n2KH9FUeA9BFVaG0s2hr5IUQ7CloE1SCtklDbmXpudB
X-Gm-Gg: AR+sD13J4/fMjuAmML/Wm0z3zyaz89wH55+9/+Xx70SxX+a4bZ8aZUITNfYNlTeoULc
	mM/Nhrs7Mapxud6YO0MOTMPkJDZMzDBdkVlu1yQi0qkgMieF1flE25lAsnKBzyU3zugssOqqjnz
	NF8uJ4073/pXIT7hquuP/99kRvZQBjhFNVmPXRPQ42LqoOdAnM9XKCWiPF+ZoXd9VlJnI/2oFRb
	53J9Eh9OEw2T0ijwur1zsAuxLbE2ExFoqYpsdthS4uucmPzjtQapaSBB2wlaapcaD/2gwuU+XNC
	+bSBhBYMXjDFZEDhcVWx+flhUXvuc1uGE5WGqXWJwdrC50274FslElRSsYvylZ+8wUFrhxL8/cS
	bG+HDctDAiLwpL0zhrTqAhQadkA+do/G2G1b3yWRnaTaqx8ekCREhQDwUohZCz2hxYJlZVPPcIU
	tc2eWePAnRgFZkpqhfC3+G54Y=
X-Received: by 2002:a17:903:2c0f:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d3b0eec2f6mr47930875ad.14.1786692731575;
        Fri, 14 Aug 2026 00:32:11 -0700 (PDT)
X-Received: by 2002:a17:903:2c0f:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d3b0eec2f6mr47930065ad.14.1786692731101;
        Fri, 14 Aug 2026 00:32:11 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:10 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:32 +0530
Subject: [PATCH v2 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-1-3079794f0f73@oss.qualcomm.com>
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
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=973;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=gHxGYWhnicYORaElGwhsc1d3PMvje3as8cNJCACI2hM=;
 b=I0K2b/N6iz/Hf/cAEZCNxofz9Q4I9Wd0lnRLDoR4xw7gpjXX9Y5mTLDuaUuwduG/xIi8+eCO4
 Fhxl4TnLyFUAy1u4Qn15sFvcwtEhWmOFc2g9+d78zMwYmEfpYDN52DO
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=NsfhtcdJ c=1 sm=1 tr=0 ts=6a7ec47c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6t05LGSwh5SlIrDCal4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXx7ahVZyM4iWQ
 8Cpz2THMsFPovHr5W2ocD1YH7gMcQf1XoB7IvRzTlhLOrCix0z1Nd3cSxd/b3p0YYTwn57wBtIH
 RmerPb3h9ZOhP7f1F5oqjw9v/V3qmSAjngFs8U0O7rvbwiU1mDu3aQQ8/ZW8+37XRFL9LVFYUR1
 OcCriYESy1quqAdHIxUwkIQjc29fcwl536UUQesDypcQIg3Mc/Y1NEEHYp0+cX20Hf3RHwb192z
 Q0vC/C23KAx/VvAyHto7twD04pV/VQNkGV5fLjJJvkLc8b8ibn2ITXrKHfcbMVqPWscDR0L8c39
 o3GnTzV3bYX8qx0d4LWfUTMNxUG5cH83Y54KyJefm+uIMTpf3Gxsh7CPSc4EwwF+uIw91yYNC/u
 Pkyhi7sktnA0lVJjO5C4YdmMLrgrFUG8WGnXdFmv9AhmswhuGlh8cKP7SUDb4+sHnrKb7eIJW2n
 rTuQjgejYAfDqcZnEzQ==
X-Proofpoint-ORIG-GUID: QkprYZnXGD5OBTvwws2ZXuEsCEuIWvd7
X-Proofpoint-GUID: QkprYZnXGD5OBTvwws2ZXuEsCEuIWvd7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX+ueyMIxedbA2
 KXR70qfADj1RwlDXqSFADuPgMag3M0jPRPD52h04bi0rdVrsqiCFK6I343eUQSIwSEI3zRrHCjW
 A35aqdJp3YIGp6C1m9iKOUYv83WXUDI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140058

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART. Drop the explicit ARM64 dependency so the
driver can be selected on 32-bit ARM as well; QCOM_GENI_SE already sits
under the QCOM_SOC menuconfig, which is gated by ARCH_QCOM ||
COMPILE_TEST, so no replacement dependency is needed.

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
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

