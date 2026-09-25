Received: from mail-10696.protonmail.ch (mail-10696.protonmail.ch [79.135.106.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6D047A0B7
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 18:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362388; cv=none; b=hdBOIARxsIvMgc9y6bCWqq/4KhrhLff4mRIMKwqd+2JPuEkbBaiJutmXwu5smgOV9XNpO+/+shKSVMd+h6bbcbAlsZ11IdYjMB0++v2cpYTHO2suNe9zILxRGSdXYzEbrZ8D++7+SV+2FmE9jtr2uUk/dN00kD3ZysdPbWOaPJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362388; c=relaxed/simple;
	bh=09lQl48OX/61lUlQn4pgA3wuZCuMTYbY/AloETO9nyE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=u2u1mraXpSfouWGU+jyXIxE25/GReGzkWeQbAvY0WSE/b9qD+QlYJ3Mh5ma3Rqrfvsr2JfNiHkbsyAYCLg34FtPI05PtqpzN4ajsY5YVkdiP5a1ZGHmiTEggq7p2NJiSpU8hwygGrnARsu1939DuEi59gNeN5JQYgFVqVm5h50c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=zCUACAcc; arc=none smtp.client-ip=79.135.106.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="zCUACAcc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790362383; x=1790621583;
	bh=U9kby6pcI1OMpLkgnQZ2bZQgP5zb/td94MppquZEeEA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=zCUACAccINOUkL4zC1sZ5TLXTZrXfu6qReT8Z2XHv19SPjiF6uvxeR3J42mjfNPVA
	 Q+uRi+uEyflx2vmU12TO6E7lulAd8k5yZxPPPW5WIy3fv7SkU9vqFbH/akojEOcyOF
	 g2QUK+eKJhvHgOgffIwRlapxUVJcwYXdAfWVIC2XmOhae9lZqfe9euVRA+df1yisLy
	 3qIFeDGwQTnDYcmZbzRnES4qd5clSGQ5C0kub4iNXboHhn12wVSekwOHQtewgmzJw+
	 x6uyHNgT9uwYa84sOWcvg75Q0lAuMyHIS3QJ71IgjAGv9DstBCfIp6SD4XBpGnYKy4
	 FEtV3egc/Xofw==
Date: Fri, 25 Sep 2026 18:52:57 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 2/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode and property descriptions
Message-ID: <20260925-mt6735-pinctrl-v9-v10-2-cc042983c565@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 47a0544b51a3a5be9418fa196cf84e2ced4cd6e4
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Change "subnodes" to "subnode" in subnode description for better
grammatical accuracy, wrap all descriptions at 80 characters, and remove
literal style indicators from descriptions that don't need their new lines
preserved.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml         | 15 ++++++++---=
----
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
index 0dcbca5ca8f92..4dc9504e24ad5 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
@@ -119,11 +119,11 @@ patternProperties:
       '^pins':
         type: object
         description:
-          A pinctrl node should contain at least one subnodes representing=
 the
+          A pinctrl node should contain at least one subnode representing =
the
           pinctrl groups available on the machine. Each subnode will list =
the
-          pins it needs, and how they should be configured, with regard to=
 muxer
-          configuration, pullups, drive strength, input enable/disable and=
 input
-          schmitt.
+          pins it needs, and how they should be configured, with regard to
+          muxer configuration, pullups, drive strength, input enable/disab=
le
+          and input schmitt.
         allOf:
           - $ref: pinmux-node.yaml
           - $ref: pincfg-node.yaml
@@ -133,7 +133,8 @@ patternProperties:
             description:
               Integer array, represents gpio pin number and mux setting.
               Supported pin number and mux varies for different SoCs, and =
are
-              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h dir=
ectly.
+              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h
+              directly.
=20
           bias-disable: true
=20
@@ -142,7 +143,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull up PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull up type, it is not necessary to specify R1R0
               values; When pull up type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
@@ -152,7 +153,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull down PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull down type, it is not necessary to specify R1=
R0
               values; When pull down type is PUPD/R0/R1, adding R1R0 defin=
es
               will set different resistance values.

--=20
2.55.0


