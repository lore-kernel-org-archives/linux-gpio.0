Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792953821;
	b=icgbm8DUSSocvOtfX4rA4p0JfDVdTN6+E2rSGJ1MeYvdG/W6/5vFHDTVBYyTsr4IgE1h
	 onS+F9iDX4rf1UEonwLwt9f/PPu4ckgvMilCp6bkmB9golkNueJJohAiJFJtVf5OM+CfB
	 keEvfTotVRGYkYEAsvJGK9afjJiuqtSru2fAE2qOYEFTGzaPilu6iJ3eU3n16NGQPsID9
	 BGX5xuHnREzo3LpAfqAh8ZqzfaL9gYAarjlupWUYhvIRSWqioofFdNHZGcNapQ518gGOA
	 sbLBCNbw2kiv5ShJZJSrAFjE0msEKU9SmswIFwSxQkMa2R7Vw6YYKXN5aKONkRUK1cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792953821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EA+TGwhOKTSjJMI/+IH2m8d0jmRxkGdSQ6LfUGiuKeY=;
	b=nmFDRD9GBVHAwWnc6A2Z101rJciK01/BlX7NOF0ovu+OuEIXfEJXhAaK7CL2/k3RlBTh
	 DhIw8ZS580Bf28Lr3eWwPCL9er1s+veZmtInyCgWCspocbgA6qNlyTKxcHPuKCg3ovIQh
	 1Ss2LcFm4MC7H89RZRaffQnELx6tzGYHrDmQKo3r0q+x+h6OvvgCjbaV/TYGuwE9aJ3V4
	 QVCyV64gpLBxWUV2BuvXK9Mfh3HevTOW+gp+e+YV7t1CVsFTsiSZkhukkRgWXz6G93v+n
	 zCA9ct7Bk+he9cM9xxETgJOoeIcTKkeie0+sDhq1HqjEdg3IN5H4iAbH0wXMoNfkmGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ptIN5jwl;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423E3606A31B
	for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 18:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 423E3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ptIN5jwl
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so4496275a12.1
        for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 11:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792953819; x=1793558619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EA+TGwhOKTSjJMI/+IH2m8d0jmRxkGdSQ6LfUGiuKeY=;
        b=ptIN5jwl8wfXt0ZjXqZ1Prbvvn+fmQOC78CtBSeMmBPCxxuiQrVrnrqkmBLdYv5d4e
         sWS/HkRXEnCYkb6n5plCIBH8Qj1qdiNR1AdaTa0l/NNgeSMkoB2QmovQ9kO77KXCNIIg
         j/3aUKZBJs7gRpkhgVZc/ULIYrtWPjNoMaxpHlqNmAg7d0+preG26bntItsea3TB0Hpb
         T91stOC7WuGNTZTfCQCNNZEQnFHVTFG/4sp+YXlB29d9NfO9mmusXHYaFNJhbbgx2TvQ
         E6no/uQzVee8PjhW4TLusR+Lp9yse8rsXOv164SlLom3sLtZW7XmP7MO/+LeBhaMcr18
         2u2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792953819; x=1793558619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EA+TGwhOKTSjJMI/+IH2m8d0jmRxkGdSQ6LfUGiuKeY=;
        b=Sgp855BwHyN42goeUx/N9y8YHCNm2bEx/Cry7Gk9wQ2p9mw7FvaXsTrCrif561haMB
         12YargntXccehR3F3v0JsQJBXPw0SAqptAPTvVqCtNAvpJDcIxoc7gzRcA/dozsqiDiN
         5DmmI0faNSJ8JI3jVAH3D4HmVu03lrNBYbq1iDKgyoK/ZI+EBwsnG7ySveyZ/t/+4kuH
         qV+NPJg5uFn5je8Sf7G6Pi1l18oK+gHHOTIa0q6fmLz/RK/hJECWhwNvqVUl/Y5LjGpo
         sDYCjmhpbFBBqGsDl4xnoO8KZwc1sL0OztRG1tmxrIA6yOuBnjD1e4Qq+vW89c2MPqlj
         0DUw==
X-Forwarded-Encrypted: i=1; AKwUvBwIoe69NMFikN2Dh1MV6QE8HEiKmRyfbSOdg0kBXoKAgKSqeZSLnowIrjnnSe2C8th3Xo22LyaNie9V@vger.kernel.org
X-Gm-Message-State: AFq9FYL+jveuJjqZNGrKDO2gqkacHVlPCELgMeWiglBKPYWI4/ToyhGj
	Bos78sgoMLrVLhP1i/jbRIP7+TRp3h6VZCArvR0OtpHhsFOPKadIFHwm
