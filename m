Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806632;
	b=XtNurpYEUO2PhHXDvDYDIVStt9x4KHvhTtYed+R8AsJhtaxEOojvqrFbWmS8MedC8YkI
	 pG1FTNOexFGAoKNPeBd5JuU9McQn/vCF6f4KK6qBP4VdWkorqAzX5oU/N1M7LLA7fQ3sn
	 xT7kJ+CYMwnP0jScxp9wJy9ONCCZJDDDO5q5+RS7AoM8mR+rdyahNBNj9X8/vpccnr+Cd
	 2nSvSzQYJRhNw23PfQmo7y7N4nSbEVZIHrtNFnLCCD6mB2E5QU9cy3NNKgaR4uR3LFhq/
	 YeNGS/Bx6Y4r8iKG8BKGVM85mClZUAP8tsfz4QWSp8yQcJi9TqTDOl1zV/TRYaW5dgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806632;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/wCpx7ZbYMvn+dKS5Ed45+HwLytHW0nEsPP9dFbtQpw=;
	b=OI9QXPcvTQTrFWZN4xLyoJCrbUUrX71L6wox6XfZz35vMvQVzEzlEFXwr45B+ii2k4Fm
	 nw3ZHQUPNhWFaUVRZ/kN1SNXZoQVKgTD1P1cHJxB9GEEvNv0waa64n7UNRwohMLcWt1I5
	 pHoo0n0zxGSxojBr9b+wGUGAC1fqZ24Y1/ouWmxKJojnVdOKUjyv0UfdR8jAW0+iyYnTY
	 MnoBx75XjZDtlnJpV7wF+orM5+5yXh72iC+XLMBBolZoDx9j7xYekJy/EbcdfxaTT9gpR
	 Ui2esoXCtOxUKxkh3qU+E8+KdRm+nk+wW2iIdycevwr2qsPBisKv6Uv5wVdLb5+NAiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YBeiEG8T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P2+QtTZs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF72660A2615
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 15:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF72660A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YBeiEG8T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P2+QtTZs
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZtA3608380
	for <linux-gpio@vger.kernel.org>; Wed, 4 Nov 2026 15:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wCpx7ZbYMvn+dKS5Ed45+HwLytHW0nEsPP9dFbtQpw=; b=YBeiEG8Tit99pO8q
	CfIZVSNF4ZWuzBqjHTB2N2paNjFwWHK8RPV45aixKvUck7RkCcW/qWndPeMvl2rv
	yHEA07j9D0W67c9d6OpW5bOnL+fFadlax0jTomxNfMw5h30l2OJZo/BKuFyny1P3
	gXenoVw/guQPpOxP/l35j+3DaUxk3ZJ+H+j32IjVc2kpck3ZGZZyXkh9N0sxq3DC
	PTXyfbGYXk1/PZfmG45wtDWGINtoKDcHm5IGnVcUBVBmd3MWOniILpLs4rRoFaMC
	HJ387S4aFc7U8sGBCEsrlZWy1LbrF/tf5tywrXbYRq0RQayCJ3eJA9ySEeGnNiRs
	TO4wew==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r8106s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 15:37:10 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d06f3784e2so225429137.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 07:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793806630; x=1794411430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/wCpx7ZbYMvn+dKS5Ed45+HwLytHW0nEsPP9dFbtQpw=;
        b=P2+QtTZsJ3uClm1xUMSnPGCrbvctppNNpqLpNJ10GngoWt/tC48379woMFaJWrWjzZ
         3Vmpu3F7WmSIuZJOb/koho9a7c+IOa9bRLjZTClOB4ju+r46NXUIvh8CXua49+UOMGCc
         EJAfQKh9Mk1cgzgPQ7QlA+nF3x+1kPiB8sEjb1wBka2Gr/lmssVsw6wBLlILmlOrbpxr
         ZGF1lpd3GMW3Tj8zYZ3m/n1Tfde7LmO8XMPcYXiPncSu/r0M8rULj4cX+/iuuq/7T13b
         sJcUPVz8QHtQey4pbqXwYJL/t7DOKumbS9TldrI0dbBV4tNkc3due5JlxvuhAQ3vuU5m
         5e9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806630; x=1794411430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wCpx7ZbYMvn+dKS5Ed45+HwLytHW0nEsPP9dFbtQpw=;
        b=ssa0Ug3BANnllcxSKx7Tzz7owabbwgM29qwHYyUIASUtStLg8+xc6TO1wCI8QR1G9H
         Xuf/TsxCTWMKWJQXbnuD56E6NXRH/GebptbOYW+9m/V/xHwkHr8zFa3MprMPLJ4Nh1rs
         bB7s1iQdvTjz8VOOnqycqBmzU2l+OYZQjaQto27kdHRUXR1BwmeL+rqDq0adlT1br63S
         X81KfpeE7pEoCtiR8PyOUwjX3SiSNm+s8DsjptAy9R7YFC9nfTADHhN1UMwud4WfCObn
         CJPfFT+akDGD9vemK87xqmMN/a6/98mnBsm3FBPmKLUYrK20Kwozb4bt4CpMbJCf5Zhi
         COXg==
