Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7A84DF4AA
	for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2026 14:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792656; cv=none; b=kHcHba0J+bbMbtt8LmtGwcVKGNse7VwOnK40i4QuOIMMPFSOiz4yrhg3GtL6TzxEZSxnrvLvnlISSpJ6i+opE4S/81NCSLJ8TmZNCiPGvXoXC1+jgWUGfG8g0FvZIliiHORbowr1LP3fjQmp+VjZXrp8Aae1Qy5hyaDv9L6nxxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792656; c=relaxed/simple;
	bh=K2ViqTzOpEDHvp+cqdfYocXKmQsQgnQjVeDffFe7fWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kIR4et7MmV5Lnp/+K+o3p5PYJU+kL+NnPQYpIE8L+SOEdErNgTRpySuxwTP0IlCena2lZan/MZtIOecfDub/1m8K4oTnWcjlmYCgidXCIwCSPhkM5nd4xQzsFQRlQD1roHcfBzRJe9qDPr4aXKgF1svCNY8pxa051vOZUfBKS/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T8IW4QZv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QMWMP/Ni; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T8IW4QZv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QMWMP/Ni"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdWu5851893
	for <linux-gpio@vger.kernel.org>; Mon, 7 Sep 2026 14:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ppud3nGl13YsNzAxyhfY/O
	orUntYFNkI2yG5l09eE/s=; b=T8IW4QZv2orgIEkuMBNR3UuBd/4eotRB5Luj2N
	i5MuvhPLWpoW6jTE8FDZTe1IZgxoU3MCyZ9QFq3wRghVv+n2EKGlzUzZSkO7i84T
	0u5OD5s0E3dsILtH4pwgMMYMcpclptlTKERyWffA+7LJKYu5N4b8gcL4qxGTkHr7
	m8qAiDkD10zPadMdwIQ4Vwl+arNkc7qQMR+nVPN/J8xcjTUa3MuFud0kkNOXX1tZ
	udZb41D3J3Xk62TjXbYmEHLGqX+GKSdUx1kJuKiu7v+Bdclq51jW0xYEQVkEky+7
	e9woIbSyJ0j2uAZlC/hHO4gTHNyvM+WW7Wb4JPr4x63+oZVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk8tf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 14:50:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso438707485a.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 07:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788792650; x=1789397450; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ppud3nGl13YsNzAxyhfY/OorUntYFNkI2yG5l09eE/s=;
        b=QMWMP/NiaX4Oats/EiQpavzzBW7/rD2zv67b02wuk2ExmYhgq+xpVRoiCmB/1jXjVt
         BZ3OL9ePl1jAE9eu04M51/ixoKYuGMsnQG7NL+5NAWA0N3arO1Sqolb/gXKvSPvWfWIZ
         NmEJNNXACoAHSek7a3wpy8hffSXF3H8xm341hLEqirV4w8/NGF2wRg2UGilvfMkrKjfE
         FxMsYkmVzAda3yBBta2fnN3/DshOEKQio7F8NCzuNzQxQiBbQs1jz1FcDf5f0U4G3fmZ
         EFxygEjxi+DLOCMQzRKGjmPeraV9Sp0J3IFC0WACp/6wRQZvRIUbfnnHwS98XXH4uh87
         bFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792650; x=1789397450;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ppud3nGl13YsNzAxyhfY/OorUntYFNkI2yG5l09eE/s=;
        b=g0tPYiYHVlQO+wQUUgStgHp7EPlLrfilIcczBZZ4TOFPOtIVMd6cNXcpv9MUwGTKB0
         mx2/H/ZnKslh50uwiJVeYxXjtCKStU1WDCNaqpPI6tWY+1qPwscyizSJ8JKD3Pa6MmUL
         91TN5sDCVn+j/jCPELphVS721lVLQVELblfsWZQI1BG16rimaLQh9NDNGu4KBtj1zlZy
         838jgK1+6jSOO1AdKsOQR8IC4/UzT8l/uRfEf1as7hb2rASFUWw3yf17wjTMdEi43Hx2
         h1KN9lBpJMdzogXbDRWYuWSC/tX/wt+bxwwjby5O6vyyy1Lq8bscZWresHq8N5IaiPGZ
         mBng==
