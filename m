Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0443368962;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164481; cv=none; b=XRNQvWjsqJz1Y6Y9Pj98livJBF7gDy+Z+1IcyJIEpOhomfux50tkA+0yMZEbQOzfapQlQ77w3pJDPFVmq7EOQF18AmrRVuvQlH68Y//K1L4jLHw/WHIWwKH13nzCW4YAzgVho4+xivKdgc7YHLgm2zsFuFXVxQZiIltT23CxOmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164481; c=relaxed/simple;
	bh=AAkROPjG9vjEI1vREPfQS1ERhGg3Q+Sad8i4hhcHFtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=afxf1b+C7lIwBOtHIJDkfofW3W064w8cXMk6GYFDbmEDfhN4A9GLSw5zrxOqM4dwCTFv/M5FPKeQmstSpTnbMjIh4EJARG3N81LegQ6jzhT8d5jX5wEqvlS+bkJnJeh+hETwi8Xsv98mWoxSktK8zmRyBbhlOITs/NQHIGrqHwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BdaXJyHC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BdaXJyHC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F342C2BCB9;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781164481;
	bh=AAkROPjG9vjEI1vREPfQS1ERhGg3Q+Sad8i4hhcHFtA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BdaXJyHCSSTXYQ3BmE8gSJTdA8lKaXawkriFhvOq0+DPsTuGkMagQkNgFeYRz6XYo
	 YS9v+gxVmQXnH7YyVVWUH3g2lSq/amPz+qmrKsLPGIA6GHsXLl0+K0VZGBZ2j0dqfJ
	 iXvs6KUhcIl1LkqR4AWbRmPfOBTByGZuvEartknrQYfEqUa2bwArIpitVZHP2sU+4q
	 DP0K2/iNHhA/GJHJ7oF1ONEVI+ucZgtf9bF6gLcMJTHUMBm00M33sN0Q/Ga6ctrbun
	 ORpmUGeudWt6zALi66eMz4Z6SfiQyFY9kO4nvxAGDsdQf/wdBo15vq2RD6dskBuj0S
	 Z4cwKiLLHoh4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4366CCD98C7;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 11 Jun 2026 07:54:33 +0000
Subject: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add gpio
 irq property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
In-Reply-To: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781164479; l=1026;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=f2QomikSfT1qCooaMl1RhIsTgkvu22kj3kqZBPEonnA=;
 b=kaz9R4lN17UNqFjm0N1XpjPESjtpT6n3pIrJdL7Z+WLfsXg1x0aUsq1/0YcSbykV67lX+yyIy
 lAZ/lmz9+MMA+WvF4oAY7e1cekHyQr9DKu+yJwM0Z0cZHT/CeyO+rRL
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the hw-irq property for each GPIO bank and enable interrupt-parent
for pinctrl so that gpiod_to_irq() can translate GPIO lines to IRQs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index b69db1b95345..65ec9121300e 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -37,6 +37,8 @@ properties:
 
   ranges: true
 
+  interrupt-parent: true
+
 patternProperties:
   "^gpio@[0-9a-f]+$":
     type: object
@@ -65,6 +67,9 @@ patternProperties:
       gpio-ranges:
         maxItems: 1
 
+      hw-irq:
+        $ref: /schemas/types.yaml#/definitions/uint32
+
     required:
       - reg
       - reg-names

-- 
2.52.0


