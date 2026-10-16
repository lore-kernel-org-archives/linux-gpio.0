Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678514DEC36
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161697; cv=none; b=nGc0TVX1bOnLbcVFI3nX8ba/UJuo0M4Bn1y3C3RmSScq/jcmoRPDKyLpeoEz+Ab823sItfG7SpjrHNjfjyLpRlMnl3ltVF5lp8xPpWKGwWXA2+Bszi8wk7EOixj5A6jKrWZkUtnfVUC4MRzoIkcxjANRuVEaqLATFF4ZF9eMqps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161697; c=relaxed/simple;
	bh=wsNbpek+NTljF03iIQXsxCSf3wSpZEAjJFyKvkVrFuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tM+qPQSXDbfM5WFWPyZvgOWewx2G+tMaaWNdbPRsVb+/MMGweEzG8QE/KgtPaFk3roJf7c6+WYfmp706KNJlHzp1Iy+i81s2yvACkT6Vga0c23BF+z77joMoZeyqLfR6uiG9mZjTPVYSE8lZj1PMImjAQQCr+j6Rn2yvP63p1eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nhfvBEIi; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nhfvBEIi"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1523844f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 07:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161694; x=1792766494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4FV3FRgo5Fq9ibwyvwR+FrSwQlHm1b1ksNAl+GUkAY=;
        b=nhfvBEIivUie7y+Hv0T/nIUoa9uaqogGZU4H2RKwgV37T+NtCBeiTaIgfrnn6Pkkq3
         V2pGrZSZA1jdSIeB6bI9PBnTJ6RtC69o5qqQsKt1NqxrEexEaUYYGhJWK4FKf+/lnBEs
         9b42VFVP4eOWs2PxHx9SxCJzYBrrV6nq7y+dbCQMSE0FDM7phsdIsGmnPAoNbEWX4Qcr
         i6ARBXvDElt7v+ESM8ySjcFc7pM1iB3yjiQtHcvVme5MTP31F+cy4A9QDH66761Ra+BF
         wq90wgnMXCopZ6gnXH5xVlW8nXtZ/8ZndAikBZMrJjVrjxtYAxRghuh5vU8IJ3uGM5iY
         NF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161694; x=1792766494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4FV3FRgo5Fq9ibwyvwR+FrSwQlHm1b1ksNAl+GUkAY=;
        b=wHDFgso1o6nYzzt144Q7tZlsXlobM9IW3AFd2CN+JEILlq36pO8ffskQiek7vChUxj
         BrR4cLOncWdl6U1Y9hwTrk3+CcPJLxlTxyedqvDE0Y8Rj0OyV+9j1q127KnDzxv/1/th
         SgswFXzx/ok4FW5rTyxCEZsqO/KCzWg1dDbVMIOw5mIM02Nmv25kPgqsdl7oU4L7QuNF
         MFS6BeX/wrxpy0Sez+eVEtyODfmHDdeMiQrVYqbfQCiTUIY2zp2/33wMHnB2juhR/oB3
         DJR8Uaef+2NkAwWOUT4RKTO9jsYr9IBPlMU23OBdvyUa4uTYLUqDRCwe8UiQc+zBDJUz
         CRzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwvRIoCFUMy6eSwYSvbceLQemRn7S/3rodfWdGnjsc/dlZY/Lt2FTfV0VhJ/c/Ctzbq4byUoqy2kfC@vger.kernel.org
X-Gm-Message-State: AFq9FYLB3vfejQyFB2qP1/4mMOA/wgJA09iJXJBfazsBgEM+6P2EapfV
	0oKZ49fG8Fz0Nz9hoggQjVrWhAYkbuv3xSZDRxpgkl2Hksnio6OUNx+pXQk+Hyqq1ys=
