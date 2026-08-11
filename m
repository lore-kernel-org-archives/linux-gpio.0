Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BAF3B5DEE
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 11:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786446639; cv=none; b=d74/cYAZL5I7deMYwhbMGX/iIgHLfocz3Xjae7IyGexGd6hjb2av4joMnxUbroTox6BFEmzsL/f6um+JxxT5YaaXOoEwVaR07UfQJptfRsbuK2JwSlZhoUZXaJbEerDaMRX/J//yQQbL4vx/d9p8rJLVoDP7xAI5bQKFGSUsFew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786446639; c=relaxed/simple;
	bh=6rZ3mfhDGKX05Rlz+nZ6HYVUNrw2v8ggiqfc7/1++Ig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ikCF3uajhJvTeHfJGvI7I5XafMNkJQq/OmDTBC0VOWat6T9wIfUTT71whnxELkMgFCsIqfmo51E5sRcElg3ggPRMU08+cf8UyJKKnauEsDyotUyZrbxWLMx/mPr9GGLANfyyy3ke1NPLcu0F/oXshcx0jl8zK5gJYKxpGLvfxZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWGU7CJ8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWGU7CJ8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so22644675e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 04:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786446634; x=1787051434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5Gfsr1BRyTWUvkjYrx91YwKhmyq/zfL5zpExYSPVmQ=;
        b=JWGU7CJ84E7XzQDymrjSP8KFAN2o2RL9uqx5us0J0DcFrVmAZ4ePzWGn+FYj+a7caE
         8GLqItgRI1zqmR4KrED/0c+Bmp/nv2bLjaTVm0d0QNr4MViYnTZN8bDhpCedwz0gIN7R
         JYzbqLvzrtDXEfLWZhhubIIvrYA/TE7sLwb9oUoiy/rBKUL93A4WTmYj9nlJkturRN/M
         tsUGIksbiZLjGZcN6ms+wrfoRVEPKbXNgXDeXtU3tZ1QtENLUVbG5/3Qjq8prHhJ9bsX
         izG2r9KiDV36Ng7EtJmkjRJnPK4eap4SElI0K/BrlCrZScbdRWW8eEkA3B34qDEaSkCr
         /2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786446634; x=1787051434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5Gfsr1BRyTWUvkjYrx91YwKhmyq/zfL5zpExYSPVmQ=;
        b=S7UffPv6ezy7WlIe3sU/o1o2SwXr5dc0P4Ltgvsh+uj0outjk654fxMmHvx44lok51
         y+jqqbKiBPFPFztPA89Qg+jmGuV96N36Si6SN5AVfG0S57V2ry1wvwe8SHDcbUTHqgbS
         mTjdxwjgJsoJGKh2pT0JaFzOycA1v7fSBwQjoZSF34bIFBDcGjE/8KYYONZPpgxtbqC/
         3wziJWMGb5smhTLrWJx0id6nHoEKvEdJF4XqjMnJehWtDtBlJHIdVu3M36tXv5vcsIup
         iSgDR3RcpFuvI94K5YYOcN8tLZCUd5GJQqdZSnQEDp2YC2QytQVEfHBOzEkoo3Hlrv6q
         rBAA==
X-Forwarded-Encrypted: i=1; AHgh+RqyIwg8UvflrEDeRJ/M7+5YOB0YII0/pXQ+Nks2Ml3WOYah7Nb3h8//096JEjeJYarzSmlrfJeoUPKo@vger.kernel.org
X-Gm-Message-State: AOJu0YyFDiKvlk4OT1nlg3q//WIy1FR1wW9y2Jx/ctPUGg5bZ3/0gKiT
	klNgPLrHb69Oj0wUOiUg98W9koZJjZCF7ND7S8TrfKkefzZalW7+C36d
X-Gm-Gg: AR+sD12pmxlmBnUB8rKiAVThMY8evqcZpBy7oe8/U7mAMc7Bdg2aBJ1vKtTSiAsMq9t
	p6PsNypnQqn9//eEAM9j9XDSD1wXrzZtzP1V/uxCeQoCQorgRs6+MpeSLu0a206vtQ1J/rMmG0v
	hXT3QsgBggNNIwbq5H8tclqtUzwVVsB9HgvV7r5Jw/JrUxv3jgKxygqx7OcIRjw+hsNwKp6xumC
	e0vF38if+eFETntBRWEjYbuSfTw0yRrlhD/SZ8H5AuJwNzbZcEwE2V5nfuFm1BWh1+RR/Ypq4/A
	yuNO++zEw/zymFykD7goTKuV7vm4wO+Sq2oTVe8nT77ixWYt8/z+CPcEQ9vXyXtNqNYCJqjrbG4
	AJJRU6KcHVBkfz1Rpkcn6mCeIgW3TF7ctm4pX+oN4Zc1qq+ns40Z+bh2N+lDGpZeL6tWNZJCHeW
	fSvn/+QdY2+T6DEDhQBwrkCe35+dqpwAdi6EZdLfyrk5SNB1qzcgYTRUHut4Z5Yd48ZB5aOLSvj
	ykf0cFd4M2QwA9DQzUFZe+0NGV4eEkQ4TdeLb23
