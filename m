Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498914;
	b=3157J8k6Vb7Pqj2CwmtFcMbfezf/ejXy2a53wX/9YaLZDyezsj7x3f6gqj69m44NEx4M
	 IB1vQNvYOL4CcBWtK0mQqiSyShU1ZikQ/xNUf2L7WEEW0VZ0QzivbT+UaP6ToSyVEg22w
	 06dwXf/x0M/JoKp3jM1vvsEVVlVz4lpdtXrscY1MWxZ+3yapOB52/2qQPHAsRPWdYV8sU
	 vE597+gssThrFvmN1Xowv4Fj8KCbYnlejmrkSDfCzb0cl+D8FpcxzHFZeORaiefZakIJW
	 TGblw6Hczl4TDx7d3bzatSGVFbjNQfnpk9i/I1gafjZoYZATDWmcHXLcTr7W4TZTi8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498914;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fX8WGcWxCUS5ZAzxPpUN7u5KfbAJxAtNOT6+xLcO1tw=;
	b=PX04QXYuV+t7f89KcZOzqfep+KhDGtS4O/jpJy/i4P0PX1BJdmJdkLSx4xg75Q6xcD7d
	 7oFQONy8OqkIWG9mw4rzLSeJJ5a2ca6HS6+9RGigL1aPlPGEsClqlNhPzda4I8JjcG1FJ
	 H+RyyBX3whrc7nQ3RJoCKPH+6fQHKm/Ab0iYBT108oakWkG6O936TnNsg1x10JiqkkCt7
	 f3IF4LzBvWWdJ2DGd/cNDeYDI/6DOcmij4123W29Tt9xYjlR3FANMcoX6lTY41tmT5QdB
	 cqDhalj2VUOqDDqBpizQLpx82RdYBhQ7GI+yB52whUy1EZZJNPGKbiUxvSe7O9CyfAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d0LD5mDs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SN6nI+YK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1A8606A321
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 15:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C1A8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d0LD5mDs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SN6nI+YK
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZsxR2594936
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 15:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fX8WGcWxCUS5ZAzxPpUN7u5KfbAJxAtNOT6
	+xLcO1tw=; b=d0LD5mDsj3RJPNPq1nn5JG8LQdJLOPBcSuWB2tmdPXZT28X+sWJ
	53+ebA0Q/5sXGL3DzkCNEIIcdtV2mgS9XjMCSDXNuIf5OrMzYIvsChCgNAPf3rk3
	nuDD9kCg0t/jTzulLG+wGLiOT0smIcHSaFtXtIccv6nPdEt1phTJ/sSDtswDc/0E
	2LolUmA0UYZciMabeAztuyEHhFiHcZmAmXq2UcFnBgkurW2+0/wkUTJhCn4wrbi2
	Sz4UmQ2wDcfSBqxiWu7VdJoybUP1zcznktZNK45lHT5xjYXU80uQarCVNTAqdnj5
	RWiHshUF0bzllw67wSET20bl9czpCqNaZ4g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx3145s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 15:55:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990835cec5aso748757241.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 07:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794498912; x=1795103712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fX8WGcWxCUS5ZAzxPpUN7u5KfbAJxAtNOT6+xLcO1tw=;
        b=SN6nI+YKIVlWpEDXUzhAmbzIzbPMepTcXy6KM7QWzSrefZ7v20JvaEK/6z1Z0YLXi2
         a/WUsFB5hS9cpjlx8RGSMzo7l3CbKdte4ZgVcf6ctkOIkP1QFtjMgPaGhAhiWmXLqSHJ
         DSIEmb/5XWXMjNs54DO57PjNYJXa5VqR8TzU+EWYyt4q2T9GJEswdgDtdT+7+wq61Cgy
         rtXyb2ycumGTkIGbsssj6dYyX+HR2nCBRv78lzFVzIoqFCCQ58/eJmGeZO4dTmgVFBUn
         vGjOQWPH/L8Y7NAXN1hd4FbluN0vV+YV9rRu+3W3HJEtLG+xXj/u7F8jLgBenXhrzbX2
         O2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498912; x=1795103712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fX8WGcWxCUS5ZAzxPpUN7u5KfbAJxAtNOT6+xLcO1tw=;
        b=zHgxak8n/RbWG0jTFEwsyFwqN/3v1TtmnIl6YCiqqJOq5XIIcIgmBI7BY0YytAGpxO
         wshT0X1bE7KKpXMjQKSCjELcJkZTyeOYFtp+ww9EdgdaQeyCtpQFW6rEWTXnrWnMzMbF
         y2Y/y3FIllvUbSRHTsXQjhKAIsXG9ESZjoCbxv7h2MbyTsgmNanQ+CvcRA3VVue/rn64
         G0s5sHqdRQq4h2Qr26NtQt8JAZYAMCFPR+GqJ2EWyhli2UINfbYiD3E99NiLKRCgzB5w
         EJecReUfpSb+2OMQoyhz8ntZP+YwAsGmxMuFG0GihneuerRK7dUROtZIA+s7JecTGfT7
         g2LA==
