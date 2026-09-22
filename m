Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3914F51616C;
	Tue, 22 Sep 2026 22:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115903; cv=none; b=XmDXgU1xUxNDtYJ2hQA8RHD0P+MeoyPHI4bTv3M2vT7ybOI36TKpR3Lxd0r0StukB7BYBAC6iLDUUZj3RtK61TNj2KMhztYae5hTVYvtRbwsmKOrfz6TqWEw9Yf/NOhr3FyMDDxa6S8pLDoz7eZxx5eZUsIwd+kZ0gKohwbJze0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115903; c=relaxed/simple;
	bh=+mGzfvcGRvvDxMhn1pdz8wAXxa1sKYRxsMNMo4xftkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DJJhNo1fp6LyE9DRW93eZccYnlGK9eRINgwU0lABe7u4ywlFrKXnYJ2KHfAQeHyOQbg91jRN2spzGbxZV2OY6LbIEuHr8+SpbZnODmRyy0gC6VFaVJkZNXeW0J90usAgUD+u4T7zlRe64kMjbUMIarslEoHyZR+kHMf8CpXSOIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjCKBqcK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjCKBqcK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EEB1F000FF;
	Tue, 22 Sep 2026 22:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790115891;
	bh=vWi2Axh0FHWZnYR9ulxCow+anQdMaqgalXbk9rXUqks=;
	h=From:To:Cc:Subject:Date;
	b=cjCKBqcKEru9zM97pqeXmgjpuIsJTYOlXU65lbCzviwU1uTCQc7/jP5GAGwVB8bC3
	 bAIdF0wadiIt0JD/TxosSvXCWr9Whe6gR35sjbdMUGcXYb5w48YTA1eC9WXRva11H/
	 cqrhIh6itFZQlEK/IePJv8OzC1ogosWKzq0KXyXGdcAFPwNgDB3B3mP4DHYUQk52eb
	 56ZMiCgnM3aN1iAVCpEznT0im7FSJv1scneOxejhud4uCnr/3PEpA5l1d9caLkTxgp
	 TC113L05PJvZN8TUmOE1ja4cEkgoSNn97JzZLn8IuKqKPH5qSA2ojJ93x92ZILsL9K
	 CUM0Xnq6unQRA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: pinctrl: Fix MT6797 pin nodes
Date: Tue, 22 Sep 2026 17:24:39 -0500
Message-ID: <20260922222439.1682749-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow MT6797 pinctrl state nodes named *-pins directly under the
pinctrl controller. The existing mt6797.dtsi uses nodes such as
i2c0-pins and uart0-pins, each with pins-* child nodes, while the
conversion only allowed numbered state nodes such as foo-0.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index f4bab7a132d3..dba2dec15477 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -111,12 +111,12 @@ allOf:
         - "#interrupt-cells"
 
 patternProperties:
-  '-[0-9]*$':
+  '(-pins|-[0-9]+)$':
     type: object
     additionalProperties: false
 
     patternProperties:
-      '-pins*$':
+      '.*pins.*':
         type: object
         description:
           A pinctrl node should contain at least one subnodes representing the
-- 
2.53.0

