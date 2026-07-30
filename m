Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74DC3F076E
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 09:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402077; cv=none; b=Q93uHZSrr8lVRVJWm+KwRqvhPY1gERQWB5NbKqnJuQcAhaGLftKc1/La5tQo+o4x4PWZvVKjUwzUXAreyDuJrAl3ubNlCIofEuAieefDdYZsPC3iIVzCjq5ucZSTYwYHlBI4xuyr0JMSW+UuekkKG9u+oCK9jvLcvrmf6QF4gcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402077; c=relaxed/simple;
	bh=2zWWPE4w9PDJ4ONBtij1IKrVMbrPHy12yw/nYTVGnxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rgqyCwb6VgTY6nC+VYETLS6+xRuhjp7hQL6AdBHHWNlaa/gkSi2kSnbJipFvaxaOT+ZVaq9aCP5Bev+0Geu5JNLl32Eu+4ATXhOB4RA/KhRyKW9vIRaB57XYEzRUl0XhvfOPwJoYX79Anw9b6r3OA6p4T0Q4Kgx2r24nlofr4TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=odo8YVIc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kAmmkhhf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="odo8YVIc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kAmmkhhf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8svWH338496
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 09:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KeEGFjblG56Y/ZV05Ebu0x
	p0d14c8TRFNasc87Enve4=; b=odo8YVIcWqur1mWmxBbHLqdpGThf55zoAbpwjA
	FUYFt2vyBA1uJsO4O/wbJk/pxSXeRcUER/QkqUZf+qx5a4tekvKgPJFSqyVrXNvR
	JPiUWpSGSMoQ5O686sYGx++UA1WMSui9se+WyT1//dbgA3/bPZBCK6ubMTvjvPqH
	4D4kYP6UIeXNm2caTrrRo6PD5U5UdbdqggA1NlWK5DZ/xAy8GR/mf6aE6ICaymBJ
	lu1UvxRLU5LVni2EBbv5COuvzaArkx6S22F02ZFZMYc2m37cJ8ckei6jZi6b/dAo
	PzekcIasCvpLbz4EhepvgGHcUoaQwb/JkRyhY/9PS6eUGUWg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3h4r10b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 09:01:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so581442a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 02:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785402073; x=1786006873; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KeEGFjblG56Y/ZV05Ebu0xp0d14c8TRFNasc87Enve4=;
        b=kAmmkhhfBzwNQvvIAlFPe8yDtt1S/N5SsK/rbx1mTHlrRda5f76r5lZ7M6VnmYcePQ
         V33cIfRRloBdNTs+9og4y/VKvGC/irR5k9U8szsG2RvFAU2Z6hjlkwKrmAfrT5OvMeug
         qVuwe0MSTz7+4pUPU99QckmTJyr9rrRoXNn8fWN35BBMWC26TyIkAK7obi5OBzezTeYh
         Uxa5Vw8t5jeqmZdxKHSw3YblH6+XrV9F9yCVa6XFWZOym6rhb64l1UZor2nwle3eS9QR
         m2kVpNJDQ6b5MxKSHQo1UaB58s2Vl9uWe4K1R45I1/8/oPpju7TCJFM2hyPsJJyz5qIY
         5zSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785402073; x=1786006873;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KeEGFjblG56Y/ZV05Ebu0xp0d14c8TRFNasc87Enve4=;
        b=fKBJspa2CUaYiRZhDyCV5c+zhzcMWZ2CuK22CBaniPLGDPRH7J06/slebAKtO7WOqG
         kncjwjzR97ML3m1E932t6ah8TmKQMIHy+aPpaCnBzOeSHqZuHKAHUQMyWZnEsn++oJQq
         MEQSMP3z7wmkJfyMmAkGwlDScl/WJil3PwUcaleMO3fC+fawhPRTgAzqhk9hG4v0SphQ
         2apwe7yKjRn3p0yUx+qPH3xDAX8NZH5XAI1E9jGcT0lr40aSlLtS6H0dRJggHcxWUR0H
         NlTYAdTlp0DI4IPs0jbex72NjklAXeGQ6K/GdAQ/C4K6mA8mCD0vOcoR0TRbwBP72xGu
         Zd0w==
