Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794647555;
	b=d68NyDKUgTUOX9UDy2IEypsbfCpVnurdQzVi2oHlDG1z1BtKobtmhYtNcmBXgQD/yUBi
	 OltezSGajnVzELK4pSjoKoLHRuk2nsC2YyPyeEoDhuP0qO9H6ifb50aEcVLLWTuXmHpIQ
	 0//X9uBFlgxyjV7qi2VoJkPlSkE71+PBDWVJp9O83aKuqgHTgiYhI+Wd6Kwt+cGwcCZfB
	 Uj5FDLNdEwOSJEPB3WHNpRO0DGWqKl6xp78zxFaoo63lLF/a75hidMGsXdXspwBEc8Kbf
	 nxaNk2hlycjfQziPsWErr8lQdEEhEFOl/kvLcKx9kvbpAH9lK/Hguzz0mu7QM2UEceA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647555;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=babwifpmF+cyUWB+9VMRl1vKTHXgxVaI3gnuv2cJLI0=;
	b=sTvFr3+iKMKizZ36e6gZh4Ci8jQpZDTcNDtaaXdc743UOunWtz1TDr9fDhF38SBmBOvK
	 4Aur6H6WJwcryrjr/xEb8Pa88+fjs2vLwQskTrlgGwSxzBptEPnmPwNuTjU7CoGDKyt1t
	 nZ6DX3BZOr74KK4QK+Bike1jqIskKSMehsQsl8SCj0Rx+lWePWCCgrVR656n9u2EJdriB
	 PwAKgEvMzmLoklz7TE4nZiIn+XaSRUUNf6zyn/kz45xU/dAjN6hwypYPcXRM22HbNMhMf
	 FSfOEHLcVGxW3nqWJGolCKYUSRQbSoDJYDFrESliLpV5yLqAR+PpC4nREnRFZMVP8lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U8T154xp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BB0606A891;
	Sat, 14 Nov 2026 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U8T154xp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794647554;
	b=T5kdhHQmgw6ayxKlS9mmyNt9e6+bNYoLbwSRSljXtBC/5FieEuC3ESjNn4ID7SyHHea/
	 6o/Y2FQ33RdefN2E1teC1iud6nggM/6HtpSM/3Uvc15emEXc7fQKoJ6BBH0U6e/HEYjIk
	 /Va/xwkvfFtZ4QxNZs5W83WhFCN3Uru6IV7rfFOqPrEAM5N8ZNJzoH3STudmnmTvI4yIt
	 sEvsvbiNGqj73EjaPz4tejXIeeTliEpdvXGFVu/eUWGNyUeMFVbOF1vf2jJnImXxDOkB5
	 gqsTR+Sa52fm/zVAcEtLu1viHTUPwtZsCfu9Muk92MVmc1KmrP1ZE/6/cj38mqf7w0Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794647554;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=babwifpmF+cyUWB+9VMRl1vKTHXgxVaI3gnuv2cJLI0=;
	b=Pkz04WvRqzdZv6g8JkUzEJdR+bgPaWG4I1K/RojxlRwFS8T/+JMH5q7VGSiMQzfFXtIM
	 cr4Xp4cWgHI+1K5XoFsdEWlEpHdu4ibodzj4FvEXDcn2E2bSFzz0EFxHl9X2Vvvfj0WvF
	 spDxCmC3kwtJM/oLf+kUsk6OSWr/dwVai9wvfIohAX7n4fJ+uqp8CsTjZISzhY4gGWNp0
	 WXUWUDOpqItwP6n7QDfUdqLteGS3xC+uRxBC6iyfAsklZJpWLVsuGZQ0s6uW3Z5/4xqqS
	 uO/TLzaibAOoi3T8X23bkkz8VaWlalWwQ71KEXZC/0/euedtihVWEfdtEsBuJX1kSPQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A8DA1F000CF;
	Sat, 14 Nov 2026 09:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794647554;
	bh=babwifpmF+cyUWB+9VMRl1vKTHXgxVaI3gnuv2cJLI0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=U8T154xp3FOLdtph0UeUvN2n7rhp4CdDlRxwiueiCB7JMxz+rDxr5J6tK++xBW9JY
	 dTbTgh7JyTdzHPpnWeYDs4yjHgyIB2ld7UFddL0kaAL71rMjo0tZfCtyRx9mnrSOwR
	 RNHu3Q3elnfVH0k63OzaAFGtKgKHgXLLmV9+M7zmCfpdM6gF4zcazYXRfq9NHO9l33
	 GhPjq6aZsMf4opikAJfHnPavY9R8hEBO7GFF9W51m2+RIkzHN4dYoRFpWTSFg1e5JI
	 4kw2Lp6ulM8e7YUuaZ7Nyq+4HqwVDzh3tOdz/v5q1xWfdtrulrcMaFxNWawuQbUmIi
	 YJeOSfZTa1Abg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D8DFD49D16;
	Sat, 14 Nov 2026 09:12:33 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sat, 14 Nov 2026 10:12:29 +0100
Subject: [PATCH v4 2/5] dt-bindings: soc: fsl: layerscape-dcfg: add the
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
Message-Id: <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-2-eefcea066a55@free.fr>
References: <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-0-eefcea066a55@free.fr>
In-Reply-To: <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-0-eefcea066a55@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794647552; l=1662;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=1NcRZKUbhHo5ObPGgGp/sHMAv9KfLbdBJ+nJZ5dybKU=;
 b=41HJ9LS/M2bVWH/saBdn+bZMVUQ071BXOqESqnNFyI4nx0665rjhVOEbbM6Xb9KGFJ+ecakp5
 5OvNMSxpdudDebJQqQvAc/4xdvmXKHHNuEXsNmil9Ro2WGIFxwyA0zb
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


