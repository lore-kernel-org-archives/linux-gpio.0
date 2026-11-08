Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794132415;
	b=feBnjyb04UHuvdrduZzwi+BT2Dy5SZI+h48b5C+qT/BzMrSC5wBzijPPFbixJC5adXJC
	 Ol5alZPQJdQR/UK4Z7fdW3AkJ+fnBDKRxeOvHFtHXQNQozFCwL8jpBGhPlChxEHsvRO3H
	 HLXSzqA3FLRMWj++/6tG9mu7DUQnHOPd4Oht+KqvJkL/k7ZlHfxcxxlyhO363eMEEvt+Z
	 APr7K5D72JQMzaGPgcJLlYnwI4Yx93fiu6IKHmCoUT4G1bgUfYhfiiTCdeAVkQgO+OFSa
	 qQ5HbjfX4j+l/OHKnlzLB3XGWDTMCGQ9hBsMeQHgNC3tAPj2t7bXikdhaG5udsjVu6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794132415;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/CBIxBtxe5cLJliqrEr89kFFnMkA85ZCth8NQT0Zhdo=;
	b=U6x6zoz3CWUG1zhclEaZfREpkofISuhR37wzkn9tWdLsOdBUnUShfGcj3PeWnRyFS/jc
	 T6OjtK6IrqrEv18bVasLA90sWvA4Jwm78I/nW/aXjh+a9iNCgG9DPLp9Q/o+r43wGGrBC
	 RrOc9jzevPRJDTyTtSEv9tslGtRdMABmc/WvivPiGMnAHzPQhZu9VIcUUt0m6xEL+edtP
	 OqmgrRGJ2WTWvJdyjXv64cQLWC1zaZdOXscvCPj+dIAZotUZPEYZZj40cz27gpMfo45XK
	 SoXZeIRj2aKg7U1JUYqwsFoT19Src0rUUqzmjt9wNG69nrfBg8g3j2Xr9mgR24T/p6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KvLhPH7B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFD7606A31C;
	Sun,  8 Nov 2026 10:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KvLhPH7B
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794132414;
	b=gjwXEXSrIIFZKF+0wUN8fhMUo8NuLZw+ZcgR7U1uwSzxsWLkl4fPHcc33TDsBpVPMvjr
	 JBo9xw5HTEMcB6rczqMOaQzPa9sYTMTfaJ2x0c8BnkbJc7dU+xk1vKPM4BroYuqgfekT5
	 bpx2GJ+QIFaxwjHpCcEG2O+ADOAAgAs4yeZorxNtbwz48vy2wSSop1AvmI1C69g0gpvRv
	 L42fGfg/T+KOqXPdrVL1UG9YGz2lrmWZb4pLQj1PBq60Eb6vdMV5A5eXVzN/Qev4aXUZV
	 yr/dtBqz2rKBn8tdnnMP6HzsX7p32tmCj9S84efiTH6/wk6B/ipT9RjKOKjx/ZDdAqQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794132414;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/CBIxBtxe5cLJliqrEr89kFFnMkA85ZCth8NQT0Zhdo=;
	b=clMj8vIEASOoWeQpWDmbNzAS9RH4SgttRm6/CpJ/l2n3a/ynMcEC3UrFLIPapIvnKSZK
	 iSdHjMG+8KRbpbsXfYRutlZud7SIGucTdP9w1GY/Qg4eBcJ5dQuMqERO55eg5vG/8m20U
	 EJqPsB5dqSm/HRi3LEfC6oUUB+ijOZoTXdgXpCGYsZU2G4FdlT4UBNTqMxQz1jhUWHuAW
	 o/XbgtEFe4ycr4e3enxW1M+YjZBrckPuMexVMislr7OCaxgJkk7keORekkzfb6RaComiB
	 G5EERJXFBl915qTacUyWL5+zyWhckhdjPyJh5BTBCmVErXSaJR1QVXhsvib3SD/CM+w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 870AE1F0089F;
	Sun,  8 Nov 2026 10:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794132414;
	bh=/CBIxBtxe5cLJliqrEr89kFFnMkA85ZCth8NQT0Zhdo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KvLhPH7BfjsHpLg/3a6uI53+BWg8QV1PgaNxg7i7/SYvFZdSVInvD4nZlRDcPPxjK
	 TNGcUsOqIvWOfar1j/QYyFwZLVLhoUwc6XPsLGz/UQ2Cnfakcu6l9zWPnZ9eIy1MiH
	 Hxnj9KJNEnyOFDIGeZgDaCzxvRnA/WKLhozjE+NdnO+M3UFTH7pFtDwUI6HdSC3olg
	 n4lflx/vRSzEij9nDC7OxNmmDKh9eBKxwOIK9knQTlyQWJwlaoWuJbVcA/PceGu4Hc
	 js8Ke+e18Zv7HS93eJ2iw+OpWQRFNF02gs1L/P4ejhamOieem3qPWWDrETLsVwaKXq
	 S3NNrXo5GFVaw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0CED647ECF;
	Sun,  8 Nov 2026 10:06:53 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sun, 08 Nov 2026 11:06:50 +0100
Subject: [PATCH v3 2/5] dt-bindings: soc: fsl: layerscape-dcfg: add the
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
Message-Id: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-2-5a0063f1da9e@free.fr>
References: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-0-5a0063f1da9e@free.fr>
In-Reply-To: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-0-5a0063f1da9e@free.fr>
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
 Vladimir Oltean <vladimir.oltean@nxp.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794132412; l=1618;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=NV7ikdkPmY9swMmgPPLfT7uHu5tnhWSgtC9GlwjwoQA=;
 b=HWpUJ1RYuSjYL0KrlrQ9yYqQhY5OFmSV9BDxpxQQ4oEFdU1EBPF3/iBvnGdWb1yjctEiy5xli
 I3zIhT7fEbCCTMH4CawT1BFrQ0senC5UPUWxCLsscMfrPvzNo6AlfCA
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

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 .../bindings/soc/fsl/fsl,layerscape-dcfg.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
index fc14fd0bf84b..6661c7d08340 100644
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
+      window, overridden through the DCSR view of this block.
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


