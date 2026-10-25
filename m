Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938270;
	b=y6VcJ86+BROwU7wri9+2pYFwcYVQWyDOI47vsm6kZKZJcXXtgxjO/i5uJnlumFnSAhEx
	 BUgfiJnnOwBjYDOVkimYuRog9zzKoMbzfJU/aWcLxXQIXF8mj8VTTA7qetC7GftLm7jHO
	 WiRoA/9DzGqXxylENxUOy7viPbblUma2B5unVTGUZNAQTumYU+BR+6BbBW8hlPOkNT22w
	 XZdlErNJDUiTxR2T7TbRlGG8Ku/+L38a3UgqRNW1K0HLoWgOnb2SoFpY5xNLIHfH1ZZa7
	 sh8P2axfby88KYttszc+ztVE8EBe/n8RX2e0lYjqMZkExuBOIhfuTWzFR84XxJWAjPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
	b=Wpgg2SHvztWUcW2s2blo933BaC9WUwRSOY0clqSzb03HHVmHatYxZt1ub4SRvP7Dzlx8
	 uqcRgWV5zMuCkBbCSqslzTvxMq5PbRk5DRlPD1b3zKX+uCXwWGHWFi18ekWsn6McuoPIq
	 cAIe/nwhbH4oSK6dnzPcnMWk/JDgLy5HdsOvcwx/80TDFSvUL8flLn2ELpsFgtTwnsee9
	 TwjWxNgBAMQnV9tlckYVT1OKDh8RHOgQZmVThEj1/ft8D4cFpE2nsCh6JpmJzg6Z6DqeW
	 Cjs0tqVUJD0O5tbvF9h/qm1xLa/PeMJaI9yUpRCnlfYiHS22D7KXdbUKhnNr/fEisTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qu1lOI8Q;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF670606A31B
	for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 14:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF670606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qu1lOI8Q
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956869750eso14438035e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 07:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938268; x=1793543068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=Qu1lOI8QZekGc0/T3lNosVhVwTnTbJ87BRp5/wQvCSCYPk4ikw+AS5UJDMKlxbVEs+
         aDRKaCRya/og+zMFwYd81rsxgBxFa1/X5ySr3j2S4jRMiGp/QCV6f/AVhatXNWurb6UE
         RvCJqwQU+NzB4bPso1dYAlrdgoTig0bHUN1CUDWPSNG3r8Kg8+zhMR08k6aUfbbcEmMk
         GUxWNS1ACsh8WgAVL68lI5JkQlBw6b1nf1K7+Z5Q61tsoHuDL7uSUZN9NMoJgsmrxMzV
         scu3MBpumqc8oyw5GFlS2jUunLJPrOtNMMF1PN6VMtQCbLHm30ZIv9Mzuw92Pr+GaL2A
         gh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938268; x=1793543068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=RdCkqkMLXbIDXeJY15iwYdUjL7R8pOn6ekR0X1mDDCnvhcjyh7KrbsgAcFXFWXf0np
         WHKc/4mBa2s7vhkOvQj96V1ee4t6VZ8QeABAgAaX3txJ/2X2u46AS84sYV8zr9Awu2Jp
         /BrU4nZfB4kboneDXx+fnT7CMi0iplSC6HIS5ZXYwoiavAojJ403eqzwfWOYH+lUzQgt
         8ZaXHvbk8x8bMEjw7PG11n7uGFuo2e8cFfPpIzvhxSZZG50q4No0qWr6NexNpaP4TUBK
         7RBNg0J2KR95j4Urk8cAeT0enwdMUTKPrHvJucOizUtBm6NL9gUiaI6SbMWEQxmU7f57
         uIQg==
X-Forwarded-Encrypted: i=1; AKwUvBwzLjk0K5CUw6s3GM39GOGb7V/NkqjIGugGgREnC9imB4oepPFeEE/2QDTnJx88Jw+b0y9kwycs4ZxQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIDMKvriKrnCYOIqLU5fmUE7pwPUiYvk0r7ohZkG4T0U/6787VJ
	RR9zoVmwNJDCApoeLEFa0n3Kk350l+NLOLgnGq1lKY9tXoZuZvzUAg0S
X-Gm-Gg: AYBFou0FrBbF9Sm1mfK/Iywq5hG/J0p6ExJKY3XymJeFde5hUpug0MqPKUzw2Jc6nHu
	kJK3rkP/5gTMgl3P6AKmS08qx24WoRcFT970/MgIjdTMFh7bcNAVtbm319SebHrbnzU4HVKAnB3
	7/DD2kNzxz/nR7pTQ0UG3FfyoAXsVsVVnkIiHwBqmnXMEdfJbTysxtPN7GZ7RRtR2WKAK3d51CX
	5j5nIYEg1fOOIAZ99q1qruLe/Iz2KPLhzwT85mNN7Yi1O2OiDwufIjl+tXSEjKqYUY/lwQ5FYJn
	7rUT0d/pdqK6nWwLeZJcuT6bQzzYVZ1pzqTKoaEWtPDU6eTDbp+agx9fBGmeg5dhpGPQDP0+zGW
	jlcSXDK6wxXeVRKNAMZHKqXkYqnQbtpjgIsT6F/ZUEPF9KqrSAeM1h+hDACwuCRIEhu0Lfn0+IQ
	7G04mGCbsFr1gl1Bcz5tgyDCRqL8tgdz6g+wIWD08lhHQW+TlwC0kcYVdxho/V1B2Pht7OBA8SB
	05pMXF0Fu7l0e2M+wVzjCIMuRrVy/b9RGH/0RsURUNTm8fk+8Oaq/RDx3t+I6JQa/fiA/b1oiPG
	kQu0rlCxnnlFgQ==
X-Received: by 2002:a05:600c:34d5:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a35aca2b53mr66206695e9.25.1792938268065;
        Sun, 25 Oct 2026 07:24:28 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:27 -0700 (PDT)
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
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Sun, 25 Oct 2026 14:24:11 +0000
Message-ID: <20261025142412.112216-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025142412.112216-1-pmazzini@gmail.com>
References: <20261025142412.112216-1-pmazzini@gmail.com>
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

