Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712855;
	b=zZgYQ5cmmOg1gNqZPPv5wX7RbsB6Ar8GR+2NXmlzZopHD78HJiIVmFdn99Fm7fCYhNif
	 WIohGgskYIxS2O4GTLJEd0l8hOzITwmj4ArGPwzsejwTL0wsnoGNMMOc18AcLU0SBM4BC
	 NW5YFd/A458Nq/PmytZAFZrpq7z91cWZwEG3Js14XLsD1Ydr7b66IqKP4WjaKaBcllV0R
	 S9NvziVAqP3g4UL5+rzxAhbw4PTU7j98Z4a/9BjFQdCguhJeHjsK+sotBSkyJQ2tgS1cj
	 WQR3VMD2E+nzWyrDk/x/I2fmXGfHtw+21kw8cifaYQwHoRl5P/rs5V0Jl6rKcBHcd4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fSFNdJgGvwopHTFPREQKhgPmKSBKEGZI/r6GjlVmNlQ=;
	b=WcLDF0egZ+mOdTXjSGbPxRQLQ7bvEaCy+wzLGD1N+D2zycHC4nOgoB+O1sdHaIeJdLB4
	 yzSOtbQZMe/owJY7jak4ZS36+APSQIYDAqpgAEukhEvG5evDdNIsHRpKTIEBx2sjhu23a
	 v3EfaPjz1jL9jWJffi8zrjS9HD3LCGaxmBeGaDW2EdY+T4k6TW1VSrvlx6KrQ943bLKDR
	 ubePGvPu+5PzspLImhnp4V63AfOAMG5/+9FzpspAz4lotVDddskv8u2xfDTmumQLoUPa4
	 wKqg5e+h2InWBr3I5ortzFgE137H2FOwl75kQKN6LXb2udHal6ZHJiC4FJOyHYroUXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1CK6Ffo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V2GT3KkJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDB0606A324
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 13:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFDB0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1CK6Ffo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V2GT3KkJ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClCMA1821117
	for <linux-gpio@vger.kernel.org>; Tue, 3 Nov 2026 13:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fSFNdJgGvwopHTFPREQKhg
	PmKSBKEGZI/r6GjlVmNlQ=; b=P1CK6FfoAAkGJNL40dyQMbJWqH1fCi3gQZd/8z
	Lou6/z0PloUEvicelSjeopBBgaVP7ptdK3DoIPq8HMk4bMEhGUQuadxsE++tMOTK
	MWMysaVloK09OijfNNLA7RIGKyc3C6Uh8w0S+jG84NsC/1tKHZMZ+uo+eo/J0oVX
	el+s8EVytA1aURLuFkYk2xt3EHyABEioJqpcwLyq3k151ne1Pei8ahFdeFDtNYN7
	ak1kBMTi8a4uUgZdV2hL5iGRsx08PxySTt/1Xp539W1ZjYegHY2C61z6CfBlrNzp
	vstikzjAOadT0/+ReQov7Ve0eVsGCKx11YGiKWe0AovtqQHQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5j09h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 13:34:13 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eaad995a7eso975707e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 05:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712853; x=1794317653; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fSFNdJgGvwopHTFPREQKhgPmKSBKEGZI/r6GjlVmNlQ=;
        b=V2GT3KkJFgjiKsxURVAI6rBI31iMGhpcb0GgWjvf5jSVrZsq8ebmlRzgkEDEPGcj4S
         +JiWA0Y/BpXIdiHyNuzVNhWYGWNS20fUUA09kST4SY09v/dct5CURom7nlktksNR+k75
         Xd0E20qRt11TRpvVTgN8RBVAWfLDrlFdsC5lce11YC8gmgjQ2QJDnYgqi/6NHla9kqyv
         ybPGNDAyJmNyogfDYSD2n23YZderEhwO3HywWzgKzQ2pwMvNTHk5Qch95rmaM1JeFNRk
         zuPur7J7j05z3tF3y+6xBWa31vDVzM62TGY4ktS7ZRHGbzmc4EU7ht2gUNlXgwKXtRkW
         lLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712853; x=1794317653;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fSFNdJgGvwopHTFPREQKhgPmKSBKEGZI/r6GjlVmNlQ=;
        b=ZEeGhbSnfZubIG+U8Ag5HbXj0tk/QmPTZ6T1dkjHbgymE1gms4wyfGkvMiAWv15/n6
         8wp55BBhGX9KaHSswc+OIrXrtfXU7iJLDA7VlHCydevgs34tkT1/vKm/pKVd3cFtd4rq
         NXxhTMxJOZI9zBhaHhlqw2rY5UwgO8L6HodFWP5W4nPNKaELfQj27MqKxjIeCSBb2/FJ
         sNYER6DaGGnk82boU4uyKuV+FmV1zBG8xn1yfpRTH4LcZi7nfkgYZaDPvcvsFyQlQuGC
         u9KST179openWcvYEOGrEs3WcnoIcoZb/4qq3yAj40CFTqGLDwVINcgjJ8RFpZ5Bd3Z0
         VD7g==
