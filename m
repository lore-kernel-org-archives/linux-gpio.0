Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712857;
	b=z9N3jWYb2g8OewhbM3GWTG3/uDOLpz7FKd1JPAZvTDFgWZsnVWrvCWS8FF63kuqRj7hu
	 44fWqG0WBH4/+QgRhzmWu/+FZBg2nSXwGcmlt18Du3ju9i0PpeMIU10Flqv0m5aM6HbMf
	 AMAGCR5DmE8+gPlKEcK4lcbOYec9nB/bJl0XaWY0k982UbT72THq34FAslaTrhHDM+VYq
	 qlp+uENVb23SjO7qsNTt5qJBw8tmKNXCcaTGtOEvEODIfapPTxiyF2ura1KwZZc/oJ3AQ
	 52yHNCGQjJ2l4Z/Nf6WTI4884rNYhqz4rrUlSu33eeOzbRB8j+KXZnAzdf0vT5Kj8Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yIknrBZjHPY8Jt51beaEL0ty78CCW4k2vbkiC0Sj0zI=;
	b=pts/4mGb48T/12z3XU59zPsuKaZXQSW4ke6YMQjt6PIpq0v9Wjvz/b3X8HoBenAkCc8W
	 MpS2K4wgAL1yBhkGo//EUjQ7rscwOL8Dai8AK7sbQanmGV50FSsmSLOn/HpJx98CRUF0a
	 1qUA4P9FHi3dSMxfmADCu2/y7gIbK2OgrMqc2almd+yrOh+27bAJjxIODZ9vl0Szxt97e
	 4n+LmSy7+pCG9qpYKPMjFQthsHr4Ec3wtOWyIbE37SJxy00ukrhkgNcBlovGmAqBR1zJK
	 N26/+5jaISt3RqKf7aSsqNRlEZiNok+jLTdYjwdL1D0qLCswNH/gFvkjMQur159kYFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MsiV/zLn";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=USZPa1lG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039DC606EEAE
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 13:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 039DC606EEAE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MsiV/zLn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=USZPa1lG
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClAWD3476601
	for <linux-gpio@vger.kernel.org>; Tue, 3 Nov 2026 13:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yIknrBZjHPY8Jt51beaEL0ty78CCW4k2vbkiC0Sj0zI=; b=MsiV/zLnv5StFd6p
	hWvIzjdpPt9IQDAnWLv0tTrBGhCXT6u4wo6edsawVRotPX9NAWrAfgVi5ddHdiaL
	/GkXynkW/wyyEYd90f/TZ5cMEQcY7/FilTG67WsbGrdsuFkJTIx6ZtxrjeOgAQRK
	SlyRxNJRt+IOgiRCUykisIH3nJmlVDP+XfdwOCYYAT8dKmhUmLvi3Jf64xb6+OwC
	gzOz/6jUAoRJn5sH0nIA9iCDR/IPID3189s7CrV1cOIyuKvr0H6OW5FfUlHp4cnh
	NOeXAFq9T+O4R0O02xxzXBBrEX5vW2xkGRZ5lErI6Yn1X6ZP0Hk+IjpfHlMOqQsB
	cnyeaQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94cswxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 13:34:15 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99063f4065eso608736241.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 05:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712855; x=1794317655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIknrBZjHPY8Jt51beaEL0ty78CCW4k2vbkiC0Sj0zI=;
        b=USZPa1lGaBYXX8CerxlOtCoPk9IdTrHaFlphp4If5Qbzua476nxX61yl11ji6x6xU1
         LUbTk1ycAIBfjlvh/uwk+iYvHdfGFyjzMyb4laqu/3hcsj5JDWR+HKAFLXs/Yr517tSt
         0Zls6kNHvztUVuwavEDNk/acxGybOCY2NT5RXRzSRmxJ42SZwKIAle0BIacr9QN9wtJ8
         Tk86iSZdlLeaslMwQxC+lkT225wZ/j41t7JTMneHIdSL+YzZy8FzZ4fv59Z9d77KEdCC
         sTDb8lMiI/6QIG0ZXqWhc1PQUVkRRZGnQIgOMgfv7xS0eUAE77Cje+f+5rSkw57Km8c5
         vfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712855; x=1794317655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIknrBZjHPY8Jt51beaEL0ty78CCW4k2vbkiC0Sj0zI=;
        b=LqyNvbtAX8MH19bg6gLr6lORUDMT9wvjZ3er4HpA2Y+Xu1Sh5iiXZZMuuvNBzbBtgv
         27Dc3wzOSNHOeCM0NiUayiATSpM7Ycy+mHVB8xbzDQuMrH3P5tIwpmNtFXF/SpquBKR3
         LZQJ7A1ncND1C924S8qz0MxE3Sxw7No5Qmn6xgpha4AmYn8slFelE8GNiPrG3rx8ft4q
         Y0jVMkDcy4hMHDW7hzURduhnFpb8z8qzunVFcLHQ2Ebvhniq01Ahk0GrJLAZg2gR9lc1
         /rtOtXnx+r0eiRnGmit+VKq8A19FQr1iUNtLZ1vIxxnrepb+WzZcShboSgBpsZxtVc/G
         hs+g==
