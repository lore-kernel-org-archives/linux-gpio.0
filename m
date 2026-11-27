Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776830;
	b=sM4w8MCI40e+uvrLxRuejRhl+6HHrNKandFrNDi4eugDCQoqNreR0Gyic/te5s8/613u
	 nFrAsI3cs3X4HR98SNxHUJtkBrTxQbhIOhMSAgHBMhuoOpsDcXOE4VKHijDvrCqWU37SK
	 xZBZnszVKFPAtE1qXYho03paUGrk+qjgJ4MxjvAFBjuN71CUEm6QdjHVNElvDrCn5kU5S
	 OGSeKhvou3/G9mKUl3CkWReqxmrIHesgX8f3+kdVbJZRxLipoAEqxby0IL16wtHHZXOou
	 vW0BNMf3fg67RRDNJ/Pbsz/zte7/Fxn6Cvm2F7teDp7f0N+/YFdyYne1KVlLSQ/e9ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=6mnDxbdKfAHk+Y53uBHJ9bU5wDj+UOZfSGDbI+kC1Is=;
	b=QJBPs3nmWQDM+TnKvg0OO66xyGKF2zv8qn4qdiHm8Vff4P2OqLUCRT2igq7uX+RVA9LB
	 nWV6s+UGjPJfUAK4XJt92zVJaPqVs7p17BReGbVs/W39V482ilUPL613/nzsrDIVlCRyE
	 5WGgfIvoVSPqM2/quPpHi15pNcGJMuhBIk+j2SwSkuZwouNO7g3P1//yunJHtGtF8bfvq
	 Iu8j0qn0ja+/CnqTBYL3OEdH8YTY0Jqh7l0OQtA3ur9Bguu+RA85u09HeDnK/xh+Ue8aj
	 nSOXJ1HRMBZu6C8djf7UlG7Wqge84HJ9dbbV5iGr9gKkBxgmk+k9nWBDKO7+g6jZgmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gpFkjJgV;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AC8606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 10:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79AC8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gpFkjJgV
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a357b1c649so4584380f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 02:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795776828; x=1796381628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mnDxbdKfAHk+Y53uBHJ9bU5wDj+UOZfSGDbI+kC1Is=;
        b=gpFkjJgV2jksD2apXzqFjw9KAipT/Ej66vrhn41kQrzOPGtjhD8w638cz/K0ItJb7z
         a6137D4lijTw+hQnt5jX4MkOb9iv/ECNmg0o+QE8eyJ+tvRl2D/1Gw9j2eBfkvqu47dv
         siXawdtPo9NH4u9d9A+mpOlDRL4QMLCcn15io2p8y502o1/+xi/TGqqlHHBkdjVlEDSc
         XQcqNTM/PaBJE8DQ6rAbIE/mL7+E+lMWZ2gnASswOCcYBo2KeuvyEJy0yqjUAqLPl7Kq
         SFHJVifLK8jjZ6w4vLf/StoJDhccCcJ8uc9fTXnnN8q9MeBixiGRFz4baaY2LsRx+IiJ
         3Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776828; x=1796381628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6mnDxbdKfAHk+Y53uBHJ9bU5wDj+UOZfSGDbI+kC1Is=;
        b=Qszm7Z8CO6xT9vIiHjST4BNkEEnjkD70DGejtWMS8v2H3KADN5SzwFYtESsgc01vgu
         HqtzrJqNoxAZFeH3F0Dqu4Z531iYZGeXRh8lQFn2DFUnMniwKnHipvLMQ8T20sOS23Si
         aReRxusMWDA1tl03d65GOo3Sh9WuLBFNjIV2qOIchUzNFAkS/p+gQeQvlaWVj5hJDuCY
         NAYmwUN56OvG8qbhBTTvYFltnp9Hwi3ndzUmIukIAoRef6lBuYrYSkH2aR9IMMjk7K6H
         DYMwWY1Bk5M891/mh6aRrXOYXVN3sMGvzA71CIxIn5ygL5CTr7PWKztK/ho/a+JHSB/Z
         gppQ==