X-Gm-Gg: AYBFou2+UMQiLifur9+Ybaw8K1oJGN3tYJrY2aBsi82QPr+mGWIgAt1ilYOy8qVTr63
	5ZiSLa7B/ZOQNN5uHQKMumoTQsLN+qMpoHuXXPDcOi77TfGzrP6eRWY9R8igKpci9pJPABFS7ei
	NnQgaDwfBFKGBHVSEWVw2bitYL035iW8dwfbSkiQdzeORStbbdUWSmoH3HrqVVInZ7I3Vfl4N3i
	cGt2xQxMb6uargeaEbAUhciBYKX7FTaGcwgOIpGsuvjLIQIJxUsKvFc/hSYo/7TOV9PFxwiT0Un
	O+2aFkImsRYewdvDPblsecTCOxSPXifcqblfdavk+gJpjscqAWOMdk4MEdG34QPNOrctD6Dsbtg
	GxSLVsxiEGE3c0639iHDEQJzOxNNcB6qLRNW9SlZWe19Z/rHYBbtOPNIwjDQKPAocQDZxOn2ZVf
	UWhNW3khxaVDTa55ltJvKFz0TVbLn+GHQSx7Xnba9NHv1GA0B5iJX5AxFnziwIpnMDE3KiI3odC
	PjItpFc3klEh1AzxyMJUN5I9oymWrTpSS+7D7GMHtYMVZWvDmOlgKP7JqFvMyLZPUStkw==
X-Received: by 2002:a5d:6f13:0:b0:48d:ff71:dd97 with SMTP id ffacd0b85a97d-48dff71e2e3mr4135577f8f.7.1792161693523;
        Fri, 16 Oct 2026 07:41:33 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:33 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:24 +0200
Subject: [PATCH 09/10] ARM: dts: omap: dm8168-evm: Correct SD card pinmux
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-9-b4ce30217028@linaro.org>
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
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=2104;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=X4wb3xiiISYs6tuR/KwDk67KeYlf9Jq//WgEqEqzrr8=;
 b=A8n3VCROf6Kr5krycQ1d48B8SRfuPvwxe+ZIq5pENuMZnmBMSwf4Q8JrQ6EBlByjeeDxMVjWi
 OyHPdjXZG25B5q4bqtX9PIxqh81UtNS5KZj6mYT6wuQlhP936n3mKJx
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The SD card lines use external pullups and so the internal pullups need
to be disabled so that they do not cause contention on the lines.
This bug was revealed by correcting the effective bit mask of
the pinctrl device. Use the correct macro for DM8168.

Also fix typo in comment SD_DAT2->SD_DAT3.

Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
[ettore.chimenti@linaro.org: squashed after fixing DM816x macros ]
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index 81450e15b889..a6d42766a496 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -45,13 +45,13 @@ DM816X_IOPAD(0x0aac, MUX_MODE0)			/* SPI_D1 */
 
 	mmc_pins: mmc-pins {
 		pinctrl-single,pins = <
-			DM816X_IOPAD(0x0a70, MUX_MODE0)			/* SD_POW */
-			DM816X_IOPAD(0x0a74, MUX_MODE0)			/* SD_CLK */
-			DM816X_IOPAD(0x0a78, MUX_MODE0)			/* SD_CMD */
-			DM816X_IOPAD(0x0a7C, MUX_MODE0)			/* SD_DAT0 */
-			DM816X_IOPAD(0x0a80, MUX_MODE0)			/* SD_DAT1 */
-			DM816X_IOPAD(0x0a84, MUX_MODE0)			/* SD_DAT2 */
-			DM816X_IOPAD(0x0a88, MUX_MODE0)			/* SD_DAT2 */
+			DM816X_IOPAD(0x0a70, PULL_DIS | MUX_MODE0)	/* SD_POW */
+			DM816X_IOPAD(0x0a74, PULL_DIS | MUX_MODE0)	/* SD_CLK */
+			DM816X_IOPAD(0x0a78, PULL_DIS | MUX_MODE0)	/* SD_CMD */
+			DM816X_IOPAD(0x0a7C, PULL_DIS | MUX_MODE0)	/* SD_DAT0 */
+			DM816X_IOPAD(0x0a80, PULL_DIS | MUX_MODE0)	/* SD_DAT1 */
+			DM816X_IOPAD(0x0a84, PULL_DIS | MUX_MODE0)	/* SD_DAT2 */
+			DM816X_IOPAD(0x0a88, PULL_DIS | MUX_MODE0)	/* SD_DAT3 */
 			DM816X_IOPAD(0x0a8c, MUX_MODE2)			/* GP1[7] */
 			DM816X_IOPAD(0x0a90, MUX_MODE2)			/* GP1[8] */
 		>;

-- 
2.56.0

