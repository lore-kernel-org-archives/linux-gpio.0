Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F282238D01B
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 21:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776721021; cv=none; b=u7vuSvqxdybBXkE/2xd1LmB9Utdqgl148W9tvSlsuGxZHGY5/kC06kXgoVvtHnm9FbvFdrRq4DRMNfDNN6O2GVu1SvpZLHZp2Nxka1kzJYHvWDadI6DzV1FB4JaxiC9A00sabIQMVFPSuboHE2t1rgNWLMgBOhFg6H9wzQDa2H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776721021; c=relaxed/simple;
	bh=8avPzjkVf9V7xqsFuREDbJnx4rKI5nF9UCQknqLhMxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLppM5cZKaLEb4Kwjp9O1GnJvyuTw88bLaETFwbCnLjLXvHk0/oTmHlcHtq7gz5Tp6n2+OtOfLakujAAIY/qaYE5VjH1KOy08lQn2KM4kczjXIaiN24dbpdng2IwlPXs7p/ShN1cfmL7FWs7hBlMPl5jyQYYrKBW9/oCGzvyFK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIVzQOng; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIVzQOng"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891cd41959so15345025e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 14:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776721018; x=1777325818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=;
        b=SIVzQOngeh1ibnbriZVEw7KtAeRK5U364aE4zfXi97A74xg0YSIoUbjgKtlyO9Nv20
         /Of7Ba4l6se4q4taGQE0YCG7/xRYCX/ci8QjMzuIM2LN1MjCSms4RrcfrKKaks4uQa8Q
         JDE7PH0b+sJGDmly5ZVF+qL0JetVpHu4H7QAH+LxYxxDgu846R7CQgLgXC3TCO5IvAki
         UcdpaqWHoC3MkzoWLrz9u7tHH83Syf8FZHBqd1wCMmUXXX210qUywwCUi5bVdHy17zq6
         T5h9jQGSzRMcWsO7BgZl9S0LFT4P8h6vWhnirDqR6ZBlbCEsSKa+yCBmMHZRsJ/DqtI8
         B62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776721018; x=1777325818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=;
        b=ijVb1Tbjwrww1cEA4fVWjYpPg6eVjl1KMXSVtjxoAfVQtmyfyUngCzO+ITpWW6G+vE
         dJJyzBOzM/cntotoRhjP+zkg1tYaVkkbCc1g4aUZABFvMdrISBDeti6V8jeicrCNR0Kd
         LkD0k+/FjIUfnia/t2RbA9biT0qsn2vlcBmp2LM64x+FZJBBdCN0sQ/LaE04hJMMM8rS
         +0cfTHpx62Bu/NU3jZ9Nr7SxIvgGvjZ5L66zXkcg2eHCgCKyi/Siu3mco8XLZmP6sQrr
         Q6BJU6jWXubZWgwJq6RaQJLjM/ZTYMbRjwMdxYjUtOW/Sf7viY9MULM3axhHO0GPr/NO
         HoBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zJwfx3g2UGDteTeM8e+ci/dA3s82YHECqasC2pvsMS2WrSkL51RgL2lrwQ6kJVGjhQ1UB0aoG2pk9@vger.kernel.org
X-Gm-Message-State: AOJu0YzPrHUfLKNBgciM4kb5l175S7p9AYedYaKnzhnBgMGTE7AmpdKf
	RfQwPHHvXMKemyB+7CPDRfHL8V7F0JYXSj4Ke/C0fl+t3tDxs3YN/eYb
X-Gm-Gg: AeBDievDsufsFS8d1JMMPXT25mRF+57a4cTE/bo+H9c6x4yRO4Eh63QJrXaHzXbgLpe
	iLPtjPgW1u7N0NdP1AGxxFD1uJC15QewquPhtRwiXZEZNKyukDgUlGPfEMzTBkWorPHdgaH9HMS
	629u3qVQrsJhXm0illfffqWlsURQ2E+VeRBUqzJxb6La4VFlsiZ2u/q7U5LonmFdGcxjVE+3rNo
	0rggl63wHTa6hEiWi0pb4ObtS52HtiYo+jRE/bsnNh9ZNxsWc6LGOekquxVcfudaxQBLMzUB/A+
	bbzziWj1V8WTdiGht7KgFl5o4TsCPQ8YNmx+XGsaN8PvUeyqMAz1qQNF1iyFQzBogHBfE7JFahn
	Q5n5A5rQA3KQBhJs576WsBVm1n/TGGH4mJYBqHviAATyIML+xEA1idguYKeN2ewk6rtXauSFKKe
	1uKyMzcP9RnMp1SRkDJWQdy4uQKeVM881iW6TLVr0v
X-Received: by 2002:a05:600c:34d3:b0:489:1cda:bbb7 with SMTP id 5b1f17b1804b1-4891cdabf13mr74014935e9.25.1776721018309;
        Mon, 20 Apr 2026 14:36:58 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:36:57 -0700 (PDT)
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
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
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
Subject: [PATCH v5 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Mon, 20 Apr 2026 22:30:01 +0100
Message-ID: <20260420213529.1645560-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
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
index b95435bd6a9b..2d3c4161a7f8 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -30,6 +30,7 @@ properties:
       - mediatek,mt6357-keys
       - mediatek,mt6358-keys
       - mediatek,mt6359-keys
+      - mediatek,mt6392-keys
       - mediatek,mt6397-keys
 
   power-off-time-sec: true
-- 
2.43.0

