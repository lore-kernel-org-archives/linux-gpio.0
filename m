Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794999618;
	b=lvCaoarRgmg6+L4zGh6Mhs0yhv9U7lceL8mWY2seoALoPklQfTIIMancrgq9c5NhcZkf
	 Vt6KraAoFX1cz+y8+GBxQpfk6C10ZTKwtoRV2bK9Rmv/k2/c9ZqHK7gkBENScGDTbjoSC
	 IP9TvMTxJmz/dMTNl2l1O/qgexh67NAnrfVC88Bas36orplAO0kSV5V+y/WIcBqjIJhOr
	 OcEkcRzVVTx11dYodCAJizE3NxGNuAAFK+QOAWaVXs2rvmaQgHq8zceqOY32XiefWy2n1
	 oBmzQ+rF/IzJ8jeMTa3Y0eEuWtLYHfbCT61/tM6ivgxQWLkuHXVUBbR6OjLxG1nBCjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999618;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Mwq+iu5CW36e5IgB7HRxeUVlsDlGieQ1iNgZ9f4H8eI=;
	b=5C57/XaOTrYkr/5Dv2w5tuCxf4NyUSzdPz3uqeEScD2ucZlQqov8Pydxl60xV3uC4/pr
	 QxGrYc9aY0uNY1aObne5aenEMFnSSTgrFpZTkhPcDw6XRum6wdLqP2C3mu+NyzY+M6kET
	 YIB6ge2Nj41hHn/RUTdyUDYb7HhRFLwzM+CkSmofh0vx+d70yUUm4388sQr8Eu+bE0WRh
	 r6X1E9ql7UJEZwFQPUNzOCmACqPykyuXNzDCThin1xRIiUM4RlWUtqDYoJ5nCFQFuLebG
	 C53IzVrz9PJM3MBQA4egq8Tw3ZtaNOx6ZZJXvWQMnG6k6/TwSf1uaCg8UK+pFYGvf+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZGjsGKxa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C7560A2600;
	Wed, 18 Nov 2026 11:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZGjsGKxa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794999618;
	b=yBLp3dkMKIZKmImwGV47hwuWG7HCjrI87ann4Vvz9b11gRbSLuOS5PRuZwYY46SMp90s
	 cWHfFcaU8ks9cdQjVDJxHP7U52nAWUIWibL9A+gqF80PpH55dPuaqGYf3OO2q9gIBie6R
	 kTsU4ZYpz42jAuoF2waGqPa+3vUY+mWGirZbiismc/fYtSTXQL0ahwpiiZkIpGxHRmyso
	 zkNTfED4ET+hM5U1GiSy2lTPIywKfsUpGBGa4QwWL2/MgT4sXDFHCOgGtFW05hZSRtEqF
	 wYvbbbR2BZmKl637/gQn7NHW15v4CXzq3iIX1Qp7SfTdQSEPQu3MLnic28iHCwYdxAQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794999618;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Mwq+iu5CW36e5IgB7HRxeUVlsDlGieQ1iNgZ9f4H8eI=;
	b=0ZL/L3dLQijKZPpuRDusYSlli5azWnUevjZ8ZUTv1YCR6PlSuniylAaAlw2lHi0ZfBiP
	 xmsdjtSt0WwNk3tzgSpX5Z1LMUxNNBdJOCIXBHPBvk5LaEixIEoW2oblNnrSLuuEIy0Iw
	 nMVkLxS0164mSrwOquQpKZD2cuEM50jOFXXywUHQa7v/vQB1IEVeQVztQYncweb2k6RL7
	 0yq5Mxu2vfYvyUCY9H8IisRdxGTzWcO+B2IZiRl8eK/GTj9zhk5oFchr4KSWKuCyY6/Fs
	 U/m2iZA5fiHU/gfubg2R07+oZu40Qe4/sov/K9fUBZlyUywKRNRtSWG3jTPs97a9fOA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F05D1F000C6;
	Wed, 18 Nov 2026 11:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794999617;
	bh=Mwq+iu5CW36e5IgB7HRxeUVlsDlGieQ1iNgZ9f4H8eI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZGjsGKxa6BXUpeDoykyhXpFmRTvOCc5az+WLgnRF2pySDMp9ES6NeywL5NdBUqfxE
	 nroXkx1lMLDj/oEjhWEQa6VasYlZ40rhV+fWgVsjS5hQEZA73eEtmxKWrPmO0mL1ri
	 uQgM/qGxXDkXV1dDzweMHziO+DQaHs9AMi1u7xDW4uOxdWzL6i8by1Bzh+7UGyQZWM
	 3ZJdJ4EpvBrPTVsU8BT/VWVBWz8PYPRCFNRLZg9UpEOFqaoYPq68DLmYAIm/SNcUA+
	 z8dGLu0m1ZVbtRGAPYAStZE8CBw94Xwylhpu0TSAUVDZMchwVujeVvQcUUMWzZBrdK
	 I5iPe1wD6MBmg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CA46E4AD20;
	Wed, 18 Nov 2026 11:00:16 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Wed, 18 Nov 2026 12:00:16 +0100
Subject: [PATCH v8 2/6] dt-bindings: soc: fsl: layerscape-dcfg: add the
 LX2160A pad-mux child
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
Message-Id: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-2-d01bc837593e@free.fr>
References: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-0-d01bc837593e@free.fr>
In-Reply-To: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-0-d01bc837593e@free.fr>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794999615; l=1775;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=NHu8sncarMX+DwnkZ0QuY5r1sPX18dxzAlIoWpTi0Fk=;
 b=aDQ/XuT5vQhItfSF2MrzCy6Euqi6AuJMNHrWgeXCGLK426QpHfhniwQBd8afVUhcdZcJ7poDJ
 3Fmsqd4vMvfAtlUqdlNhB3tR4IB07ht4xfSRGf2vwGDaInUmL+H1JXn
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr
Content-Transfer-Encoding: 7bit

From: Vincent Jardin <vjardin@free.fr>

On the LX2160A the DCFG node holds the pad mux, overridden through its
DCSR view. Allow fsl,lx2160a-dcfg with simple-mfd, so that the child is
populated, and the pinctrl child, on the LX2160A only.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 .../bindings/soc/fsl/fsl,layerscape-dcfg.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
index fc14fd0bf84b1..bb9dbcfec1881 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
@@ -32,6 +32,7 @@ properties:
       - items:
           - enum:
               - fsl,ls1028a-dcfg
+              - fsl,lx2160a-dcfg
           - const: syscon
           - const: simple-mfd
 
@@ -66,10 +67,27 @@ patternProperties:
   "^clock-controller@[0-9a-f]+$":
     $ref: /schemas/clock/fsl,flexspi-clock.yaml#
 
+  "^pinctrl@[0-9a-f]+$":
+    $ref: /schemas/pinctrl/fsl,lx2160a-rcw-pinmux.yaml#
+    description:
+      The pad muxes of the RCW on the LX2160A, at their RCWSR12 to RCWSR14
+      and RCWSR27 windows, overridden through the DCSR view of this block.
+
 required:
   - compatible
   - reg
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: fsl,lx2160a-dcfg
+    then:
+      patternProperties:
+        "^pinctrl@[0-9a-f]+$": false
+
 additionalProperties: false
 
 examples:

-- 
2.43.0