X-Forwarded-Encrypted: i=1; AKwUvBzIqcLsDNKX54Z9PCKBDGZDw/8nSZy/lxhKAJTlZmuaW3uSsnpHukw80sOfft+ylZCfKQ8QqEUxrxCy@vger.kernel.org
X-Gm-Message-State: APuU4Z/wc06mBsRTY5+pt8IYTZKyuYOVhjuc+FcxmMgMFYRlq/7JEZ1I
	6dnX/g55t+iSox7HYHLTgiQZM3NHqsCiD2XoQ7UsGC7EcWi5TAj6IU5t1pwcViyjzB336QXvYNt
	GT+Ni8n1yIgpapme8Ky9byg597YRhGDvsO4ba8BmwEOs52GnNKoVZGFrFEX6QTPZu
X-Gm-Gg: AYBFou0Rl7d/whM3pNw6Q2Bf5pFoOzsohSpuvMdRTWdXYAWVCgEXZnzWC11yZA3edMw
	OhqVzWmnVcS0vOCZ60PuJmJh9Ed74hH6toHt56iFOOCWiwWqlFLQpzj9Pv2uOsHRzr2yZ7mN5ve
	uux8jdr1VhQrjJz7B4cy13dhRymvqxQICu7fltsi9rmrkIuPI2/vB+yuqbPRKefCjmdqsH4rovU
	/NQGzrPkl9hvry2kERA/Ac9aXJm8OXB6QdvO5lGa/sCgU09dJWdnl9OJLp1zV7VU+qp6NjWm6WZ
	NpL4td51+mIdyn3n9fmPtA6HgHeghq3ruiX5851fPWS0PQwBGcwjiZfD9pY6PeQyKzX5rwzdZQg
	y5ySLFbmTZ963caSKk80xCYCyGQ898AIWOMLueBsWp85ovTJxKtCI+X+nr12Hwka5s7j0smBeeI
	RpNA==
X-Received: by 2002:a05:6102:6883:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7d07267f930mr4343546137.24.1793712855153;
        Tue, 03 Nov 2026 05:34:15 -0800 (PST)
X-Received: by 2002:a05:6102:6883:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7d07267f930mr4343520137.24.1793712854700;
        Tue, 03 Nov 2026 05:34:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm26866970f8f.55.2026.11.03.05.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:33:52 +0100
