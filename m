Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61904A2056;
	Thu, 10 Sep 2026 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047342; cv=none; b=fQpK9zqS+C/Q0dEv7zmQrayK9E9aRWGiBMd7hICzHOJcl3TnmfwITeSgFX1mVmfiNz43ud9ClDeTULeujBJr27lMqYLbOeQXiucrHs37mgGlzP6Y32anbm2vH+Aw5f1nt+EVwCO8UmGs0H7Z1Ry6StiJNq9cY1DBPx6AhzZ9bCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047342; c=relaxed/simple;
	bh=hSa/tH8M8jk5gYes5gwVXQnH3e8X4j6HtduRWqIb3Ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G08fhgnOLFfxJu/9kfbLE07Jay7PqO76juLVyNMMWuoQktlC6ID6K7WoqshgSf2/gT+lCo/GkFdke4qv7ARWGGyuKraERZxQQ7U6tWaPwnL1cL+S14Eyd4lPdPmTVIZM/eZ97Dhc6CO9kjUg8MFFnYNVQAQ96xzA8SBKLTAk8AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ufl9Fesw; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ufl9Fesw"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DA1622C7;
	Thu, 10 Sep 2026 06:35:36 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9220C3F528;
	Thu, 10 Sep 2026 06:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789047340; bh=hSa/tH8M8jk5gYes5gwVXQnH3e8X4j6HtduRWqIb3Ig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ufl9Fesw8ci7X2Kc4PTAqdtuKbfDNk+st4bNXYBhxmDMYOlz9TjgyfWh6sRuv1v9o
	 4juU4bwHRWNchv+K9SsLkDg/Cjrt2THjC5Kz22Fx7iL3pImZJnbqHUC5HqcWb9bEJQ
	 ZVD7Sy5FAi2WzcsvanRC8rC1EoFFOsxLHqa/1QnM=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 5/7] dt-bindings: pinctrl: add compatible for Allwinner A733
Date: Thu, 10 Sep 2026 15:35:16 +0200
Message-ID: <20260910133519.459011-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133519.459011-1-andre.przywara@arm.com>
References: <20260910133519.459011-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A733 contains a pin controller similar to previous SoCs, although
with a change in the MMIO register frame layout.
This SoC uses the new style of DT binding, where the pinmux values for
each pin group are stored in the new "allwinner,pinmux" property in the
DT node.

Add the new compatible to the existing A523 binding, since they share a
lot of features, including the number of banks and clocks.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index f87b8274cc372..d7d0ba32ced4d 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Allwinner A523 Pin Controller
+title: Allwinner A523 & A733 Pin Controller
 
 maintainers:
   - Andre Przywara <andre.przywara@arm.com>
@@ -28,6 +28,8 @@ properties:
     enum:
       - allwinner,sun55i-a523-pinctrl
       - allwinner,sun55i-a523-r-pinctrl
+      - allwinner,sun60i-a733-pinctrl
+      - allwinner,sun60i-a733-r-pinctrl
 
   reg:
     maxItems: 1
@@ -126,6 +128,7 @@ allOf:
         compatible:
           enum:
             - allwinner,sun55i-a523-pinctrl
+            - allwinner,sun60i-a733-pinctrl
 
     then:
       properties:
@@ -138,6 +141,7 @@ allOf:
         compatible:
           enum:
             - allwinner,sun55i-a523-r-pinctrl
+            - allwinner,sun60i-a733-r-pinctrl
 
     then:
       properties:
-- 
2.47.3

