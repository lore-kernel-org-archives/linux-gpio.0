Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772C34766B1
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799785; cv=none; b=e3QleFITALZz3t8cJWNAct3Aogr5JBUGPfffkdoDNMKgmXzvcV1aAETQg7WfAmQD5K8CKoLqDk2ww7EvNcmBSPL5D7d2ionZMZ3rUPgKIiLzgxFCaHcNQDxtFIRbHymn6wuJ6lHDDXu5jDKkQPvQBt7cHYPRQx8Um87BuVMQe90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799785; c=relaxed/simple;
	bh=KOfinKpMQsa5zSbyZ5FVh9P3doA6BZAOXn+lKRg+jbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZfQ33zhPNOU3X1dcE8hoF0+WUgdJx4L2NNHHmgpGd0FR3GFrrAT/wXmAdohKowjcHD/ymZbgbdpqzSYLuSo6532EErkoSZ8iFNV7jz/hLcx/7RxJOVi5Kh63KnghfsOSCgV4s0sbk1R5NNh5koS+sZKn3EdWuW4nkeeEfklNno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0I71sog; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0I71sog"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so16739265e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 03:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799774; x=1792404574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=n0I71soggFx87zpN+Kp7argQ60LSXxn2BUpQReOSetaejNimBO0oxnef5h9IDY9P4z
         9yphp2LSstrmvvK+XKZp2Km8n2orEZ4YwsruCT2KT0Ffqt5yV5jyd3BcWUIXPd92dKnd
         94Z0zA0w0s/NrHvCnyvk03l1jqbmMKjYNQLQFsAZfyocN374jhdoHn3upbw7h9SiEDGB
         B1cPZkHJtZJxTt97tT9KBJ5u4RZUonoIqP6CpOpPSG+KgFu3HBX/KqD7aR5s9qGO4Lv+
         vmbvf1015rfFuGn3ebpIVCMaHAr4ifkNJ08evoL3Shkbmh4+brN4/mtXrkyMT4o4r6Wa
         YlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799774; x=1792404574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=cfgbG52EYV8mw7tEDf5l9EwxGfG4RMz9XdYZ5Wdjs6cb3TZo7jCfnCGhiM2pJp5igj
         LDDpPhjJPWQ2ZfSNXzpfHNTWAl/ewtSrLK6/4i+ZAHJroAwW0lDwgazLDFiXTJ9qzjLB
         sFn62oR5NL5yFtVvbXxMx8zY57pewa/Ju3zuEQBOnkXRQEN2OsFGBwj94lZe7T0jgmv2
         SzrXxom1p83mhO/4fCmPxstN9FksLzpFrxAW/phqqrpaYNzjHhb1/16SoiWDFubF/QJz
         kQOpdvGEviyrJxM+JcgcOEtC/Dlwd25+25cKJW4Sv/8QDXq5S+stoOBQtnPz/3dT5Zsn
         2diw==
X-Forwarded-Encrypted: i=1; AKwUvBwPeciDK+6LIKXaUs+CeLShS5uRdzVklmQL9fvuhwqB2Ahb0MKOy72Wm9kMdSEtCrgXn67vr6hDK7cq@vger.kernel.org
X-Gm-Message-State: AFq9FYLg4QT7QtORFKdoOd8/etvMBrXGQb+FUmlhM6ZKQVGyIajuoHWs
	55tfhAmFFZtPsMhHXnGNTo+KFkB5ydLiL7Wqm6gb2neMmU/opj/nmFhk
X-Gm-Gg: AYBFou0tMlR9gMv+nJh7HF7GehBvZcVkXfRdOMOZ5KnTsUg2Bvlk7oHjFzA+BfyCEDh
	iJq4jaYH+f6hVMlTet/yy4VF7n9iUXkv7SnzjbQG3fyJYJuNnhwhmCGz0i0bvOOdtzucAYBtblT
	Nm/Italh+dGBCHLKS0NGOaJChV/luq+xbPCwD43hG86qF/wV0ERCods5GFS2dbiFgyHfRQAuFzh
	FTpVfPzn+W+1orVgkeED2bpGlMZ1yonYF2cVl5CAeT0MextSgaWDROaYKhF8JZsP/n7f3uOXBr+
	0Cng+2b78f1Ci0wRJETSHQ/sCo8OAXpv1KIfYrJIttwjRdYA7PeKhjT+WcoBhkSaMstkaMAZ/EL
	89QPOlBzD8dP7xcjP5+9a6b+v4dbgb8E3q37kK3WJ8Zs7uzhtqFkxJ2B2VK7gC9MsUUmb1rApuf
	dJqpkJRYq3uXacVBRyKQE2coX/RXPsJKCHzp6NmeoQY5gfJThb9JHZyBoE4EfgNKJrdJX9nwJoF
	o+X31YTVkFtulqOj7H7wI/w16FXsH9Q
X-Received: by 2002:a05:600c:5397:b0:4a1:7ba9:da2c with SMTP id 5b1f17b1804b1-4a18e4a7cacmr168741805e9.25.1791799773645;
        Mon, 12 Oct 2026 03:09:33 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:33 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:08 +0100
Message-ID: <20261012100816.331033-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 driver takes its mux values from the DT, so allwinner,pinmux
becomes an allowed property here, required for this compatible only.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 45b7a0b6c626..b1f093d218f5 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -39,6 +39,7 @@ properties:
       - allwinner,sun8i-a33-pinctrl
       - allwinner,sun8i-a83t-pinctrl
       - allwinner,sun8i-a83t-r-pinctrl
+      - allwinner,sun8i-b288-pinctrl
       - allwinner,sun8i-h3-pinctrl
       - allwinner,sun8i-h3-r-pinctrl
       - allwinner,sun8i-r40-pinctrl
@@ -120,6 +121,15 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [10, 20, 30, 40]
 
+      allwinner,pinmux:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Pinmux selector value, for each pin. Only used by SoCs whose
+          driver takes the mux values from the DT instead of an in-driver
+          table. Almost every time this value is the same for all pins, so
+          any array shorter than the number of pins will repeat the last
+          value, to allow just specifying a single cell, for all cells.
+
     required:
       - pins
       - function
@@ -144,6 +154,17 @@ allOf:
   # warnings.
 
   - $ref: pinctrl.yaml#
+
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun8i-b288-pinctrl
+
+    then:
+      patternProperties:
+        "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z0-9][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
+          required:
+            - allwinner,pinmux
   - if:
       not:
         properties:
@@ -222,6 +243,7 @@ allOf:
           enum:
             - allwinner,sun6i-a31-pinctrl
             - allwinner,sun6i-a31s-pinctrl
+            - allwinner,sun8i-b288-pinctrl
             - allwinner,sun50i-h6-pinctrl
 
     then:
-- 
2.52.0

