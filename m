Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774724E2F11
	for <linux-gpio@vger.kernel.org>; Mon,  5 Oct 2026 20:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232097; cv=none; b=ojvPBNnf9ezAt+Osv9s9VJdQ283nn9Nsc/rVWqd50dFjxdHchcB4wNVYwFqQIUYPXXpxCrxOSFHv9oDHUe0HNogivpuX1zZ7/xdijx1Kg7xZDT/5PqGyQJAirYyYBlvFb5wq07ME09iI/xgZrLSEWGy6nuur3IiP33gGcKxs+fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232097; c=relaxed/simple;
	bh=KOfinKpMQsa5zSbyZ5FVh9P3doA6BZAOXn+lKRg+jbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MBrZ39ifSjdewhetELL1ezlfBPoMweVmAfpY8gu45AO0TELK3VAmHZHoN2yY7zc7hRWckk+BHmBzznpsLiJB9GCoLDI+7sAh1Va3hJp1DBA/1Pdm290uyGESIZJy51Mu2lkYyNa0lma5SxIXrpLWqDEN5if8Gsmy3AsHHi3deOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nm7sDQFC; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nm7sDQFC"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acb8b78d6cso3205185a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2026 13:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232087; x=1791836887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=nm7sDQFCwhbhz2fmwEF6zqLMwKE7kqgonfae//3MFeljhPCOUM6HKwAP2xpgLLvVz1
         S7XzFbWE+yLEic7Zplg4DaMC/gmdN3OuRaQAlh61ChaemqP7hgOM5F23rqlfjIuexozP
         V7OFXvr3mKldNnJWGPCWbUW48kRKa2B835qmcgwYsAdZtQZNHxpbrm7zVXm+9jsKS8iN
         C8bS2DyK2l/a8YiYq5qHFkLGJyKVLBkkpynHj3DKhxHCLm0gfYRukptMWrmCMJprxwWe
         vBoFtx+GD696BPJybMj5TvAZCkA0QU/PO1neiUA50cg3UvOeEFacyyzsxShnhKWGTI2j
         xzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232087; x=1791836887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=pxa/4LmI53tR2b12IkPF1TQU5kACODPocjklWpbpNBwOyCu7UuwDUEAE6QypfQdp/X
         ZBQGj4ECtsMorVc6Kh4ECMypntPcpk2TJ9NxsWWgt55O4/MePiKB044g7IYc2/6jO6Fn
         icGy27bif+J5Jn1GWizP5QRJ7jTE4ffcFfWPEoeZ9BKIbuZJ349nOep1iEIgpCrc0uY9
         cbdAv6mtxRwtsKhTeDlO65pRkLEuTzhGsW0kibksyaDpalXBhZ32N7OweT3WR69Th88k
         SrwB7xoPQJewAFnQfYA0r9hA3QKmBsAhGyHm10LnL5y8IevvCB4GJFpaDarjg5ZXmUQn
         6org==
X-Forwarded-Encrypted: i=1; AKwUvBwTAS1cZpEeQBARagxiFZ7J5TOmU8HCi455V3UtGZlibzV/kBr2ITmbsK11v8bSiONTHRGiaZORbWzI@vger.kernel.org
X-Gm-Message-State: AFq9FYJapHC/KsHydLUouaUsZOR6POetYGm4P4XwXwfUDLYm1f0yX6FG
	rPHsH8VSh1bzq/F0qk3UhmabsgE1H86c5tpw0qBrCoYgOT4TMbmp5nxg
X-Gm-Gg: AYBFou2tmCfT/yElfnFL0HIQZd6V4Oqlb1yfxuRKR+R/xq+q61veS1vVaH8YNnYgivO
	eLZYCQwB/d4cQhTukACBqVjTyHy0ZmuPKJD31PZMnf8eFAzOZjX6ffWIqB8zHSBcxO4cAnrnYEO
	JdKhQBdgPWnOC9Wcm4RdvHSuGkVxOvzFOhftrOgmzhp4gCAJSVlfy1TSpFVihmmiKAbueNyG91C
	bFi3uQpfIoSx/SIz/f4s/IBRl+hvuQ+9L+TDBwIgoC64JYcJ1cL5nzjfA35z1raHHgF//ehrwOe
	TIwl2IaYT43ONHqSy+SL900pKCkgHuUa2X1hXTNgGvrvR5YlY76JY/Q1TLOoozlWli9Xm+w131a
	b860dZfEPtnO6o4YChFg+Zoaun6NjlYIPQJiHTmF6BS3cwLsyV+uEAUP5j9BoHScpAoOZrg34ee
	PAkyE99YauZBe+wZ1k4fbgHVV6/ySbB9Gx65Pqhni1kGXy3iwWWj21Mmfxnl+Xr7QCkGJsRim1Y
	sPMj2Y47QLZorKizVlKZhH/FSl6xBgVLw==
X-Received: by 2002:a05:6402:320a:b0:6a9:ae86:bb1b with SMTP id 4fb4d7f45d1cf-6af9e03ded3mr10580275a12.5.1791232087424;
        Mon, 05 Oct 2026 13:28:07 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:05 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
Date: Mon,  5 Oct 2026 21:27:23 +0100
Message-ID: <20261005202731.153971-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
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

