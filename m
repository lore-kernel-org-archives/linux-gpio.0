Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579935;
	b=eXGmY7sIM6L2LsEljhMzBlVD64jcLRi2nQOrtw94pstcPQGAT6GY0C/Bwta76rnuxp0G
	 RUr8B3HsaCcW0nT6zLBuFYUVxXHFrIgAPZDbPpLOAKpTTwOWO5kEKUl+z6JT+FgLHsyY9
	 v47t2w/+syqOKpa5CBph0lNyxR3QZNobGVU0/m1H3nKsknOweD7agXyOTr8mu+wLdn1vZ
	 7jauo3TFv0irYTI+UT9qo3YdHttDkTpXeIqUiBJzJwfFUlG4y6g/TOT2iEA7dspJI/Mzc
	 FDyAcvXcTWVYC+xHpVkG2mj2q8Hi1R+2bOhEyW2XHZsJM5M+fkJyhIaQlWvcYxF740A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
	b=2eGmzxbp8FwSvlNSLbwj081vRVYcbRJVwqHA/CVAsLUT+h0s9/srSX0tdXUKcLcfIYC8
	 n0mYjagVXXuv91prGkWfVqHSd4c+vi95rtmeey6dtr9nvllI0vA/fWfThf0lyWwWB30Wb
	 OMADY8ZQC9NyLIAKgqsGPJcmMsJX22x4lIFUlqjdmYI9Wao8JK19vhhSMQIixdyTKj4P1
	 Q/vEeIQ0cEcWZO0k/61FF0oWPhqg5e4jL+sNkz1/xTerFvqBXr3N7E4pML+chPqrxrzNq
	 mM6yD+vxmaBjcPvFEiv2YjHS4Fl4/jya/BB3PfYOUmUxcu2roIPEDOdYl1HR/pigCVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=baH1H5HU;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1AA606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B1AA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=baH1H5HU
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d05d51553so3945635e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 03:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579933; x=1793184733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=baH1H5HU89i+T118hkko/06VcnYYiJnn4oobqwgCsllxrJMDL6Wk55SvW0p8z2Ag9j
         uQyg5Z4TStPauoAXQupNfY9XZVOYpzLV8q0NQ4Z51+rsYF2nnKLlDslJp7hJwrUXewam
         v5xg2r3ohdM2d2ua+xFgr4tjsEwmr7L6kw0runobEQ4zJwJKwY3Y/7SolXnI0VbNHkyg
         oz0GlPBkxD0y+iTmKgpJOx/yrTWcD08yYWS7A4dg6HtdE96S00B/APkLTb7uGhrmw6aB
         pzFhNeEo/+gJXuj/vZnGZPLL7iv2I/yzPoFFHnLoGBIQNOQp8EXBVm24d54T0WIsOZtJ
         Sxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579933; x=1793184733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=lkL3PonGI5Y5iy4idSqeIzeP9VX60bKewGY5Z3iAMWf4cuCpax0OKiGxVn4QQlQZcX
         n1t1XX2+FRRUHGeosVSWBtIcZm6ykVsdDnnQ7GaAT+0OFPS7Nk4g3xoY22m0amITfvwE
         1rJFZKzmDL0OtadDOV4/7E1fT0AbUE+lccNrmgKYy/c2BrZ33PkcY3qpD9Iua1oQfimj
         WJlr7s8jAyJ4W54g2M9BEHeUgV7ZQUCbWdkVdBLUm+cajEKvLgPbSNn1WjPiqd9MSLns
         OFrwWhGYb+wm7Ic91zHbusKADDXFezf6dHrGTMCoK/r1z1s9W9FW2/q0poCWV4ltyC5Q
         0J8A==
X-Forwarded-Encrypted: i=1; AKwUvBzPPgqbO8TaAJG+i5Ds5y5rCM8ZSz3bO8b8oiHj7wMXOsuWzclI5vizTsLUaYlX3bo54JO/eJv39IjV@vger.kernel.org
X-Gm-Message-State: AFq9FYL2Tsnrpl7gkLFewFE03N85lhIy2ZopVpLMkpC3Qn8SO2KmjnUu
	5cJMAwhcvC0YF7ie0i7tiu3Iop78js7cxsml7aG6WFEHmLUNGa7Kx7/Y
X-Gm-Gg: AYBFou0oOSCjht7O2UQP19ErJTFM4niYUFp1J3OYVcdYitapKzL2KUZYf7VHCS9rHy1
	XuFbCkEKBGFi8FB+SSwHgoTXpsidVUDicD/mRHZaD/PVcLiVgIomHrLOPUJtaJuZg+PTqvvmGYf
	nILcjvnbH/4vAQHD+cQuNTDIms3cRUYV8oHwiVkm5xOC7e9CCGSgzClovofDhSyyTNn9DjK2QHe
	mBd3jE6/g+8HkTXqD3oAKpBiBz+2bDh22yWxrd3jEAwW3gCWDKAugtMyMEAqksHo7ItDrnbMLHE
	MHrtCLdpDERN3DcuCrmeXOWvhQR4genOR2Qc3YyDCfNXlH4L9gxo1e6Vk5+AcZQ5yD4H5ANkgyA
	PC2FPw9wrcgxf9H38onAmfh0Cayax/er5s2G1bREt6JDwd4I6a85NrK+9P70EywrjZoqjavvtql
	7STuYmlY41zIleyRx52Gg5RZFFaaefYJmqs20SYhUeMFUf5IXkJM6SDM9xcrdRzy/0XDxb7a+m5
	If9GdSTlNaqY5l50US/CXEzTx0ZtsUtkPV29TMTWV3OIk8db6Aa
X-Received: by 2002:a05:600c:8b0a:b0:4a1:7ed5:99e8 with SMTP id 5b1f17b1804b1-4a1fdd23003mr30749575e9.22.1792579933214;
        Wed, 21 Oct 2026 03:52:13 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:52:12 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Wed, 21 Oct 2026 12:47:20 +0200
Message-ID: <20261021105109.199886-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0

