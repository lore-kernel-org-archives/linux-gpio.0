Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62593A963C;
	Tue, 19 May 2026 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187113; cv=none; b=Li0jnQ9NDAMOYR6edJhU17DvCKAs5rctF1bLM4G7qgtcK2/Ntytjv9kTsnI/kV/4nKXdv/j8TZFMPotqUAUUfmL8ZbQDVoUPI4GGg7km7zFrlenFXXQZTbhvl65K8i0//hE8E2Y4zMstdv8W+KfPOinQj8BBIScT9DBSlroIqy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187113; c=relaxed/simple;
	bh=mifqQksma9lQEsIcCnr8yLdBewmIibN5Q3gHUJ1cct8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UK3yt3QpPnjzEK9tddzAnsR0nNLUNgRteNNeYAHCn6NA/47qmRSAdjpnnxRvR1RSMCEopXqZUR6/uCxqgGsQ2V/2ugwunt8fUU8VkD52NgzsK3qZ5wC5e6riKeSed+TFnPTICFDvTGwayOS+O1Cx91R8qylEjT0jTpkS66R5Dn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 19 May
 2026 18:38:20 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 19 May 2026 18:38:20 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 19 May 2026 18:38:12 +0800
Subject: [PATCH v4 1/3] dt-bindings: mfd: aspeed,ast2x00-scu: Support
 AST2700 SoC1 pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260519-pinctrl-single-bit-v4-1-5fe568a8ffde@aspeedtech.com>
References: <20260519-pinctrl-single-bit-v4-0-5fe568a8ffde@aspeedtech.com>
In-Reply-To: <20260519-pinctrl-single-bit-v4-0-5fe568a8ffde@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, "Lee
 Jones" <lee@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
CC: <patrickw3@meta.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<BMC-SW@aspeedtech.com>, <openbmc@lists.ozlabs.org>, Andrew Jeffery
	<andrew@aj.id.au>, <linux-clk@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779187100; l=1606;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=mifqQksma9lQEsIcCnr8yLdBewmIibN5Q3gHUJ1cct8=;
 b=81ocsRhQYAvmkT3KwtcR61/d8wD183YFus7nUsSeqMKqfKevVDmSkDp61iFIdZifNB8CY41oR
 1GhkXwTOYgwDsDU0rLlyVbakX32gRzgi7w3t/AXl8KjkayyFDNe7pty
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

The AST2700 SoC integrates two interconnected SoC instances, each
managed by its own System Control Unit (SCU).

Allow the AST2700 SoC1 pin controller to be described as a child
node of the SCU by extending the compatible strings accepted by
the SCU binding.

There is no functional change to the SCU binding beyond permitting
the aspeed,ast2700-soc1-pinctrl compatible string.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Note: The companion AST2700 SoC0 pinctrl series modifies the same
binding and has been applied to pinctrl/for-next. Linus Walleij noted
for the equivalent SoC0 MFD patch that it should be applied through the
MFD tree by Lee Jones, providing an Acked-by in the process [1]. The
same routing applies to this patch.

[1] https://lore.kernel.org/all/CAD++jL=3p9BvDgaot3=emM4Zn5jU-ZAUKtB4UwT1HzDiyzKq4Q@mail.gmail.com/
---
 Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index a87f31fce019..b81c561d2a8c 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -87,6 +87,7 @@ patternProperties:
             - aspeed,ast2400-pinctrl
             - aspeed,ast2500-pinctrl
             - aspeed,ast2600-pinctrl
+            - aspeed,ast2700-soc1-pinctrl
 
     required:
       - compatible

-- 
2.34.1

