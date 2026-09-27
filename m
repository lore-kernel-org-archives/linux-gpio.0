Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E761917CD
	for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2026 15:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521920; cv=none; b=PkRNXA32O8iAfo6W0yOqUopOVe4i6uHmT4B+PgiLigDqp4qPxcNUecGmn8Jr1bm0SU0szkHh52YQaTZIOzQ9q1n8oD+bugSGU9XJi+W1faCtlwaj9gFzEfIGwTY88mF/NC3vs8/AZ8NdPshZZynht2jPFYmw300F/ADNDZEa31w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521920; c=relaxed/simple;
	bh=Ai/Pt6iwST/hPrf66UHaVA/fpcI2B9b/ey70FIEcV90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqn9z162JvnpjcVJVDc+u/znQprOd0hbVRCZB7uayGb+wYFZfTDuC3ievkMnY2LnjpVSR8tcwVZC8hS5y8c9Dqd+rUew9LsOtvc1ueqN2hcZC1koEA/FZrUn7S1Bi3JdUlrbBLDpPkAhw5Gps49AQmxgJFxR8iuws5ozbL6ovks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBXDhaxA; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBXDhaxA"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso1023793f8f.2
        for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2026 08:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521918; x=1791126718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKsiUf1zswQ5v01inYZcqNF5S6iWN3Iz43ERd6nymQA=;
        b=LBXDhaxA/zY4Lt4EOvastsQwONNivTIQJvXQScEFwlsk8HtyM+MLZL1y3rl0UqbsNx
         y9Xnq36gPGzTqD/W2249ztRGNGXWEFQZJLDbLfJmwQ6Ky2SWr10c2bvbDNV39v09OVZa
         m7Wv1ybejZQQwOGDtK6Qu9Srcd/l1+5cjFXRc4jRMkpZNhQg+1MEdvJzbDeC7fdx3YOQ
         VcIh8eOtUunvAjuY+WxwY5vz6Gw5gr4G5DF9upQD2dqt9HbKgQI6LRo1GtJv1Lj3/xJI
         kNn5SkBROaBBsM4pzmXGhjFbExpIn4b8DjOAqaoyR7oU0E7KFK2BlheuLYf+nBxQr2YL
         +evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521918; x=1791126718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lKsiUf1zswQ5v01inYZcqNF5S6iWN3Iz43ERd6nymQA=;
        b=oi/Vt7mDwsUHoj/dbvJK5doi7yizdFzHuaxuUrD2o7p13tISBDU3/2ZjK6evNYWVmr
         WVEEbOaqtsvbIIMdf1SqgeCwAbhIA234yY14Z/XMMyak2rmlFYvl+pfCmt5TWn3xdS8G
         5HMtCSk+ZLxJqO7gTBRENJAd9B+4m5RxRbUe+MgUQkYp2QGCq6EKzOjJGme2SBaHYoIh
         6ZWMAv3XH2jS/6yrrnOt+aceBzefsFWNLldoAESLhbwnX75RvQ5i2GfdTieBvY4yYP56
         Ln5fpcRG23cMyjBZxapAAeOMKd3UnZYDYQ3RQuYTQ8NKxLz4jcbZnLiZsCmKYJouskYF
         myVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwc5GkLDbAFra/VaXwg8REBRcq90FWo9aZF/RuQtohPS8/rpy3MoQNyiwKf5EAJ+dAUP4aIyfl4rZv7@vger.kernel.org
X-Gm-Message-State: AFq9FYIOr9zD8JpBOe6FIR3pI9Hh5eUrD6V8PNSPSCovk/me6Vf1qZF8
	T+4mHeDPOoe1mLh3CPowW9Ks7rTN1+B0li/3cbtBQhaZXRwRkeTpIR7c
X-Gm-Gg: AYBFou3YnD1JlhE36OTHhlNsCKvRz3X1w8m8f963edGAoxrIDTQXiPVO123dsR3aeOd
	tw1SqlFh3Zsy70dwk2/rpOwrLxcItKj7zr4aouXpSoP1Z4AzS4shjwEzHycgLMOQu8wejaMl0LX
	nhvvPa71djuMWMUmkPYveeaPcoCTGr2Aijh4slBZv5ou2ub2xkyA2tQovvb120DAfQK682rIHxf
	auDe0ZdoGy/HI1tZp9Mx4SavXDWFNAdpu1pXpqdAEeHM0H03IwYQOlqNYyzpl6bLN4o28yNqf/P
	FJyrKN5r9Qv9V4nXS+zY4zvG//XQ2SxWvAgnYgvEGiMY+S2+EeVlAAMA8EsMxsZPHlXb05+kQVu
	wdHMalrFjJ0j8OxnU1wjYVfKZ8G+QV0Xuo+qMyfMxzFIvuLBA6M8p932h+wgP3yaNmQLrWmqcQo
	JNnMf2Nw1Edz+oNezPbB/KD3QOOPkbHYC6OJ+X+a6E7iiOwhDdqQOwtNnXkAVvicv30621syf1o
	T0jIQ7BV0xGKg+SyouJA9l7/w16cGI0
X-Received: by 2002:a05:6000:288e:b0:488:820b:7e24 with SMTP id ffacd0b85a97d-488820b7fedmr12875064f8f.28.1790521917582;
        Sun, 27 Sep 2026 08:11:57 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:11:56 -0700 (PDT)
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
Subject: [PATCH v2 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
Date: Sun, 27 Sep 2026 16:10:08 +0100
Message-ID: <20260927151016.186493-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
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
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 45b7a0b6c626..6fe3b6410734 100644
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
@@ -144,6 +154,19 @@ allOf:
   # warnings.
 
   - $ref: pinctrl.yaml#
+
+  # The B288 driver has no in-driver pin table, so the mux values have to
+  # come from the DT.
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
-- 
2.53.0

