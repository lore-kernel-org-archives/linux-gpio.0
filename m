Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881874;
	b=zeFI0lVtNgBOWtPcISIcjo+5BJ6cNi81gRaokskqlmbjDrhO6HdK7siv/ioYMH1of2kE
	 vKzP/+tdh7KCR8aWCxh2yQcpFxOnhncGTFWTGQvereEiFEnnDv+U0KiFbcSnn9Liqvt+s
	 Qa3pR+TKltQfgZFDFYpNNVMc8NHFYQIC05pp96+f0+vh93jr2MBtWcBIZvaqvZ2mnn74A
	 BcBONxwbDI1KnjvjddSmvxUk8fvrC+CdgERRn0KpeAkR/No+8rML1Lul/F640QEtMs+Hy
	 QIzsy5xlN/4JHnKzspSF/BgKfgBy8hqkIMmj6DQRQlIzIS4PwjmMWjI6wseqNn1rq1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881874;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4/oRDqwhi3VDoXLgA5GrAWXdmPaS/aW4+VhU7F5t7uI=;
	b=O3428yRptKJNM6rg7weeXSc+Ibu7uUEt2UAVYokuZfzZ0NtUgMDcGgv3grP+9ln89xg6
	 lhoi2+jnuoWSHIqf4kTVzT48G8W1lwBaPODC2lFR554qGLpG6XucZozwCm8yboRqkXmjn
	 dSgKOMo8qD3LJacBXhUpDRYrAENqQ7Vt5x5J6eJea5BVx86Y19hvqCvmo0BOsu9Bhja57
	 J2TFaogeamdYllU7I1cO58m8Ro+S48XpyCXV1kCm1JqQEZRDcwulKKv/L5UFZ1z5/ylLg
	 LGgLMYEVmP/1A/21pvRmtQZTbD7Gg05iQedMXL15GrdvQenwCcLEJFINQRGr+jKad5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SJZBY15X;
	arc=none smtp.remote-ip=91.218.175.61
Received: from mta0.migadu.com (out-61.mta0.migadu.com [91.218.175.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC98606A31B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 12:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECC98606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SJZBY15X
X-Envelope-To: linux-gpio@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LNzXwPtAzajvtYxI6EotRBLZdeMB3u0+426q1DrZgGw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793881869; v=1; x=1794486669;
 b=SJZBY15XH8s9rCV7Z4cE9+pIiP0zyWOrnxAYodoDIN+HDrugiIYKEnqbXzJddKHVEJNLtkng
 1Mak7BHk2elDIbLTO/HXOQPP9cf5ZBtLfJdfo+67CLQuJtRbiK/HIqsNdbIfg/R0v9G7+yb2Z5r
 bGfxkK4QT98gGHPXBFWYImLU=
X-Envelope-To: linux-gpio@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 63e722beeefc127e;
	Thu, 05 Nov 2026 12:31:08 +0000
X-Mizu-Trace-ID: 63e722beeefc127e
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 20:30:56 +0800
From: Peng Fan <peng.fan@linux.dev>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: gpio: vf610: fix clock
 requirements per SoC
Message-ID: <aux3AIUFTEXUIbsN@fedora>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
 <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>

On Thu, Nov 05, 2026 at 11:52:59AM +0800, Peng Fan (OSS) wrote:
>From: Peng Fan <peng.fan@nxp.com>
>
>The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
>while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
>a single "gpio" clock. The VF610 controller has no gateable clocks,
>so force clocks and clock-names false.

Sashiko reported:

[Severity: Low]
As reported by Sashiko on v2 [1], this isn't a bug, but in
Documentation/devicetree/bindings/gpio/gpio-vf610.yaml, the fsl,imx8ulp-gpio
family (including fsl,imx93-gpio, fsl,imx94-gpio, and fsl,imx95-gpio) does
not share a compatible fallback with fsl,vf610-gpio or fsl,imx7ulp-gpio, and
almost every hardware resource property now differs across the variants:


I prefer to keep the patch as it is since it has a fixes tag. But anyway
if this is not welcomed, I could separate fsl,imx8ulp-gpio into a new dt-binding
file.

Thanks
Peng

>
>Fixes: c61d8b5791ab ("dt-bindings: gpio: gpio-vf610: Add imx8ulp compatible string")
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
> .../devicetree/bindings/gpio/gpio-vf610.yaml       | 41 ++++++++++++++++++++++
> 1 file changed, 41 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
>index a31f64b6d40b..d1d5315ee164 100644
>--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
>+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
>@@ -57,11 +57,13 @@ properties:
>     maxItems: 32
> 
>   clocks:
>+    minItems: 1
>     items:
>       - description: SoC GPIO clock
>       - description: SoC PORT clock
> 
>   clock-names:
>+    minItems: 1
>     items:
>       - const: gpio
>       - const: port
>@@ -117,6 +119,45 @@ allOf:
>           items:
>             - description: GPIO register base address
> 
>+  - if:
>+      properties:
>+        compatible:
>+          const: fsl,vf610-gpio
>+    then:
>+      properties:
>+        clocks: false
>+        clock-names: false
>+
>+  - if:
>+      properties:
>+        compatible:
>+          contains:
>+            const: fsl,imx7ulp-gpio
>+    then:
>+      properties:
>+        clocks:
>+          minItems: 2
>+        clock-names:
>+          minItems: 2
>+      required:
>+        - clocks
>+        - clock-names
>+
>+  - if:
>+      properties:
>+        compatible:
>+          contains:
>+            const: fsl,imx8ulp-gpio
>+    then:
>+      properties:
>+        clocks:
>+          maxItems: 1
>+        clock-names:
>+          maxItems: 1
>+      required:
>+        - clocks
>+        - clock-names
>+
> additionalProperties: false
> 
> examples:
>
>-- 
>2.51.0
>
