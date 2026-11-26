Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795700487;
	b=OoTz/sd2JMnVT+pL3w6K1Pxhgkha2knGBIsIsPXPiTRy7LYBgyIDNwFp83fabppVEkmT
	 I9ViyPicw9nit2+elbJMC3BEa+TPy+10fDziVoNplMTssQX3Kq1HWTMrbemWikd8JTP51
	 6M++fn/6Ua912OmSKTmhVqwLtRyltZzWTINHj0WgPV/F1wje5TD8IqCnduowwHpm4ZaZW
	 HYyAoWaxI3MDBPCjMe9w2Rd3IRYmRD85mBAIZfTEBniaBbVUGPul/fwgCdkJdldqlxOoM
	 iwjnMszSvNntyujslwHMgxqr5LmLJe9o8PwldH1U7kSJhiHDohlj5wOYJzz9GCyYrOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700487;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GbvnVt1TsjZ5ESCJiZTQraEYaUyZXbI8ncH+x7BkR0Y=;
	b=dCqM5LGu9bBcngJxHOmIW6pahCHTV+tctL2FesY1PxwoSF7IZrQagjNE0pWyFvHkK5cI
	 fij9XGJnnTnd+CuJEQAp3Ui1TceGUBBh9pUurQSuCoO+yR5cLR3pyIS9zI34CCbLgozFX
	 apnXy22MTS4AH0pTXsHPpMSfdssisNoUmrHI16MLq/+6XKX+nf1u7APKie0QOulRwVRBn
	 dvnk2sh+0/gp12+jK3kJxzsalcm8FnZSAYASOoWbpQMTB+YRf5RoH+IExzR/bjsQMJ7+z
	 YADnhyHIpKmZ2kpCzCexDD0ROOvkcTIC8BhQtY5COeelmIQS5mhtpLm9co/5CLX9iZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lK1tJe5a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6F8606A32A;
	Thu, 26 Nov 2026 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lK1tJe5a
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795700487;
	b=elYsocxLHj8BJ+MDM6rmgg0K8xsYC83luQUkN2uu6ipxWz7jJsIrBrhE3PtJpbdRsyQC
	 vPs65G/JzIZ9CEzldo7rnFSP5AZSrD3oASoMG1u9bHF1ruwwPTOG09IrzVMLYPhbMpRux
	 mkoWGIAuYzEiU/BIa+F0GN49BtjBltZgOZ4Thjpvo8zF2+tXeqoEy1uv0atCaHwBVd6IK
	 Xxq6L1Yd6mtB759+QCxZP17f6U1qtdowhJ5ojycl3c1G5gbrUgpwfWMWHRedd65UfiLrW
	 oW2lFAT3Witn1qGLnQorTu3eIeuBQLATcE2jCxJ4ej5Pz6Mds04RRrorPWob+DkLAaw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795700487;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GbvnVt1TsjZ5ESCJiZTQraEYaUyZXbI8ncH+x7BkR0Y=;
	b=XDZx0SEwefbySww9JhcG5cTM30N1DdslPwgmA9xMBmxtbEj7Ibmp6Vqyx7a5qDLoYwio
	 hRAU3MsNaMuptzdmFwgrZ1AkN3qjOaXt7CmUcQbFMUN7MuTqK+xOWkqWQkJ3P08yzmJOg
	 DynKut8upWysEWV5bs2XAMVHMvUzHDGZLS4Xb9+JpZ4tkC8/v61Ju+hChAt9nmgv+09sS
	 0+IRX5Hi1hmCoFDyWpYKjS/8fMvJbs/kqOFpq0w4CEFUiwwVQuiHi46UXBkT2JggeqBXu
	 vrVAzDhtAF4OYCKs+kTOTZAZOqwAul1+6zBTL0kWhclZ0A1zf/1p66BlGVcVUKB+eUQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99A0F1F000D3;
	Thu, 26 Nov 2026 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700487;
	bh=GbvnVt1TsjZ5ESCJiZTQraEYaUyZXbI8ncH+x7BkR0Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lK1tJe5ar+JEJA1DAhqrfYZoV+LIcPNz2LbruRxaqOhXJgkWPQ0nLcSO00c05ECRM
	 dnTr9XPzV1rjhFkJN7YT8ZzKynZq8mvCIC0DYEDwxuMhpx4hlftrH7qTYUPZ7uo/l+
	 Rq5s7hX8VhjgE8EucBFBSapY3VUZLQukxT8sEA9QFOH5kiz8dO7NtBvZ67fzoov6EL
	 YLDSG9kktOdhqBtfOVlQzSz/GXFrgHlFGMOQPzheaxT4iNZ6H+W5Za2PczDtKiJhS2
	 PtRLj7a/4BhKYlHNMuqYaEERWVjM91ILxxCOQBWC+CfmyCbQCZXBPd3c+yHe9/z08N
	 LByR44txI0Azg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 304564D54D;
	Thu, 26 Nov 2026 13:41:12 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 26 Nov 2026 21:41:09 +0800
