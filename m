Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFC84ACC7C
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 19:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377700; cv=none; b=MIos4TRVjsl7SUdFfOWrraakU5J/9U9Y/NqoTbrLiwui5VXnfd7v4NXkPNaGpleNF68XbLbHlLDFDZH8IfSkLYSIgUURZoreWQ1FtTl8TFnjV3TnUMZlTdTWUHl6EBk7eMYIQu1k/jM9j9YHqdWKPAFNcvCplBL0J9fyESTHQK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377700; c=relaxed/simple;
	bh=UGIM3aTui+shPbVvhLT3b5f6OpTvEv4JPJold/DY6lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CE+IvYHiGFpsQ50wadpUrJylKWSxGhYhKaIpDf65QNlNmvM6BbweLp50oNHeScDzHY69uCy3gtSXo48Hg3wJMGRROjj17PyQk+Npr3/sV8+fVtjWjkFIsMwsw7DWA2DDbELZi1U3FLSWJ20VqkX+1MVc6H5CBpJvl2w+HlvnU0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XK9fhsdq; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XK9fhsdq"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482dbe4d247so645118f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 12:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377682; x=1788982482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=XK9fhsdqDFBXhDjSuvWJfNE5vT/jVeNPYAPP/NsbbmaD3WbbBJ8NmTOZ9mY8+VzunN
         KdMH+E+kYoUcuDdKeZfyf+1jRkx1ke28J3+mJxybitnpa9GE4lBGiOwLiQyZUrsi3NaQ
         d0itTIUnxjzeyI0qb1nEyA1sVdhEI0tKyoJylS0I1fofsuoD2XAW9fSCMkYPTeFTR51l
         J2JLqSmJjWuq2NXZP3vy/SS3Qsn/0TSbIo6dLmvzySLHrtcj8M3mS79hUxkWp5KYUrsH
         VwRRvKTb6J64DZPSekFwGbiuS66QqX8vv8Q5C+MqTKv8BFOQABLWhFgiZZv2eUPkPR5i
         ffDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377682; x=1788982482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=Eh3yldWxOtzAccxgdjBRKFxylLyqsEDb9EKx2FI+07NITi8kkXWDZVE4ReGhDAx/60
         9HK4GrT5ESXZYmefFuj7kuaQ/psP+rpDG7C6OA5jNbVaQngDAsXslMMcRtYMv3+wLgXd
         vzVwD0DZ6qykqwNYSuXzKuEVh2Cc+VOBCzRIzpw9TZKcKRM+cGxdCIifnYN7L1AXkx9t
         Qy2H9q66m9PWVhJsElOmdycXrCCaLhCNp02lCaQeB19sW/h9wn+xJZaD1TodxQav68VC
         51Yim64lT7Qj+UsHbFoID2Zfi3QnvvxcJ4KmG67BnsaWW80M/uz9sF8WLvvhcepd13tn
         COKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuGduT1Y3gwYsEPmSLl85O3he1PzDo1w3BGNAQV7BPiZ6KGdulZ4yK42nuoDV0AKdMl/zT0yllgYyl@vger.kernel.org
X-Gm-Message-State: AFuF++k3gdZii8oLktxig1MHk0yhWmRuHgIIRa5iMSEaLxtAjpojBFFY
	kD00Snj1nNuYN0NpHkml3GeinmGkkChzEhspLJ9QRoCV7KP1VwQLEqMo
X-Gm-Gg: AYBFou198JYCdkGY9ZPJALVeQVIY65rZddy1X/ROQUxiCHoYMUm5DAqwdnm/RMDZCng
	ftM5z/mNnT0lclXHdgZsiCGkunSp45dR/x3P/ugfOYMq8vqXfcqaylBUp3sQNwQH1umVEFYGzBQ
	HCsqPWdvnQMWIqkYP+u16a3tRa8T38jU3aAV0+zNURbFMF66xadykX8SnUpAsDLJgH5kx5dndIj
	oU+CH0bCUkNuRPJb0YtUc0+hxg6v0gwrwg4NiDmD8lPkwtLDgyjzHm5Dzvfu6JiJxsnqUjlz8nV
	sfe12sQ/8sqQws1sQgOrHF0Kc4pDt4ttU2RNVJyuiS9hz/HIFOwijPMHyEowA3PysRm68aRzPsM
	MnnIx4Qx2jgc02nl5iWBq285zjOy5/i7ZAEBDSWzmKOwAqkWU7abch2Wklx88KfubfyyzC0hn+s
	GQNRH1Aq6X5bpHVVQ96yZd9i0xt8JWYPt9he+DpN2lqMi9/hNrn8bjWJ2d
X-Received: by 2002:a05:6000:480a:b0:47f:eac2:6f55 with SMTP id ffacd0b85a97d-48488f2229cmr14997817f8f.19.1788377682430;
        Wed, 02 Sep 2026 12:34:42 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm8889191f8f.34.2026.09.02.12.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:34:42 -0700 (PDT)
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
Subject: [PATCH v10 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Wed,  2 Sep 2026 21:25:38 +0200
Message-ID: <20260902193351.185771-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902193351.185771-1-l.scorcia@gmail.com>
References: <20260902193351.185771-1-l.scorcia@gmail.com>
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

