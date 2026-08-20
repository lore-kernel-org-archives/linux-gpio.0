Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C1843F0B7
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 12:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787228766; cv=none; b=U1O9/QC7fejIF3M9Jr3thwt0NQ1QkYOmqfvqluDAxNgm+rtkkWG+I2UtB4F0ugSH1h4JnEG6tGRsTG34ib65NzYiY0yX4k743GX78StCBxpqjwfEeAGDIPXSP80SRXJotLD3qnKLV+VtAkvF1U8h3LKSzlJQ2fn1EUvMsyDt+w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787228766; c=relaxed/simple;
	bh=UGIM3aTui+shPbVvhLT3b5f6OpTvEv4JPJold/DY6lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCLBNxaGylRrysx+dnqvnsrrht2YZzqazgYwd1e/J6VyqCBvsBe9OsE27Bv+TxhKYBSVQ6O5bvdmVysRpECVQEImhBvnaYeaVS+IGVBtagkHQ7tyqpveo7Q6GV7gh7WekGFnbArGIPzFUpOsmgR2xChyNiUZCqQHw8T1btPBDSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smH3jAQh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smH3jAQh"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49954b88fffso22524745e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228762; x=1787833562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=smH3jAQh3vCdNjEeaF8UD3BHn5lWWVbhOwqm3FC8giSqd9hZwfYsZeeL4tdwGGs1Cu
         S3i0NEZd+bqjXPIAOuWVTA332n7IMUoZqGQaEvDtGTybVuCL74ADlT53Eoi8vRiJ9ub/
         4t1HZdFxl1kQoukgKuVTlctHv6Zo2XlXuzP3xb9eBt83EEtYcgmUCU2aGt3BwjPWZxi8
         PtRyJES5t5KSkshDSzmF7g2sA2rZfhP55t0MVXNOMGxij+bs7nqragOUvxfrn8akP4in
         mpBwd1m0X1BbFpraBDCseUUMe7DQB9xOr4WBTrQAs1QdlLlUo5OFPQTo9Jpc3sTSLXMt
         wMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228762; x=1787833562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=GQcLgHrEpvNGXoneinaoIZg0UmYo6P9CzqQaPjMONTpvKm/RMnMPpOoLFjguPQ9EJh
         PQPjfZx8csfgT4kFbXcpr9lIVWjT+xQIPstCSIgh94LjfwJL0KuwlGZ2510ook7VjP88
         trUbHJIRySb9BiTfdFO2TkbEXFQREKpW1hRQ4xrtBxXH4wTKO2VfrQCYdKQjOYUtLcra
         l2o/q8ci42V/Tgi9KSVmqUUkvoF96J2H74CoMsrFLClbFTHPbsZPne9K6hxgCSCY4wUY
         cB2/sfAoFBB5Pq+05Aqt1cy4SY7p4P/oR6qcrm9W4Yc/9leMTsUYezwrAs5K6nPgQ8if
         kSWw==
X-Forwarded-Encrypted: i=1; AHgh+Rpu8ee3czseASdWSzeWN6FDCh/jey/pIBhBaDg6GqzVuIOgVtkfX0i2KXJx4Eshm1Eme5bJj98yonXQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Qobs2Nms5TFa+dnwH3ne3kTurHRSNClYIlbEjw77+DWlB4us
	5ZBA3aTcqQn6RQ3T7hA5ah1si9M27SpsyI23TtgvrB2IqS/Pi4XedxK2
X-Gm-Gg: AR+sD13njTcDoCNCxQTElHZ72fD5UdPxu41IVb9rvXyfaH/JeguFjx59X3SF0J+rOKU
	aZEklUREcgFvLHO23BfKeeiLUBJdSPd/yJPNkUJ+C3/qrZuSfnWnYCz7WdN78yNIi8o37XqKlKx
	khDMP1mCIKe5zw4yA9er6CzPkt8jQvJg50Mr7di0HguksFGlLrWpe5/ydztLSQczfsa6MZtP5ue
	8tLY69u3D4LNjQhpTR5g8qEJKx+L6S4nsAIxaJ8f+fXsrWiPf6BRnHTKDobVmrO2DQOlVROgdSk
	355MoRPpT8L0YhskNdB7LcctcVjUHbHB515FD1JJi7XZRsidphcR78Kfo8y8KwX5oib9NAa4QGl
	F/QFi87b/Vrp1jzJMWXN1fqlXmmz0rPAvwYSiWN+YOvJQuI8qBvb0tE26n3mujF1AglaUVLfGfo
	k0l4qhsU4zASkhosI3DTKiFrNQhSj3YmLnKIGy7XhSQHG5qkPTvfTyWA==
X-Received: by 2002:a05:600c:8b65:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-499aa1722f5mr231760135e9.6.1787228762272;
        Thu, 20 Aug 2026 05:26:02 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:26:01 -0700 (PDT)
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
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Thu, 20 Aug 2026 14:20:00 +0200
Message-ID: <20260820122242.120039-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
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

