Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793729576;
	b=FPRb7cgQlWEP64iS+0Mck0I6yMQxL9IOd+FjdCRuCTPnFp4FVCXiSR58Yf2G3Ewaa1be
	 cOCTzyvqqB8G01xeQPD8L9yNAPWeZF4EtXDG9iHm96usn16fJkRUOxsoTqOHut+q5TmOb
	 F+7d9YBS9xLPGX/CTyVJmaZI0poT+bKaLlWU/AVU+ve5RUoiUipUQN63lrVoWWO7DRKcF
	 w8+Gx2ia3csYvoVkEL/trRZ6l3QBMLh3DKEl3LuWNXDhyNMtIuP+qM3L7QRn6fACuTYW+
	 T7Rw1YQ8+dWQTjtD8uBS2HWlfAoAPKW7JNEhqfADERChgcby2ll8D0k/qYp76p10Lhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729576;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ja/5Mv/Gop/oCSkbd+7+q5gBCpKe4wRAQI2mzWh3K/A=;
	b=GYRJCCkZ+WxfoUn45tATtMpPBWnKpeHyG0w8sV4G2zGDHxbWE/7dIjOfYlZNRyQn5FBd
	 Tz/AHtX5T+vDci6iKmIVtJ7V5QUf8g3oj2MEfkngrOS8aAruo57VKZQdvdfouXVZmsG/1
	 7FHwMvK6am4MnxoqWkuJpAn/ZOX9UkgOu7ajdAo9GAkkXlnJ/LLNcNAoyx8uWOzkNFtbl
	 rWPVcg2oo0jfwid1fG12yQT+/YrgfOB7lTHB64g6AqeCjsSQ4t3ju2yZroqGa4AEQ+wna
	 Ow12/2CYzldX3/Cv9CcWd05rmxLi0I7RqB++KrJYV+r7KY/hINjtMxqe41sCJW7QC7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OJi0zXMv;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A855C606A32E;
	Tue,  3 Nov 2026 18:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OJi0zXMv
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793729575;
	b=Kcab7kIHKWSY5OR2wy+5jn+DT5z0hkvp/hqb1mZkfThZGaOVnDqJw0r8f6vmzOKJd5tD
	 warCxGkxHNldeWFGslyNDarukCSLv5+9GpoIPWYksyL2AJoB6AwUHW5Nc0u6A6dK2ZYdi
	 bXGavUZbQetXYpWEm4mIcL5vZr8tDOR+8Bii9Z/De0uBSNmGUYa3N/o7kzD/QuRFdcDpG
	 y7LRRCG0GM9XHGP8D7bfTIaQFCWwALQKALW7Nw17hCooAtXuwvIp8KpdUwk3RKrm58Kmb
	 e9WiIJIahqfuNTz6Apjj8N4Z7tbyq8gFeFl4T7IrMKvgRfyBn6fIwFxQSyF31Q5+Oyg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793729575;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ja/5Mv/Gop/oCSkbd+7+q5gBCpKe4wRAQI2mzWh3K/A=;
	b=HgCuoLB6IQdRvscUKvVX776/IVk7H/d7FXS6DmoWQxJoeoBsm8p34sLfTnMirhnY+HQ4
	 BoM1txCjrlbWbFR0jHN98Ahuia3cxp01+ZsxIP6TiitJvWeKdGqpbd7PBzdUZN7dVyzsX
	 VZFaShvhG35kGKLk3wIt5dUQodQULzGXoBDUxW/V93yNbei0lQQ0ajeVRZrvTrAGsOlKF
	 WQWNdoRbE3US2IQB+70owdgKkZ7YSQKnMMORYTkCYd4On/gy8dxN6pE+VTsMFil4lkGRT
	 UNYs4rBqF8YbPE0W5JpySu/81xcgQHvvK26xbkK6dj2bpfkJwi7IxtdlmsBx915skhw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DDDD1F00A1C;
	Tue,  3 Nov 2026 18:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793729575;
	bh=Ja/5Mv/Gop/oCSkbd+7+q5gBCpKe4wRAQI2mzWh3K/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OJi0zXMvZEbFNQR744kZZclXuAaOdLgDzcnRoyCWuQEGbddkvJjoW0kdfjcTaNL8k
	 kyzc5WVPyHPLHpnLRpykJlH7NNk2Jg6YM20hl15YGSivge/Wb6BrGh4Tlmi3YwGzQR
	 /MpU8u53wEXOBqIyA3UG8AX5JXPlOVsA5Mtz6FmAVKk4AzHP7IdcSdA3l06EwRxsTJ
	 EdfKqm89Cc7UuSi3IuE66zhhmE/wghdkbSGnIViZZSkwrxpTGmosW15pYU+4Ao/YNK
	 rh/g0SmwcC+TPM7NlII58Jj054tQq0IDJXoFr75c3/+WG7nHpIRiQs4pYniC6IhPVL
	 bsI5BLAIlE9Bg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1E91046A75;
	Tue,  3 Nov 2026 18:12:54 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Tue, 03 Nov 2026 19:12:10 +0100
Subject: [PATCH v2 2/5] dt-bindings: soc: fsl: layerscape-dcfg: add the
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
Message-Id: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-2-3aad0860b984@free.fr>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
In-Reply-To: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793729572; l=1598;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=YA2Jv1p1SkYZyf+rDzE5uX5RrqHER8WNy18Uw1BptA0=;
 b=BuYXFKVa7bzqfQNlLlL/JpWV4nMUvbYRC0qmNKHkyzhAszW8PB0bokvLsaF+vQSiSGNzvmZlg
 89PcYFMXPqgAHrg/pg8G5LGavtJrFyt3QTheTm3eXX5Oq0SPWpZKSH2
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
index fc14fd0bf84b..dd6a00ba04eb 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
@@ -32,6 +32,7 @@ properties:
       - items:
           - enum:
               - fsl,ls1028a-dcfg
+              - fsl,lx2160a-dcfg
           - const: syscon
           - const: simple-mfd
 
@@ -62,6 +63,12 @@ properties:
 
   ranges: true
 
+  pinctrl:
+    $ref: /schemas/pinctrl/fsl,lx2160a-rcw-pinmux.yaml#
+    description:
+      The pad muxes of the RCW on the LX2160A, overridden through the DCSR
+      view of this block.
+
 patternProperties:
   "^clock-controller@[0-9a-f]+$":
     $ref: /schemas/clock/fsl,flexspi-clock.yaml#
@@ -70,6 +77,17 @@ required:
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
+      properties:
+        pinctrl: false
+
 additionalProperties: false
 
 examples:

-- 
2.43.0


