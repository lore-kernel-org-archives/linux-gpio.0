Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5730C3BB128
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625980; cv=none; b=AZ04vsHauvyjnMCEdmaIvStfOc2xeOLEMIjr04JkPISfCsKbkb2aQZbF6rvruX4oHmAg1zyVPNshdusBr0iF3a+9q6CPJ+1Nz8/CwKqcjs9D3uEoyDzDfcZrgiTgjoJ7s7lpk1ZtcN3yqGEN2rRw/sVgtKhxIOPUJHXtMfHXVIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625980; c=relaxed/simple;
	bh=ZvxvIgwHzE9yj6ySmWBg3bX/llGDIIzETW1roOBCEE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k0GCbSgC+STe7Gnmt2McX+BmgHJqQA+782kHTR4KItVxhONBswO1VgZlIHN0SRQ9PYRNQEfKYtvjGriWU3IC7eU38+e7lB5/l2CGhIdkioZlAc5ZStTTufkbJT0KTv1e42NTKnGtYAn/DhcIyXJFXKlDPs5YXQK0M3m/UHf4VS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTzpywx5; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTzpywx5"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc827a68fbso511325ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 12:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625979; x=1784230779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1C9Fd2DZvYyR1+upE043sUmS7e2RixbOHmD9oJqDM90=;
        b=bTzpywx5D0rfCLnpDkWMU8e/sGifebZv9lyqXx/Z568iyyDfPkkQqQoDXrZoaNfTit
         iAz/Dbxx1ymiQGro5invhVvWsytkiznDJB0tkt8q/PHZW+uKW2bvTqX3Pqi+yqF1Ag/Q
         Oce/6FSpIdmYsTaq6W8H6Mv0k53noaIkhZJQur+SXS2MbQiLmb/d0vqqGrQxOCzJZbcx
         hEF2EV/whTd119mrJLlOjHokg0fU+i3VMXLY3kbybDgcfwu35jCeqkrzvR+WyVGAr/Vj
         T7gkIt02d+n9z0yFAT7qw/rgvhoR9DK3y8zf/qZcAgCahj3+piPIUPVinTQ6/obJ6gmc
         XSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625979; x=1784230779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1C9Fd2DZvYyR1+upE043sUmS7e2RixbOHmD9oJqDM90=;
        b=Fm5wJh9nbE/jSPqrY1Yomvwj8pA5a0awmhlxpDz9OottRSKJM0Yp+3Me+XSf9WUV+9
         CKrIzRsISt+8hWqJh5jUyabZwDmf5vNeRZH74SzVOKYUrkRk8OAGchPVvGqgx+OsSDw5
         GilSCN7ySXnTAuQ1y0vor0jX+WA+OFcQ7JSpZcnVZwpy1PL8QxpYb1jZUuCEb9wWguzu
         UfE4/mPrGnUfPp9k7LOsxU217fgnosduBUFCXSOetAePgrmNsyGnQPQ09g4ZqE7ZneIz
         R/knTsQ31DyOJ/IbfhFqUHq6392tfbXjFDrZj1pMnojJFCyfzIbzjRmDxcPqqddX/kE1
         KYrA==
X-Forwarded-Encrypted: i=1; AHgh+RoN3bxOpskfke344w0x6VU7zsctzjkelhlJfBv9obDiRDifKI9qDwD1omsFOh5kK/Bzss3mapcVUd1n@vger.kernel.org
X-Gm-Message-State: AOJu0YzVCjCDmGCLIpfSdYkeI/lAyTCWvIA+7J192w1cG6E0KBDdoVN7
	S3QQhmGsnFh3z8KJe4fIjiHGouQbPKc/TRbbqe4hcMOCW8UKzflSiMl3
X-Gm-Gg: AfdE7ckj7evU/VrMnswfDwx3JNlesby0fXHYGj98xWLgTshsxg0O/tGxbuscNVO8t33
	bPZGEsAOL67RjfxO5Fev9tnDJscRfcBzoamhtc+g5R32os/yC8UHL834lPO3rjNMGUe+0vSLA4/
	yBE1sHnaT6NpeygpnSjeH5yEDU02tixBtWFbtVyR1ZNohZ847pQK/9zCCHcV8g2RTuBxTH80yEW
	EEx7rm9OBrsh4LxaMScdooagpHJ3rM9BZNBK/dbPd3JGsapFn10If1w26CdmJt1eluuhizxCt4A
	Bd7xPnOXXM5zTxTrVtusJR2pzRDYeDjf5Ti9cTKAk0W0f0STzf2kGA1OpleO01MRP9/29UfaOfh
	XxRZ4O7plmUSTz7Eo18LEf5bkmdBAcCe6WJ0rtyoamoAYtJMk106KcYiXgoOA7w3mHAis4QCV/I
	uWDRkQ4Gb4r7G5hDubeh5t4q43b88sy8wzPUVuXe3AnYQdrTKw4oIn5XrJyIgcMIST5A==
X-Received: by 2002:a17:903:90b:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2ccff09e0fbmr44702215ad.4.1783625978569;
        Thu, 09 Jul 2026 12:39:38 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bde9sm49018755ad.79.2026.07.09.12.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:39:37 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Frank Wunderlich <frank-w@public-files.de>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH] dt-bindings: pinctrl: mt7622: allow gpio-hogs
Date: Fri, 10 Jul 2026 03:39:27 +0800
Message-ID: <20260709193927.108105-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 6e3b067d3c5e ("arm64: dts: mediatek: mt7622: Align GPIO hog
name with bindings") renamed the asm_sel GPIO hog to asm-sel-hog to
follow the GPIO hog naming convention, but the mt7622 pinctrl binding
only allows child nodes matching '-pins(-[a-z]+)?$', causing a
dtbs_check warning:

  mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl):
  'asm-sel-hog' does not match any of the regexes:
  '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'

Allow gpio-hog nodes in the pinctrl node, following the same pattern
as commit 9322da935c9a ("dt-bindings: pinctrl: mt7988: allow
gpio-hogs").

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index 6b925c5099cc..021307b6d801 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -65,6 +65,11 @@ then:
     - "#interrupt-cells"
 
 patternProperties:
+  "-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
   '-pins(-[a-z]+)?$':
     type: object
     additionalProperties: false
-- 
2.43.0

