Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45304273803
	for <linux-gpio@vger.kernel.org>; Sun, 21 Jun 2026 08:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782029843; cv=none; b=u42HyWe74KjWi7cd2eS3s/ArlIuo1VhUwH3Cet1wax+4UtFXcydt2wx9/HTRJuWAjMfhptVtSNSIRbaSAJHr+cY9kp204gR4XrxpOJiUii6xWXM+whuOeHHxZMotC+uEO7WxkxFHcGU8cdjR6jnXihMkpqxpC+g6ZNfTFjOt2Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782029843; c=relaxed/simple;
	bh=UGIM3aTui+shPbVvhLT3b5f6OpTvEv4JPJold/DY6lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nRowrrs2UcOEGbK3AtkatDOvk/vXbAsbu64EVW/xnj6+NxFVQ+oB0bnyY4w8Dns1VXfns6/GXoi7iywnttT/bZygMlfAbv5WQyAUdBJVIFyWcgSZiRj/c+xxvjIQA+14yYW3pgATUXag9iIJIm4O6zTJDCKXlsEyhmUZqiah8Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbyXZtWB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbyXZtWB"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso22647535e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 21 Jun 2026 01:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782029841; x=1782634641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=dbyXZtWBNRHT+OgstRcFJ3dvfYdKvLxQlxqWJgch6ivGYs/N37G7ZFMoBt7Glg+tQY
         GD/3vVUvShCeY3TsYHxpyZhrJ/j64DsZLJ22uS8IPJA0cSZ4KrST4PMMzFi4pdQpCgn7
         Jo/bFBR7ATKZQwnl3dhiaNLK1lnLXU4+Lmd8BkL065B+CMMgRU1Uv97mFX2+vC6utVVA
         PShYw3/Uf1xWEhHneUGV2+g+ZbFHm/knuLSoKhZnebmQZFMY+Of1XFy2rGx5SAhtKwIx
         bqr8Bso7QPYoUTrtVddxlSTmDocICzbBWxJpQ0xCICkPhrx0KRH3Ee0hFBFprmaG5/RR
         /uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782029841; x=1782634641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=UpzfErVYWfkk16tDJm10vRfRXwoE4xUBHGQgkRPIJL6H6vaAQSNSwM5uK1Mr3thhN5
         KwrfvHqo+egZxnEinRPU1+7Bi+1v9lsJVUq2jxuMOSukl50N0k/HYWIuiznY0/BPYcxg
         0EqAVY/uf4/+kxEn8iLFHCwNiyPis2qgHIWiikS+xj3nRAyfQAA01nGQBfxCilpQzS+2
         bLxZ3Qydl6p3gXQpI1KKCkwdsOryVBjy7mGvjflYQATFssk7eapAlvc6T66EjaDiDjDQ
         l32pQRDYCEejCD9jKLYvuOpGW/uk7kC6XpwIHUxr0+KglWVFnwWCly+A2BlF5gkkyWPN
         gchw==
X-Forwarded-Encrypted: i=1; AFNElJ/KP/dKF/zr1F9/gp5v3XUwS09l2E/zyoXO1gRaV+An2dnQNf2SvbxIqsgDMPv0ornUkBQlmZDXVcTI@vger.kernel.org
X-Gm-Message-State: AOJu0YwVMuUcSfIzzYDKJBz7XucOFIboUheGDz0LNMRo7IIheR52YRBj
	bJt4o4uxEsvqpJb3umEwkfZsRvPgK7gAQSaghztkcEBHM1Rnb6dObHJQ
X-Gm-Gg: AfdE7cmcq7+d5Vok97N3C81LtqAobGUHOQne9gfiXtE2tOYUDn39jsZRAuFG8W/d2kc
	UhHQbdf2lc9GGyNao3t4IFxbcbO+7TXuTUe8Y1XvB+miij9WQPOa74QPKU30SmrTynSu8+h1ycA
	LBSdN76IbHvSZgaFsHODEzq4weDqCPLjZuYMFd6sJtDGwRkPg9Ck2l/GVJr1VVM5OdP0Wbqfff5
	DcDiZbbYwwXGZY8L74eHWYDyz2U8j64avs/jhVm05kkrEnXQaBNuHax+Bp6cAyWQD0iF+AhjjR7
	djbmN1cZ1z50SUVzNbrCcS/od9BoXlJoxltUNSJJ50nlFReMbRSACoxOEjq/GGg2IvxZtbMxl5x
	DUS9zUiv+Cz091dz6brfdadTIX4CMmywbCoaSJOd2RNY6t9OJWEpD1wIkqwCsSVmXccHcCC+xmz
	QQlPdWEg==
X-Received: by 2002:a05:600c:5289:b0:490:3d62:f5e1 with SMTP id 5b1f17b1804b1-49240e81ac2mr164933815e9.22.1782029840525;
        Sun, 21 Jun 2026 01:17:20 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7b9e5sm194100445e9.10.2026.06.21.01.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 01:17:19 -0700 (PDT)
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
Subject: [PATCH v9 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Sun, 21 Jun 2026 10:13:27 +0200
Message-ID: <20260621081634.467858-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260621081634.467858-1-l.scorcia@gmail.com>
References: <20260621081634.467858-1-l.scorcia@gmail.com>
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

