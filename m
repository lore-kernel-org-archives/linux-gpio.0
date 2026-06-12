Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996D43A3E68
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 20:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781295991; cv=none; b=G/Iw+V6vhK9aH33ram0JQYUdPYhwO+B0t28BrkEbi1VZ7vHYX4AkcoFggVomXMKpAPC3JIJYIT5tbml8/+J4B6vfn8drU+4EZkVFQ5+EyykpM+0fAwqEMLU5BTWYb+9kVTwkE/P137M4OpdmkS/Ta2ZgDh8aWL58Pi8VJqOiVMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781295991; c=relaxed/simple;
	bh=UGIM3aTui+shPbVvhLT3b5f6OpTvEv4JPJold/DY6lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uBJcO1IpYskLWLTZHvZMT6+m+NyQePWGKSgJukux0Qo7TjLViM7EN42g1Aq7B3BYE3EsIBFQEGP3c9iCc9WyF0VDd+ADDvyl95LJvEjzSv+4Hp1kxdCz0HCswVssreeo6JyinMuiZTGRv4EjEjhs94xwXjKnn9AyN391gMkx2f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AedV3o6C; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AedV3o6C"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef29c5561so690403f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 13:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781295988; x=1781900788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=AedV3o6CKP9etrouAX2aI4TYbvR95xMnhT2ZI0vfhKmntM4pr3UgStPI6woybZbkPe
         KTtc4cqXC2pFmagPE9jIfvkpYkXnK0boVxn3oRKQlaED5uQL00pO3y+oNThpEr4eXgAP
         53FEf7G7fCkrxTkm1Gmq55s/HLCHxbysWTNn6XhF8lQ343pySfjmtgCm4F+/3ZGrs1r5
         LRSvlANumz6+t13Q/S3shQz8MOfgLDPx/7SxdC2emuTrKPiISpH84xWxTUWlgHrwK7Wm
         DBNn3GBG1BGkkSzForG4RF7/d2bY6yDrQ3bh9pZWZ68527o0WmvRGsAa3H1rVt91Yiyw
         Zq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781295988; x=1781900788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=XIRt+z6uOYNhudn2SF/pRdwlQ9OeHYBPO9FBAuX6eXZ5YHJIUMUAZVSgkwlVQse/m8
         eDkAS1lTKGm/aOm5gvwDz4GvdSkpNQaD9Ql3E3D1XxBu7XBuvFA7l1yGwqhHuZkDTYM5
         Xw0QRehFFCZ9XGV8zRvWVEnRpsTHY7eAnKc7xnwAA3UUkDgrPsYUimejedNHpKELSOr9
         HZYCoP3RblAnLUvBj4HOtfefo03g4TYnVpKiAD17r4fKvJ/pgaP+FV2Hi6txnbB6ghuO
         S5ewjuicYlxh8jH9gjaGXY5HzsX1HzVG4JwN7wTJZzy8Abc041PHY75XN8oFghGdijkS
         +54A==
X-Forwarded-Encrypted: i=1; AFNElJ/KAHMkhSuLjEACiLYZLkS64mE9XWERcg9/hUgWWZ2kD7BYddikPh9ZN+tilwY0GTjkA1hjEqHjs+j8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7B+62GHVIeJCw7J4+vQ7seaKyHiXnncV49ZmGH/dG262+X0Fb
	aELXfbmOJIDAlFSjhOsPLCFRtpOMJywi+rpliMlGqOCio5UJTnO720MG
X-Gm-Gg: Acq92OH9l+Tdsgl7PzwpnE538jAzVkpzQS/4QomHCTH/8m/xaO2c58O/abTlQuQRZdL
	DFstYCyk1vMEBuI+yAg8VZQhtmekS9VG9mjtkcQX5j6slFdJ8YAj/3QYNQohNLuKlN8TH+ClV9N
	shMBMeMTBU11byx8GuSHRa/GH3ojTc1mXHpNqoQ/feHOX/JhagFDdnMbG71OXmUMkX7wP6rUyS+
	kVodPNQQSd9O8L3KDcvBcPu661Z3JQ/MWsLvc4fEVeOnBw/tHfGS7N68YZjGE5sT+qtBcaG0m5Q
	oLTupe8O7d6EZ7e8yfz9C+FsaIwumfNWrTwGfHVNghI2iR4G2KKO/ztk75T327K4isMievI81fe
	J67KDDaOidIyhKU4pHgQGmBVumA8XPyp5mufNAofjg7CBE3dRebm40RfBKe+91s5B44glHFGKxg
	ue/TXcVa/4jXDPJ3NQ
X-Received: by 2002:a5d:59aa:0:b0:460:6731:6165 with SMTP id ffacd0b85a97d-4607796858emr866095f8f.22.1781295987798;
        Fri, 12 Jun 2026 13:26:27 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm9173261f8f.1.2026.06.12.13.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:26:27 -0700 (PDT)
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
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v6 2/7] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Fri, 12 Jun 2026 22:04:07 +0200
Message-ID: <20260612200717.361018-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612200717.361018-1-l.scorcia@gmail.com>
References: <20260612200717.361018-1-l.scorcia@gmail.com>
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