Subject: [PATCH 1/3] ARM: stm32: select HAVE_SHARED_GPIOS
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-panel-mipi-non-exclusive-gpios-v1-1-aa862c1d71e3@oss.qualcomm.com>
References: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
In-Reply-To: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
To: Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+xwhEIq1Kfy5I5NBWcOLNXVJMoR1QHxqiMRtC7afj20=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eLSGfA1l9T+A4p0kHk24QWFBtFJJJT4XTpef
 LL7mrxNOM2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauni0gAKCRAFnS7L/zaE
 w3MtD/9uudBQVkBxiiyISXvd0Y8Wm8gryDzgKaUNm4uEeMoX6xWUdYiho8KqcFnTr2vQp4EHnl3
 V0ky3XWFAJp0xs5mWtYBVxfPRZRr8cnxjlXKA8ij1iB/xGYMX9c36/H6dvhJMcv0J5TVL479Ho1
 Us0zp0l9KFSw9Wb7NAJYRFMMmmycip9ccbIS5alE2M4qiJmOoP+brHSvRaXMTZcIfAPXSlDn72R
 e+KKlEt3o6mq5kvmkf1IqPQPvfB/e/Ge4s4s76EVwK/1qjlPqRuRLjDkBuwi4db9tshI2O9hd4/
 enqe4FeuCfB7VRHCRYiBS9m+Ic/QKQaDynxnHy8un+GYvrJ7tUuoXIL2n7bU3ArxHq4feXatqZU
 7QD+4rD4k4y0Wpu4IX6wbtG2W46DJ+782W3LOnAbWo+QL53D4Re/Um+LJ5mYVG04dNybyezoMDM
 b16yKM6XXF+aWYlc9lVXiHYH/S4Qv0AKH3gbG6oH7Bs0aRloOJoTG7tF+k6SGgKz6DdorIl7gq+
 B2jzN5nJ7CW8Ir2RG9+9/iWLT/uwfmCqrpUIYb4rNPgFRBhkawf0a0XJ7SC6ofdLHCFkD2Zf06O
 UXxh6oLDnuX6xMBcFK3qaQYYVC1zi0uFcU5ITlheV7DslAZ06/VqIMwIjTDugUu9CzVnemUyQbq
 j0MTBEPlGcNcfIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9e2d7 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=b5q88MxlnkSnrj9B7awA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: WLphzkgPeI0mO3XdCeqJzdEg2yRpYC4M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX9UQr7C9O8Iqo
 bNOCpT45vWHkxjICiuxkdFJH2718YNv4jnw8uPsYjB1UuxzIYLix6zqxSIkR/CWdggUueQ7XuYO
 4+C6d7rGUtutGsEH7o5CM9LYvpvyhDMfriatTx6HzsAcH0ohWmZe08hkIlGOmiBSQLju2VNQ6xN
 /GP/qf59gytUVMp8a3sh4T2L8WO2FpAYHhgpqvk3sV0/eehvUWMtgwOvs5Ivf85ZLkMo6PJsU8w
 JovQgV2J214GRlTh2pRL6swUe7jZMhrvEl5obnZ1c5/8DJa1UNnCDYowBJfquSAQ+vPS6GORqcM
 7Pe5pAjv9uH/hVAVZby+aimUfcy0F/qOsdZdvJ15/oo2p/9ZUvpYmi7tCxJr+6y0b3HnPZbsTUx
 UlhRP7+iK7MCFLeJqGD92cEE2b4mDdCWxoscHWdeoQUTikrBwXsJQ9jPSIOZrJ5W3AnIRXQeSrA
 gAg8U+di1HkxaHvoRVQ==
X-Proofpoint-GUID: WLphzkgPeI0mO3XdCeqJzdEg2yRpYC4M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX+mB99aXPC9Q1
 hpfsMSRT5kIckbHPa8JAUd21jiDuEPMwpiraOzNPWNsL6Ygp9HK3uF6MvMWvnYnCCXfr/qdki1r
 WOM7ukjcLN7S3O+4h2hvzZlAr75xLjQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030053

Enable automated management of shared GPIOs provided by the GPIO shared
proxy module for stm32 platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-stm32/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 4ac3384e397aabd86e4843d6a6326cd22a2dd66e..ecb6b35610f4988b4fca3fa10defc260a149f7c1 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -9,6 +9,7 @@ menuconfig ARCH_STM32
 	select ARM_AMBA
 	select ARCH_HAS_RESET_CONTROLLER
 	select CLKSRC_STM32
+	select HAVE_SHARED_GPIOS
 	select PINCTRL
 	select RESET_CONTROLLER
 	select STM32_EXTI if ARM_SINGLE_ARMV7M

-- 
2.47.3