X-Forwarded-Encrypted: i=1; AL+hErFUXMiaC9XQTTW7DDXqCO5nsQNm9KD2uoYDNZqXEaE4CNCHNtsak9xf+cD6A7G7A7sOLp714HpCkJJD@vger.kernel.org
X-Gm-Message-State: APuU4Z8mZDQnWQCVIFsBRPc6yZmsku2nesl/4iz64Gxw7HTi0imndiin
	/bw61xcrRbB4mbF4UJuOs4OtiloyPmmPBVxDpPdNJLcphAzHx4eeZSgDrGYMPSkFi+bxmfyUCET
	NFaFOtJrxi9v02Rb3D5fz+HcC4rtph79Qvd9qho2jXxcpZiDMMWLNJWmNigOU/A1Rf5PZdIwr
X-Gm-Gg: AYBFou0hRcEFAi0EQnQ9r3Z6ZK5YPUITYzY0KaMz2mfkS3i543HzK1enyoiiLVbXmXl
	6X3EVQ8QKdZjed5Q/ROAATYwos/XTy/cRCT91sgcXU8KrHnC51O1/Ph/C4jN8HAeryPrLo1+NF9
	3AANJ3gsAZk8Zj+34IxYctI48/wiYyio+vhkTNaxCJVHG+zcIVB3vDnt3F1YUtfU4P+BiInGvI6
	SRRJHe0K2cSrnVwVyoOpVklR3UxdaoncSmV72WSy6n98V+UwOd3a/uKPpUNzz2PLB23tD2zzpk6
	Uf/MpfcpSJgYR8VNs/jLqXVMuYXHn5ARZjfiTbYMlO2ECAMJDUZo9aPaJzMtcA0PxO+SVy4MMya
	yMZvYebjQwa9QnXMaiepwrQGiCi7YqjaTBVSFXo+vY+MoeoH4Xfi4sM1erLOENCO+k4QLqwrA+d
	8bYIY+l219Sx9LfpHJg8CuTiV29AUSdXhDw8EGlbj3OqC1yL8Nx0D4yHaP4l1ucA==
X-Received: by 2002:a05:6102:2c14:b0:7d2:cc91:1aaf with SMTP id ada2fe7eead31-7d631828aa4mr879943137.43.1794498912351;
        Thu, 12 Nov 2026 07:55:12 -0800 (PST)
X-Received: by 2002:a05:6102:2c14:b0:7d2:cc91:1aaf with SMTP id ada2fe7eead31-7d631828aa4mr879933137.43.1794498911787;
        Thu, 12 Nov 2026 07:55:11 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm87782115e9.10.2026.11.12.07.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:55:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.4-rc3
Date: Thu, 12 Nov 2026 16:55:06 +0100
Message-ID: <20261112155506.50717-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5e161 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=BQnds3YY0ppyBSQW7s4A:9
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MyBTYWx0ZWRfX3KvG4H+2poeQ
 kldPbeOeRapDjogejQy5YA92m1QMRxuVgPi16XWVH1m/zfHwfwhdDYnr4B8m1h+SSclyBnFEgyf
 bQB4zgkgLWY6tLtrhi4senUez/YidQP/+KoggQcQpFbW1niISIzvy/zAduFwYP3ucjJJGY6J1kx
 q88CEGmZLPmvEGWvHGH7cVZUAIfnDCcHd3omChHsIGPONLfC0piVeGGtPNiE0fKM8RMfYWYAH7w
 qBjS93zAezB7JviqzqQTltXG+eBuktgXE2VxwUcoWOADZ99r6vBJBxK7GGY5KuwDFbxoq4Fhfsd
 ET4nsl1Q0kVzcv3Zsq8NUxhHcu9V50dNyi964dkRAjVLiCxwCT+RDwc75b+uQaMJAS6FmTWCqfs
 Ma1bLuyWUOWUno98L98SFcRuEwPfw2JGqzDuc/gdb0MAGspNsZ8kiSdqhSyEkFXEaW0KVcDGaeo
 nA78s7eeagK2OE9eKKg==
X-Proofpoint-ORIG-GUID: bd5VupzdHk5fXtncFaXRbJX5ACuvJdlm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MyBTYWx0ZWRfX5fKOKT+KMhTM
 dwdWKw6p84Al94eGfOONIy4PLP+6Vn9v8iOLAb216pqh/4e2zgiXGSUi1/tcWqA+457b+FQJZfi
 pBCjlWykv1ZYKP2Di9zQkm8QVfwme2g=
X-Proofpoint-GUID: bd5VupzdHk5fXtncFaXRbJX5ACuvJdlm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120063

Linus,

Please pull the following set of GPIO fixes for the next RC. To no surprise,
this batch was mostly driven by issues found by LLMs (notably: sashiko) during
reviews of other changes. This is why it's bigger than what I normally send at
this stage. It's likely that the next week's PR will be similar in size.

Thanks,
Bartosz

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v7.4-rc3