X-Forwarded-Encrypted: i=1; AKwUvBx38nS72dJDuu3C5etIH/jcTvzZ4t8VedIAST9fXhjKEypRb4o4QWfatL6KrdZm2dDUbWNqLtnCD9Vr@vger.kernel.org
X-Gm-Message-State: AFuF++mmtUr+ktN5s9umfLyRarLwHIohozQAou4D5cN6Zu8KAEp+a/Mz
	up/44tZ6ZmnojxE+mq0Ms/USoyGeSQH4pJVieOHOo29MuiROUl7mvonNxa0Vs31UTvoGbnUVMpn
	JW4Iy8e1gVzGngBSyHV3/36HZ/f+XRwAVKqdLTJs6pzvHxIfO4rmI/8yFr0FhqmoH
X-Gm-Gg: AYBFou2IcwtKtIRExKB57AHT/afcB1m4EovnrjHo5uVaW7K0Eg8XFJnKcBfS238rypy
	VQeU80Nu5ID+aC8hPBA+h60iO0Uli1eeJct5jSg2r/B520tEI5wPQ3nJdOnXvom1Wo6NolzbwUJ
	6ljk/ggQvsV6xA71wvk9ASGfVIlJYleHrGpBcG4CQaTnEmBwa8b5YOg96zkxydKL/aFSEn0uw2v
	rqbGv6O3tdDImitv0+EcQZlaQwv+Xcm4Zz3Hnju7YnyBzmdudA1vut6WgObW84lWtZmBY6YiSlJ
	6azjqIkpRvsb0ugTyrpy+geeRFPpbd319AgdTj4jJftb0AESPcAWSTNED1Ua+ROfFRUCN8S1er/
	CLvlRIFCRUEvnmcJyU2R5awAidPw=
X-Received: by 2002:a05:620a:a50d:b0:92e:520a:ffab with SMTP id af79cd13be357-939804af76amr2292726085a.38.1788792649694;
        Mon, 07 Sep 2026 07:50:49 -0700 (PDT)
X-Received: by 2002:a05:620a:a50d:b0:92e:520a:ffab with SMTP id af79cd13be357-939804af76amr2292717485a.38.1788792649044;
        Mon, 07 Sep 2026 07:50:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:48dd:b57:9236:95f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c81c3sm29352286f8f.26.2026.09.07.07.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:50:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 16:50:34 +0200
Subject: [PATCH] arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-arm64-have-shared-gpios-v1-1-31af942ab30f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADnPnmoC/x3MMQqAMAxA0atIZgNVtEWvIg6ljTaDrSQggnh3i
 +Mb/n9ASZgU5uYBoYuVS67o2gZC8nkn5FgNvemtmYxDL4cdMPmLUJMXirifXBSHYINx0cUwEtT
 6FNr4/s/L+r4fdMefmWkAAAA=
X-Change-ID: 20260907-arm64-have-shared-gpios-4c6c07d7dc5e
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=K2ViqTzOpEDHvp+cqdfYocXKmQsQgnQjVeDffFe7fWk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqns9Bv3NjIrxt3+2C2pEysw5R8Sg664dHoSRZV
 Di1uvEpaVCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCap7PQQAKCRAFnS7L/zaE
 w+7mD/4l9IRKkaSI6SJ0J+rVvXu/a+tmFBna6FPq6jp8CjYS+Qx45NxwvH+4s3vm8TMZU7ha7ZF
 293O6Z22dlTshcljlPcPJyM4FIDaPwtNbEynp6OsLZd8IFDCQ1BIzOq3vSNfKcYP0G35L0Ev4Nn
 J6x6RD9ncmHxinx2hy5SYLLQy5RSCb9H+mt7uqSnYNMfc77AY9oCbrhe1+uleENiXqsryZ3Hp+T
 k2NSOUZmyR2WN95svWm482tFbfgC+xTIB1AdE9Qdb2Frz568h9/sfqg1r1T2BMdiDIIbq4MC58Q
 4sNyzGO8y1xkcegwZwUuvllCXFeGyeHF9sAU22JbzwoW9k77FABG4MwF5242PPokxnvwx2ifs0o
 8dUhvYxthfV627z7f2r/vGLeztm9njh9Q4mDsbwunv01xg9BrkV+LNXzj42q7tbZMOuHjDN6w1T
 GdbBH7qkKdQCv8wURf5P8TU+o8ggO5WkMu602uNHf8K07SzfgLmZn0OUfcXFXw2ir0mDLol3JlR
 fKTNJkGUYjTFqVzCqOdVGaTfDaE/PXNg5MszJqBkmdc3NmAJIZRhf5UFmi4PFUeYJe+55RCGYf0
 gih3SLuHgoegcCb0qGJRA0RK21VGPMdzsLWxpB8AmaZIP19wznlMpyCSBUMjYJQ0BeDGRjxTnEx
 pw6xhOFYC9T0QJw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE2NCBTYWx0ZWRfX7qmGHUoqBEMm
 1hVJj4vvGbjR0VpnQlzoRlackpfPQkwUQSu3AHg+0yKsJ5zuGeJlGfkncC4LchRExohu3T04wk3
 q1IjL4DbDMNHwSnjvD0CgBWj4Hu1CHA=
