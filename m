Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566763CE482;
	Thu,  5 Mar 2026 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772727100; cv=none; b=Htvw/x50hEldhuisrEciO0000bZWTy/7x2HkKT2xSOGlMiXoe+Q9pGLUJyKrmN/50wXz5H8GiWbJo92JuJ9js4j7HIGCC7DjkTaKbSKUE5lg5CA6d/CtnLqhDXNansOVLQmlFxlAf9BbBB5aV9oFH1MKphOAlygANGCfRF7RJUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772727100; c=relaxed/simple;
	bh=i9w3eQ0zsYY8QgJ9O/z5bZJblS92HhX4ugozB0Nz+uE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WXXD1fscv5DbDgiI5G9CmywxGuiQX6cSzQGzsMgWl42n/khxFRxpNYKSfIs8fvS30ZdCVpENwk1nlaHmE2dw1oJ3cKRnMC5YgxV4GYlqRKvAUbcMKL4YTH3CNBxTVueKQuEVOD34vLa5jCY1tAofi5hdo4Vz59m7XkfaizrwqYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=ODs0cNSy; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="ODs0cNSy"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0FC2A26433;
	Thu,  5 Mar 2026 17:11:37 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D85SDUHLWlAA; Thu,  5 Mar 2026 17:11:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1772727096; bh=i9w3eQ0zsYY8QgJ9O/z5bZJblS92HhX4ugozB0Nz+uE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ODs0cNSyNxHnrLEpnIxsb1JOL3QcWyZEVo0BkPYmQ4gzq2sP5U9fGA7vAY6UCSBmc
	 LuTzRoJbcGA34TyF1ItqAZQ04iqBtpkU3NxVSr9JOgijO5XX4YhRcgEdGTX36NiCLc
	 rYfD4aNd8O7RT/zD4TAUdOLG08YScYpYYcfItmWn620DgZvKbnz/9qaVU58sVwGAGO
	 P6kS8COMGJ2w4jI1OCrFBSEHKd4G4h/YwfHaXyEoLfDcQ0jY+lfl7fGBNHoV+luqI2
	 OdOJrUNnPczOb508jmWT8nGpzUbA4GMlVL5rNBuAfZVoFUvgZ/bTAbXR8jqZmFycFS
	 y7s/EPSESaJvQ==
From: Rustam Adilov <adilov@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH 1/2] dt-bindings: gpio: realtek-otto: add rtl9607 compatible
Date: Thu,  5 Mar 2026 21:11:05 +0500
Message-ID: <20260305161106.15999-2-adilov@disroot.org>
In-Reply-To: <20260305161106.15999-1-adilov@disroot.org>
References: <20260305161106.15999-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "realtek,rtl9607-gpio" compatible for GPIO nodes
on the RTL9607C SoC series.

Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
index 728099c65824..b18f8f0ca0ae 100644
--- a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
@@ -30,6 +30,7 @@ properties:
           - realtek,rtl8390-gpio
           - realtek,rtl9300-gpio
           - realtek,rtl9310-gpio
+          - realtek,rtl9607-gpio
       - const: realtek,otto-gpio
 
   reg: true
-- 
2.53.0