X-Forwarded-Encrypted: i=1; AHgh+Rp6IAVtlM5HSHQmNG2Fb6UxIc9i6MpSfJsJFFAtYXB4X7k2QZ89U4DeCqT1qDLmC5ANokh0cgQfLlvq@vger.kernel.org
X-Gm-Message-State: AOJu0YyrUfgcUBA1pSAjAhDPN5qwe15gAwAReyc8pm8xRlrFVKAKv6gp
	G1jNJvrX/70SMPTrFEa92LdbCF1Tbclr8zi0750CW4F+kLxyCg+1K9Hw7y2fzpEKf5QwVt10Bt8
	lub23DUDX0xjnbpTdz5fOAPlRov+z8S4Dq2vE2we/dWNZW9xyxcXPNwxeyWda0hmIBCxTYe/4
X-Gm-Gg: AR+sD11cydAOcC+5zSRH+wYTWO4kXqcovIl725MlffoGJivOdRQCjENRGYRNAQGEd4m
	lM7B188AORP+qrFfCyKxmas9iAUualMHEUpEKAaQHb4gbiT0yX1GEuGp3mkyuKa33BI5G9Ow5JF
	RUobznoUr9N1GZ64sXTJREb91tglusCYSNQcboffQkmSTQYrm2dkoyBkLN3eXT3OqseAXEuYEHc
	zJt3WGJUiDNMAHwARNq4BLzWyfoM5pBKopUZ/5q+LDRabHMKZIkQN5ZThx7HyS55oJALdyMH22b
	XUKoLIn/et8Y3uo/bocazBEh+DnyfVGq11xLRudK03WXNeGvS+aDZ1KyXr7NUTTb8SXWllpaS5M
	DSkyh/5zKoekuj0CzaD1AjibQfKyz
X-Received: by 2002:a17:90b:3908:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-38f9d3e383fmr893617a91.8.1785402073256;
        Thu, 30 Jul 2026 02:01:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3908:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-38f9d3e383fmr893590a91.8.1785402072694;
        Thu, 30 Jul 2026 02:01:12 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b928f09sm688489a91.2.2026.07.30.02.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:01:11 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 14:30:57 +0530
Subject: [PATCH] pinctrl: qcom: Remove unused macro definitions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-b4b4-pinctrl-unused-macros-v2-v1-1-315337a8797e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMgSa2oC/yXM0QrCMAxA0V8ZeTZQu1HRXxEf1jRqRLuRrEMY+
 3c793jgchcwVmGDS7OA8iwmQ644HhqgZ58fjJKqwTsf3Kl1GLvY4SiZJn1jycU44acnHQxnj95
 xCqHGZ3JQH6PyXb7///W220p8MU3bFNb1B6EhmSeBAAAA
X-Change-ID: 20260730-b4b4-pinctrl-unused-macros-v2-20ed662029c0
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785402069; l=2589;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=2zWWPE4w9PDJ4ONBtij1IKrVMbrPHy12yw/nYTVGnxg=;
 b=TvaRoCs626fxoC+9x8HAey48mzbcq5PzMzsq7sa3MdI/qvt/i9urorzRuUBiyrr94DA11KRKP
 N9dtcbG18+7BmYluQ8U+Nk6RY1R9wpvXktzC98h8nGIqlsCQzEKypXK
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: Ctgnm8AuGSgEG81UPlWS4e9POR6JUQ1b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2NSBTYWx0ZWRfX5eVEXQxOYOjn
 3VlqZmnbBVZH7XyCYuN9mBqBCmN7HMX80sFP9pcvA14gsNNw6Kna5TRhf6qgpUq9wgxwD0Dp7jW
 N82eUrBTpnWL003WRcqINT8PpLsk7Iy7WhhoNx2/zB3fNk2kO6RcWJGi3+YIlmJUoSHeIEseMYc
 GqKnANwlZqfPY4Vztss9eRIuwQL4M1xqneIg6uQvSaUrrw8k1CdNyksRPGKeG6Zz3k4l65EVpne
 K74JdK65CdKYPF8vMSsKE6wnOTGC0oE/PyWYQ9gXWQgplKkNrgkDj4xF6TUb7gx1ApbGRQFeq6h
 8ABJLUg/eHHwQpjsH3X7LfMAMGi+/OKDtwehNjMM/RJnr4T7VIRp7QuyDn2mSapTiRg1hCMY8F/
 sa7V4Jx1UXgVnjx1zdlxsfROzmIpjsKcGvh9GI3eLbR0pQgbSC0sGqqAERSoGQ5fmdhhnbkdoba
 95nJs+4nMZFHLkLZGmw==
