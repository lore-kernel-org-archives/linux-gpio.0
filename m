Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794794898;
	b=sFMEjBykGR8OHFL7eHOYYqa2MskxWelZ/NMyAiWCkxYpmzZseuGP/6NBX72JhGICLP2V
	 5JtlGNTeeP1XZCeQ0mantWRC6NIoQ05lDIPKcxOrxewFjBNam5YnOyTyYrPuMJqMGPbbj
	 dr+Mn3qgqwmfznVgRPaWkQmR8tCBXl7Dybs+/9i9smf5DWSmKgZEmcMKuG52m6JAxCrq6
	 VPfWw62rlCMe0wZ1SVoXKK75TZ3/rWHg948GHnv5XGMbWfdAghrbCfiBOumH8GREHS0lC
	 iruWxKvLzEN2ZspzZqIutijlQbf7D3guO0fuIMqhM6TVN+7Dmd5WZGD+BCErW/ZSIVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794898;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0gfmC7Y9UGqDfQb5Fry2k4Chq8RDKYlQ6TX9c+vrN8A=;
	b=urEqWNMBd8OWQr5KQeFLuHYuE5uf5/PLU/W4OBw+U3Os9v8LGWpDfLWQ/KCN3sTjSm0O
	 K7D3hgftuMy49w3Bt37iAg8knbrYxm6cXn9hnaryz1VDjI1zrAgENpWc03BQoyL1U39F5
	 jac59uB2OeZl4XTcxs2t8C9Np2zb79iGsnCWAxTknr+A4Tr6nec2kdWrfrHuJJ02ON/YF
	 fKqIqynOfCUKF6zIFYg7EgYfp2iuSpHFAsdNpgzZf9Y9vHHFrhDSyVxiY1MMi+s54vZVV
	 15pLliJAVoW32Sv6rvMHeceRkctGSBk4OFXsRgtYLFXKR+FKpg+qNo9NTkkHxVQDz9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cokMtsj2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7B0606A321;
	Mon, 16 Nov 2026 02:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cokMtsj2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794794898;
	b=tuEwdcunt4gXsn8wI24v+jW7R2M0LnzxgK2IUz9hR1jktxxYvh7xQFcAuXbqQ/G2AbH7
	 njoeLSVuPhrEqwJWdOWd485aUdf/7tGjD08IjMU5VPnZ6YiaQFJfU5jdWQbc0mAtmwGUo
	 /t6rh8EG9LRoy/JzmcdkbKcBzZIXNLWgHjPAdxNha8HZJL/tUQIkx/MdEhN8WufRUCFAT
	 BCDsS2AaGJ22BGcisTjLKa9+2EDXQetzUQHx4xX8zm0DqLIWOOYmmfSOPHOl1FStO18IJ
	 LS6gP76aLKlrKZGJ+rw1vCexfIfIcfawr49nAP5DwmgGRVGZtdnazNwKdfpbyypSXEg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794794898;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0gfmC7Y9UGqDfQb5Fry2k4Chq8RDKYlQ6TX9c+vrN8A=;
	b=ZVyFw0YAFGbtT8slj3JaxPAuOViyyD6Sp0qPgdBPfOeGdpoBmQGSeSbjNnH7053GWZjR
	 OWBt3psFiVLlw/9cWwsf5KfZWF3K3La+VfqpiYx0ziH7SiPcH/AVMGA6EgGUAfXRadm7l
	 bNcx3rmnmTkVFViErGjFY4KbJ0YACgqPVIcIF3ZNE8FxT+3kgVXTai33HLc8Ip2xiu4lJ
	 6LrZclluTrb0V8TMNthAZUawCSP4jfEuKZVvd7nLtz+SxAerPNNX6XD50Pnl7ZMs/yoEu
	 3X1jKwnvCvzDvk9N201c49EriJXPiqhFZaUj2VWsgCFkkJUucQ0LBM+Jy8JXyTWZ93w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACEB71F000C4;
	Mon, 16 Nov 2026 02:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794898;
	bh=0gfmC7Y9UGqDfQb5Fry2k4Chq8RDKYlQ6TX9c+vrN8A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cokMtsj2pBJ8hMd+o8MbptGVCfIuUBHSLLtEhO7ZKmJWjGLvHRbQ8XxVFA8n/HZr3
	 SzAjTgWLrmLTZqteSD+hAY7eVsQnPorKVkAi9lkQkrSFYr+C+a0rL6RrV4bTUvnW0Z
	 AIbpfGhPEShAsbY+bgY5IQP16tn/9ASbXoYQhcpWQ2CoNSsIK8mq3UPy06Ds3axH1/
	 OXQ5M5CESnizqAQwAYJiWyOXNz0z6MMUeip/r+/pwPO8laNZ5C59D4nJqCCBLmztGu
	 EZ7/ZGQq/bCa10LU44zFzyQOGy7QxTsM+cru4lt2lEdUQXtNdgvtM30l2jIzsc2dCu
	 vaHrx+FNOBzeQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 343174A2B7;
	Mon, 16 Nov 2026 02:08:17 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 16 Nov 2026 05:08:16 +0300
Subject: [PATCH v4 1/2] dt-bindings: gpio: Add Cortina Systems CS7542 GPIO
 controller
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
Message-Id: <20261116-cs75xx-gpio-v4-1-ad80a944e966@gmail.com>
References: <20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com>
In-Reply-To: <20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794794896; l=2174;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=uZPKiOwpZpFDwjo7k4WMPvOXgvIRpR4xQHtLI92EFkI=;
 b=Q2FTiw9zpF8SGfKF2lTP80YbnclDCPZkZRCKB3rmTGzRbij8W9e/V/JrwT7708WtnRVJvQSje
 dsvNKHu+8YUCdweOUiim7wq38QnAaxfwubEoW93GC5rabre/VFMrL9A
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

The Cortina Systems CS75xx SoCs have five banks of 32 GPIO lines. Each
pin is shared between a GPIO line and a peripheral function; the pin
mux lives in the global control block and is not described here.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/gpio/cortina,cs7542-gpio.yaml         | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/cortina,cs7542-gpio.yaml b/Documentation/devicetree/bindings/gpio/cortina,cs7542-gpio.yaml
new file mode 100644
index 000000000..faa302180
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/cortina,cs7542-gpio.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/cortina,cs7542-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 GPIO controller
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The Cortina Systems CS75xx (Goldengate G2) SoCs have five banks of 32
+  GPIO lines, each with its own interrupt. Every pin is shared between a
+  GPIO line and a peripheral function; the choice is made in the global
+  control block and is not part of the GPIO controller.
+
+properties:
+  compatible:
+    const: cortina,cs7542-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-line-names:
+    maxItems: 32
+
+  gpio-reserved-ranges: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@f00701f0 {
+        compatible = "cortina,cs7542-gpio";
+        reg = <0xf00701f0 0x20>;
+        interrupt-parent = <&intc>;
+        interrupts = <7>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };

-- 
2.53.0


