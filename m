Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811793290B1
	for <linux-gpio@vger.kernel.org>; Mon,  5 Oct 2026 06:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791180414; cv=none; b=ZHHFxVql+0vvBLRbrHF0sfHidmYvJJLzdDMDuE8NdqMe95PeEVr5anthfniqn4rOOueLikpaRvSwMLjnalb55gAyUUj4rF2RSyxkKAysU8sKnZjC6q8MGHb3czkPfRJnh5q2XcwMtBq22injxWK6+1Gelgm56lo2duUcQ+3MF/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791180414; c=relaxed/simple;
	bh=lVF+Ieq6VFNaQlfh6SXbpbgQq2pYNgR30DDLcDHwqH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dqJqKYzdR+r4t9+BomiN55XwHSPDVD51+uhaSk0ZGb09VUNlmo8f6JWnHwVsjAxLsfdkF1dVUzPW/spehZ06aDwEspQj6McLNYNh36WVxWUJgN5P8zERYth9tz1p61VSM0y+NDdDTEakDRWrqvmylWx49zMnLzyozHUjgkmebSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwXM6bSh; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwXM6bSh"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so4801345e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 04 Oct 2026 23:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791180411; x=1791785211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i12y/n1I7Joev3/O6opsapKYTtaoZWQvHYQMKgmIotE=;
        b=BwXM6bShH/knLvgKPLVt1Gvvp2Vbg9Ozokb9VRvayJjc6uNArvpToi9GT94ptl5lUP
         oxo/HIZLs3+Xi5V8gyE8/uEq5PWls8QltfKbC+4cmYuviysr1vcIZb7KfFYLdGAdMEjP
         UcvAEqqnDWlGUFEXvprYvvrxaSo0h7uZj97wo9XkSihBXM67bXWp5IkI7rXLJi5cwE9h
         tpfzRZpxf0Sza8X9602CKN+niwCsyfj67aT4vMBRV8pXZtLr6XskrRGSzcBgVc3YpyJI
         RI9peN0OBFwNp9FAI18BXmqW21nT/jiO4LjK4ImPWzlhylye0AvV/csG+dHN+2kV58Vg
         u+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791180411; x=1791785211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i12y/n1I7Joev3/O6opsapKYTtaoZWQvHYQMKgmIotE=;
        b=HX0noCUZhMriqGmFtXvKHXwGhWKILM5s5qWMyTdf9YT5BPItEqDAZmBGBYgSpl8RQS
         iF6XpIpst/V4CQf1facQmBF5Cdh5c6CU8nFLef6SrjMyMxsQlG9bX7PrtHNaq/JXGOTn
         ZOOf6tiNAX/d59elpiSxP8UgOCGv5m2Aj+O2xqqnh6yN69//v+/9YBSEk86l2KY4jkTk
         L6ZVe52u62C1Nf3Wqu33lRpqT8liv0AfxRsdiSyQ5BOOwgV9fURtUAxXG8ADYZOWe+4a
         C28KoF/tJhaHcecLDTssZrsaephmkEmhwFR4saW5ANVCRUGaad7+0APiq4fe/XK6RFcf
         6Fbg==
X-Forwarded-Encrypted: i=1; AKwUvBxxabQItS+Ie5RzVSdt+okn2JnEgwdGFa7getZMvbFAoj3eHKMrEGSX3zdT2lmQH1pSgcZ56GlzJcv6@vger.kernel.org
X-Gm-Message-State: AFuF++mKo64ikeAuv0OQA9j2B7okEUEKgjzGvhXs3zSh8cCEjZYjISIX
	bsTsVPlKKr1GajmxB2fX29e1n7GQZpYlxNS7EoVYSqWk95NuuLanttXW
X-Gm-Gg: AYBFou1XdyV4iHyt8PAIbqrT36od8jPoXSEOabQVL/5WMMjICSs23JOib4JzYM6VNrd
	3ZDnRwtDScztJU546iZitNJcu9ArPsppPYAwbvsVzy1bpD8/OBeLkvTldsr929KkHNbH0l2ijfp
	mHJMdS+3JlqywG52ta85wWtN5/F20XwHozm72Bj1fPQm6KbC74LICGMNrr9fFn7Hm8G9blNzyhu
	/56uMaI0dUc9C2fOkt6RLB05syfXz8k7Ga/Ce7KzS+1fX18Wy2zQYeOmful0ahFXOxawxHcfuax
	wgiyFJylhvdzJnyq6m6+ZTbAmN+2G4VPLwSJhKsYn5RqU5Wfq7yPzcTjr8kA+hyMWU5yUTOjqfj
	pMkCpB5RWIVUHGuKeCOD33awZsdiz8ht1TnKsa/6RSPJtAPpgT/LZ+Xi3D880Uue1p7KquaUcUn
	9ky/CeutuD7kujzVXKeUkpSCyVd+PvFIcXq+WpP+OvPNEeFcUHpIpkg4k1uRqmJWmXm27hpH6Hd
	LcBggjSGukQ2BNg7m3BdDIptENB3om9
X-Received: by 2002:a05:600c:1d0d:b0:4a1:6d2d:d8bb with SMTP id 5b1f17b1804b1-4a16d2dd8c5mr77010345e9.12.1791180410483;
        Sun, 04 Oct 2026 23:06:50 -0700 (PDT)
Received: from localhost.localdomain ([182.189.185.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027727cecsm324625325e9.9.2026.10.04.23.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:06:50 -0700 (PDT)
From: Saad Anjum <saadanjum239@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Sean Wang <sean.wang@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hao Chang <ot_chhao.chang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Saad Anjum <saadanjum239@gmail.com>
Subject: [PATCH] pinctrl: mediatek: common-v2: Fix of_iomap() error check
Date: Mon,  5 Oct 2026 11:06:41 +0500
Message-ID: <20261005060641.32674-1-saadanjum239@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_iomap() returns NULL on failure, never an error pointer, so the
IS_ERR() check in mtk_build_eint() can never be true. The check was
carried over from the previous devm_platform_ioremap_resource_byname()
call, which does return an error pointer, when the EINT registers were
switched to being mapped with of_iomap() to support multiple bases.

If mapping one of the EINT register ranges fails, for example because
the device tree node lists more "reg-names" than "reg" entries so that
of_address_to_resource() fails, or because ioremap() itself fails, the
NULL pointer is stored in hw->eint->base[] and probing continues.
mtk_eint_do_init() then calls mtk_eint_hw_init(), which writes to
eint->base[i] + regs->dom_en, causing a NULL pointer dereference
instead of a clean probe failure.

Check for NULL and return -ENOMEM instead. The existing error path
already skips NULL entries when unmapping, so any ranges mapped before
the failure are still released.

Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
Signed-off-by: Saad Anjum <saadanjum239@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index faa6dbf0f..bf9d20b59 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -398,8 +398,8 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 
 	for (i = hw->soc->nbase_names, j = 0; i < count_reg_names; i++, j++) {
 		hw->eint->base[j] = of_iomap(np, i);
-		if (IS_ERR(hw->eint->base[j])) {
-			ret = PTR_ERR(hw->eint->base[j]);
+		if (!hw->eint->base[j]) {
+			ret = -ENOMEM;
 			goto err_free_eint;
 		}
 	}

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.50.1 (Apple Git-155)

