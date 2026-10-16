Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425DD37755A
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161685; cv=none; b=NnZRpHuXhj4xuZAl4mH/j048xAN/yeOxceSfDkqwUWmnwQO8SjY38ZeFbCXBVQwhKWfn+SvsUvRT1D5/0UX0rDmWZr1fkMC6EIRhz+Qv3LBbGCQBf33OvJg9KlIO4KZNOkchozbTIgR5Xz3QTQtOKioA2KAZfNu25AHlqdtSN3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161685; c=relaxed/simple;
	bh=WZNjPntmTxKB6PnwoW9tTwXddGro5Tl2X0NnzaRRwkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B10Iai834cJWQfhVELcssy3u/ZW3WLVmg+WKkqWx1p0v3hYxiLoaBOLhi5pkAqNwW53aYftZ/HLViDraSx68vUXDk7s95BtQgAvtlRJRo/+a5WMKFqlVe5MdhGO57+EOfvUFJnkMBcuj8hHK6bTgd87/6H70rSrruh8rRbf3o18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MqKaD/wd; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MqKaD/wd"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so708528f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 07:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161682; x=1792766482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/7VUpAGcux4fjxIdlTVJM8GX+izz1YH+HzRtvPUJ78=;
        b=MqKaD/wdSsX0fGn/qjcGxznbE4DDVX5Vuv/qRP9lUxDHhm5ra4oBvmEwABBF2UGKgy
         0IwFFzkqpXQtRNp2hcvXdL60Tlz5PMzMZBt/mn0WFgPUFapxtxHeqyqkadJjWGLapUTY
         p+4UcKzqeIuGv/QYiBfefFUE0bQ7ohA9g2A954GGIg8fnVuRaBDFuRX7YhwKHwADhGf0
         yApBytXdUuqR+Upt+uJH6SlplIabLkGbmiM46IEt5QpFiFllUXltW6FYjlfV2+DzMvh4
         v/9Dan2Zlt6Nbnj5D+lXuGwTCqY9eWb58Q0cnjBoq/q/tGUUE1TadR+MfQUAT5EW/BjO
         XWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161682; x=1792766482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/7VUpAGcux4fjxIdlTVJM8GX+izz1YH+HzRtvPUJ78=;
        b=xw/W2MCf/vxGK4ehjm2Vee/tHefvHAC5fX8HUFaUd5xH4er2UM9bFYgnAT508LwuXn
         16xIG1Vvlimesqu9vdXotu3N3OLLV92a/LL9gICUrz06Myqd3ubki320V4iJBNBAWImD
         wq4oIQM+NdN69T7pRqBbUJy+B7edmEZYnZ3Bwu9rtTlYrUr71LXo8t0YA6BQ2VV1bGZ4
         ngohbc52EHck7PsCxIOyXab3lZhZhvfAMPfDG8mouKeZGSEWvoDBD3Qmr8XgUOUiecoW
         pJPufCYE4/98TWB41VhOlpzSYP2NHek+5ZHLqibJymBGs2ghkZS4bdywW+txJ5Oh8Ry0
         BB2A==
X-Forwarded-Encrypted: i=1; AKwUvBwxOz5x4++jFTKEC4VviQrEvSo8THzlmgFMW6PX0fs9kPYlNZjt7UiUNflFobzhSapnZ6uWa+Emwe9C@vger.kernel.org
X-Gm-Message-State: AFq9FYLa84AsWq+v9iIvzdETL/+Y4hluMlIgtOOoj7DAvnbaW7rMzeOv
	u8MxTAy2bQoObqvgdKp6olVFlSwSvp2PfFmhHfe00Y3snLwsSg5Gwjj1K0tAg5o9JAQ=
X-Gm-Gg: AYBFou27/HmkgrGlFp9+fHEv1Qop1cwz6S+igG+L5QdHiLcRBfe2tXQJBOh9grIGevy
	gvfnyVYoNnqwQEcPdVPhLu56E+0qUwR4SYr+J0IJr6U7BrFOCTnUeME1S9JfenmmFwqJomAoPkX
	r+TtNnyjcx0zRHGGXEz27tnPh1pMbxIRLEMqVUAZsNMlT6ka/yXoPXZm72mm+SH062ZWJs16BOx
	2fDRTSrtHgSLt1WmsQVFWooBJISo5Sb3V1NX9z6n8xp14iC+pedgf7shKjcQcwNP4ovFJYmjrNW
	jV4etp9JMMM4QI1lfZtPBjkQYbW9aIuXf1Sk9a5xSRttwhtODdY9hKNJ8OumnNB0C6gjpVKn9Jz
	ZV7h6SmnK/ba6GKYSmFTrAHiy1/U0tFeewQ2hjTvn6vEqwg356Kk4Iexp+rdiEnM2c5FfDtoPcr
	cuDJHr8tmFyrDnoCRSwONYYrWSlaQTkhS0oKG8cUpXLERWv9y6cfba+XDUEI161+IdY0oTGe9Ul
	CK+W2wVh3GSOnPDS+EyhHGI+k2HDkxUsyXfM/8fMmtNWi8DScENvQQ1sU/wsRJFS76zwfQ=
X-Received: by 2002:adf:edd1:0:b0:48d:f1ab:faf9 with SMTP id ffacd0b85a97d-48dfae1ee24mr6334662f8f.16.1792161682381;
        Fri, 16 Oct 2026 07:41:22 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:22 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:16 +0200
Subject: [PATCH 01/10] ARM: ti81xx: Prevent USB being put into idle
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-1-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=1058;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=vkbGDt2t9O3PEQmqq3WpWoBfMDyf2l0F94OzzH0Lqck=;
 b=G/D+U2sPat3Xx8BIZaPIsfhCX1A7J15eqsyRChroWg78s4J3EXHdoTbuWHyx0L7PknTnAfqwn
 IH65RPB9BFLAvsjLEHx+wXWjp9HH1vccFQxAVZoS1qKHUm/WAA8zm1l
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

There is an issue with USB being put into idle with DMA enabled and that
is mostly prevented with usbcore.autosuspend=-1 on the kernel command
line. Stop the ti,hwmod code from putting it into idle by setting the
appropriate flag. This stops the log entry 'clk:0058:0: failed to
disable' being generated.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
index 9b5c728fb7da..2f55dc32e150 100644
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -650,6 +650,7 @@ static struct omap_hwmod dm816x_usbss_hwmod = {
 	.name		= "usb_otg_hs",
 	.clkdm_name	= "default_l3_slow_clkdm",
 	.main_clk	= "sysclk6_ck",
+	.flags		= HWMOD_NO_IDLE,
 	.prcm		= {
 		.omap4 = {
 			.clkctrl_offs = DM81XX_CM_DEFAULT_USB_CLKCTRL,

-- 
2.56.0

