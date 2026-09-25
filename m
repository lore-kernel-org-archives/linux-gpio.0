Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A738138F929;
	Fri, 25 Sep 2026 18:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362373; cv=none; b=RIDYEaTvg5THcUTzMmFdH4uLfXdJ5giv1bOAlbQgj7R4Sqw6iXqEBn/Dg304HAnepl0F8KE8zAKE8aJZ/s7I+jUnxz7cVLBMNehcqY9Sq+/f8M9EJAHmE9BXjOxrORnM7WaUoB8Yz+4zcRrCDPOs+JktoUxEy9Je95JtKe5u84c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362373; c=relaxed/simple;
	bh=rYbeQepvW0k5eRJXTTb3g2fRqf/6vSs8XJWvOsUqM6k=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qR9mMlaOPkplvZH/1KANgQzZLXlr0ZTQx1pPHL736IE/gtMcBQfh0DI0kfoj45XPNTFFdHvUw3o+6k7mUXY6tT9aCy+q4n3ovQArmtf8IwnKiX3IG4JiNAr49miiqRvY28lnWB3xfQejR6HxgyzKYGdPOjvHC9wwVng0iGK5eX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=bEKB22VC; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="bEKB22VC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790362369; x=1790621569;
	bh=2xR7Qwp0o8G+y7oSeBf74kipM/J3H4hlNEeshGOMywQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bEKB22VCjPnLwBqODYqvVBRNN/8BvPOKDNFaJJ4LkjeqXfY1hfr96seW7SkkeShxR
	 eWlKJ2kozfXAZH9nHfi3uCvIHwlpGdXR4vn+nvSDsePBGg+oWwbD7jftjFWnAW+hdG
	 RhYr7xZgUsnTRnL62d3pfF4PAJyWMWObKfKU3qzWbE1XBfoqSUbW+3CGOTbe3k0jiR
	 mhM8Rz5pideD+OhYi/EnoOBfl+b6Mrkyzhi2RkRJ0J/RvV9Oax7gBuMl+xoFscBij+
	 Td90tL3Xv1lRYkVqQ7shGVRPP6QzQW4izHHad7C840YsbZMZDmO0YeqtB+6l/N08zx
	 q27zcwkb/FplA==
Date: Fri, 25 Sep 2026 18:52:43 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 1/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node changes from MT6795 document
Message-ID: <20260925-mt6735-pinctrl-v9-v10-1-cc042983c565@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 1036b730375ac2fc4a5d8395d6009d28bbfd9034
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

mediatek,pinctrl-mt6795.yaml has different node name patterns which match
bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
has a description of the pinmux property, as well as some additional
descriptions for some pin configuration properties. Pull those changes
into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
preparation to combine the MT6795 document into it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  | 38 ++++++++++++++++--=
----
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
index f4bab7a132d3c..0dcbca5ca8f92 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
@@ -111,12 +111,12 @@ allOf:
         - "#interrupt-cells"
=20
 patternProperties:
-  '-[0-9]*$':
+  '-pins$':
     type: object
     additionalProperties: false
=20
     patternProperties:
-      '-pins*$':
+      '^pins':
         type: object
         description:
           A pinctrl node should contain at least one subnodes representing=
 the
@@ -124,7 +124,9 @@ patternProperties:
           pins it needs, and how they should be configured, with regard to=
 muxer
           configuration, pullups, drive strength, input enable/disable and=
 input
           schmitt.
-        $ref: /schemas/pinctrl/pincfg-node.yaml
+        allOf:
+          - $ref: pinmux-node.yaml
+          - $ref: pincfg-node.yaml
=20
         properties:
           pinmux:
@@ -135,9 +137,25 @@ patternProperties:
=20
           bias-disable: true
=20
-          bias-pull-up: true
-
-          bias-pull-down: true
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull up PUPD/R0/R1 type define value.
+            description: |
+              For normal pull up type, it is not necessary to specify R1R0
+              values; When pull up type is PUPD/R0/R1, adding R1R0 defines
+              will set different resistance values.
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull down PUPD/R0/R1 type define value.
+            description: |
+              For normal pull down type, it is not necessary to specify R1=
R0
+              values; When pull down type is PUPD/R0/R1, adding R1R0 defin=
es
+              will set different resistance values.
=20
           input-enable: true
=20
@@ -221,8 +239,8 @@ examples:
             #interrupt-cells =3D <2>;
             interrupts =3D <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
=20
-            mmc0_pins_default: mmc0-0 {
-                cmd-dat-pins {
+            mmc0_pins_default: mmc0-pins {
+                pins-cmd-dat {
                     pinmux =3D <PINMUX_GPIO168__FUNC_MSDC0_DAT0>,
                         <PINMUX_GPIO172__FUNC_MSDC0_DAT1>,
                         <PINMUX_GPIO169__FUNC_MSDC0_DAT2>,
@@ -235,11 +253,11 @@ examples:
                     input-enable;
                     mediatek,pull-up-adv =3D <1>;
                 };
-                clk-pins {
+                pins-clk {
                     pinmux =3D <PINMUX_GPIO176__FUNC_MSDC0_CLK>;
                     mediatek,pull-down-adv =3D <2>;
                 };
-                rst-pins {
+                pins-rst {
                     pinmux =3D <PINMUX_GPIO178__FUNC_MSDC0_RSTB>;
                     mediatek,pull-up-adv =3D <0>;
                 };

--=20
2.55.0