X-Forwarded-Encrypted: i=1; AL+hErHxvNNUtsuXtN/Sf+yMQtrBicCEZuIUvoeBIHG+VPuRKvJpaBdNSpXbbbDXvuYjL+37/fgzrY5BYwPh@vger.kernel.org
X-Gm-Message-State: APuU4Z8xh+mSFkry5Hwfxoe8NzR5GmSLsKLFoiazbFfJPFVL/hZnr0Ke
	AUL81jizXdkiy8iVSuWc2sWPaq+YrnfxoA/eWrfywPsaIPoS6nDXGPr/iAXMk2RNOUU=
X-Gm-Gg: AZFdTZed/GbTPd22UW9MLsmUD/bG1FNAKtrb92qInORMyswtwOzQXBsT7wyTaDK8h1C
	7tD/k+0SmGyJwPPe5cxRBAYJTuUesd/y2kLmcITQaaK7sffjXoaZU5Z3yRM0TpQsWDckDUbeKcN
	xDSfXUdDBwIi8+fUh018U8tlepgRCGcKh1ea8kvgRp1tTe36Hr/mIVtNSsOibmTxrmRmmdvWx5c
	bT85sc36C1ISisFWx1Ibh4YgQ3H0FPYddAGgXx23G8Hs0G1cGtQnozAEtLEKUzWytgADFwc48io
	mTlJ5Sts7LuLeKh5fmebW7+FjxKR8zc+IQG+o85I9zlerv5haTi867HpSh50ZEwRJ56ndUiBwZ/
	k3Xpe0mEhpsUPDnsb8TiWmnaxvW+oMf6e9xk0vM/zcA410lZKf4tBy/wk2bDutBen2JkPn7S8jQ
	8383OFi/qg1XC2kSg4APWsPAk6MzA4l6bjHr7YYlB4b5G6X/MnCCV/0/EhBbzWjeL7G2ZjYWJdK
	UVmcfm07YT8On+cifyro10DtvaEOaLtLv7Pxy+7O2K79nHGZId1NHT8e0VxAISxRt6rMQV9SKdY
	RHsClMn3kzfHlBFFKYg=
X-Received: by 2002:a05:6000:4283:b0:492:ea10:b073 with SMTP id ffacd0b85a97d-4abaf74016emr47592308f8f.18.1795776827867;
        Fri, 27 Nov 2026 02:53:47 -0800 (PST)
