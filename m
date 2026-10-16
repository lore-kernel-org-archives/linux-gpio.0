Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ED74D9549
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161693; cv=none; b=C1/mOmw+QOJbhhuzeFDqHGFKJ9kerir6H/2W5na0z3VVDKOXhizu5COzzWSZ7MFoxHHE4/7nhol/jttooHngj8/f7+JHo1z07gPg+Op3y1RyLyP20yciwablxg5rVMHl1O5k31zsOm1Lhnj0oviCvDxnfyQ83+r91fpIxaxSpbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161693; c=relaxed/simple;
	bh=pDlen/zLNF5pSkc+7mpw0u61XUlwNOOWig4yKnoWWnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lof0GS3SWADF0/IS91zfBQY1T3LojlXzcJUHssw3EcHMxReBfwtTiydAeYeS+CfNKJHJWJU31MnQ/Ij8knA8vq42JhfHT/GjdusfkDCzStGv9B7uUb9bZp7ZWyk323CM5bfX3lyYHWn3dNbXLLu+Wr6qgT9xQepMYVWtodwmK4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u4EZn/3T; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u4EZn/3T"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a01933b584so352155e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 07:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161689; x=1792766489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTWugQ07RJZxi4zUckj+Gcw87y2zOdheX+TP0+T7qDM=;
        b=u4EZn/3T+UlQiiCm/lEbwiBMzJvK8oUXt6fBCy8fdc2M/fEQ9wESjhRf71Wm5NLtCc
         CYyriEqJFoGdoCvlFCmbcXCtDdg9X65/k4ex9UfFdGc4GwWu/U3tosXBDA48tdrXu80d
         vpU+5lrxRM0I+pIhpICx3oAygsVQFI27Ez+yF7zaOWSixY1NzZhb2ObvIFeNkDPuZnsI
         zDE5QOYN4risy2FaXDLLD1TBfYr16t/dCCMT+06CTL5HbgenlZrdCk7IMqYFQhzCoa+p
         UD2VCUkCXUR88Xh/WKjG7RQ9bKz0LUicFvtHlGwlWSV6ECWciSHYU4WFz6FluJl6oSzn
         rGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161689; x=1792766489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTWugQ07RJZxi4zUckj+Gcw87y2zOdheX+TP0+T7qDM=;
        b=0j/N/tgwoY3CwJKVPcwvWA3k2/u2irDacxbN/CyWhrgpRNCe0G5EoDMWsSz4IP6/wm
         0SrvJaN02mmXy1dWlpW2Ey3znu8egBXzHpVrWcc+SK1obiv+tFPfmxza3+hm51KKknn6
         WJ2x3RtWbhpDfyCxJHrQdfqkiSRXOrjgiaq/xbw5T5XiViEEmvjGtkSrq/GMKrzXN3A2
         2O6z2zSuyQedZX12tkxEq0BBdsRVMJ4mPnJE00/XgOHTAkS0ETLBUL0O6c2vNHXXHZID
         e3oiUOFe2KeA8aKhIXQ6HJ9jF1QUHwfmzq/aM2p62d0F1nUNWTiMguNGBuHgG3PYKI5k
         R8Ow==
X-Forwarded-Encrypted: i=1; AKwUvByblytwsu6XrUsblsKzl4thm45t8ddbGre0QeOl6d4LdWGWdWVi5Y11OJWH6e/+aGQqE5EvkrCFupw4@vger.kernel.org
X-Gm-Message-State: AFq9FYKOtpLIv1chkYeBCU57KnsAFU4MUa3kIgcH2HgEaj2ubunzLO6J
	wWF6eWX8s5heW6Ddk1Fg6Bk3tFuFE7zbbUHFn1wYPCj6IJQXZeqbnSpqMPVxaJyCbus=