X-Gm-Message-State: APuU4Z+0ek8jjxW83zE3FiWBlgQ+tGwbp1n2ZlyFrMoOvw+dHKA4qYWr
	zn8rYx97lX3tMMtdPNg3UemoF9bP/DUFBCr2MV6SWL4koRshJzIEQqR4GCY8BElWqdeXYHygNTc
	Xh+CL9wLOW3qV685k2QFx5jDhD/3JPcUFgncJVFTCUhMOWFJaFa3UMWebN6SDkmdifGapchw2
X-Gm-Gg: AYBFou0BhRF3DHvXg1RzZXUyYQ1mw9Iik+Mw7nYzFIVCpi/enIGUbvwE/t7o02G0mqK
	/qHlTb4Q4B7IoahgLu4OnDiDrREBFvvYP4Fw7R46iSa3d5oQn97Og/6yHwvTxpAu5/LHdsd4BOb
	Z7UIAe3ascRJoR6Ua3p1HlyIgZOjQakVfK036ZIxtkh7QETchENHLlJ6JtKkBYTO8py7JKETM8K
	ubKCZVmPGHNNoQS//ZG1Hkoz/tgadm0xNUg339oesUA6tPonbfcioeQowhTEYEJ+w3MEZrbiEnJ
	eUjagAUpST8IhMmPQARw2Ut4G0WItTcjPNa93lYJOkkPz/C1ZHSkYxK1gvx3hAg18DUyuPFC6/A
	+2mFMux6oOW3k5f257ADh5xKYT/QlM3i/K/y8AlJIGUwTfY7oT51DZA5TIOy/aIUWp4sF5sZoXP
	lo7Q==
X-Received: by 2002:a05:6102:f12:b0:7d2:7c63:5a08 with SMTP id ada2fe7eead31-7d27c637376mr562779137.32.1793806630195;
        Wed, 04 Nov 2026 07:37:10 -0800 (PST)
X-Received: by 2002:a05:6102:f12:b0:7d2:7c63:5a08 with SMTP id ada2fe7eead31-7d27c637376mr562762137.32.1793806629573;
        Wed, 04 Nov 2026 07:37:09 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4107b7198sm30388825e9.0.2026.11.04.07.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:37:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 16:36:59 +0100
Subject: [PATCH 4/5] gpiolib: don't overwrite the entire flags field in
 gpiod_free_commit()
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
Message-Id: <20261104-gpio-desc-flags-atomic-v1-4-e23cedf619ba@oss.qualcomm.com>
References: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2148;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=qfnK8NhwXPiksOiKAVXJenfSAZexKhEl6VecmEIZHx0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq61Eb3dAXKfqdjl8aAODE9wErfP/LlakiYzGNT
 Xrms8M5YhqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCautRGwAKCRAFnS7L/zaE
 wzngEACuLXVyld0G8pZ9KX+6UAPKvpcseqf45H9ED+mQV6iMR4xcAgYK+PLET7Sc1+00S5EdkyC
 516eKz6qkWlCGZnIft0Gkb1aS6k1VlAVYqnr7est8NtRxvx9KvMoFetHFVSDGunpI19CslZAxvC
 h4eMjuyFDHuy/OO2LOslH2s2cwc2IpcQbQYKjuqo0A/XpQ9ciOh+WMaHkGTIFyOcCiENS/E3YiB
 c+5hv/YCl41EnVBQQpDBYi7rkW+twxzxiJX3BjDYKveo+8Qi2z+zvEWKKxcsV99yaYyhkeo0UYo
 W3ExghwYV/O/oqN5Cf2tqfTOdG3ot3ZTqlZ5P+H/a9Ns7ECQj1quNOD5x2M5SllYp8PSdljphwF
 D+wrlXcEEthNEDt9MRx+TWT35mIHtiwxZTEbaykQMSUxAaq0FF9pKcjNbDL8cThrN/7LdTVaAdg
 UuyzLCy+hgQK7rhxEqITBULffMQzSZ4Wn5NyEuMC5nygUY7oEY+f869kuCsj4w52yMF71Q0Nsmf
 VBG48NelChhyKCRzj5EwfikuXvrTb/NAJ6j3zA6NLPofKcIQt3tv5Q6LR4qaYLiNIlBNNHvgMz6
 k63sMDEYJnHmLO2XHY6O2byxISL9wO2kcROh5asZ4f8CPBdzCNrnDfdyTQYI37Fip1z3c3tQ0Z9
 sF2BVtvx3iAz3Sg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 39qLGzR2PGDYWOCluD6-SXsYUMpnRUiE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfXy/vxEUn/PFYM
 QnD9+K9kNelzVWp/iW9gdQhE9Zl21S6HIeAk9pLWqL0uBdrjNmVh3Xz6IcVRAo3n+rENFAKOhVV
 X0aZDkfxXhtqaMXHh4hv9IiDzhYOGZoVO9bDUzjc1qjKiSlSAbFh9eXq2hrYBEvv4OUWETtza7d
 7JVhI3akYGLHyDHhNQRdMDFVHR4IMbIEkzsFkTAyMstH9ysP83ZKvjz8ZGnq40zyS6tcBF0B1a/
 Z3BSFB4YO/0lfmF5HLEc+EmPkTTMj5htyFjs+ElKbImei7UTdV9WFm4b/qKaaG2ophm2qCs+TP/
 WRBWyGx6SoMBa31s11rf+fkhvoCz74HotPyBXJJfci+ODmi4ofZsaRkJ4+v/OyNDfNWyuJey+mt
 PR1nkDTaKUx1+Sqdw8sZKxTpamS84me59fkWL0S1042F7tWZCS8+uHDvSjg2JzSXVZv16Ev8DqR
 I5+tgDuuG+/s+06bYZA==
