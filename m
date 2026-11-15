Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794749257;
	b=s8IY9OxzoGFmV2f3Un7TFawWs9CEXCcGSX0/UHWiorkYHEI/wy0joxI7Glby2z+jvU8b
	 zwnt6letCuvxcqKP5RJ1QO5Uw5LsOk94pnbnSDys0HREsDNu24hxfGFpLTV7wGOngivFu
	 KRZO6LxEzuZ8TOOGGAul+kNYF6Cm56h4uG6f2J+XbM3g1mcxeqY8jEuCesymZxTUnlJfN
	 H3AUB8wHg76QWX8hyfzfSgOizdmbQBDzEGzzuA+fukfMlo74KMabp6Lf8QILFQ44R6O69
	 fgc6IVGX5CewOkNCn90weEiwao9AudIgeSqVzC399/cJl/ICQj3Ha+RLPQztmWPAEEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749257;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qxCmilCZAfa92h6cZG6evZorYW89HH9VZP60+AaswCI=;
	b=GExjNqDdfe5J7nYLjGG9Nd/f2fyGf7wBNRShehYMNuA6lAMAlD4NVV88kAkRAVzGksBB
	 VkoOlzW7aSwbrP/lfNPLjRoFfo5UwCYWxFq9kKgFYYVK62y0oQJGs4VzxxOAXFSwlfhVi
	 EREqGdczjowo26h3iqhoq77XP8X6HfSCDqMJv41laoBQNXud53XV5Mx7pcxprGUcBXSMD
	 c2inBHETpXFqq5hWNYndIRepgaAPiAyCSmKXKcmzseOdPZUj0ZFU+HUqf/LQjeTWEX9/z
	 2UCJ3fKIG/OdwmVQQ+kA0CEyLWpqCRZGNU+VUYaqxaI0ey7sG/WV7KgrST2v96n5R0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SGYOumrN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8607A606A33B;
	Sun, 15 Nov 2026 13:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SGYOumrN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794749257;
	b=RVRunVpk9xrPhyVMM6OdPVLmANjA3QeEayxZfCJuPHSdoitS2FC6kdu2X24PsPkui5TS
	 aGiDKOJH5hd+twfAByRPPNSeiRqf9uF/KJYjfRyfl2f3+l4qV0fjQ9hnfvVH0xsgJzb9I
	 MvKz6uad4Bq+y2AOoXsaBx4mV+epdCmT5iA80+0w4sBC+Q0DgaTr322KbXZuu3oz+sKB4
	 3CiU5fjlzPODOvt197Hb0VOKZTc9NMj+DGRfljP6f3RiRuOPCOeniTkayj17Mdbl7YT0o
	 crvpe533eGUImSZRHTMZIxAue3LUKUGWodKbHJyiJsJte0XPHfpXwk5ZC1c3v7aSfgQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794749257;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qxCmilCZAfa92h6cZG6evZorYW89HH9VZP60+AaswCI=;
	b=JwevuFBGP1x/aAGEOVlRpXbokMteU/yeEynfNAm0VXU4oB1g6zIYRT6wtcYXuseLHR+/
	 F3wWxsBw/yfesnl3+BBT2ENZOn+NfzNb7hViqScBp9gDMs9W1xgYqvmg2yOyFyZ9JEmkz
	 6HS6U1mTt4GFpdQrLnuvjhil8EBWicH5vVIkxy6jUu6GBSkikNwknwcuaXOteO2vwQcJk
	 LQFiATbrLJJsXd3JKyEf1Gs1SslZmMi2FNts+1vErcWv6PCzcOHdIBEkiIv7MCNWmyM8o
	 tmPzgwDrzjS430eb3VCEBbe3bxCqpHm2BsdZPr+8wW9hGUSqWnHq8w5WUu8AAcYQmww==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 732371F000C9;
	Sun, 15 Nov 2026 13:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794749257;
	bh=qxCmilCZAfa92h6cZG6evZorYW89HH9VZP60+AaswCI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SGYOumrNg83OYrL/6mrzN/pOn19eLy+goLjlD8SUfTMmk33iWxEW63UGo7ZIywpZd
	 F0AMeBLT0MlLjMX81I0s5xliSS6p6jdNVXZIl5xnNSZ2iHdmbCqeUGaYfpaKLJ0kfU
	 gMmsYz3lyfyQizpAD5hRXDyk5a0q3mqIgbZZMPXO5/MeMiOSFar08UpTj1a35e6ClX
	 6Ec2myPSrpVID3NLTHtdRHNlXrez+oZyKVXablooCBnIvRJHVqKOT7FAB5w7YVyRX1
	 YMzxum/avIQEMQj8SDa7kRimxzaYNDFDrS3tV71nlmpmIPL+KozN2zyn5IihHphtQu
	 Afa0tjMFWViwA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EE6614A0B7;
	Sun, 15 Nov 2026 13:27:35 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sun, 15 Nov 2026 14:27:32 +0100
Subject: [PATCH v6 2/5] dt-bindings: soc: fsl: layerscape-dcfg: add the
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
Message-Id: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-2-fbdce4565a5c@free.fr>
References: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-0-fbdce4565a5c@free.fr>
In-Reply-To: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-0-fbdce4565a5c@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794749254; l=1675;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=rINtrhuavppUlRpXg6MQkeI27TcZ5wfEkTX3E6hc7Y8=;
 b=OiWIs6Jpbhy+7yJvjsGKgfipFgGthExM6sYdvd5Shf/MzGz75jknjv63HZ6tuo4IsNb6vl6Uz
 79UpTFqEoafB96PnnLmgmu5QHsLfXKL0Vt2StSCy2UUcoEOFsmTE6H7
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
index fc14fd0bf84b..bb9dbcfec188 100644
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