X-Gm-Gg: AYBFou2lCJ/5wKHIKduszQHk4y33fQAYYHT4HX4OGjvlLXYGSL5WCZHNthIIJ4AGqpQ
	7m5HPn9laru70KW0c7PtptJLL7/Hc4pew5QF2oxEIhexjf5u3AjGWhJHmfyjPngzUlzpk3RQr1H
	ZQt62/TlTHUy1MPkTI8F6aoBLJbF0wc4VU4iwl+93rWfNcR8PAX4QJ94CzI66NzWcSt77VAC5+N
	Neo9pDqBuT85Z3y9ywBJVzHAzbVL1FP+vCvFVEKDGe8mGdiS1syDhtdd1kDcAtDLWwUkYX8AvUo
	ZLJfaMlbJlz8zMvNUqi5WJ1pc5lbBaX0VZ9m+mm912ijxfVgLO994zJaRjXU/f3gTI6jlSJ+23q
	pc+uZnwNmE4P6MLIH3LHafjmMkL964aoDR2GFMb9HaegQZ6ITAawNGCyTnumK8XLX/RzZsqUjJt
	lWjuCn0HzIpF5v2BEORNFidTToqKH8c4kOJogV10Utl7c7UbX588y35HX5G37SzIk3vJ3twJo0o
	t2q4054609TbJVatYdppIo/ScMQSdBGnoE9Lzl5il39fxkEXBYYMi4nM3ReFtPbUAFpim8fEniG
	ES0o3WL92ueJk9fZG0neABnOH0jeEdZaEhwxw0tJcej/xMyaxG+P0NQKoY1u5vls6x85L2yIbd4
	L5mAEx00w7Ui8kZEvHiulJpvAVk22R9kzTIqg92YqoKWRRA==
X-Received: by 2002:a17:907:944e:b0:c33:dbe8:291c with SMTP id a640c23a62f3a-c46bddf8079mr627054166b.20.1792953818947;
        Sun, 25 Oct 2026 11:43:38 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66fa59sm225666866b.61.2026.10.25.11.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:43:38 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] pinctrl: nuvoton: fix fwnode_handle leaks in npcm7xx_gpio_of() and npcm8xx_gpio_fw()
Date: Sun, 25 Oct 2026 20:43:35 +0200
Message-ID: <20261025184335.447963-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Both npcm7xx_gpio_of() and npcm8xx_gpio_fw() iterate over GPIO bank
child nodes using for_each_gpiochip_node(dev, child), which holds a
reference on child during each iteration. Returning early on any of the
error paths inside the loop leaks the child fwnode_handle reference.

Additionally, both functions call fwnode_property_get_reference_args()
to parse the "gpio-ranges" property into args, which acquires a
reference on args.fwnode that is never released.

Use the __free(fwnode_handle) cleanup attribute for child so early
returns automatically drop the reference, and call
fwnode_handle_put(args.fwnode) after fwnode_property_get_reference_args()
succeeds.

Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver")
Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 4 +++-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 0df749cbc..47bb642cf 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2016-2018 Nuvoton Technology corporation.
 // Copyright (c) 2016, Dell Inc
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/generic.h>
@@ -1827,7 +1828,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 	int ret = -ENXIO;
 	struct device *dev = pctrl->dev;
 	struct fwnode_reference_args args;
-	struct fwnode_handle *child;
+	struct fwnode_handle *child __free(fwnode_handle) = NULL;
 	int id = 0;
 
 	for_each_gpiochip_node(dev, child) {
@@ -1855,6 +1856,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 			dev_err(dev, "gpio-ranges fail for GPIO bank %u\n", id);
 			return ret;
 		}
+		fwnode_handle_put(args.fwnode);
 
 		ret = fwnode_irq_get(child, 0);
 		if (!ret) {
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index a68d55cae..83e4e1511 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2020 Nuvoton Technology corporation.
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/generic.h>
@@ -2319,7 +2320,7 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 	struct gpio_generic_chip_config config;
 	struct fwnode_reference_args args;
 	struct device *dev = pctrl->dev;
-	struct fwnode_handle *child;
+	struct fwnode_handle *child __free(fwnode_handle) = NULL;
 	int ret = -ENXIO;
 	int id = 0, i;
 
@@ -2345,6 +2346,7 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 		ret = fwnode_property_get_reference_args(child, "gpio-ranges", NULL, 3, 0, &args);
 		if (ret < 0)
 			return dev_err_probe(dev, ret, "gpio-ranges fail for GPIO bank %u\n", id);
+		fwnode_handle_put(args.fwnode);
 
 		ret = fwnode_irq_get(child, 0);
 		if (ret < 0)
-- 
2.56.0

