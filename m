Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739511;
	b=gzE7W8SN2eLWtdckCDzS/mBLjixLN3kuXsejGBhOt0/fEfoAbj/KNWGy1rjQ6n374ijp
	 EVCGys0qHQjBn8Svm6d2q4N0nPCUufq5CZjT5dmkNcgte38P9o0ZHBO1tMcAohRLW9DK7
	 uWUuQJVAuq6eqfESTTcNPXhm0sF57P1kqYNFPGzPYdIgYZqZKpmXvoPf40iIedo1W3UCS
	 5eeZ44LD9tef06nUQo6qVY9mmzCFTth60Awly2eAHXUtMgsG2rOQlSdM0bhPyGcy8EYfs
	 0+q4e+ob/73+T4N7Ixk/DV32VBkKmy52pqvkmI033OepoCocv44jYCCVu6SoGtdNi8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739511;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bu8GPmpCAkcoaJxsFEUiAyGP51RQcGFILDv8clR+O0k=;
	b=xmunTLtAxzDxTexWA9C24enHY4PMcnxV0KClyOP73p3NwVMxi/25Qse+INd0r3qBWRSr
	 c+EJ1muTTdzlQrBQI17nk3bUywZVY3NAqEyj8EcbQvy7EclLkwurPN6l00F8iRpuQe4ty
	 wVdHg2zhqk/45DZgjmFfabBbexrKxJxHvoo83c6aBNPQBSRXAVAGRjzvEAx15DGa3uSv+
	 lx5fcCtIKnbNwyp/tXu1rpI31eND1hMb1pY5uKyXG847cPs/k3O3giNlHvW4yad10v54q
	 Tv2ZsHVItcdL77tyGN3tu6PorINKA1wa5W2QX0LtwrTElOzJHjK4GsCYCtqgcylOAag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jl5+aGR4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF7A606A31A;
	Sun, 15 Nov 2026 10:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jl5+aGR4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265921F000C4;
	Sun, 15 Nov 2026 10:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739511;
	bh=bu8GPmpCAkcoaJxsFEUiAyGP51RQcGFILDv8clR+O0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jl5+aGR4rXDMnFJG4HP6h8u8YP+Lw82HWV1aAgbwwQwC/bmjsULNb+Ut/H8GeYUqe
	 1ICR33Sryjo9MOaRDKLa3HXAhLiqw0fN9C8ewTi2qLJlMgdDvLHIq/LnMiGMfoIuFi
	 jv2JbQMEMhSvJgqXvtW/vHAhSJYeq1t2s74QotyE1enhyWUJThocrq/T5y0nqeAFCn
	 mX68LL8FIHXzGEAC/D3QMeQ++sPa3UjgsOvmyjWD3nMC6792H9hRYLrOieLen93i5r
	 t5eJhtpFB8BGQOVlcltFDFuaVdytpLC1lv20katDgQOiHSbWJuBb1owVD9cwB8AIly
	 efa/BkI3IIkHw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 11/13] dt-bindings: arm: berlin: add Synaptics SL2610 SoCs and RDK boards
Date: Sun, 15 Nov 2026 18:23:50 +0800
Message-ID: <20261115102401.3520-12-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree binding for the Synaptics SL2610 SoCs and corresponding
RDK boards.

The SL2610 family includes five pin-to-pin compatible SoCs: SL2611,
SL2613, SL2615, SL2617, and SL2619.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/arm/marvell,berlin.yaml          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell,berlin.yaml b/Documentation/devicetree/bindings/arm/marvell,berlin.yaml
index 4e8442980dcb..30d94059e2f2 100644
--- a/Documentation/devicetree/bindings/arm/marvell,berlin.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell,berlin.yaml
@@ -41,5 +41,25 @@ properties:
               - marvell,berlin4ct-stb
           - const: marvell,berlin4ct
           - const: marvell,berlin
+      - items:
+          - enum:
+              - syna,sl2611-rdk
+          - const: syna,sl2611
+      - items:
+          - enum:
+              - syna,sl2613-rdk
+          - const: syna,sl2613
+      - items:
+          - enum:
+              - syna,sl2615-rdk
+          - const: syna,sl2615
+      - items:
+          - enum:
+              - syna,sl2617-rdk
+          - const: syna,sl2617
+      - items:
+          - enum:
+              - syna,sl2619-rdk
+          - const: syna,sl2619
 
 additionalProperties: true
-- 
2.55.0

