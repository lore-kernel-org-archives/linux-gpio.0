Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D01202997
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 20:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781985677; cv=none; b=tpeDCqVsXQO4XbQpbI0fjGUdGdgaxslLr+QxWkECegMga4N4wosBGqbBGBrnYvVXcPQPKpgi6T0tPlhl/sm0MMAHjWeKTaVcLEKTlyntfC2az9uXoCD9iPozLcLufZ5vi1Fcj8nUP8T9WNRxK3TzWtaShHwrgqXz37EQx8YTSNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781985677; c=relaxed/simple;
	bh=UGIM3aTui+shPbVvhLT3b5f6OpTvEv4JPJold/DY6lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dkcXjQyWNfSO24qocrpjW9BmR+eEhazOoAF6jqzOoyaVbPC4aZiGMGXtwK0JSn8k9+TECnd70Eel5lCkXyz3rCfbhaD5jvSxkmjx6yfo5ZLIFZeoZxcD9arAFx23iNvSNG1JCfoaRVO+X+420+1oXQafqg3mXky7IfqN/g/gIb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vh0yTGa9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vh0yTGa9"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so23010955e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 13:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781985674; x=1782590474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=Vh0yTGa90+7WA9H2teAYH4fqZwLprY+cgU2m+PZechgUkuY2cBgOIUw7vJReHItBOT
         7I3Yz9jA7K/1SPahTTmhQgQHy5kGaa5EA3StSnDH6kLolptx01Yc1t6MxUFdXYydQRJL
         IqVfHfmodBOKMgDnBp6kM3PJX/28azp4Cc1ZG/2BBJyMpGMx80C/dnpsK1R2zXu2i1Xr
         GEL8/Swo/yxzfH5N5NYGlWWOzb/RTzzVkdcoOq78hHGETf0171h9ajeQ4S/AqKt01BpK
         pu4DkuzDNK7BRmZzKWMtFeumj4BkhjiGMmMThxFvC7MwxSN5bbgQVIgQZbzglkZxWXx0
         TBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781985674; x=1782590474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=iao1cGP8uIr5m6liDwSrEORhSweM6NyQYKJ2Xo1dqQAGSmUqQQMSa6pzxNsFLv887F
         RWAkRGnYgdIyUc0pxF7HWo2Ngbkv9S5Urg572BGXrwaxM7q/ycufwr5DYu84PXMPry1d
         yyEKZ3vUbEfPf2A1sil4Mbj3ONVdRXXox++fa0oltNDZAsdthB55hCNLYZFxe+Pl9vB4
         F/WZQS86XNCS+Kk47fMF/fhuHlijLdc3dG9d0aNY2NUih5W7uP8QkA/XZMQhBdwomv7Q
         TsSpS/LSh8cWiJu3q66RrsOjjMwBd0Qv4WfACZZthQD3v4KlxVx4zzxXFmOl42Zo4+e1
         DsBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OMTXDxJAYjTOSv75k0SGR1dXpOgtTZ+szKCAxuHWDgNu9KevNCxIPlHMZRBmOzU60fMastbteiLjn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7y56UF1iOxRTcyFsNjNaBEYOqXgFEWZdV/yrI+Rvelqu7psrq
	QtVXMXN9wbIC4ftUEhU9pLizWf8j/Fu+/R+BAzQJPjfpg84bAZfpmCEC
X-Gm-Gg: AfdE7ckWQdomsaW3wGE76+cOQWAAuTzKWkmvW3722/4hocPsPm7YQ25+/osfUhw3rjo
	GEYRihnkPiw3CU2TW9RD+izouoq9ikBmAfA+uF6oqlJVJjq8QGgibsJZ3qJqCjSYOy3edDoL36j
	L/ayPgHrKQl2ZFcAgt7pEq5NQWcEk6ThSJrLo8x8IksPbO9fiUpYjd6D5VIhsJkngoU1BZx39eN
	WNJa5sN+amUgykJAEPTQ2C60S9jzJtI2qY1vHQN+4+qiYALioXYdUBQ5ONjJl34R8ZMYbhRM4VC
	bQGCGzFYUXFpkmDZ2aexvbXq3RmjyKfMGNPdCnVDn3xNknhX8VvenWwD47w4eYjTYEJFAMOaqFI
	2MVHcHNd/DFyJ6MOeRgcoNNyxXPieQx5/cWtTuOpOLDuNZnjjKgWDGyJ2+q3QWYl/ty+Yo3avj/
	lVXjIWLg==
X-Received: by 2002:a05:600c:4443:b0:490:44eb:c1ec with SMTP id 5b1f17b1804b1-4923f582c6dmr168656025e9.27.1781985674088;
        Sat, 20 Jun 2026 13:01:14 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788226sm10708354f8f.23.2026.06.20.13.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:01:12 -0700 (PDT)
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
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v8 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Sat, 20 Jun 2026 21:56:48 +0200
Message-ID: <20260620200032.334192-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260620200032.334192-1-l.scorcia@gmail.com>
References: <20260620200032.334192-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
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

