Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756622;
	b=oyO5dr+GgVIfIZf71j9/UDtb4Sg6Nr/LkEYgQHfcsBIx8MvLyCdNKa9JylM7AXlWHB/D
	 92cz9S8Aj34gEdizoSx8InnrRjf/dx6Ap7AtGAa1bCQBx6PcTFOWMRv7PzjJG5AWI3OSP
	 F8JuUjcifZYwgiBFl19Q9vFxcnnLmiranI8WcavV451tga0qG5QPVNK21i1BZplIGRodu
	 wEA2iUjZH79ZbrIEDmVjtE+9PtcTufNCeRc4P6phK1lu2QfthGwwsZVbXTa915Fj2PqwC
	 Z+1LqQkVwfVrdIrXaqXDYNgwafxo/PIxW9aqzebKARzVQ2xmU4IxLVxPfTw0qa74mQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QYSnAwHR1vrNUFiRcbl+fsM6n+M9SQnCfusXazqIDBw=;
	b=SJDn7e4pgzblA4TJocmTJ+ncRnSxRZXxFIlowTj6LYKpAcD+4SsZMudLq8k6SnY3o7DD
	 E6FX39+rHt2swaNSzroQsGyurumTYAkbSfESMedvGItcURM8YJSQhMLJmmYNAxFP+6o2Z
	 nCOe8HM/papLKbn+O1n7/fd47ZzObYcg7+vO+u4IzHyPN08KLYxDCI4LrOBmZgbUIFX3W
	 m7Fb/5Qi5+gQsycNGctMJGX0d0YW7ujt9HxWuM0OmfzTY21YNL3GyVwcn5SmED3MKPX1Q
	 99bSRkqzcEGt6QN8xppip8rM9KpFMamP2kQctubGKJpSJqso64sajvSlv91o0GJOlxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RHLt852c;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1705606A31E
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 11:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1705606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RHLt852c
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df54150dfso425713f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792756620; x=1793361420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QYSnAwHR1vrNUFiRcbl+fsM6n+M9SQnCfusXazqIDBw=;
        b=RHLt852c7cE2Fin96m5wr4aGMaiMXg9OKRJFP1JXPyByb8y/cnhAazYnpy73aWE6wl
         60QX8giD+dAmg/j0mdI8IzmhaIfoUH2DLP4qcijW4GMLlvvMDIR+R8aKd7rG4j9Yae7Y
         t9kJ2lh7ZwG4ln43zbo074uum0MNPnMHro0q9rPPXYcSauTpBhZh1bP3EcVgxtTe6l3p
         45+ZgytZyVoYqzcoq+O5/VU15CTlYNwkE+FG1fPcVdNP0GmRMfNl1XhkcM6FsWHBfj/b
         fuJyCL2Wk1ag7zZ+lrweQlkFxbdE/vxgE7rLvxYYEMIbU8743sOk15k+4SOAQwq/HfRZ
         t3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756620; x=1793361420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYSnAwHR1vrNUFiRcbl+fsM6n+M9SQnCfusXazqIDBw=;
        b=MPcEY9GBl+EWTVr2uvsZo+Fn6v8LGidoktJeXZigI+Xd/covun+oKvVX2nP5m3iPLa
         w+p+qdb0rEzOBGpTbobxmy472zl5pxe3o9XnxzWwp8mncPa/t+94H34lutdLTb3wvZQ2
         sQaDNzWSDWcAcE7t5JligpIUJud2NxKeZn9LzN/JV6ulrhRoSFWGymsd8vzOfB6QxUMY
         qsqJeAmy6S478Ggb7cvhG93Rf32+0t5dunAA6aSaGNOz5vHHxO++zim9m8U6twurwzcN
         qznKy1fb9XS6mMLQbkpqNKMLBHWwmOszuDgYOHAaseat39qY3sIrWVIZw5df7qHDAnlc
         +KJg==
