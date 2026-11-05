Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907923;
	b=z9YMwC2JPrX4BUvkzq1d8tjB19PaxaY2Lj3BmwS2VQJ1qzZPo/1QXFLOWJfbp0QOCeYo
	 8q6hHMiZg+20snyb/2Bhrp9LAF9Jx2j+X9yXDOh6j9sQyEyHN+RVeHlkTQCgJEOl71fZ1
	 1Uw8YWEfS89Q8PWozpV8g3d+JWuzs+QR1I0k7hvCpTsP6Lrya3L5AIvD8cazCkg39vT93
	 qoOSZ1CRQ4FeYT+Shki75lLdkDS8GzNnurZLX0tifV8jF9uNErnZARidW22odMbIgzazr
	 0MjDUkN+nUmJ3fXSmLYzIDNz8ZLhQa2xufSHG7WRklFQm91HeMYkHJYwlmsHyf+tKTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
	b=tq87fjxCvuQEXeyOgJKVO/n/aEAE0nOvxu3Fh+r8kEVh4mS37yw7GbkqBmog4b9n95ty
	 TiB7RumYGXKTdawTNt8kMytYRGdIPr8oc5nhUez/C/2tN4MBYhpGW/yzj1dvBBwADYyl/
	 /WztP7oqcrsIB9qIvP4Zwvcqs63zhMVdZtEUGHFQh3r3g7oP4O8WLiU7MqUl+I03k/Rik
	 B3T0cNge+QeErBzipdKN9zTa87W6nWUoCwpt1bAHeVJPrW0p/eo1aomPuoHoScARHiKK3
	 mK0r48aP7qNKmD/RxQWgUiNES65K32obpPNmHEZ/FUK38T4HQSqgY6UCE2WKU49aa6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RrX5BTtZ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B696079566
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 19:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B696079566
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RrX5BTtZ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso17628975e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 11:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907922; x=1794512722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=RrX5BTtZ25KAkyVDqIgIjSieI0yowwfSr8T6mwymv0DBFz5APBPsQ60BLti2G0x05q
         6boqmc8T+fJnxWSpzn8kJusKUm60NFwdJju/vVYZ3iqkbGQzDtfFvv/qi3tNuErvjFQe
         11nINNWnhw0ATZ5Z0jI9ua9qp/9M4BXOQh8gsE8HOJjK9+JEh2ZyMaKOxeec2cZVtpKK
         k8HMWcB67/FgMv553KebZ8rp0aOtZ37D8ZbsTaxepxk5+SsWn0SA5ZeuI9H04WfA/VaL
         WJq5E68OZ+r+EbYxT3Ff7TSgkCiF45epeHQoZdEWx7D/vK7+0qaxziCcKWwcGhlSdQT+
         Ybnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907922; x=1794512722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=nZ2AN6GGZ3yzpBw6XJu71Z0WtJihX5tteNnlLxrIKUvL06jIv1fftcqp7mVLXw9/Rv
         0yK0VL+eLIR/DgqlrRPakb1Tn+EQxBOAoVpzLz1pn2RMldvWX3RE0U/jhIjVs9VBEVUz
         lHMm9tFdLLRk6+WLBIIM+X/ofcfvlhFS7Rz4+xb1NWxLG6Ocger8v7Re3teFPgj10mGS
         2gGgo9gZnSVsGXo/IiIZYiUKlOXCoNsge4XPg92NR/1+Yegigg531Hoo1P3lrtDNDkoa
         MhKXKE4zgr+AgDOkhZ3qYghiLOUu8oUagE3HOS2M4hX8rYXRTuKFSLyXAyz+4tKjYvWY
         ekxQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5tDWlmINoadrwhSg4LdaOMuK7qkUkcxEoZJWV0wN+jhIubUrH21XTQ/nJ9byCI2FQU2SWaeZTX46v@vger.kernel.org
X-Gm-Message-State: APuU4Z9C3o3IHVc7Pl0bnccp/fI1heH6x9zXl7xqXuvV47VcZmNNvcA9
	XFUTgjdF99sIaNpVaIpYdQyetIvH2xyNsYhLWcFE1LbF0zAO0xp6OkO5
X-Gm-Gg: AYBFou0yHnqhC/Cqk8YLtNKQtuWhMfl/+79qDDVWKD+KdSxgrmKeZr3q3CPQgCLjUfw
	U/KCRML4ComxmXWHOF2gT/U/zAsboEnHCHPg3PazNc/uvs1LrannkRxK7CfnMtoP/sUKstRWxen
	g/dEKzoYZZBdtUNKoPa2vMO+pfm89XjLmYSRNd3nGXOOXJKTp9rGIfP7i7C4BiVgoMcvbvVgQiu
	k846uMQQKRBcJdZvADm14TLZT0l0XvhaKvF4Nq/9GSe9R12BTHAx3p8PQqfa5duQBl5d3hD5Jyq
	sEXMJmJCwhquF6q+rGuMQ4xiTOWA7/nGWlAgvFKyxKLVX5ITBSmBjSquN+tk5uMhME2OCSuZyjn
	2td9ePYjsnJ+LvzqfrEjCQBttgvTn9T6cfU+kpjLpqOPEQthfAb/56o9ZOlp7neKWaeQfbGhR9J
	ZjxW4BTu2w7FhuplQzMAoFrjmuiIilq7viq1Z8OKn9r7RgGJPJ3R5Ns7sil2Afmf5/ombMNOwiU
	6Yu2ebIGB5XGEcA84Zi4W9LKoxekblBk+UGsxBw7GFDYnCv+bJRhTpr8AwfJ7lEX1OUEKREm4TO
	DzD/smGU6E4rBZAzoVJeMKyE
X-Received: by 2002:a05:600c:5285:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4b6db4a9a2emr3123275e9.2.1793907921887;
        Thu, 05 Nov 2026 11:45:21 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eaabbsm4204265e9.2.2026.11.05.11.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:45:21 -0800 (PST)
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
Subject: [PATCH v12 2/8] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Thu,  5 Nov 2026 20:41:33 +0100
Message-ID: <20261105194426.1113050-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105194426.1113050-1-l.scorcia@gmail.com>
References: <20261105194426.1113050-1-l.scorcia@gmail.com>
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

