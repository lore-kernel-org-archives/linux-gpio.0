Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795465625;
	b=n5u6JWTHSGCrtg2MvuOJ2Mt9gRMLgeC1OicL0ng0tuhCpYO0wWKq2uYUnU+ZYFB0qNTu
	 n1ochOBjSQrEPvWXCPRTtp/aIXN2+97HA8YRd93YbRFdwmL9eF95P+9e6xAX077a/zrpd
	 JYnU3CIQVnGMlnVkfAgOAMduQaPpvPPJIfVrDuDXKXRPj9WCs83JFKMg2jDpD2cR9dfIJ
	 Ei2QY46kjRQ+JXsAYss3SVneKGbOJhGlCmEZKfeh44aiwHEkhcy161lDGBSNdNhvj0yI+
	 nDNo3/dF5+GFfGCV6MWwjl09kve4WlOTW8rPmt7oarkGh4HL8JTSBzguqBsBndx2S5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465625;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=etweggmvewghqZeCOi7wUZ9wIdIXkNXXNOxh61ejO+Q=;
	b=Zb2jOA69Qx2JZIPz9wmLiyw0z5ip7eH2Opi2cn4+JkSVyxw9v9MFQnVZl4fSsWOclyLx
	 vCwaWdWS6zburpQABfNTPshT8z07Z3W+GKG5HmP/ezl4hsPiXL9mtgewvuSDjqPTUVmQl
	 MKO2zm7EtDc3R0sP1fYPMthj/tlsW6jI+qYzsyOQDrsEBnLylb5/c8YLxLqmBMnfXf6/c
	 Sa1lfIIytcqhMnuDHIGgh154I8wjA6PE582HAM99oeOrQde9E0oaIGQhq5KszTebZNWHc
	 FUJP3F+z8WJhEZWbYFkbygH6NgDJpEg+K8SyyarP3A1RVJ3Q9/3gvO6UKTsqa18iYTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HDCBx/5k";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17867606A31E;
	Mon, 23 Nov 2026 20:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HDCBx/5k
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795465624;
	b=Hca5SzEFNJNFNxn8dwgk6RYCMIH7GIrOHfLKIYMuBWMnMYAeSKVE8xu9BBnt6LaPnaFB
	 oAHQo4Pb0KLZZjDQwmNQtaz1QSe2ZPZ6dTtCWN9Pby1r7ZXpCPSDfC18XdchVCV/EiHZy
	 INHaUFHcnskgXUSIlD3hoBBj1gfoM1zQRB7rFd+n8tzXnvx8LA1a1OR9+VMTZ+uR1dfut
	 I2ioaEfkTApCBcJlTYZJCIqjVCTeUr4ykDFZ+g0QapO9YC4mS2tEdXt2n2EKKXWht2kDH
	 vgTP/ELf4Gu69qB6ALuQv6F7oBkGCUOyg2jIPTpFJT8v4EnOty3xtyiBh//d3ueOr+g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465624;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=etweggmvewghqZeCOi7wUZ9wIdIXkNXXNOxh61ejO+Q=;
	b=GswKGq8CU8mD1k43P8YtHNZtlItEwXY82z5VBSBKzX1kdtZ8p2UFPlBlAI84jr4mTTQj
	 Ot4jjkcQLGuGesjQmNU1+J6nv0AUO8scvtTkZ1QqvhtQxLeWzCwOJLYx7UHVzxFod2osZ
	 hsJiQpX/g3JpPl8XdoiE5PEE0pMl07RVBlsPv6q91y7HV25a9OEvySKQ+ZY8FCiHUBJ/O
	 0wUFlzwmxGSutYUhtAoxo1H7oh/pxct3+LFdgyOyQuwekpp5oP1EKwDgKIrDgLzSa9mUc
	 pWtmtRguz90dl6y+wplnVDoP6ECmOwCWE5YkyaCiuDw9LZ1ZVI+tGWSWg8byOW1XPiQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B51181F000C4;
	Mon, 23 Nov 2026 20:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465624;
	bh=etweggmvewghqZeCOi7wUZ9wIdIXkNXXNOxh61ejO+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HDCBx/5kEhJnHc6TMy99sgojmZsqPB16Hare43hVfykqGf5dKDrmWaY/ShKCiURef
	 ORCwdehUUjDWTPWgJsKkIoK9HuK5wwCG7J7mWJ8z4Fs2H0nrJ8JfLAcx/YKHiAH7DW
	 ++X7Y0Nc8dnbMz3OdZLq0UjkpUQozjpB7g/P95tgnB4q5B+kQq7Jo3dGODZDDlZljo
	 un0BVt6wZNMMvWuDOblDQCiv/mkrMT3TGrB3kinL0oLXBGrVuFEbx9rBYP8vD3n655
	 LcvEVvcuN8rgup3zARzpKfIYJPpxtp7XlrcZePi8lLESJKa1pWJjPjYEHFm3CMcjKo
	 bxiihkAFh3znw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 397994C6CB;
	Mon, 23 Nov 2026 20:26:58 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:26:55 +0300
Subject: [PATCH v2 1/5] dt-bindings: soc: Add Cortina Systems CS7542 global
 control block
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
Message-Id: <20261123-cs7542-syscon-v2-1-1cd74b2522f9@gmail.com>
References: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795465614; l=2734;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=FpK/rtN440rKXrT4wuja3g3AXioE5n0xbhhWrVDfiGg=;
 b=ipRGVR0liCQjBfbPvnA26IUI9W9GGepF2VaOm+/bXlvPaqbrCcpP4bUSV8WHhC3NX+J4IDHAy
 PcVVeMO+ubKBmJyrDhQqLxgra6qTHJsYyrtDI3FnrwRgtyB3mAARPtN
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the shared global register block and its strap-selected APB,
CPU and AXI clocks. A pinctrl child will share the syscon regmap. Keep
clock IDs in the order used by the previous out-of-tree CS75xx clock
provider.

AI assistance: Codex prepared this change from the existing OpenWrt port
and GPL vendor sources.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../soc/cortina/cortina,cs7542-syscon.yaml         | 49 ++++++++++++++++++++++
 include/dt-bindings/clock/cortina,cs7542-clock.h   |  9 ++++
 2 files changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
new file mode 100644
index 000000000..fb074de87
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/cortina/cortina,cs7542-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 global control block
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The global control block contains the boot strap status, GPIO/peripheral
+  mux registers, reset controls and the secondary CPU release register.
+  It provides the APB, CPU and AXI clock rates selected by the boot straps.
+  The clock specifiers are defined in dt-bindings/clock/cortina,cs7542-clock.h.
+  The pin controller uses the same register map through its parent syscon.
+
+properties:
+  compatible:
+    items:
+      - const: cortina,cs7542-syscon
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/cortina,cs7542-pinctrl.yaml#
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@f0000000 {
+        compatible = "cortina,cs7542-syscon", "syscon", "simple-mfd";
+        reg = <0xf0000000 0x100>;
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/cortina,cs7542-clock.h b/include/dt-bindings/clock/cortina,cs7542-clock.h
new file mode 100644
index 000000000..34d544238
--- /dev/null
+++ b/include/dt-bindings/clock/cortina,cs7542-clock.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_CLOCK_CORTINA_CS7542_H
+#define _DT_BINDINGS_CLOCK_CORTINA_CS7542_H
+
+#define CS7542_CLK_APB	0
+#define CS7542_CLK_CPU	1
+#define CS7542_CLK_AXI	2
+
+#endif

-- 
2.53.0


