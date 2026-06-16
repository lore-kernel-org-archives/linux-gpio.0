Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E303C552F;
	Tue, 16 Jun 2026 03:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781580615; cv=none; b=R6xLfeH7xtopy5jH+uO1Ekll2hFiItJlXVt8W3umF8Qy4/T+FxN+7G03kthpGjhLXOo2KH6nuJbK/KBC99ACHEeogvGEscegPXZynYm93pX17r39DnA/z9NRA5wtGWfIeTWyIFpYITWryyMwcaenbKHqT18jXLsQRvinHSmaKIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781580615; c=relaxed/simple;
	bh=GQ3UQ5BFqq5w8PmNHkkbD3GB5wPV3CqM9yPcj5KE00g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Xw5MqWZGldW+WZ6pS5Td8fCGBLN2i+HpZcXEzDe4nTIvAwpJmeMZvT1JHnaLIvSbB67K8nDWd/cS+JWn1ORKxBXz2IlOdG8KoDGBgXyrflXFV1d3+zMoqibjhSg9ksq/kAjUY1GDv8gx5pMi4wECJ4aTUq3Z41mPpRVVItcwxRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 16 Jun
 2026 11:30:02 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 16 Jun 2026 11:30:02 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 16 Jun 2026 11:30:01 +0800
Subject: [PATCH 1/2] dt-bindings: pinctrl: aspeed,ast2700-soc1: Add
 JTAGM1TRST group
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260616-pinctrl-fix-v1-1-621036e45c7c@aspeedtech.com>
References: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
In-Reply-To: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij
	<linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>
CC: <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Billy Tsai" <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781580601; l=1070;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=GQ3UQ5BFqq5w8PmNHkkbD3GB5wPV3CqM9yPcj5KE00g=;
 b=bHIkg0RFnCrvD4WKwjeopVECkuhuV/dk2dW8dRMWJM/DDZ9aLi/6fkU5tjS07KZJZyRxeo96e
 YPaQoo8uQWzCEr9WtIWN3OHGitlQEd35PnEnK3QyQrt8WPpA2/Dcq72
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

The TRST signal of the JTAG master is optional and may not be wired on
every design, but it is only selectable as part of the JTAGM1 group,
which forces the D12 ball to be muxed whenever the JTAG master is used.

Add a separate JTAGM1TRST group so boards can enable TRST independently
of the other JTAG master signals.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
index 76944fd14e2c..fe7cef4fef6a 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
@@ -356,6 +356,7 @@ patternProperties:
           - I3C8
           - I3C9
           - JTAGM1
+          - JTAGM1TRST
           - LPC0
           - LPC1
           - LTPI

-- 
2.34.1

