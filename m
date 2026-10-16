Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CD93D812D
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161687; cv=none; b=YMuhZ0byQWl8f4EK5pMKCw+ezr5iFBJQ/4YmMBakKdGrmE+Qy1BPYM0FWg8N/bKEZeHh2QdfgjCYVJ4D//stzvGYoexPGhFL6hoAVWzmBU9zwWqxjINNJda0Xjdp4EgzijI3olgEd8Sy4++MjQtT9V1uuYJVlrCtXBfQSfqq/ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161687; c=relaxed/simple;
	bh=Ldmay9QwO3gg+IGIDPYY4zVrqDjxeT9i+JqWgm/7kgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gMDcz0x6K6ntJj3exB9FkUg3BYnmThZ0JzImBox6YyZpkQuXFWgXmNTtSmJhoQ5MzZF+E2D3AkIHiBbwdh8mUCbI3/yFwjuF4T4RcEDUo2xBNdut6lWXnVmoXEwlFXz+Vvnza1p/vveWt5XEWjYHqJ/zdDpxTnrXL6kZZo5+DPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o5m7nBNB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o5m7nBNB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1523678f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161684; x=1792766484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKla0beewDRf+y6czDuhAfCVHpAbSKZ3cp1Ezxdtm80=;
        b=o5m7nBNBVTUX58PYxitBc2IxPcPEMPKiEOgPlNrQT5K4CPXnLaal6gANRn09plABR7
         dyCoU3cX0EZjmCVI0+2Riy6mxgHNkq2G/svUrzh7IaKz3tqG1xYsGmNV+sHDK43OZWfp
         +/EcAf/C4pHuE/FYz4gpujVqSe0EMxFUkAXKA1rtaGh/l5QugtTQGjNY1Z2ZpeDXVafT
         P0ZX1kVHnCclA0u4YOGH79nS3Ta4UKqCh8DBlISK9KFDCsIPg+/lGy53BgzlkeMyhvc4
         rz/cCu+GxQK9d3/ud7N/Vtz0MxO+lLDtkZ97fn9ylbnlaKDaRzr4o1yjAOwihyGIN6F4
         dmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161684; x=1792766484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKla0beewDRf+y6czDuhAfCVHpAbSKZ3cp1Ezxdtm80=;
        b=Us2/ngEvCwmJIpQJ3CwxOomjZnYfsjR3cLsXgLVQ3AZbuW6tsXQ5bGz+LMEKiySem2
         1gSXdRUOAKEB989F2inYOm3e0ukhEGCVlB55hIulvhDT6WoubunQ/Lv5njnD+3ZluW69
         /YJyH2IdSl/7BbYJX/PfJy0lco/fX2td4xxNGLs7Tg8UKKP7A//nTNjqXDdltqMnxyCa
         DVn4KA8DXcCH441EPoyJu8wIHg2uHK2TV2s9XtSICLFkuC8TM72c/sfMoRqYeRuYvafT
         SDHPJQ3SUk7igJJ+wAKuVYpK7txqeTXcg+lVwUN51+sYyvYmqxF+KeX3cUKRI6XWyeKq
         eWTQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1R/9lnHkesGPpnlFe/ogjgmUOYeh2hutJMrM2ibIRSwmrNiKdKu49jqhVaFZ15EVhGme6y8+Nelwl@vger.kernel.org
X-Gm-Message-State: AFq9FYIIy58gfibzcuK4bCzSahcHpcD7UQJC6Wuwua7jPU/Qbi4Jr5us
	5If2+5+YM/VtyUHR13z8/ALmCSTy18oWuCiR5xM6+vKKk9Ct/fGxZJ6kQ4JXnCoG4bo=
X-Gm-Gg: AYBFou0q94Qp5NLK77n+cqgv7f6kggeF11MUIurz5dlMR58zZEuQH3NwnTa0sok0yVM
	RXO27SCoY3Ywbo2KgsA3NWCDn0PfXHKU0V0i/ta01m0T6/f2DHeIPmYwaQNq8w2q4abOaRfr/La
	R/+mgw98VtD5lwr1nURp+VlWDn67OjpLK5Pt4UyY9WHYOq0ddQk+n4kAA79vD47x8G6g/OPUne8
	dJAlw52GAH3fs5Lw+4CTh2gj0eSDSiNzSvGTVV+lHjN1nEAjX21+Zxs0ZQx0tOo4lbLUzFKIuUV
	fjcFbTKjbuGg49a9QrEo9/GrbEXfsXNJcgvH6YbtvTEhhKKSFDhYw43k9Ycciw4Xf7694sCteui
	NgSi6xvBCOYaiIyerDHCQ+ibTUeyNDB8Ua4Q5Kuei2yu2YgWPtxF+FKktK5UnSjRd95hSpskglE
	YdNTvdP6hmv5P8ZNNT8Q54JT5lYkh2ZzuKs3eN4Mn6MsUSV6udsoUviJDkjwcClOc28RPPF78j4
	q0o6JNX8YJPY0qOVGcftEWUEUJ962EGvZxAMWrJ/4PZsWI0JxlnM9xcWpHDZfzrlkxxDA==
X-Received: by 2002:a5d:59c9:0:b0:48d:f58f:c91 with SMTP id ffacd0b85a97d-48df58f0dadmr11842710f8f.19.1792161684079;
        Fri, 16 Oct 2026 07:41:24 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:23 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:17 +0200
Subject: [PATCH 02/10] dt-bindings: pinctrl: Add devicetree bindings for
 DM816x SoC Pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=1087;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=Ldmay9QwO3gg+IGIDPYY4zVrqDjxeT9i+JqWgm/7kgE=;
 b=66GZw7iCsiX/A3jlcZvBstNeIKCIcwPkl/zB0PXA811CviVeXsTSD5ExJbsaK9vOJ/ACie66C
 jOHvBGugEGNBh6gznhogp46BBqamrLpOy/a6hSFeItYsAo2Cv4BVwW0
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

Add devicetree bindings for TI DM816x SoC pinctrl configuration.
Using same definition as OMAP2/3 except pullup/down enable macros, which
are inverted in this SoC.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 include/dt-bindings/pinctrl/dm816x.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/dt-bindings/pinctrl/dm816x.h b/include/dt-bindings/pinctrl/dm816x.h
new file mode 100644
index 000000000000..15aa15bca9bd
--- /dev/null
+++ b/include/dt-bindings/pinctrl/dm816x.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * This header provides constants specific to DM816X pinctrl bindings.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_DM816X_H
+#define _DT_BINDINGS_PINCTRL_DM816X_H
+
+#include <dt-bindings/pinctrl/omap.h>
+
+#undef PULL_UP
+#undef PULL_ENA
+
+/* DM81xx mux bit defines */
+#define PULL_ENA		(0 << 3)  /* Pullup enabled  => 0 */
+#define PULL_DIS		(1 << 3)  /* Pullup disabled => 1 */
+#define PULL_DN			(0 << 4)
+#define PULL_UP			(1 << 4)
+
+#endif

-- 
2.56.0

