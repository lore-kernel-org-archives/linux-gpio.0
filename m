Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517822;
	b=pzjCBaUn3gZ/cvZ/s2Bo/e5vQO5jc6aAfK/4a6kgWYg8TkDnxv5xJzM80UKqlrfCji/R
	 OUmHzx9p15uLUBHnBbF6l3o1pcirbBKzvaYT8Oq03rDAywYRacpbIos5UgndMNqZvxQZd
	 mLBFqAZBjf1JHNMecisI4y/jO6+48ZibdIv3EI/rf7QGBAOtF4iGjVhsMfXXESHSH9SWA
	 g5zGbHrBcgKXnTXP/yXAn27cyu48cOX0CAvVRV8O6c1AC5EuMw9CLnyI61ISBKQam2Kh9
	 FgRYrEaGNb798eZltE5yOg1p4G2/o9o5DJdaWkkKGLyCKfgBgQ2toX9oqKvpp/zANRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
	b=ayMyrhLKgLNpDGvOEDhDqt7Y55H2oWfgNcRztzDuSLhTNNrSGobLms5YMv5DpEJMrMmI
	 DExZgsHSJrId/q4xhYvkz964uvFEgn8vIZyjN4H94OWZTKPDM+1tWg8EHw6Be8/HzroLr
	 ZW3+Ke1vQ+MxUfbmHIPVFNuT6egbXXNyJ4GpYYJpDpO8CYqzY3HGhpDMcUkRmfcPmcY7m
	 MyuHwcu4VcyDnIZNaWfIVrE8DV1rT7p0AIjBvtxg4Ihczvw38MtYJ04VPKuM9va2TfvIv
	 xFlNBrhrb9GXOS//3th8MhWG881gz+315aA0POLkrqoUj4Z8bIUqrVeOsT27hMbAA8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kpAWwkFI;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABD3606A330
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 17:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ABD3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kpAWwkFI
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so18802495e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 10:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517820; x=1793122620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=kpAWwkFIF9xwPv2rF4Urtm/z72bnzw5wHjMRnjnWDZxbuO7568i6CG5x73NUlEKKry
         mx4b3vUHZiLTbrlxfQ6kXksr3dCLRwWiSDnIVvShyL42ACssSuvYZH14lS0Xkl0J7Qnu
         2F/5fMrlzhcFCbD/NgUIr8NegG13j3QAdsulLO9FsOLYpA1zmr/2egF6qSuhdCwptWcK
         AUrr74TZmzZMEFYl7CLnyzFVu58owtm8P87VwPcNzJBtHRujGkGcreuzRRtR6lKn4lKq
         awiJaUyI5dNBLJpkJ5gz4iQMyBDgXVeKhMonvHKjh/ZXQYbUUqlfwxsKRIdOIEohtEcl
         igxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517820; x=1793122620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=zQeL3rjwavWBqAjRNbV1vBjoqa59A9IPlQ30PmpafjPbdYE0CC+aLyhE2DHHlDQnxB
         I5fsC3clM+QtIpcqs8UCatwwHB2kByf/eruSRpPT2z+StxhMgJ6gKNWBSjrODfxRKGx+
         99ZQZWY8H1u5sGlOKYqGsopSFg5PzAOGwmMArxBNPhlyJGkPUQ1wvs88XmGuvBKxQXpt
         X4AoXDxZtHFXlwBOoOr7pNGxh6Spest3FjQOJ3slhcvbCXfNR4nUD3E1+EuZQ1vPueel
         tJGiQnhaIyYSnpu0fOKtiFEiUXuQwAGKIaAfMm1bk4FZN7gjayIEY2wGGYcMEk4zTvkO
         l00Q==
X-Forwarded-Encrypted: i=1; AKwUvByx4fDdfPGKcKKm/Vxi6lopaUOUzluk9NZcVK4iq1s9RzRfnIiQJoL+IQN95yO21eb8ZZgzyHFIc6Zc@vger.kernel.org
X-Gm-Message-State: AFq9FYLwOHcI08K5WlPmj0J+ts/Mj5VvbCZlTfDEifDDhT0WYbLBb6Ib
	+8rhALTQCuEW79MeoD8PhBpTLQWuh6A9nsmLUmLo3UxBr4SQqfjrShsQ
X-Gm-Gg: AYBFou3XzNaZCH+BxGWdHxP746VQUc3iXtxp+eL5J80HsLapE/Z+s0hVNK1AORqlBAz
	k2Y6ibctIAcz49Wt999Q8kR2D5GsfdR7n9R8Vl90fyGrDt4KXr2/b1fmMswyPd0C3BZZR967hD6
	i8H2ga5KqZdCUA0PvGcuoiUvMAbFAqOgwBjXZvVJEpum9xhDhIHH2hb2TYl7wXZRGMo7yln3Pgk
	di9oVgvkQU6+PQWej1encQSQQOdkERHuYu3E83Zw7VskwrXvh38PBTFqXsnbeQrbxEQiZMQu2se
	nqheIVO4Sp8Qq3DefR1LikgrD/RiMKen2sGO3MkzTdfXHrhrPef9vmT6EOmBjyww8+TXNHvIxG+
	RRwJLoceQXCgns8FoDxFsgPtRYq7RfcjG1LUJE8WqonCiOoatcJEWwASO1s9aKKgeOiN3AvNjVL
	M/d17zj3XIIw9UUoE52R7TKJi7xOAzrINASFNN3DzFS0oBWkiQboYmbhBP5BtDfGwBuUo=
X-Received: by 2002:a05:600c:c87:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4a1fae2a902mr22956085e9.3.1792517820215;
        Tue, 20 Oct 2026 10:37:00 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:36:59 -0700 (PDT)
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
Subject: [PATCH RESEND v10 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Tue, 20 Oct 2026 19:33:23 +0200
Message-ID: <20261020173556.632798-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
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