X-Authority-Analysis: v=2.4 cv=bq18wkai c=1 sm=1 tr=0 ts=6a6b12da cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Zr7XXSxRx3OQYGt1In8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2NSBTYWx0ZWRfX/iMdeHJdMIPD
 KlLdPMor6HlFKWQJtK6QmKqYEcTv8E09KsawV5g2+pYb9J5HyH9f5oLv2l1ANAnoE2sRQjxT/+U
 QtOCDDyVZq2TGvS1P95Olvw0CFor/iU=
X-Proofpoint-ORIG-GUID: Ctgnm8AuGSgEG81UPlWS4e9POR6JUQ1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300065

Remove macros that are defined but never used, as identified by
-Wunused-macros:

- pinctrl-qcs8300.c: QUP_I3C_{6,7,13,14}_MODE_OFFSET
- pinctrl-sa8775p.c: QUP_I3C_{6,7,13,14}_MODE_OFFSET
- pinctrl-sm6375.c: REG_BASE

No functional impact.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Remove macros in Qualcomm pinctrl drivers that are defined but never
used, as identified by -Wunused-macros.

The QUP_I3C_*_MODE_OFFSET macros in pinctrl-qcs8300.c and
pinctrl-sa8775p.c, and REG_BASE in pinctrl-sm6375.c have no
references in their respective files.

No functional impact.
---
 drivers/pinctrl/qcom/pinctrl-qcs8300.c | 5 -----
 drivers/pinctrl/qcom/pinctrl-sa8775p.c | 5 -----
 drivers/pinctrl/qcom/pinctrl-sm6375.c  | 1 -
 3 files changed, 11 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
index 9a904d809e11..c37ad3590838 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs8300.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -100,11 +100,6 @@
 		.intr_detection_width = -1,		\
 	}
 
-#define QUP_I3C_6_MODE_OFFSET	0xaf000
-#define QUP_I3C_7_MODE_OFFSET	0xb0000
-#define QUP_I3C_13_MODE_OFFSET	0xb1000
-#define QUP_I3C_14_MODE_OFFSET	0xb2000
-
 static const struct pinctrl_pin_desc qcs8300_pins[] = {
 	PINCTRL_PIN(0, "GPIO_0"),
 	PINCTRL_PIN(1, "GPIO_1"),
diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index 5dbaa50cbff0..23653dc65e8e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -101,11 +101,6 @@
 		.intr_detection_width = -1,		\
 	}
 
-#define QUP_I3C_6_MODE_OFFSET	0xAF000
-#define QUP_I3C_7_MODE_OFFSET	0xB0000
-#define QUP_I3C_13_MODE_OFFSET	0xB1000
-#define QUP_I3C_14_MODE_OFFSET	0xB2000
-
 static const struct pinctrl_pin_desc sa8775p_pins[] = {
 	PINCTRL_PIN(0, "GPIO_0"),
 	PINCTRL_PIN(1, "GPIO_1"),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6375.c b/drivers/pinctrl/qcom/pinctrl-sm6375.c
index 8da71d940b90..cb15c562b865 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6375.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6375.c
@@ -10,7 +10,6 @@
 
 #include "pinctrl-msm.h"
 
-#define REG_BASE 0x100000
 #define REG_SIZE 0x1000
 #define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
 	{					        \

---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260730-b4b4-pinctrl-unused-macros-v2-20ed662029c0

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

