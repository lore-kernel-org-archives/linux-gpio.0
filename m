Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4900353A7E;
	Sat, 26 Sep 2026 14:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790434338; cv=none; b=HBT3z1jQYtMfEfFfMTMTM/YE7V+zmSJR2xvho8zANxUe9ht55DbFpnuAGtnhGhlj351iqKBhTeZlj85gtt2+AWqQGDppurRlduT5mU+HujxkaTdzIzIN8uh1JOQOV8Sy4poO1nd9mClqYlnz/aj6vWK2ZNCz1rNnR8fYD3DpdnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790434338; c=relaxed/simple;
	bh=W+fJf5thKUUuSW4ejZfvddd+wOysb5gxwcWpFAUaACE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MI/qZ/xMgWUIoghoGN08UDX8x1SLrUCY45comXe18tcrfndeNH3krpArRokDbUjFPfEqpTnZUUs5wlGh/GdPYYW0KpiMPx05K133ApJ/wS4eNaVr6tL7ZIULcsyvtn/rV2kK7KFgveewsIUuZzOLIbZKg1Q6oISVlZ0+FyantmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=DQAhH2ZA; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="DQAhH2ZA"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790434328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XgN6b8D14rl9Xk9OFZqu9qpCw4GNdvG/TpBFPo8UFbQ=;
	b=DQAhH2ZAqIN7QQBnxXDzaZyP9sinunuyfonYsCkzWN6AtTE7nHXnSx092lzacB10qnQ3e1
	uKOAYNeTL52yfr+CLhfJPhpsqoV4f9sLSASHaXd2zRr4IMhP2l0d/uu9SG9tWhKr00brIT
	jQmKVSJOH3igDw5dZrbjQ4XKhINjqgY=
Date: Sat, 26 Sep 2026 16:51:45 +0200
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: apple,pinctrl: Add t8140
 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-apple-pinctrl-t8140-v2-1-620bd11cd2a1@cyberchaos.dev>
References: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
In-Reply-To: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

The pinctrl_ap GPIO controller on the MacBook Neo crashes upon reading
REG_GPIOx for certain pins. These pins, which are also listed in Apple's
device tree, are described by the gpio-reserved-ranges property.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index bc6d41b63b5d..f2eac9b9a727 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     oneOf:
+      - const: apple,t8140-pinctrl
       - items:
           - enum:
               - apple,t6020-pinctrl
@@ -52,6 +53,8 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  gpio-reserved-ranges: true
+
   apple,npins:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: The number of pins in this GPIO controller.
@@ -90,6 +93,15 @@ patternProperties:
 
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: apple,t8140-pinctrl
+    then:
+      properties:
+        gpio-reserved-ranges: false
 
 required:
   - compatible

-- 
2.55.0