Received: from localhost ([2a0e:439:b3b7:0:22e0:5fb9:48c1:3f50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm48283639f8f.8.2026.11.27.02.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:53:47 -0800 (PST)
From: Francesco Lavra <flavra@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Dmitry Mastykin <mastichi@gmail.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: mcp23s08: Protect temporary masking from concurrent enable/disable
Date: Fri, 27 Nov 2026 11:53:46 +0100
Message-Id: <20261127105346.729300-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3775; i=flavra@baylibre.com; h=from:subject; bh=SV9aquxnd2R8DpsrWSrGIGe0mzfX1kowZxsqx7hDX7A=; b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBrCWEQXGKpsqa1T3h+O6bJQyk9Xhs8GOcQTKCyX rrPsALxMrOJAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCawlhEAAKCRDt8TtzzpQ2 XxnjC/9R0DOBb/x6l0cDEt57h38cgWVxNJ+uQxcF6/xwTVe9HUX56A9UoSyNshC6inQ6xnK7Vwn rmf4llhNKPexjByz41XkHJ7R4aeyTPmD+gm3Yy2amvs1UWJlQchQW1VFKi5nztZyztww9oSWADE bSSxiNfsOW7W0pxwh+9jHnRQkz8HLLTJYEfH9Bb71GZaYnZ84CPFIAN52ZgEFbe8jkfN0Td/jgq A6HQSSTEe37zRnkfKCtSqycz3qORU6maRyoHXoaxeaLx+zwz6kgGGVrp4942rbPWQQsnfIw7XwY I7EV9+1mY8q/MeJXuWhc///3rfIHdoc13nlsNr0mWzLOKx+ClEETTJkIAeSUiOPUfXIrEGIrCoz GF18t/JVeSFkQW2yDnSBVSzTxFUDPOmHxj01QwHCEhm909C6aIw1hWwOwE9a3Km490zxIcrFF3O CfgljhBUerw8baoK9yxDtBWgSFQAkpAbTidtxwTE4YKBFfhMTCakeDX3XgM4AItok5BW4=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp; fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit

In mcp23s08_irq(), the code that restores the set of enabled interrupts
after temporary masking can potentially use a stale GPINTEN snapshot.
Although the save/mask and restore each happen under mcp->lock, the handler
releases that mutex before calling the nested handlers and reacquires it
afterwards. During this unlocked interval, an IRQ mask or unmask operation
can acquire the same mutex and change GPINTEN. Writing the original gpinten
here then overwrites that change.
Add a `irq_enable` field to struct mcp23s08, and always use this field
under mcp->lock when modifying the hardware mask; in mcp23s08_irq(), remove
the gpinten local variable which is made redundant by mcp->irq_enable.

Fixes: 7b0671b97f08 ("pinctrl: mcp23s08: Get rid of spurious level interrupts")
Signed-off-by: Francesco Lavra <flavra@baylibre.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 13 ++++++-------
 drivers/pinctrl/pinctrl-mcp23s08.h |  1 +
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index cc668f84bf8b..856cba4fa5b9 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -362,7 +362,7 @@ mcp23s08_direction_output(struct gpio_chip *chip, unsigned offset, int value)
 static irqreturn_t mcp23s08_irq(int irq, void *data)
 {
 	struct mcp23s08 *mcp = data;
-	int intcap, intcon, intf, i, gpio, gpio_orig, intcap_mask, defval, gpinten;
+	int intcap, intcon, intf, i, gpio, gpio_orig, intcap_mask, defval;
 	bool need_unmask = false;
 	unsigned long int enabled_interrupts;
 	unsigned int child_irq;
@@ -381,16 +381,13 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 	if (mcp_read(mcp, MCP_INTCON, &intcon))
 		goto unlock;
 
-	if (mcp_read(mcp, MCP_GPINTEN, &gpinten))
-		goto unlock;
-
 	if (mcp_read(mcp, MCP_DEFVAL, &defval))
 		goto unlock;
 
 	/* Mask level interrupts to avoid their immediate reactivation after clearing */
 	if (intcon) {
 		need_unmask = true;
-		if (mcp_write(mcp, MCP_GPINTEN, gpinten & ~intcon))
+		if (mcp_write(mcp, MCP_GPINTEN, mcp->irq_enable & ~intcon))
 			goto unlock;
 	}
 
@@ -409,7 +406,7 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 		"intcap 0x%04X intf 0x%04X gpio_orig 0x%04X gpio 0x%04X\n",
 		intcap, intf, gpio_orig, gpio);
 
-	enabled_interrupts = gpinten;
+	enabled_interrupts = mcp->irq_enable;
 	for_each_set_bit(i, &enabled_interrupts, mcp->chip.ngpio) {
 		/*
 		 * We must check all of the inputs with enabled interrupts
@@ -468,7 +465,7 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 
 unlock:
 	if (need_unmask)
-		if (mcp_write(mcp, MCP_GPINTEN, gpinten))
+		if (mcp_write(mcp, MCP_GPINTEN, mcp->irq_enable))
 			dev_err(mcp->chip.parent, "can't unmask GPINTEN\n");
 
 	mutex_unlock(&mcp->lock);
@@ -481,6 +478,7 @@ static void mcp23s08_irq_mask(struct irq_data *data)
 	struct mcp23s08 *mcp = gpiochip_get_data(gc);
 	unsigned int pos = irqd_to_hwirq(data);
 
+	mcp->irq_enable &= ~BIT(pos);
 	mcp_set_bit(mcp, MCP_GPINTEN, pos, false);
 	gpiochip_disable_irq(gc, pos);
 }
@@ -492,6 +490,7 @@ static void mcp23s08_irq_unmask(struct irq_data *data)
 	unsigned int pos = irqd_to_hwirq(data);
 
 	gpiochip_enable_irq(gc, pos);
+	mcp->irq_enable |= BIT(pos);
 	mcp_set_bit(mcp, MCP_GPINTEN, pos, true);
 }
 
diff --git a/drivers/pinctrl/pinctrl-mcp23s08.h b/drivers/pinctrl/pinctrl-mcp23s08.h
index 105bce9e0f50..a29e67f5df46 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.h
+++ b/drivers/pinctrl/pinctrl-mcp23s08.h
@@ -37,6 +37,7 @@ struct mcp23s08 {
 
 	u16			irq_rise;
 	u16			irq_fall;
+	u16			irq_enable;
 	int			irq;
 	bool			irq_controller;
 	int			cached_gpio;
-- 
2.39.5

