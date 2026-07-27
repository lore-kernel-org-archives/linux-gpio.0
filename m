Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7953DE45C
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 08:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139340; cv=none; b=uqXvqH6+Q7GghXp6NU2jPKhf9hDeXGYARgFFKNCS5w5pOi9Gck4T4NP8RX9UfvKgoklqmOzgcNjZuDN+fpulqetio0uvKuZpss7MeKLlR70gBTZMcSpO1FGpO3NQF0mZdETkydu+VcfxxD1gPv2keOFQYLhygcfG9UHuXCcclsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139340; c=relaxed/simple;
	bh=pGRRkLOovQKXGIVL46U0Bymbr48B32n4icpDQJ4H2Ig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U4pUNbx9EWnewaNfccC7/YjAsUp5WGSb1c9XxWBvSMOrrmOFAfbVX4lWancj+iVTQlmsYCD7eU5YuyY8LafWt998FfR+WI32MqKPwv6oK0Y5vzhTeZQSkoIvBoQgU3VFVqaWc7GQKdJ/dnZQxyT3NAOop/nJeAJh0cBYhqP3q2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kX2b36h+; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kX2b36h+"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so2341462a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 01:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785139338; x=1785744138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QaLoWGkEcB7GzSZ0TXQ17OSV0J1XYO8dorJLUXwgL5k=;
        b=kX2b36h+EDxNVOu2jAubOtSeBlpSXMI226b3MRICXr5GlztshI3vwa6ci6I+TdaZ7F
         Q3Lfi0pklkQePGPnPnK5pv33oK4ZhhAb2UgGrbPBVwqugPiCNj9dtoHVDHBwEC4sufxO
         Ln/3c0XKXo2elN43qe9ff1vpYvnSkw+uRS07ZokkucH63Gp8+IonYXyICPsBNfSgPGWi
         CQcjm9oMPEMrp4XoDAX2JOw5jIF4RYpy/fcNntmZVhJHK/Zf+F+DcW1IKoB24zu89PkP
         31yfn7QlpiCjYiycipzSdnZwdmn+BdMQEz6wnr59eIutIJUFpP64OUXmSAGn4d789oPB
         kjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139338; x=1785744138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QaLoWGkEcB7GzSZ0TXQ17OSV0J1XYO8dorJLUXwgL5k=;
        b=iw2VY2dkvjtsHTL3XSukfaWfp1Id1ULax0pk8oN3P7zmtFh5eRH5kCOm71Qf5z5Odz
         g+9hh9q+89ZJHbawvb/xOTN2XV5LKjlRSQYHt2qgut6H3HM6jXUmvrZvg5FXsq95AFY5
         xkJ7TM45Oz+GAm8shgd5H7fX3pGB/isLNSmP6KYLmI1Mh92ch6b6dgTi3L2j+zXl7ozG
         8MPO11Llco24APHRQxHxUcfnFUA5DIs7Btyk1ycvXetus3pW2TOABJUt/pxyVN0wN0l+
         7/pgtqEs+LlutjD54Sl/ko0ZAJMW13sKu3MCz0F8Csx4X6mQ2HC4qKzPveMPSL/GwMVj
         yXFw==
X-Forwarded-Encrypted: i=1; AHgh+RoXDpP4gPyl3eS8NeWT8elOfY0SbyltfqjDW/bIMMH3FUysQSDkB9aRwtz+xV27/2I/3sR2ZmwZgcPa@vger.kernel.org
X-Gm-Message-State: AOJu0YyLPxHl6mDoFYVxVQT+ifwJiIp7mxCyBeT/CraSA8c3LXjYQ+2h
	PcOpgdcW2OgSVj9YJ1z2JqoZxVPIBCRmIVoup30D4fZs35kr1nxUQyD7
X-Gm-Gg: AR+sD12nWHvqn+4HvGZzujYxpCLgqMMNcqnXJpCgPO9Qy8WcteiW21hgMSTbXOkK4/N
	TShIR8FZMqzXgx7mvF5Sm46ExCYNnKAXwLzIoQ4XfQW+2uLfULdZ9JNJE4trsfONSijo/uKyUcD
	Dsep/G0oLYmPc1vC1P7BXQX9PIjPhwxaM8dNZJJNm22irMH0CitxO1BAeZwqKsFhp98V4DOsU+8
	U18rZVGZvmeUZeA/9OBWoaIIbqbW7sibrBDfhSk0eMEQd/PQ7GzWn0qChWH064lb2W8oW2uppwm
	bXn1HTKeNnL/rsMjFHlH/zuiluCBrkncCKjNjEbZG7QYnjNwfeBi0yGWxMgvFwXEgDeZhDZRpNf
	88hip5YnmWG4b2FCTal0/qlscG3nxAsP26m+3SefJtHZfR2ZB1RMFWlNuuw9KuoEqcAJh/mM4zv
	U5UDZokSTN+JLSUhci+pQh/RUWNPP+gxAjwqURUCZDqm/6DowagY0MHTyXYuUsXqcdNKvQ5y7Wy
	HLBg1tGpG1FnSdTZGcnMjBnaGz0qgrU
X-Received: by 2002:a05:6a21:139a:b0:3bd:3591:2457 with SMTP id adf61e73a8af0-3c67dab46a2mr7637709637.4.1785139338288;
        Mon, 27 Jul 2026 01:02:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb6623294sm2814443a12.10.2026.07.27.01.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:02:17 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] gpio: pca953x: fix cache_only and IRQ state on restore_context() failure
Date: Mon, 27 Jul 2026 15:02:05 +0700
Message-ID: <20260727080205.16353-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

When pca953x_restore_context() fails, cache_only is left disabled and
the IRQ left enabled, even though register synchronization may not have
completed successfully. Restore cache_only and disable the IRQ again on
failure, matching the state set by pca953x_save_context().

Fixes: ec5bde62019b ("gpio: pca953x: Split pca953x_restore_context() and pca953x_save_context()")
Fixes: 3e38f946062b ("gpio: pca953x: fix IRQ storm on system wake up")
Cc: stable@vger.kernel.org
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add Fixes tag and Cc: stable (Bart).
 - Add Reviewed-by tag from Linus Walleij.
 - Update the patch subject to better reflect the patch content.

 drivers/gpio/gpio-pca953x.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index f6b870b7b352..0c94630f3160 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1369,9 +1369,20 @@ static int pca953x_restore_context(struct pca953x_chip *chip)
 	regcache_mark_dirty(chip->regmap);
 	ret = pca953x_regcache_sync(chip);
 	if (ret)
-		return ret;
+		goto err;
+
+	ret = regcache_sync(chip->regmap);
+	if (ret)
+		goto err;
+
+	return 0;
 
-	return regcache_sync(chip->regmap);
+err:
+	if (chip->client->irq > 0)
+		disable_irq(chip->client->irq);
+	regcache_cache_only(chip->regmap, true);
+
+	return ret;
 }
 
 static void pca953x_save_context(struct pca953x_chip *chip)
-- 
2.43.0