X-Forwarded-Encrypted: i=1; AKwUvBx3lqQB986/RuAO9+CoaVqTAu0UFBEgdu1atnZ9i+g63v3tneIVTQJM//HBOWqeN99VXKwZFF5VwNjU@vger.kernel.org
X-Gm-Message-State: AFq9FYKAZz0wVVLvdbPUOuTVO2JhqVM28V762c2oW+jBLm+H9mMuOPdU
	P6SXv/um1IWZ5oGoiRlz40ceSAeLOAKaLntu6Dmu6i8I8hLo1SZZcyQU
X-Gm-Gg: AYBFou0zw+kgqVvsQqKgHJi6hkEwU+1mNxt1SRSs8MtItR2RB2mWr2DIYD+ARvnRUX8
	PS98vMCfRlRq6bojdwmY1t+PRfufliTugapW0JXPYh3KMc3kx0fFX1fmf7zsuunEJkCsnmIXZbP
	GTAbHtGzyU/prGMdRD87q3f/7aPherOHVBUXUlgvlaGC91ZA+rskTLKTc2QI0UxUPRrDGyFkWhW
	9aBH4LWtORq2FZv0uozuPN2rQ5YPpTK/LCE4LuIUN46D5BxLpV0SVlSm+XXoPmC2Kk5/IUuglq4
	bz8Z5HHuMIc9LEPthwD1gO+A+u7XtLl/gLRlxIZHhCMHyn66cmiuJsxZE8gu0D8uzu8fdS8KhFo
	vXY9ArilpjkaA3bVv6f8wz4iqvWXvENEh8uUXdqSYe0KlWtf3iTdnLCe/JHXUkpo8b7o7RysQzE
	WS+w4mUx9w9epA0fdQB/RDNawY0/JZONN87/v2H5HF+9Z9s7SY7JOopT1LXkq0VOfrZRiWRagvR
	4UTDtEsPSE6QFXBSH1D5TEtgGl3JfCWauVi2uFwd1LmUW/F54XMqe0xximT4mjCFdKTcbn+Yxdb
	dQtTPLGNLP3NZZ26ExrDTjYy/U6l0BrRuxSg0xdizGU+J6xbnjEEWquYgB+B
X-Received: by 2002:a5d:5d86:0:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-48e385ab429mr3050979f8f.24.1792756619921;
        Fri, 23 Oct 2026 04:56:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e380310b3sm5076321f8f.22.2026.10.23.04.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:56:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] dt-bindings: gpio: fairchild,74hc595: add support for nxp,74lv164
Date: Fri, 23 Oct 2026 13:56:48 +0200
Message-ID: <20261023115652.700765-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Document support for nxp,74lv164 as a variant of the currently supported
8-bit shift register with the only difference of not having an Output
Enable pin and a simulated Chip Select pin.

These basic 8-bit shift register chips directly change the outputs as bits
are shifted in. Particularly used to handle multiple LED for basic state
feedback.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/gpio/fairchild,74hc595.yaml       | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index 451538df63f7..0d5596af0ced 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -7,9 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Generic 8-bit shift register
 
 description: |
-  NOTE: These chips nominally don't have a chip select pin. They do however
-  have a rising-edge triggered latch clock (or storage register clock) pin,
-  which behaves like an active-low chip select.
+  NOTE: These chips nominally don't have a chip select pin. 59x chip family
+  do however have a rising-edge triggered latch clock (or storage register
+  clock) pin, which behaves like an active-low chip select.
 
   After the bits are shifted into the shift register, CS# is driven high, which
   the 74HC595 sees as a rising edge on the latch clock that results in a
@@ -22,6 +22,9 @@ description: |
                  ___                     ________
   chip select#      |___________________|
 
+  Other chip family (namely 164) directly change the outputs as bits are shifted
+  in.
+
 maintainers:
   - Maxime Ripard <mripard@kernel.org>
 
@@ -29,6 +32,7 @@ properties:
   compatible:
     enum:
       - fairchild,74hc595
+      - nxp,74lv164
       - nxp,74lvc594
 
   reg:
@@ -76,6 +80,14 @@ required:
 
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nxp,74lv164
+    then:
+      properties:
+        enable-gpios: false
 
 unevaluatedProperties: false
 
-- 
2.55.0

