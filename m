Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936706;
	b=SRtzN8fUWxR3DYVwfMk13SzQG/c5pMoJ19U/tB9J8L0sqOPkxwHDbOmKglZ1B6abT7h0
	 WY/JV6NJMiPAwE4+yPS4h22ZAlbRjTR0XNywXzfpChWQYRIUbLzX0dOMoxh6Cl9646eia
	 2qO3RmPeIR9oENonCj1xkF+ZqJPCh50WfkkHcqQuP1c8iG+Osq+msV3+FWqHz402YT9RX
	 I+yODohfJxUFKkIwKu/4ltHku6l7yL3PrDaesfGq1GF2k/rxeUyTDjgppzJqE9+eGjhtr
	 KKh0krW7QRjs+a0BCqm/P66IMEp/U4Ti1wWgMbwh9/tNYLiumn5uRhASFDW8IfEsasA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
	b=02WBwT2il+2QRUuClyJeuw798DA1etKtLxIcs3IOQmZ6Rz93eWDvPHzeoDuqXm3mYcUH
	 zdRUCbyDEEDOvWhtfGqqgETGRNVePKDUVLEiR8TKeHZ9Tw4Sp0SwmW0Z3jQa8c5Vl+A+B
	 C/aYDmAnHPVuSd3tUD2yJJqS185h7gva6dDnnunFqTeYdqvsT/NsbqDEvSj+UNeQpOx60
	 k04LzFaK5ZcnUFxep91YZencO5KwtNaLD07DumjwWiMki+bYcWEK9xXpbkbczB1Emj2IG
	 Ej2NF4BzkPnOR4wou3YzcEzlA2qnNdGANmSB9xggr/dXr5VpcTf3NMUgcqLCcvzdj6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oqLF6mqt;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDDD606A31E
	for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 13:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CDDD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oqLF6mqt
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1629412f8f.0
        for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 06:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936705; x=1793541505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=oqLF6mqtZX/wLfOVtnb3bMuXtECCsqjc7qiCPIAXSOwGIBXO4XzwzWsJvbfPiC0PIb
         Zg4wofMNHNcoS8FvRsG2haIgdsD/b+GaYZR6PcfyCRNRdkvDj0nIDOWwCD1PctuuNs0T
         tmXq4HL+sIjEa8a+KdlW3jVhiYfbQtOlhT3NTFlKEiB0DIR/zpaEFYGigG0mSOpkHIyY
         2Qo9nNSnPO0O+J3GdNi3bJw/R1m5wMLJmZroUkard/bEhK0RumpNKew8/kVXaa2WIMSh
         T3nFkn2BqCElYS4d+N+cTRLjnt9kSqfaFlUQU0TkFNE597VOYf3DZSC4TPZFQF49TgNc
         Arog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936705; x=1793541505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=R7roVSW1iju2aTOdiVXIFUdP/72+zw3PLjZLfBhRC7tek82aWMlaHLICAqOAIR21WU
         N7VAgMKqCfaWmsGO26hCX2q8MuD3sjtTvp96fngx7npyGfcg4WLVKh7KedkMMFllsmMV
         UmqAWKUjqYDluld9VtK0558YChLQI5cp9JLoat/s1Blr/8cAvE8Wg3jX5hm/p/+iSaXa
         0nEgfc6CXfcsHiRy3qvwyBWop450Ky7SIGzr2TWhwG4+dkAXjHLCN5UG/SttKtYKiF02
         p25LKKW7JaeiVQXeT1kqsLqbRVFkzRSrhLW3Foa4h9eRw+cTHxG+izgsrPELy6t+Vcwh
         25+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwXQXtl6J3mvnGM9K/tCmYfmwiZfHzPACtVZVUXpbogwoTlyGshRHZtz83TDFRlqXaFAEnS/OdCo4Xb@vger.kernel.org
X-Gm-Message-State: AFq9FYLEieTzNTpvPg1ZUQwYpWKrDatafnHVmwApO/4pDd/VJKpcRhFS
	TpFZ2CRVRZZ8Th0SR8ZmH6eBasjzVtyYNVYB57XBz1MrVEI/SOYTMQuP
X-Gm-Gg: AYBFou2FQ6Tips98V/mtvudlCthsx5pw1l2pYSCliDWPuZNDebTSAk2abekWDQvdD/r
	pBX1oXl7IULWCQMfSxoK5xKLoraZXgbxXGwaXhtZCv3oQjyNox2woWwQTpUKcTqocpeqb3Gh1pw
	NmNdI5fovOTlRBm8QGyLS7AT8DDKx05IcAWpFCRYEgDJLCXkyqfyugT5DxjtqmuaMF+2kPE+tM7
	2+aCHdyxovI+Mzadk3FXkxwfxz1+1j8SwXkJD6Yfi+Kw0sP02GisI6UrbfRfABNT6hsgGOHPj8o
	ZH9poblhV/4Tm+5E45tG3Ul2mWLNFrW6QyGymey/KIMGaTL2do1CJ5gkDBQx2fpfYZPG4SLZVF4
	r2N0vB+ryZB3Rd1gJ3q1qEr49194ijAyuOoNVcW+rbrf77I/eiVVr+JluD7+usUFRe1vZgOhjAF
	YScYMF1d8FL5OylTN76hwVSc5GBOjB0XNxNbPCeRVpxlgnC6uEaSzU7eBCJDGog7tir5FszS5C5
	FpguUP4Hrsk8qJvF78G4S/mF7uIakWQu3jWi6wuWeJwljRu1oGCRMPNdYh5VwkqgsgRdoxxmtXa
	e7z20hRQAJk69A==
X-Received: by 2002:adf:e004:0:10b0:487:27f9:834 with SMTP id ffacd0b85a97d-48e3ebb1168mr4784693f8f.41.1792936704729;
        Sun, 25 Oct 2026 06:58:24 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:24 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Sun, 25 Oct 2026 13:57:44 +0000
Message-ID: <20261025135745.102970-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025135745.102970-1-pmazzini@gmail.com>
References: <20261025135745.102970-1-pmazzini@gmail.com>
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

The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
implemented, and the driver no longer counts it. Go back to one
interrupt, and one debounce period, per implemented bank: 10 for both.

This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
increase IRQ banks number").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index d7d0ba32ced4..c04b04acf6e4 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -36,7 +36,7 @@ properties:
 
   interrupts:
     minItems: 2
-    maxItems: 11
+    maxItems: 10
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -63,7 +63,7 @@ properties:
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 11
+    maxItems: 10
 
 patternProperties:
   # It's pretty scary, but the basic idea is that:
@@ -133,8 +133,8 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 11
-          maxItems: 11
+          minItems: 10
+          maxItems: 10
 
   - if:
       properties:
-- 
2.52.0