X-Gm-Gg: AYBFou17ToZ2CDGzjgcn2vaURF+YnKkUJDABqvQQtrvYzRl4j1v2GFCNro49AnJUTpX
	LouuVrXNumDdMYXeTZqCHQIdsIg9xMCis1kiOj1HBITxRoE/4xzD3Su2n/K8CXQ0SP14Q2eQXGc
	O8zgYGxS9gx4g1hlcIx183kGBTUY/vW0VCaSkKrQ1NQfWQ2C60Qae9rP2iJ7R76SJtsJYcK6vTt
	oItg3xYiBP5hcRALF7Gz5de8Y6dZ1fU9C2xzqVscXE/u81e1V3lZOJkqew62DVXHI+jNxX2IK14
	A7LmHau20w2gJ+19MHit3MEcgI2WO5UV6Vbhcu7pzZWZmS/BslBMMAukeBvm/lwh61BCV+zHre3
	fYs28cECRd39idiAKT1o0pY8GKye7wDyHaMGULJp6F5WRA5yddqZ5/DIUpQ39sC1L/pwcKTGbcA
	YlkHWazqAwCyeFCDBCZG/TPqrD2OKn80amhcGg910cZAQc3lMrEY6u5ERZDc443cbpx80Ve/IhI
	mSvSK5lBZTcIf3RsAunKv9JV6EqMVBP4GFEq7vAxtRTMm+bdOmxUmVuGbOwmEXxUuLBN2geObQ6
	ZXrw
X-Received: by 2002:a05:600c:3f06:b0:49f:ce78:356f with SMTP id 5b1f17b1804b1-4a18e4ca2acmr446522045e9.32.1792161689564;
        Fri, 16 Oct 2026 07:41:29 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:29 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:21 +0200
Subject: [PATCH 06/10] ARM: dts: omap: dm816x: Update USB node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-6-b4ce30217028@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=2792;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=yeoQMJZLdXTsEHqsBY6ksgO6GV/Huaox9D+QkSIjjJY=;
 b=hUsC6e73gt93LP3x/KbW6rl4RE1LBMRpaoGxAroE+S6HI6fgnl9crEsTbyV+xHq8m7uXraUxO
 l/v11BMwtZwCUNC481i6cYxwKSFdFrUcMGh2iu44yYm72A4iIqYpC2T
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

USB node was not working correctly with DMA enabled as the supporting
code had been updated without updating this SoC's device tree. Bring the
device tree more up to date so that it works with DMA enabled.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 41 +++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index 7f3ef3a00ab8..5be9efc60785 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -574,18 +574,27 @@ uart3: serial@48024000 {
 		};
 
 		/* NOTE: USB needs a transceiver driver for phys to work */
-		usb: usb_otg_hs@47401000 {
-			compatible = "ti,am33xx-usb";
-			reg = <0x47401000 0x400000>;
-			ranges;
+		usb: target-module@47400000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			ti,hwmods = "usb_otg_hs";
+			reg = <0x47400000 0x4>,
+			      <0x47400010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <SYSC_OMAP4_SOFTRESET>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_SMART>;
+			ti,sysc-delay-us = <2>;
+			clocks = <&default_clkctrl DM816_USB_OTG_HS_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ti,hwmods = "usb_otg_hs";
+			ranges = <0x0 0x47400000 0x8000>;
 
-			usb0: usb@47401000 {
+			usb0: usb@1000 {
 				compatible = "ti,musb-dm816";
-				reg = <0x47401400 0x400
-				       0x47401000 0x200>;
+				reg = <0x1400 0x400>,
+				      <0x1000 0x200>;
 				reg-names = "mc", "control";
 				interrupts = <18>;
 				interrupt-names = "mc";
@@ -622,10 +631,10 @@ &cppi41dma 11 1 &cppi41dma 12 1
 					"tx14", "tx15";
 			};
 
-			usb1: usb@47401800 {
+			usb1: usb@1800 {
 				compatible = "ti,musb-dm816";
-				reg = <0x47401c00 0x400
-				       0x47401800 0x200>;
+				reg = <0x1c00 0x400>,
+				      <0x1800 0x200>;
 				reg-names = "mc", "control";
 				interrupts = <19>;
 				interrupt-names = "mc";
@@ -662,12 +671,12 @@ &cppi41dma 26 1 &cppi41dma 27 1
 					"tx14", "tx15";
 			};
 
-			cppi41dma: dma-controller@47402000 {
+			cppi41dma: dma-controller@2000 {
 				compatible = "ti,am3359-cppi41";
-				reg = <0x47400000 0x1000>,
-				      <0x47402000 0x1000>,
-				      <0x47403000 0x1000>,
-				      <0x47404000 0x4000>;
+				reg =  <0x0000 0x1000>,
+				       <0x2000 0x1000>,
+				       <0x3000 0x1000>,
+				       <0x4000 0x4000>;
 				reg-names = "glue", "controller", "scheduler", "queuemgr";
 				interrupts = <17>;
 				interrupt-names = "glue";

-- 
2.56.0

