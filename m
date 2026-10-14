Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69884486404
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 07:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962584; cv=none; b=mjR7xGQNkch/xtdyfwRsm+86r75UHbclBgUixHZUW6Qg0wVYhWgA59Ha+cJE/geDjVAVyepKmuI1cnyTe+Bj6pn/C4CQxQqgCEmE1xVdMr/X0VIbiF2OeomkjbdgVEGqErZJbKK6xiQ+D3sUHSVijzAslXCqt59zG39NKJpN6vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962584; c=relaxed/simple;
	bh=KDfB6WzKCxNKnAQO0MMr3WCuaPApE4DDdJllKHW9deE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i/55vjQjEiEYBPzDHKftHj2mag9Ue917UJNnvi+SQtP9AumFeErnql6SJ3P+ru/EegluECVm2qSGRUnjM3mIS92QRNGANqYHmbMQA0Y/KZWREC/5vWGYl+EwWLCOyOCL9tdhAsQT7Ayn2MlG/iT61+2aSAmvD21t8Iz41UFWPF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7/S/dau; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7/S/dau"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48deeadb3fdso75389f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 00:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962578; x=1792567378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDxjmt0bS4RhBRZPFlTXI4Mvp3X2uTTGOkn+NXVrE0c=;
        b=r7/S/dau52+u2udQx8CeSLih1/F6GxvtoHyatVts/S5W1Ezlm6U8CgoKfpdAN8yvdM
         A/26hjvUMvFQZJlipaQJCpiAQybtWAVKRBvha0R+9CXd8O6bFJEnNlYF0ualuhTdUSWh
         P/dBKYbulax6y6XVZHFRa/pZhRze8WecAHHyKHkfidAxidw+7Kw57hXA+XML6IbbKcaH
         8IhvS/g0hjXX6ngpOrGbKW/8jYMGQgPqKFEq0DFrtuHlUscbJfD1tUU9HagLfXeHhwqZ
         RY2/+muOdJVeIJbCJREIMZVh3SFnviWB2Ur228EyCTxEekXRBdzhLv+SaVr2dW1vZWRI
         aUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962578; x=1792567378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xDxjmt0bS4RhBRZPFlTXI4Mvp3X2uTTGOkn+NXVrE0c=;
        b=m5rKyLis04kFYgzjF+Cx34ZfDmE9h0dcxKtzlxo9V6Pr1+2X8HkfVj3jeaJVWo6ney
         HHwFdam5YG5taabj83Hm31yBHtuwdzYgQyFISYcaNUiwsHeYMaPqL9SztvmZ7H6dhlT8
         Hr5/VC4PgpphvvPFuz5Z+IVeQm4T4pwyRs0tlyT0Lfzd2Pg/LkGchOSosLFrPVjzI+Rj
         tDngggQwZQsPhE5Zq1pOD8dTHkVSV5Cd5QvJ04Xu18qmlwDlC/nBsrKSlRFpSHop2JKi
         ksoQJ2PFOv7q+9gwvQ0VDBIRXB4NCyXdMXSWTsQRjMHtQQDWMf4X1TrGocwB7xDff/Kd
         EUlA==
X-Forwarded-Encrypted: i=1; AKwUvBwwfCmJlRIUJSTDDUzuEjoN7Zw4BOZ7d9dKokI/l1J9RKA/zPVBnTv166MWs/f6/lpWm0jnEEz57jzb@vger.kernel.org
X-Gm-Message-State: AFq9FYIQHJ1PrmK5qGzJz/FZKDk8dgu7lfrdc8nH/5vnMtbfaLL4OcIp
	X6aPWEc/aL7fyfanGhY9f8wcFierbt53e2r9+Rlu5bfCmiyJ+Y3lGuN/
X-Gm-Gg: AYBFou3dbYoHJeJN+ISp3BikvmL+/eLKGL1IYq2nNzySRje8P8G0Kwa8NIfkWu3Hrxp
	mD8JxyamcTWERAFoT+WGcBPompnwp2NFIa5fs/DfhcLUvjROh42FtkQQWpfH1j5PiKiKGRtWiyU
	3+kJ62xaZHiUlev4Ys5FJ0h77O4i0eSsETCxa00MuQok2XBfQAr3jr8EIphEBqd5ZbfDiC6YkDj
	2V0BCl8SBDIgt2F1n/l8pDZ2bM4aRS+M2Uljtrxu1YCGIiuBruZq/akbFPH5z7KuNhFxkGeSIAz
	uX1nLCgd9wgyECSt2jjCYjv/+iivqCA6z1vXxTFE9YKdDZ9rks0wyqyB0GWKdjqadXJ4Imvg3lB
	9AYakJLDFFvjyDyll9WQbj+Z0XJt5Ws7n5SV8A2J/VrKxtAuVflbccJP1rvLUpuC8oAtlzMFko/
	/FBq4T5GTHji0GCciIEEZCfylzrcenf5zVXmtY3lS2ksOCun//LzISzcq5yELY5r3g2Okq5QN3q
	eUc/nyU0IPYWENpJsJI3LCQCExB2bjm+0sTxEUO0TjqVkLoFlASKXDJNlALjSdnnTrDd96ONtX/
	FtpjvR/m45m/xBrW0JM9LvHkmTyM287h+NS0QXrK4FeppQYHRz9b1HgiGgNHOw==
X-Received: by 2002:a05:6000:29c3:b0:48d:7579:1cdf with SMTP id ffacd0b85a97d-48dba9e633bmr15389523f8f.8.1791962578267;
        Wed, 14 Oct 2026 00:22:58 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:56 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/24] dt-bindings: gpio: Add ZTE ZX279128S GPIO controller
Date: Wed, 14 Oct 2026 08:20:47 +0100
Message-ID: <20261014072109.1759502-8-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the register-clock consumer and GPIO banks.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/gpio/zte,zx279128s-gpio.yaml     | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml b/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
new file mode 100644
index 0000000000..132c7126fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/zte,zx279128s-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s GPIO controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has several identical GPIO banks. Each bank has 16
+  lines and is described by its own node.
+
+properties:
+  compatible:
+    const: zte,zx279128s-gpio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-line-names:
+    maxItems: 16
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+
+    gpio@94407000 {
+        compatible = "zte,zx279128s-gpio";
+        reg = <0x94407000 0x40>;
+        clocks = <&lsp0crpm ZX279128S_LSP0_GPIO_PCLK>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
-- 
2.55.0