X-Forwarded-Encrypted: i=1; AKwUvBw6xrqD6/wX63PlUU4J5aXtX2Z9obvWIRdDQp0v0AMn49m89XlqRKNnUrHr1ykvSHuoMF7vtu41U8Ox@vger.kernel.org
X-Gm-Message-State: APuU4Z99n/gzLYGf6kgo4/Btv1etO7qHARqUjHYLcGVI5XG7oE7LbpfY
	qiCHkUhh7X8PL8bT3QgbxRYIy2SzEbunrfTfw7LAbHX6/5X4oQmavkOff4BLx2itYj+lvv41C3v
	8Y+qCwVKprNx49ivbE/bbP0Ba0vBjcal/UdiQtgoO8P+Nnw95cxUFC+5m4mOulzqV
X-Gm-Gg: AYBFou2s+ihy7UD2WfWNRm6fA1wRz4Cjy9nwJvj6r6TvFnoGgpVhPr6mXh31+H27K+s
	fyYXNuOaX6T7O56VePhq950bdkEk1B7GLzOUDfFx58nlZiu+HMAeheBeePrhstrdQad1C5AcS70
	NdRMsNpyyQDyq8ukMRUzDeEdXz0ZLYiznORAQxn2bEOQROAWf4NWOSAmRnVBU6eXEQ1JZiiC4Qx
	P7KpdW18RnDoUFZV8Kt3Z0/cMBRm7Wqk7MPQzPrUVTzUAR802QWrJZQaosMEg2F8p39u2mgFD/F
	NW9GmGWuXRzdayh/IdOdV47xwYzzLG8ferR66odGocg+xKduKemRM7VNoKacIegjX7Gb8I+V7OD
	YyLdigS2AUAML64OKlAcC5IBn5F7FzpE0I82b8jjRSk8TeexWkOgbYVYc5aKPB5j87wx1w+K/b6
	bIkg==
X-Received: by 2002:a05:6102:3e84:b0:7cc:32ce:4c51 with SMTP id ada2fe7eead31-7d0725cefcamr4330619137.8.1793712852951;
        Tue, 03 Nov 2026 05:34:12 -0800 (PST)
X-Received: by 2002:a05:6102:3e84:b0:7cc:32ce:4c51 with SMTP id ada2fe7eead31-7d0725cefcamr4330597137.8.1793712852429;
        Tue, 03 Nov 2026 05:34:12 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm26866970f8f.55.2026.11.03.05.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/3] drm/panel-mipi-dbi: stop requesting GPIOs explicitly
 as non-exclusive
Date: Tue, 03 Nov 2026 14:33:51 +0100
Message-Id: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAL/i6WoC/x3NywqDQAxG4VeRrA2YEVrsq5QuvPzagGaGCYogv
 nuHLr/NORc5ssLpVV2UcahrtAKpKxq/vS1gnYopNOEh0rScesPKmyZli8Y4x3V3PcBL0ug8DOG
 JTuZWIFQiKWPW8z94f+77BxCusO9wAAAA