X-Proofpoint-GUID: NV-rM-UoEepoPocelyKQ1Yd1c5Gj2tWf
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9ecf4a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=-NV2PVthcPmsdjADTgsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: NV-rM-UoEepoPocelyKQ1Yd1c5Gj2tWf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE2NCBTYWx0ZWRfX79CkpxqsFeR4
 Rr38LLfGp80vo1OhsIxRU2D/+RSWWMysiwb1sXUdOrmqRWKGHsbigMU6NxNQdE1Sz2bSR9ZOZQ3
 FLYBCknX3eL/Jzhkdn5ZaBAJFvqoj6aX7+eiwJRihmESiQ+O8NL8IxPVAh+x3OLIq62slxJ0m3+
 Rw4Dhl58atLHhT1ZGGV2wsKfqu3hlmaiERdclicpZ48ojkXh2mjWKBlHXLE+iu4rDGTfawkNUh1
 wvw+9RlBVC2WNwATdwRAKHVpFuGfb1SoYUQm12V9WV9CmqMNL4gN337IfAfJiIt8vh0gLTZ6OzP
 LnWKJ6le4PiScro6jafwKUgJsWn5B/pb2acMhz7wpwr/u2k8xgK0UBP9yf3Qop7N4tSNa19fV4+
 AyzPPFnfPMOyy6k+/wuUj5jUDd02OAuZn0h6nsht0gjj5Ma+r8/0HfEi2fqjGYcYsQFTHwWpRdU
 WIcdV29V327xbZj8dOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070164

Shared GPIO management provided by the GPIO shared proxy module has been
enabled for Qualcomm platforms for some time. By extension of the
defconfig, it's been effectively enabled for all ARM64 platforms when
using the default configuration. Bugs discovered initially after the
feature was first enabled, were fixed and I haven't seen any new reports
for several months. Make the feature enabled by default for all ARM64
platforms officially, which will allow us to continue the removal of the
deprecated GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from the kernel.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/Kconfig           | 1 +
 arch/arm64/Kconfig.platforms | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index bd0b4aeceb218f4085978af9421c97e5c7cea94a..b6fcf6c6a6089e26da08a7efb7eba9422f96edc4 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -195,6 +195,7 @@ config ARM64
 		if DYNAMIC_FTRACE_WITH_ARGS
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
+	select HAVE_SHARED_GPIOS
 	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_GUP_FAST
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 76a6a0e6ae4f1ed496cea090fd73398ed525e732..74c03cb2f9bc84716fbc9d186a38f4646f0f295a 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -37,7 +37,6 @@ config ARCH_APPLE
 	bool "Apple Silicon SoC family"
 	select APPLE_AIC
 	select APPLE_PMGR_PWRSTATE if PM
-	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.
@@ -329,7 +328,6 @@ config ARCH_QCOM
 	select GPIOLIB
 	select PINCTRL
 	select HAVE_PWRCTRL if PCI
-	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 

---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260907-arm64-have-shared-gpios-4c6c07d7dc5e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

