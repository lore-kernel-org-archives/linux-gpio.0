Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557109;
	b=BW+rktYsL/Gu7jJNYRPyILDcq7/WsF9yfXNei/0Ib103A6hxoJb7k+9zwZbCJxS9S8Mw
	 HUvgudVbQ3KPkYCL4pJPKN6WkmgbLzyiEkzGSdNPb69dUI0YE6iteQVqMMQc1jBuHI9Fq
	 3QLnVEIK5SSpwPs/Bgz4aVp4zxO7kaNPrR3lpD3u/wEWkvfhcSqFXJ+WUtDmmYsMsOsoO
	 nKXQ++iloLuMiOQWv7YtAkxgAx7fa6EqqHp5sMclkiRpfwJ8s6oeWnR+WC9X3x6fcmkNR
	 i5Ku/wMcywWY1ObHYDUpzFMlOSprZ5zrdkntSLk/buavlb+xtyuPhR6Va13LyG6zFHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/+lzNuUt8nH42DBcwcZOHfmA1SLSshDnrkcQ11wbKfI=;
	b=JH6w2BPsjEVshGKKYT/v7r5yiYEbRWuGJZOeoW+Y0++ei1op/FDabXlfXbjVvUUXTRqh
	 EMv1o7IhDkO01UkzoNuI/7AMBPsLJTHluC9TdZ5JkAX6h5TDPSsjTtLHtS7UQpOhaopql
	 vRqrCuyWdPnWxSAy4KieopM2wNic9Oh8IcmYwlcwqT3KAz3mdAy1TEaFb5k/BU/gTe+V/
	 STfJNnaBj+1Bk0G4uGVGtbKSf548Q6Y8Hs2wgk7ctHh067tuOcSxHPwKkxswvfqDkvGC+
	 bNogzRONKkXGx9sfLY5W4tTKXGZiXCUCsz7ZMtpCa9BSSOIQ5h8zk7aaAk5a5+qKvPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXnDnFGO;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EC0606A68D
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 21:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2EC0606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXnDnFGO
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4471237f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 13:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557106; x=1796161906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+lzNuUt8nH42DBcwcZOHfmA1SLSshDnrkcQ11wbKfI=;
        b=AXnDnFGOBfQJb/4LS7OK+fGiXnmCp4COMdessyhleS1PvjJAfCVdKnNXxPDj1onRsM
         U1TjzEtBSkDNIJNqX5h9xLOHa0M9B+aZqkzO3uGlP789vCwldkYGSYjSA8R6JVIcqtaH
         0bqr06MnbbqGOb8gW7cq4f4VdqRiQDnq3RfZSjAWVT3SiwSJDFYh/JyODpglJDLo/bH6
         8nOSJZtc6tgjdoPIqrdJrrtjcCuJmgVZ7RH0iDVQDvziKrANGoqYAZhf4Oe+fJKa5NwI
         p5hzcB7bJZEIO52kP4OgEnppdA8XZy/AExuMSx4trEax/68pxeufD6qJFXgVdzqHCQOP
         VKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557106; x=1796161906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/+lzNuUt8nH42DBcwcZOHfmA1SLSshDnrkcQ11wbKfI=;
        b=F9LNU0vWcMbqvxX/cvN3MuWBkOjkukPHREcPiMAWXl4I9Ud6SkSJyuU/9vC3dmskWh
         9CT00ptXFq30T35Lf8Pb56R/2Hrcx36wB/42utyEU4qfOyg/DxlVOUs1sYiypjVVWnjh
         DO8PDGVKBK7MEc6LIiEm6ruZYNC/CoyS4K0gvafaZRrLuDT8OJZvSoYKn/1E7NFJ1on7
         neUtZC/Sp8nUq5/SEuxv3ibQyu2uODvuCmF5reWFfswBACmvGDQu6uOi5A5h6JhxopEO
         OmdIW1ndCZJU3wjQvNQAoxlMFoqcPuIeIijQ24ZNN2fgtrhPUFT7JWJvd361gGMKGB5g
         qnRw==
X-Forwarded-Encrypted: i=1; AL+hErE6L9Etn47HFSQasyvPgsSLMRtxN4GSUk7lGExMtqzQ8oVz1aBEAW3NirbdsQqJVR0++5agi7GE83cw@vger.kernel.org
X-Gm-Message-State: APuU4Z9o7zMXiJJhmHOUNzUPLDEGQ8WeJ9b5HlXedZOENYp2Lx56DTnZ
	zzAbBEyG1rBcGO0/dFTugM/RTOldXRKiyW9eIBjAtrZuW50mwhE0QxUw
X-Gm-Gg: AZFdTZe7RZRTD+q0ugTvUgognUrppe3lxe8Nxo7Vjx5iQoFOKXwWeoCI0VxIihB1x0v
	5YvPaXftOGCqoqrW+LRibaytQdX2KfFsZwDmOrUd9hjqVqMIi3p6F6myPfOhmMfksCpRBzcPiaj
	e9e1TZrOIjKSvm+36FODRVOms2A2Fn58LUI1NE9jGy9bnF0X0e4+Yc8RMyYHEhNY1xCSlNCcmeM
	tU7e49ijTObZ55XxXh9Sq1BvIB2iYhKP8HsgzvIe82HNP8OYTqMbCwzBgOLV/DY2h/lm36nm4rF
	2c9aA9TgIGaCJ1yK0GssgyqnBe9XX7HOkvnwSCABO29OvPwvxVYifkXp518eAGp/OkrElRy0huv
	Z1jGo0JiCkF3E/CrVT4c680LC3gUrE6soIguNe3pZxk/vwPOKzIG2DShL3n5WNsbdabkTKs2iNS
	zCYDAPeVJnzdofI1YaqLv18yVJr9r9Jp/QYp5ISXcl+yWvORGw2j2LLhmmfDAtpa3hHi+q1Uup5
	HfqRXYwo68jqUHv//qk56raepRYuQPCb3fQ232ma4wvfM32li7ruk2UOERffst90r4kC49RkS+z
	r7okY8XaoV22IJcIv2WW
X-Received: by 2002:a05:6000:4a14:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4abb71cbc15mr29539105f8f.32.1795557106230;
        Tue, 24 Nov 2026 13:51:46 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:45 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH RESEND v3 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Tue, 24 Nov 2026 21:50:47 +0000
Message-ID: <20261124215048.42074-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-1-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com>
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

The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
implemented, and the driver no longer counts it. Go back to one
interrupt, and one debounce period, per implemented bank: 10 for both.

This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
increase IRQ banks number").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index d7d0ba32ced4..c04b04acf6e4 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -36,7 +36,7 @@ properties:
 
   interrupts:
     minItems: 2
-    maxItems: 11
+    maxItems: 10
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -63,7 +63,7 @@ properties:
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 11
+    maxItems: 10
 
 patternProperties:
   # It's pretty scary, but the basic idea is that:
@@ -133,8 +133,8 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 11
-          maxItems: 11
+          minItems: 10
+          maxItems: 10
 
   - if:
       properties:
-- 
2.52.1