X-Change-ID: 20261103-panel-mipi-non-exclusive-gpios-bb27e91f31e1
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wi99EfjZrDJfc4ByH5DW5LiPzd+d5x4qqFh6JHJjz+U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eLRR4h1JzI3varWGQUzdBOuYb4wR3+FhGm1v
 VLnE9/MsbOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauni0QAKCRAFnS7L/zaE
 w5RvD/9+qgHJdqEE9cOISLwTNLZEAeePooJ21oZyBXVJ9HzRowzhSVXfRV+d5UWam7pnTBKb86f
 /hFhyRxBYWnnvLzwf5T9W+Dl43T0Fv9vC/BFKpyUBUSlpZaoeCMZ9Lbp6BpPbfbDrs2ZA2GJGBJ
 /4geiGmFb9smNEX1UDPbPh4GytbFkh1ndBf47pkzIDa/5MUN0EO+BOUEWP8R68mdfEa4HO5jkbm
 a9L3eOuYNmI2O5puHkDc0I4VNhzyPvoMZz1ple0PGXsN0ALd+SEQfQb5cfssWQHKRSKDLJJRTpS
 NHPi9eaZ8ArXRDdB78eq26D1KGyt4vnhDA3j6FaD1BEz3pm14WA6whjvELRpXacKqJhWtdkm6M8
 kSRoleVeXCGClALH1TchAdVob+seZx3wqHArsiC9TC0HcdW4fWbjIAo5LXojtBYpOC9Mo1QPDDw
 wncDeDCOSlHLwNIzG4iuCw7EnNPxeSoBam28DzBbje7//AwBqDJrG+ErlZgaIJJ3ansHeIANht7
 jppIqC1pn56IQW16s7z5xpW0u6juotyKmkIteyeDnT/KCxJ4QVV7JFwmwqanBXPN4XhA8LUzWC2
 f8xoCkYRCCBjq84iApk0xhY+vDBg60VIqjo2ylevGDYOaE3CJ9XSK1KmUmBBHy4HnorbOysgo6k
 8ZDVWN2t2ktuuow==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 0faSjxatnGz2MInchbXbVfQkG-pFc5hL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfXymmATnFGSv7Q
 FfvpFBWdUjoFRcnsdd37rk9w6P9cKGtCfGpIoB5KkxAEZR8NvgPOjM71V9VXwhwAuRxO8WmeJSl
 LrzIvFzLii4364BKdwjiOfcYbMvwlpk=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9e2d5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=2ktC1rJDgDHwaXYRQ2kA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: 0faSjxatnGz2MInchbXbVfQkG-pFc5hL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX0WTkIqG7pv5l
 aUewmAUyarblYa42lTNcUZMZ5jzMyoO34fIVsbKDYPVTPoxyGi0oefl7MPSLpR0rJb89eplUsfy
 rWOAa6fFH7Bvi5i8sKKk0IJiGRYtI1oHHkwcFkv/VGJH5IWPP2NySP14RbYh6hcrYe49ID9J3UF
 LYIxt2esUv3A80MjEmB+XDH74OfzuGaF47Qbz3lZS12t+6hwJm/Nf9KBJuF+fGwYWk4NuNKSiSX
 3jBjsTa/NDHbABEH/7KR1ItIHBIYUbQ34ActsIHMHt0uTm6yf9HLIbcygdPX0IJ9dlZ1Ua8PAKx
 lubhR91q9SMdqXcnGB5yN3dVHERYW46fHaLXKQ2JPWFbTRsvQTz+BtNKALiw1Vaz5yK8+HMYU+a
 U7jOVYwHWKtrMUBsbxYZcfV73mpfIpSTHEevKn/DG5JXmK7xw9nhgH1Pl59cm7nYOrosRkdidkf
 h+XHxrpiBDreBSp0REg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053

GPIOD_FLAGS_BIT_NONEXCLUSIVE is deprecated and I'm slowly working on
converting all users to using the shared GPIO proxy which automates the
sharing and allows drivers to not care about whether the pins are shared
(as they should). This series selects HAVE_SHARED_GPIOS for the two ARM
platforms that use this panel driver and then drops the non-exclusive
flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (3):
      ARM: stm32: select HAVE_SHARED_GPIOS
      ARM: sunxi: select HAVE_SHARED_GPIOS
      drm/panel-mipi-dbi: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE

 arch/arm/mach-stm32/Kconfig           | 1 +
 arch/arm/mach-sunxi/Kconfig           | 1 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 +--
 3 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-panel-mipi-non-exclusive-gpios-bb27e91f31e1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

