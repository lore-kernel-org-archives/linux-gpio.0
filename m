Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9003434887B;
	Thu,  7 May 2026 08:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142092; cv=none; b=q37QTgX+hezru9Xz4h0Z3Ef5FTGmSmwKOTxKU9E+VpxSlGl+YsGnUHUiCSZ33hPP5DeTwHS0jueHs4L6Oc1rRJA5ndUqXvdh29JYV6pytGX+114m26EtrhyLvlF4IFCp+QYyS+p6PjB3u8uJ4Thqq/iS0o+Guvl55ggjLFHOS50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142092; c=relaxed/simple;
	bh=8aeJQiLBuxd455YFaEljjwg6lhpF/r3XUhK49nGVI7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eS/aB02q7X9Zs21u388pmGsOnoPgbxE4eaqaO8+36SGicltkRl9S7eeFjnZuyYRJEwmG3KIqwjUE/dV9ezGMll6UUpDX/4/g3UxEpPl1m62U2b1E3VzjRCDfY1kVYvp2dykkS+BluF+sxZl0xAMvIYbMzUyyOrl+VgiNG/9ntjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1om2BGn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1om2BGn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57D38C2BCC4;
	Thu,  7 May 2026 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778142092;
	bh=8aeJQiLBuxd455YFaEljjwg6lhpF/r3XUhK49nGVI7U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h1om2BGnVR5firCJkeZie4gqp4TGpqMx6f8gRxXXNAulMcrwvmJsLRqTh9qtueerV
	 QkiM4SwtaKrYtZZcQBFIxuyoxGTAOW99dn9F2sK6gkh+RGA+1b6PmQeSQ8N5aYpkMJ
	 qIVfxQVUN7PaeWGOT33HWT6bue547mLow9TjgDziOtO/iOwK1I4w9o5EhiQD+VJqW0
	 KU/N/yWChtTdUwgpE2Elk35g7MeJZZBOZG49+yajeMvSfeMgIGfViy8/jKmVX3/uyz
	 UMrFoFQS/wpIVGUSQlj+BXMWZKEHtpaYoZu9D5cizkGmbxamejmDmoktvGk/JdIO+H
	 u3WV+fANB82mg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4713DCD3442;
	Thu,  7 May 2026 08:21:32 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 07 May 2026 08:21:06 +0000
Subject: [PATCH v2 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A9
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-a9-pinctrl-v2-1-49774feff2ef@amlogic.com>
References: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
In-Reply-To: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778142090; l=952;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=2k1vwugiyN7k/DWuDNDfM9Z7PSgwUGyVNp5bE4hZPfA=;
 b=/O0SdmfGmeHXAbzezFdWPAvKdMJ3GQgtmapaC+6y6ZR9JBMfRyV7rwkGoJDfltl7UujQrVKf2
 ehAiFcAoK7pCzs9FeiYRjaj1UFwsd0zLfwGASJtGQXpoickEbDINlmn
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Update dt-binding document for pinctrl of Amlogic A9.

In Amlogic A9 SoC, a bank mux register reuse other banks.
The multiplexed part requires special processing and is
therefore incompatible with the previous SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index 6ba66c2033b4..b69db1b95345 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - enum:
           - amlogic,pinctrl-a4
+          - amlogic,pinctrl-a9
           - amlogic,pinctrl-s6
           - amlogic,pinctrl-s7
       - items:

-- 
2.52.0