X-Received: by 2002:a05:600c:6085:b0:499:728c:4704 with SMTP id 5b1f17b1804b1-499784649b5mr38456575e9.12.1786446633700;
        Tue, 11 Aug 2026 04:10:33 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.40])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4814a7095a0sm3570044f8f.17.2026.08.11.04.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 04:10:33 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v2] dt-bindings: pinctrl: Convert TI DA850 pupd to DT schema
Date: Tue, 11 Aug 2026 11:10:23 +0000
Message-ID: <20260811111023.721262-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments DA850/OMAP-L138/AM18x pullup/down
controller bindings to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Changes in v2:
- Excluded the 'phandle' property from the pin group node pattern so
  it is no longer validated as a pin configuration node. This fixes
  the 'make dt_binding_check' failure.

Link to v1:
https://lore.kernel.org/all/20260811092057.687155-1-egbostina@gmail.com/

 .../bindings/pinctrl/ti,da850-pupd.txt        | 55 --------------
 .../bindings/pinctrl/ti,da850-pupd.yaml       | 74 +++++++++++++++++++
 2 files changed, 74 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt b/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt
deleted file mode 100644
index 7f2980567c9f..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-* Pin configuration for TI DA850/OMAP-L138/AM18x
-
-These SoCs have a separate controller for setting bias (internal pullup/down).
-Bias can only be selected for groups rather than individual pins.
-
-Required Properties:
-
-  - compatible: Must be "ti,da850-pupd"
-  - reg: Base address and length of the memory resource used by the pullup/down
-    controller hardware module.
-
-The controller node also acts as a container for pin group configuration nodes.
-The names of these groups are ignored.
-
-Pin Group Node Properties:
-
-- groups: An array of strings, each string containing the name of a pin group.
-          Valid names are "cp0".."cp31".
-
-The pin configuration parameters use the generic pinconf bindings defined in
-pinctrl-bindings.txt in this directory. The supported parameters are
-bias-disable, bias-pull-up, bias-pull-down.
-
-
-Example
--------
-
-In common dtsi file:
-
-	pinconf: pin-controller@22c00c {
-		compatible = "ti,da850-pupd";
-		reg = <0x22c00c 0x8>;
-	};
-
-In board-specific file:
-
-	&pinconf {
-		pinctrl-0 = <&pinconf_bias_groups>;
-		pinctrl-names = "default";
-
-		pinconf_bias_groups: bias-groups {
-			pull-up {
-				groups = "cp30", "cp31";
-				bias-pull-up;
-			};
-			pull-down {
-				groups = "cp29", "cp28";
-				bias-pull-down;
-			};
-			disable {
-				groups = "cp27", "cp26";
-				bias-disable;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml b/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml
new file mode 100644
index 000000000000..059da050e611
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ti,da850-pupd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DA850/OMAP-L138/AM18x Pin Configuration
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description:
+  These SoCs have a separate controller for setting bias (internal pullup/down).
+  Bias can only be selected for groups rather than individual pins.
+  The controller node also acts as a container for pin group configuration nodes.
+  The names of these groups are ignored.
+
+properties:
+  compatible:
+    const: ti,da850-pupd
+
+  reg:
+    maxItems: 1
+
+  pinctrl-0: true
+  pinctrl-names: true
+
+patternProperties:
+  "-groups$":
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^(?!phandle$)[a-zA-Z0-9_-]+$":
+        $ref: /schemas/pinctrl/pincfg-node.yaml#
+        properties:
+          groups:
+            $ref: /schemas/types.yaml#/definitions/string-array
+            description: An array of strings containing the name of a pin group.
+            items:
+              pattern: "^cp([0-9]|[1-2][0-9]|3[0-1])$"
+          bias-disable: true
+          bias-pull-up: true
+          bias-pull-down: true
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pinconf: pin-controller@22c00c {
+        compatible = "ti,da850-pupd";
+        reg = <0x22c00c 0x8>;
+        pinctrl-0 = <&pinconf_bias_groups>;
+        pinctrl-names = "default";
+
+        pinconf_bias_groups: bias-groups {
+            pull-up {
+                groups = "cp30", "cp31";
+                bias-pull-up;
+            };
+            pull-down {
+                groups = "cp29", "cp28";
+                bias-pull-down;
+            };
+            disable {
+                groups = "cp27", "cp26";
+                bias-disable;
+            };
+        };
+    };
-- 
2.43.0

