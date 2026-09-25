Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A614BEE58;
	Fri, 25 Sep 2026 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351261; cv=none; b=MApw34S9RBmROOWqBjix+1XbjOQfWLYqnqfMaZ8E8FqJjjGSFaxzw4uxJitT+L4E0l0fw0RQbIEuvRZT7nW38L+Sx5t17GQohAFllJiuWvOYUce4eWbY1CanLuoaKZpcuH298loYyLhtjCqfsSv8vK7+0d3dFXhOuvXaQ+usvKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351261; c=relaxed/simple;
	bh=iGB5A7kG2/XHLgLAh7HgAItjlBw/yOawGtKgimguyD8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L77CqM0DDfpL4ttKl4idXYPWg1hGXQQXQef6df2w9BVxnDzOzEtrXap2sRCVzVANBdS9ZkDWY8C3VVZAQ6OyVt7SfJkZ4DgrB+LMEDAK9kA09xhT3bTfRoUZvP0PvlBlimAi4D+HAhMu5ixXPsY+2Om22jxXt/ptvxLHS0AnhxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=iZ89KGIj; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="iZ89KGIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790351256; x=1790610456;
	bh=o8Zh8ypkR+J0IaKNJxzzlPYCPVRTl41mdQZpe5rZ0RY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iZ89KGIjCJWXaHpaBI0zozH+neowocRAwKmnu47Nn5SH8Vg3F3TjgmhtZz50dSZsv
	 F98On0zzVUYVD4EN3/b5GWnNOWZAMveJPLclB3KwiFuATTUO2dvLQyRNUZmhsuf6h/
	 w99boc8s1q31UdQYr7cZLO7+abSeyuVeFVo1vgl9ITtFBOM8WdGsGy5GPtQyyAIP2d
	 kfQyWuyOELm0pBN3LAtrc5vhZ1z+3n6mY4jXKLMSCBCLgeMp+PxUrqmTiIPnEeHO+G
	 ZpHgg4w8EcMxNSIg6c0HyxcbtHVsgV59gL+Lrh720VVzPDhsgE16Y5CV+EioC9/Aya
	 MCOXJmx0LQEbA==
Date: Fri, 25 Sep 2026 15:47:30 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 4/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controller
Message-ID: <20260925-mt6735-pinctrl-v9-v9-4-bfb19d8bb87c@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
References: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 3185e857cc74507ae0ff4b9cdae055562fce3cca
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The MT6765 pin controller has had a driver for a while, but DT
bindings were never documented for it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  | 36 ++++++++++++++++++=
++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
index 4df6971030416..94117008ebf9f 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
@@ -18,6 +18,7 @@ description:
 properties:
   compatible:
     enum:
+      - mediatek,mt6765-pinctrl
       - mediatek,mt6779-pinctrl
       - mediatek,mt6795-pinctrl
       - mediatek,mt6797-pinctrl
@@ -61,6 +62,41 @@ required:
=20
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6765-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+
+        reg-names:
+          items:
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: iocfg6
+            - const: iocfg7
+            - const: eint
+
+        interrupts:
+          items:
+            - description: EINT interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [1, 2, 4, 16]
+
   - if:
       properties:
         compatible:

--=20
2.55.0


