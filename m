Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A70438839F
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 10:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384486; cv=none; b=mH6yctK0mcc/u9+orCrscY2sF/Z95urasphjff3tkcelM6mdS6ZYs4V6qRlZW7oI32pkaOE+a+PZMNr3uCL6s5baYzQ/zhjwqz3e2Rg+680kAvWWYbK0NfMnpUbhsphyV0qjias5Nlxd3EF1c1FESavo28NGTnRK3qcRHUNOBBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384486; c=relaxed/simple;
	bh=Lo7U6DKiKSUYIKuCHiGg+bdOXyRC/EOd7zgkHhIi2ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mOVXNr3fZRMuamJCRr8j8kGcM/FAMUuOSqTkltaRT//YKtpi+z+r/1bEctFENP+FE4bDkh2u2udVWXC5hKV/B+ssY+eYXWNY1vaBTBpked3sWZah4/WeTSXca0QT3Wa3cY5s+VZNWj176NS2iQgFoJefZeZ8h32ViFcfBndADeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Td0MX0gD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Td0MX0gD"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so20526155e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 03:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384484; x=1782989284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vzXm5SgiTxDoZ7Na6jG8JfLM+hblqMs5LJx1QPPi68=;
        b=Td0MX0gDZn2343Km58PgJVFcZxIQPGxyzHI5/6tEx4W9tidJs5FtqnHwD4MX5A72P3
         ODDQTRnSuwpzfYwFVLiTP2w8iZvWPJJblPASethx8fOaZBb8UxrGPczhYFyieRgTLKGW
         GNwYviK0HW2r9gvs+Ia5N0oWwI8KrW4aE6ZPZ3uDgC5u976j62Gaf82HBUam5c5HqBbu
         Y+R9bPDLheMUWifuW6wRD8Q3PfmNnpzRjEgvvjHcYZhh7ZZb7b3Vagn91QRRHtaiT4W4
         NYrb1mBH+3STMSAcIGNT+r9xuJ8A6LN+x0NEZSGRtPusxPaC32zlGJpz+Wj+I9JGeaO9
         fmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384484; x=1782989284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4vzXm5SgiTxDoZ7Na6jG8JfLM+hblqMs5LJx1QPPi68=;
        b=C9b2OERyuD5dgSldCbQchotM2WDhP0iX8UKt6fiNwdrdIiP4qFD7mQoI3aCYH+h5S6
         z0FjyvnF2DpTcN5iXJq0HFEIqXv6chsZG0kS+cnuvzI6bJM5Jw+f1MJQQxL2AbNFY93O
         KpIaHppXGusxa3EMniSq50NTa42dj4zEh1HRZDbZ+z5VleM0M86T5DhWx2DRrcctDUdW
         r/2SjjeeE8lROMX0C/61wTZOHTDh6yCl5HxVVN4DEc/ZYFcF0wzDMf5Mz/QSXiMLrURJ
         PY7kmz7qnzZ4JDVvXO5V6Q7mxIEIjy/P308WMx5t9J+wQ7p9HPtjfOHEfL6jrFA52axf
         1Idg==
X-Forwarded-Encrypted: i=1; AFNElJ8CLUTkqtFE47QyQ1h1RDAYQfvTtS04G1ASHyZtbDPr6tMVcB1klJOETmUQ4GYCc6Ce9tMyf0j0kE17@vger.kernel.org
X-Gm-Message-State: AOJu0YzGvW7hnur1b/q65HXdfteGF8GvAhh8VNpaDEp7BQwb9qCULr+m
	RnnIxLGU9pUJ1tT8F/vbsixIWLBXyDqGmhzijIR61Spw1zbJ5KsjtjLG
X-Gm-Gg: AfdE7ck6VtlbAy/d8SVLeotiTh4DTzsrFCf+oA0PuLdP6Iz4iOp5GZuFYJtJPjjFpZY
	uZ8VbdCoS7bTtmhiriJrGwwVoRA+1BVfNwftI7iUAtW/IliS7NktcpA7vSv3sNrGkqayO+XRf1n
	xLPPt8aI1up8/4s2KgaPgaAT84wvAxBksaZ5czYbuFe0NYdApouFPsR38D1KSVSKzuo/AfqZ7J4
	PTrLXAziIljO5lvg6V+ih7H8IGUv3NDrqqM+jEome+VgpfbshywCB8q7a/KBH8nqIuEqq8N6cPG
	Mi35MnOJdIMdjQPzYxGnhNoP9MXlEJgjVIpXhKPArlWTtkIV0bH7CEckaxyO1/WpN18ukHgDVqd
	qrRfxkc4sd4qHh09C8aADozfaXFp+kOsAp18GZ6jdEuLWBI+xQ0JSZuo5quv69qTObEpKpQceNi
	GsnDYrUA==
X-Received: by 2002:a05:600c:4f43:b0:492:660c:5fca with SMTP id 5b1f17b1804b1-4926688582fmr26319285e9.23.1782384483738;
        Thu, 25 Jun 2026 03:48:03 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm15254989f8f.14.2026.06.25.03.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:48:03 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move compatibles from mt66xx to mt6795
Date: Thu, 25 Jun 2026 12:46:30 +0200
Message-ID: <20260625104742.113803-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625104742.113803-1-l.scorcia@gmail.com>
References: <20260625104742.113803-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pinctrl settings for MediaTek mt8516-mt8167 SoCs use two reg base
addresses, one for GPIO and the other for EINT, as it is common in the
"Paris" pinctrl platform that is described in the MediaTek mt6795 docs.

Move the binding compatible for these two SoCs from mt66xx to the mt6796
one as a prerequisite for migrating the pinctrl driver to the
pinctrl-paris platform.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml | 2 --
 .../devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml | 5 ++++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index 1468c6f87cfa..0cff2a352b1f 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -22,9 +22,7 @@ properties:
       - mediatek,mt7623-pinctrl
       - mediatek,mt8127-pinctrl
       - mediatek,mt8135-pinctrl
-      - mediatek,mt8167-pinctrl
       - mediatek,mt8173-pinctrl
-      - mediatek,mt8516-pinctrl
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
index 9a937f414cc9..c703de72e1d5 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
@@ -15,7 +15,10 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt6795-pinctrl
+    enum:
+      - mediatek,mt6795-pinctrl
+      - mediatek,mt8167-pinctrl
+      - mediatek,mt8516-pinctrl
 
   gpio-controller: true
 
-- 
2.43.0

