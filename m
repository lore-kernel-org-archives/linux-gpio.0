Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E10139A04D
	for <linux-gpio@vger.kernel.org>; Sat,  4 Jul 2026 07:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783150774; cv=none; b=GAiDVumRHiUmGNavRQfvyrSaoFBcj8oifYYyIR50IIMdwVOTe6GZTla5LpdfR9WXPJnMBYZW7zrfQyv7iD63+GQGVovq1CForel4HJe8Ut2oTxTm+sIes+DUGbgtKYL9JKSrsSYOPhkX8t7djrW3N3kksHtJReLEpvuS+CZ1j5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783150774; c=relaxed/simple;
	bh=p0nFlcc0G71zRK9tMWoufvLKeY4JW3NRg9nSuniWkNo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tRzFVjEmKFy5EMUaqdBfhTYg5hKxmLuAi/WvESn/h3wSS+ve9WCvl61452F54whxHOEfD+vVK9lxMfYuaN0ku7iRYmC7zDZV3s+d9vuCLiLrET1o30njz0/ol3IQq1Kq0gqiUHW8zJcpHsMz0h4rEYWcJ/I6JiN00y+Dv/J/GxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCFz9/1A; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCFz9/1A"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso7166225e9.2
        for <linux-gpio@vger.kernel.org>; Sat, 04 Jul 2026 00:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783150760; x=1783755560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ujun7RB7FUF9dZLPZwQwz/fZN6r2PvMJI73ZhiW7os=;
        b=GCFz9/1AVAEbAgluk2yKp9vZrPjb9yAg2b200Fg6rEGXLy0/PhKUaphFocoHbZvJfO
         XYJ0Jazq/YnytfwelmGG3snlwIuiHtHLeHUOJUO+eDbZQquzKT48aqK7itkj+UUW4lXJ
         c1oDJEucmQ0GtlCQnfx+dM+CrphtsOJBy3Q5m+OYComWZoFd96nArcYEgIK5QQ3QJr3y
         2PKHLl5HB9Tnt2Ypuxu1msWKfS5w9islgTZKiEOdWfY9TvoCebThXme6ISbRBMkHwyLI
         Jgs7bBRxHhklFUPLScaSwJ6sCASXDE6uwOI+iJcFfewXX8t+EWobAfV2GzHBYFhXbz4C
         E/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783150760; x=1783755560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Ujun7RB7FUF9dZLPZwQwz/fZN6r2PvMJI73ZhiW7os=;
        b=iiX7kWPajkm0LTfWlKbfAB8WprfUkRsGX/PmU9g7Se7aMMxtfjzExaNOAl8pFzWUR9
         ariDt7dQkh5/n70LlIvoe74E+Ag7SBZK84U64RLfr6+LzAe3DR5Pz9eTTrHJG1adGLbJ
         TcasHCt/U0AnU2Vv4QHNtRaYs9lbIwTLmt6yYXUlYd9YtYHnDrFpZ5mqp24nRvgdNtXC
         cLexxoVmp4Xs4bjd4rtU5ZXyjeH6/uAuY/h+89EObJXYF43U6pFEMjHQGsqzl2IqgMTI
         4pkxafDwsW48OLvFgvaN7/RD0xrcwR0qBiK3M8talur3tgm0pbeWNbT0kMxGuYlEuE0B
         h92A==
X-Forwarded-Encrypted: i=1; AFNElJ93vFaeAq3gVt1+iR/a1/GRTii8SeH2sMjClKcXdHCXtEY/Bdf2Jt/gkTjDVczyZ+MxlKKOXGbRXCpk@vger.kernel.org
X-Gm-Message-State: AOJu0YyQDB1UAxqtXSxe4oCuSKgv9g297ykbLAxMTWL/hIXCgqoO78W0
	6OO6XFJ+v4fvExXhqGyKXkz+i1/tC0TnXUYGZ12YreosIfAzuhhe8jYbgTXgyMCl
X-Gm-Gg: AfdE7cnmwtLzT9oNYLo28tEPDkzXtxZqHh7T7wxsL2gbJe3YTX9H5rnSSsI9Rz4+pHR
	wAPYIeF6vd3r55vRxXCjnePqxsiOKzIKVR7bfh1etDCmGR2QwqYt44xbGHBy9kndIFupGvfwLHY
	p2k5d4lsu6223qdSps1WpmfzRc1GC4s1Ml2Gahgtnkki2AMjSkuN5j2SUP/pU81Z1zI4jHGLLn2
	WV7FZzIxyZe/t1FSPeY0FOVlhvpxa5nomml3mqw2p8x06YiRpLNPeY52+34jk8oLyl+OPIlvUUD
	SZtKfNyHzv2XTrsddIG9zxQvdamhBUB4orD5SO/31+gl0NgcmckSqfC+6/+M2aiMfmDxd3LHeRI
	Ud5/Np6r7N0XI4oUPtrW+No9AouiFRb8fkJ2hVdfOk+/aBZ0VRWRJ1MCbaPXFhXSzcb5EhTtHGr
	mqOpyud7Z9z9nltf5TXygIGGiIANSH6mVxd7vJTwOSj5Os
X-Received: by 2002:a05:600c:a00c:b0:490:d38c:7836 with SMTP id 5b1f17b1804b1-493d11d26d5mr25933205e9.3.1783150759893;
        Sat, 04 Jul 2026 00:39:19 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm6565488f8f.7.2026.07.04.00.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 00:39:19 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH 3/5] dt-bindings: phy: motorola,cpcap-usb: replace se1 interrupt with chrg_det
Date: Sat,  4 Jul 2026 10:38:41 +0300
Message-Id: <20260704073843.1750458-4-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260704073843.1750458-1-ivo.g.dimitrov.75@gmail.com>
References: <20260704073843.1750458-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CPCAP USB PHY driver uses the CPCAP charger detection interrupt
for DCP detection rather than the SE1 interrupt.

Update the binding and example DTS to use the corresponding
"chrg_det" interrupt name.arch: arm: dts: cpcap-mapphone: xxx

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 .../devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
index 0febd04a61f4..81c5f3b5997b 100644
--- a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
@@ -27,7 +27,7 @@ properties:
       - description: vbusvld interrupt
       - description: sessvld interrupt
       - description: sessend interrupt
-      - description: se1 interrupt
+      - description: charger detection interrupt
       - description: dm interrupt
       - description: dp interrupt
 
@@ -40,7 +40,7 @@ properties:
       - const: vbusvld
       - const: sessvld
       - const: sessend
-      - const: se1
+      - const: chrg_det
       - const: dm
       - const: dp
 
@@ -90,11 +90,11 @@ examples:
         #phy-cells = <0>;
         interrupts-extended = <
             &cpcap 15 0 &cpcap 14 0 &cpcap 28 0 &cpcap 19 0
-            &cpcap 18 0 &cpcap 17 0 &cpcap 16 0 &cpcap 49 0
+            &cpcap 18 0 &cpcap 17 0 &cpcap 13 0 &cpcap 49 0
             &cpcap 48 1
         >;
         interrupt-names = "id_ground", "id_float", "se0conn", "vbusvld",
-                          "sessvld", "sessend", "se1", "dm", "dp";
+                          "sessvld", "sessend", "chrg_det", "dm", "dp";
         io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
         io-channel-names = "vbus", "id";
         vusb-supply = <&vusb>;
-- 
2.25.1

