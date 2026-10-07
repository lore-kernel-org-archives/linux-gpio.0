Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30DC495ADC
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376817; cv=none; b=GvhnUHNaCEESZ7HaHtbjPlLAE9kTQlrDwpeLJmflovOdW0m0vZxlmBDCQyGkxTEVZKNT7vub3f9zn7825R00g8hNAvpz+qtlhYtedFzNzJGGUMk124cwEWz8gofK4mm6KNV/yoemGNbv8/gD6Pf8emARWSkE2xzz6wBPTfJFLBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376817; c=relaxed/simple;
	bh=gvlnRPbIuQpBNlIetJA1tcoffwd0qPM41kLziATxBNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cfGI1lQeHhKa4xuEMG5RYyZOhkFoC5On1jchK94F/Q7tp7oObEUuuleQ4XyguwFshMtiiwegK6PdmiFthLYed1tKXNM2hB88JqVTCPx4Hd0+s2VTYZcHDUtze5ZzpDFvIKAZQK3Ml4ZTCmuWk7J1v4BbYBZ7pyWFa7WnUnYrKpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTPXz2PY; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTPXz2PY"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2dfa54c8ccfso10190005ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 05:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791376807; x=1791981607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJssbI+xGs6ktfsC6Xw3DX5y7Ljs3Vvy25+XSMvy+cY=;
        b=XTPXz2PYjgwqLYr/+KzYv1mgR6TQ93ZOQ85RnJchI3nMOQx5cq/fwUHtAESlF71XpC
         a3xa3vUXerbShiA9FAbBNBLA47tv0zHBqfvwnYMXCEFXNCgParFFax+RUqNx3AjCjVoW
         a/in+Mqzf8rnhDp+F5+FP0kff69nmS8C+JjFAXj8LESgMPc6xbSbl3NxHFzpIKRx/c/S
         Pl+AjSa3nVsP3qpxY4EiXrtTVAgU1bwLS1J0EATgr6XHYJNAx/gnIjAaxPdp7kfV07bf
         dnT/SZlAA+VmrdCp0JLcachYIElvHzfo1Tmzc0wTVF0Cxe2GIDOdbfev4TmWuHZa7mIQ
         qF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376807; x=1791981607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJssbI+xGs6ktfsC6Xw3DX5y7Ljs3Vvy25+XSMvy+cY=;
        b=MN4qUFm5Cp1+VPXETvMLv8K0yrPOurYZ19rSugKWxZgUjsSc8B9NjPz5zOVeImn4Z4
         3ekBkWO/Dxdzbf3eVFcAcO6CsrQu8Zh7skeKRIPEHJr5m6ZwWNc4w3vAbaaEAGewLsA5
         FEkqYg1b2HZe+fbJEnsyQr27BRDmvFwbhKrlp0F2ZBJh/G3Z9rJ1naozDVZzc+iPyDqd
         JiAcsXscbi7mUHUdxv2WIeQSIonIeqCFZxnhXrx2rBl0fjC7kMqXa0OBvjRxTRlXiPRl
         5CELMNH38s8TVRkjDj+U5V+H6lsy8sEvHVoK3WZUTerP9f8DMnRuFmjWUAmiM9JM4MhF
         kxrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxx44f3vieb1i4CRiT0nzp8w5ZhDjocNK40jPJNoGC/vSD54YXdqnYj5GwYgSbAm10V5CqVEGSk2Y7H@vger.kernel.org
X-Gm-Message-State: AFq9FYKEFifAWpgcUDFTyFJp3x61D9IH1kuKw/rNF/oYXPRxKq2xYphn
	JsBj+7VlJ75CIAjj1QPnV5/39K6Hss/uK6z0blsztYDMm7WPCNl0VHsq
X-Gm-Gg: AYBFou2JBwv7LHLbyeENXlNu8HZUXbw/c5Fi/k9sSyfU0YYVmYLFzy8t/zf+dEKiWjb
	8PhahjPe57R2W5x1qL52ftSqmGCHx6soJi9EHzi6+B6M++292Raf4kybVLpAKn8tnUnaWIgMbQq
	BYJ/DjwwVzDRoTds1PMA/IWHrEoHaXTJLp+r6jD580Cp5e3bRz8MbEuLD1wBhMUr/J2gvN5qTlb
	IlSqCVaq3LU/MCnm0j5yw3fa+JX4lledUeG8XoxTpJI53oxl36PXDNKAjMzu/yZNISARGFephOV
	Tr31xwJiQPL67ddqPJTkSU4zrssSDWjlodhqAGzROEps8WMAXE3VCN+jfAjTenxkMaCiEUQryF1
	BxTYKhNp6RgrbQp7UvYImx9dIXrSZ7CaSYPT6BZvRdSabLqjmxfz69xDEijyOgPSF62IYuXGDpi
	fJQUirV92bZbTUZPtBR4NCbZ1F15l9e1VGsLS8qm2ISbNI5HZqBo4GvWA2Fifj7SXReuAo6soDT
	vjEVISLnPMvlTo=
X-Received: by 2002:a17:903:248:b0:2e3:cac:3868 with SMTP id d9443c01a7336-2e60050922cmr15218765ad.24.1791376806392;
        Wed, 07 Oct 2026 05:40:06 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fd284sm9675095ad.15.2026.10.07.05.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:40:05 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: andersson@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org
Cc: konrad.dybcio@oss.qualcomm.com,
	jingyi.wang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: kaanapali: add the I2C strong pull-up bit
Date: Wed,  7 Oct 2026 21:40:01 +0900
Message-ID: <20261007124001.1724-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kaanapali TLMM has the I2C pull-up control in bit 13 of the pin
config register, like SM8550, SM8650 and X1E80100, but the driver does
not describe it, so "bias-pull-up = <2200>" cannot select the strong
pull-up.

The downstream kernel sets it on the camera CCI pins (config 0x2007).
On a Lenovo TB323FU tablet, with only the weak pull-up every CCI
transfer on the two sensor buses times out; with bit 13 set the sensors
answer and their chip IDs read correctly.

Fixes: 35ff9c6b318a ("pinctrl: qcom: add the tlmm driver for Kaanapali platforms")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
The board uses it as "bias-pull-up = <2200>" on the CCI pin states; the
Kaanapali CCI nodes in the CAMSS series (v18) use plain bias-pull-up,
which keeps the weak pull-up.

Tested on v7.3-rc4 with a test switch that clears bit 13 when the pin
state is applied, rebinding both CCI controllers each time: with bit 13
cleared the two sensors and the VCM on those buses failed with CCI
timeouts 3 times out of 3, with it set they probed 3 times out of 3.

 drivers/pinctrl/qcom/pinctrl-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-kaanapali.c b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
index e95ac064b84c..e9351e29d38e 100644
--- a/drivers/pinctrl/qcom/pinctrl-kaanapali.c
+++ b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
@@ -37,6 +37,7 @@
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
+		.i2c_pull_bit = 13,		\
 		.egpio_enable = 12,		\
 		.egpio_present = 11,		\
 		.oe_bit = 9,			\
-- 
2.43.0