X-Proofpoint-GUID: 39qLGzR2PGDYWOCluD6-SXsYUMpnRUiE
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aeb5126 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lCfYgqX0DhX4tC7hO14A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfX3VNPwjYjadA+
 XUTK84JYQb2E9EW08Xzed3sEQRC+2e1bsSuwhts0rip7qyyr6bANpBxRRnoIXnElvfK8PRAVVHr
 f8PZJzFEyRa0ugSq+Zvo6ltwSZL8Jc0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040062

Use gpiod_update_flags() to clear all request-related flags in one go
instead of risking racing with concurrent users and overwriting any
changes they could have done between READ_ONCE() and WRITE_ONCE().

Cc: stable@vger.kernel.org
Fixes: 35b545332b80 ("gpio: remove gpio_lock")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 63b65b646fbcfa9ea0f724d1d3e1ac22ba28f638..28d4cf0cef70f437dc4271f82975d09dc55125ea 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2693,23 +2693,23 @@ void gpiod_free_commit(struct gpio_desc *desc)
 		if (guard.gc->free)
 			guard.gc->free(guard.gc, gpiod_hwgpio(desc));
 
-		clear_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
-		clear_bit(GPIOD_FLAG_REQUESTED, &flags);
-		clear_bit(GPIOD_FLAG_OPEN_DRAIN, &flags);
-		clear_bit(GPIOD_FLAG_OPEN_SOURCE, &flags);
-		clear_bit(GPIOD_FLAG_PULL_UP, &flags);
-		clear_bit(GPIOD_FLAG_PULL_DOWN, &flags);
-		clear_bit(GPIOD_FLAG_BIAS_DISABLE, &flags);
-		clear_bit(GPIOD_FLAG_EDGE_RISING, &flags);
-		clear_bit(GPIOD_FLAG_EDGE_FALLING, &flags);
-		clear_bit(GPIOD_FLAG_EVENT_CLOCK_REALTIME, &flags);
-		clear_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &flags);
-		clear_bit(GPIOD_FLAG_IS_HOGGED, &flags);
 #ifdef CONFIG_OF_DYNAMIC
 		WRITE_ONCE(desc->hog, NULL);
 #endif
 		desc_set_label(desc, NULL);
-		WRITE_ONCE(desc->flags, flags);
+		gpiod_update_flags(desc,
+				   BIT(GPIOD_FLAG_ACTIVE_LOW) |
+				   BIT(GPIOD_FLAG_REQUESTED) |
+				   BIT(GPIOD_FLAG_OPEN_DRAIN) |
+				   BIT(GPIOD_FLAG_OPEN_SOURCE) |
+				   BIT(GPIOD_FLAG_PULL_UP) |
+				   BIT(GPIOD_FLAG_PULL_DOWN) |
+				   BIT(GPIOD_FLAG_BIAS_DISABLE) |
+				   BIT(GPIOD_FLAG_EDGE_RISING) |
+				   BIT(GPIOD_FLAG_EDGE_FALLING) |
+				   BIT(GPIOD_FLAG_EVENT_CLOCK_REALTIME) |
+				   BIT(GPIOD_FLAG_EVENT_CLOCK_HTE) |
+				   BIT(GPIOD_FLAG_IS_HOGGED), 0);
 #ifdef CONFIG_GPIO_CDEV
 		WRITE_ONCE(desc->debounce_period_us, 0);
 #endif

-- 
2.47.3