Subject: [PATCH v2 1/4] dt-bindings: pinctrl: add the Allwinner V861 pin
 controllers
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-v861-pinctrl-v2-1-b1875a6a9bb8@iscas.ac.cn>
References: <20261126-v861-pinctrl-v2-0-b1875a6a9bb8@iscas.ac.cn>
In-Reply-To: <20261126-v861-pinctrl-v2-0-b1875a6a9bb8@iscas.ac.cn>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795700469; l=2853;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=+X+OFPTDQ3iXtYAUKsVqLJUtKcjryQ21gQGY0NMVTX0=;
 b=kKjprBu2KIbyopgvjFkBc+pYccd3LmiRde/a/iiQb8DvVj+ZnhEQCbWOaWrIbDSLu52x+EUkF
 44T1CHQ3agiB/E9/1fv2WXsoi3U+n8/mhH2X10bLaoeOyADARDdEhaw
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

The V861 main and always-on pin controllers follow the A523 binding.
The always-on one has a single interrupt bank, so lower the top-level
minimum of interrupts and input-debounce to one. The per-SoC conditions
keep the previous minimums for the A523 and A733.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 .../pinctrl/allwinner,sun55i-a523-pinctrl.yaml     | 36 ++++++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index d7d0ba32ced4..40fd54af871f 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Allwinner A523 & A733 Pin Controller
+title: Allwinner A523, A733 & V861 Pin Controller
 
 maintainers:
   - Andre Przywara <andre.przywara@arm.com>
@@ -26,6 +26,8 @@ properties:
 
   compatible:
     enum:
+      - allwinner,sun252i-v861-pinctrl
+      - allwinner,sun252i-v861-r-pinctrl
       - allwinner,sun55i-a523-pinctrl
       - allwinner,sun55i-a523-r-pinctrl
       - allwinner,sun60i-a733-pinctrl
@@ -35,7 +37,7 @@ properties:
     maxItems: 1
 
   interrupts:
-    minItems: 2
+    minItems: 1
     maxItems: 11
     description:
       One interrupt per external interrupt bank supported on the
@@ -62,7 +64,7 @@ properties:
       Debouncing periods in microseconds, one period per interrupt
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
-    minItems: 2
+    minItems: 1
     maxItems: 11
 
 patternProperties:
@@ -135,6 +137,8 @@ allOf:
         interrupts:
           minItems: 11
           maxItems: 11
+        input-debounce:
+          minItems: 2
 
   - if:
       properties:
@@ -148,6 +152,32 @@ allOf:
         interrupts:
           minItems: 2
           maxItems: 2
+        input-debounce:
+          minItems: 2
+
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun252i-v861-pinctrl
+    then:
+      properties:
+        interrupts:
+          minItems: 7
+          maxItems: 7
+        input-debounce:
+          minItems: 7
+          maxItems: 7
+
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun252i-v861-r-pinctrl
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+        input-debounce:
+          maxItems: 1
 
 additionalProperties: false
 

-- 
2.55.0