for you to fetch changes up to f8a4fdf57cedb9cb3f47d94269ff27fea8e819e8:

  gpiolib: fix stack out-of-bounds access in gpiochip_add_hog() (2026-11-12 09:32:48 +0100)

----------------------------------------------------------------
gpio fixes for v7.4-rc3

Fixes in GPIO core:
- fix a race in shared GPIO descriptor release path
- fix several issues in gpio-shared-proxy: race between concurrent
  initial users, dropping votes in error paths and driving the default
  value with no votes cast
- fix stack out-of-bounds access bugs in GPIO hog handling
- fix a race in GPIO descriptor consumer label update
- reset lookup flags on each hogged line
- fix GPIO descriptor leak and fast-path cancellation in gpiod_get_array()
- fix return value in of_gpiochip_instance_match() stub for !CONFIG_OF
- fix potential misconfiguration of flags for hogged lines on OF systems
- fix a reference leak in deferred GPIO controller setup error path

Fixes in GPIO drivers:
- fix interrupt handling bugs in gpio-aspeed
- fix an interrupt leak and two UAF bugs in gpio-virtuser
- fix a UAF bugs in gpio-sodaville, gpio-mpc8xxx and gpio-brcmstb
- fix a sleeping-while-atomic bug in gpio-mvebu
- reject unsupported interrupt types in gpio-mpfs
- fix an irqchip leak in gpio-regmap helper
- fix debounce arithmetic in gpio-rockchip
- propagate runtime PM failures in gpio-omap
- defer GPIO chip registration to postcore_initcall() in gpio-sa1100

----------------------------------------------------------------
Avi Weiss (1):
      gpio: omap: Propagate runtime PM failures in probe and request

Bartosz Golaszewski (8):
      Merge tag 'v7.4-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-current
      gpio: of: fix potential misconfiguration of hogged lines
      gpiolib: synchronize updates of descriptor labels
      gpio: mvebu: fix sleeping-while-atomic in mvebu_gpio_level_irq_mask()
      gpio: virtuser: fix interrupt leak and UAF
      gpio: sodaville: fix use-after-free bug when registering the irqchip
      gpio: shared: fix a race in shared desc release path
      gpiolib: fix stack out-of-bounds access in gpiochip_add_hog()

Billy Tsai (2):
      gpio: aspeed: Clear only the acked line's G4 interrupt status
      gpio: aspeed: Preserve the pending G7 interrupt status on control writes

Cunhao Lu (1):
      gpio: rockchip: Fix debounce arithmetic for GPIO v2

Dmitry Torokhov (4):
      gpio: sa1100: defer GPIO chip registration to postcore_initcall
      gpiolib: fix GPIO descriptor leak in gpiod_get_array()
      gpiolib: fix fast-path cancellation in gpiod_get_array()
      gpiolib: of: return -ENOENT from of_gpio_count() stub

Guangshuo Li (2):
      gpio: brcmstb: fix UAF after IRQ domain setup failure
      gpio: mpc8xxx: Fix potential use-after-free of IRQ domain

Isaac Adjei (1):
      gpio: mpfs: reject unsupported interrupt types

Jinseob Kim (1):
      gpiolib: reset lookup flags for each hogged line

Long Zhao (1):
      gpio: regmap: free the irqchip if adding the irq domain fails

Shawn Guo (4):
      gpio: shared-proxy: Fix race between concurrent first users
      gpio: shared-proxy: Drop the vote of a released proxy on write failure
      gpio: shared-proxy: Drive the default value when no votes are cast
      gpio: shared-proxy: Drop the vote when switching to input

Wentao Liang (1):
      gpio: keep the chip reference when deferred setup fails

Yu Zhang (1):
      gpio: virtuser: remove the debugfs files before freeing the line data

 drivers/gpio/gpio-aspeed.c       | 19 +++++++-
 drivers/gpio/gpio-brcmstb.c      |  1 +
 drivers/gpio/gpio-mpc8xxx.c      | 22 ++++++---
 drivers/gpio/gpio-mpfs.c         |  2 +
 drivers/gpio/gpio-mvebu.c        |  2 +
 drivers/gpio/gpio-omap.c         | 13 +++++-
 drivers/gpio/gpio-regmap.c       |  5 ++
 drivers/gpio/gpio-rockchip.c     | 15 ++++--
 drivers/gpio/gpio-sa1100.c       | 32 +++++++++++--
 drivers/gpio/gpio-shared-proxy.c | 98 +++++++++++++++++++++++++++++++++++-----
 drivers/gpio/gpio-sodaville.c    |  9 ++--
 drivers/gpio/gpio-virtuser.c     | 85 +++++++++++++++++++++++-----------
 drivers/gpio/gpiolib-of.c        |  2 +-
 drivers/gpio/gpiolib-of.h        |  2 +-
 drivers/gpio/gpiolib-shared.c    |  6 +--
 drivers/gpio/gpiolib-shared.h    |  1 +
 drivers/gpio/gpiolib.c           | 69 ++++++++++++++++------------
 drivers/gpio/gpiolib.h           |  2 +
 18 files changed, 288 insertions(+), 97 deletions(-)
