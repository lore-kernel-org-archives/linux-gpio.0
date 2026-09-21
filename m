Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774E047C0E6;
	Mon, 21 Sep 2026 23:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033173; cv=none; b=qZtMQznlVnWzib/kDryKB7vGW1VUDA4ZQ4bUee6eaoOsQxjnzeHvPuDDPhmaxL2vOgJVV1IqqRews0F3QJmzT3hMuwRcxxDAcmk+dqkbvFvcAFoWxaqXVD8Jj+22sOaiPY7eOPXrYMkJ/cDnnrPFo+JCKhJktu9rCEeeJFGS8Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033173; c=relaxed/simple;
	bh=Hm/eASC/VLKpf/MjTltWSCJ1zIoYOSlSNGYkucgmFNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KpyVz/iWpiKSNQke/vAqtPlxbaFy6ODskyOJe1gS9MAOKIzQ6MyKiT8hVsTkssmJpmaLDHHcHZ58YsUTWct7Ws2HoUY7hy7rkYKeMK7+wVbupRphztglzEiABTnGGsn8Ovno2BTQuwntDJeAdfOKnHkGNsfN3u3LaUZNWA9c298=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yo69Cy7w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yo69Cy7w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E9E1F000FF;
	Mon, 21 Sep 2026 23:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033159;
	bh=Nk2rM4zdEAZxzoieoxHtgsFFd46DneNiHn/9jMznVkw=;
	h=From:To:Cc:Subject:Date;
	b=Yo69Cy7wzpTi9aBac497xdl57nbYwfA0D4Z7wwMjpkDVwwXFmtEaxdgWRUoSBMtqM
	 IWlWeGymF5WY/BKYKwRGBUVUGYGRuC4wmlV8y8/Oa1CkzwQlU/XBIx7/JXb9ASD2Qk
	 f5NdEX8xgneD8S+B0QNqXYp71OK2aTtUebWHlKcIS3KDV6TiSbRvN2Vk+WBdF4bnj+
	 lGdp9NPuQtsO13TQVfe9xdPW1c5eZHkYT8oEBIyDKJPeVDNbQU+32VZzOxDNpIH7TE
	 mneXwlt814S3s/z5juGiseITHif6itvAIACsRWPKnXIL1Y9sgq2qQSQeEvC2EkJXCL
	 9pgT4vrZ29C9w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: renesas: Allow power-source
Date: Mon, 21 Sep 2026 18:25:50 -0500
Message-ID: <20260921232551.3129244-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/V2M pin configuration nodes describe the I/O voltage with
power-source. Add the property and allow the 1800 mV and 3300 mV
values used by the DTS.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
index 88b2fa5e684d..f24d05136f19 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
@@ -73,6 +73,9 @@ additionalProperties:
         bias-disable: true
         bias-pull-down: true
         bias-pull-up: true
+        power-source:
+          description: I/O voltage in millivolts.
+          enum: [ 1800, 3300 ]
         drive-strength-microamp:
           # Superset of supported values
           enum: [ 1600, 1800, 2000, 3200, 3800, 4000, 6400, 7800, 8000,
-- 
2.53.0

