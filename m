Received: from mail-10697.protonmail.ch (mail-10697.protonmail.ch [79.135.106.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C688C33A029;
	Fri, 25 Sep 2026 15:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351242; cv=none; b=WOtACpBQsiLtjpS32mnM8YDEwsCekEUc1VVgMzm9thqBgJU71q4GhDaobMdG5XKQDBQwdXmSwKgh2BrT880N+XfML3G5fGvlfbjf0EQ3yLoN6VQpsZlOBOTUGEVdkOab17OtxZecJqKRmp7VzsTzUV1i4CAW0RH0kQk9xYOSjXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351242; c=relaxed/simple;
	bh=09lQl48OX/61lUlQn4pgA3wuZCuMTYbY/AloETO9nyE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=stpWEZ+lDx9PMcPKER2mFWEkKjYcWhJdCywfwKJReVeTcC8TLe5783z6uF4afuKmGyqKX6WSEKdadUhjrGffCSk4jhMtrK60c2qhmj/D89rvMdB4m708iqWlzzwe1V2rKn8i1eLfjIgh9vIADtOzfL1/BPPxEf7bbkIOfi6r7UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=C73eU3CA; arc=none smtp.client-ip=79.135.106.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="C73eU3CA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790351230; x=1790610430;
	bh=U9kby6pcI1OMpLkgnQZ2bZQgP5zb/td94MppquZEeEA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=C73eU3CAZa3t2bbtPohGIzcku2i0Rp7AbQwbJIrtn7SyHsk5m3beCCMztNxEIg3+L
	 swp37UYSqwluu0JiqqSXKxgGx8V/1mw7sWfqloAawcE30NeFwLh9YifHIIAlfmcPY3
	 z5WlD07HYh6Y4iQj5XY2mTzDMSPWd2d8NCcjc+NJ0BUY+rEdZsdJPrE5INe+MZ6AHg
	 G4zmfsl4DoWv6w+N4fW3PeOIkxv/CxH5GV87Rnzu3vkJuqKFgX42t8JGZrI6btaxmh
	 HFxpY7av3yV/c+LM92b8a0YvyJ/IOTAK+QLF7a8UuuP9NNiYzKC+/YfZBjEoLb8H3C
	 rep4WYcdnsYBg==
Date: Fri, 25 Sep 2026 15:47:05 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 2/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode and property descriptions
Message-ID: <20260925-mt6735-pinctrl-v9-v9-2-bfb19d8bb87c@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
References: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 8f2847e15bbad7bd381a0a4d5847852f8502d1b8
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


