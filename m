Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.83
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987714;
	b=lftHfWFUp+T0li1ExBGgtqbTtLwkQw+iYUc6xoOQ4b60ctmjy7JrrZVz0j5RTXwhSIeL
	 +sXT6zDcUsnP7X7gVoPPAujk4sE5xyEHTUkvKmjAGnJ3L5VGMSAeRrwH4M6DltvByH5OP
	 9ivXXDR87uHpSWPsK4x0n/jhglByIS1bYawcd6r+9kM/PZUhSkYxzEvaq49kyeApYdNFM
	 03k8ilWS3bCMDNt4HuEsRqJeEyS0XLInJwTsIL9x+MnWobcw/IzhvKN5zKRu8yKgNvyR8
	 trUYi2AXMO0MhX2reRzkfwQ6pH3NOD8jQfjj1zboOQgaTRQV0fJ3k0l1JfWKf3mqw+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987714;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=J8iywWCu3u1SRjKvrbU+7bxJu2y547QhrMHFb0XfEnE=;
	b=RSEDyrxpaFDqwKAINB/2LZ9Mn5AJsDkEaXli9SuSB+5Nw9Kv+esbPKXKk0QAq1nlC6X5
	 KcPvzCQyDmgV/nB0jhXkmiZlatK7JBpBzkmCUvFBd6TN8v2QeMnk/MQnNNP8FPIFdvOcF
	 aHnMmgisGxlm5HYn0A7hcNE4dtt6oufLBcbA/0R4le5QJwBoD5UcJCt5HKU++iGuQvEea
	 XyhP6Zc+IoIsxszjEuYq6FlWIrjNOgpMMpsSgkyx4yHjnS/TQZL07bUgVYwY2sdrX2ZAW
	 lKiSuLIGUI90IdbzK1T+pLQnXcei7r9IG/Ar6L3+UZwr1ELPhYFBgUQ4QJKejgkapvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=F6AiDftb;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=dX09hosY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.83
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF63C606A339;
	Wed, 18 Nov 2026 07:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF63C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=F6AiDftb;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=dX09hosY
ARC-Seal: i=1; a=rsa-sha256; t=1794987703; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qKVrQlPfKsdJvP9sDFYiqavTTJNA2ablBY7kkC6/jlPvIl3zfvWHLHQhdBSXY3veAC
    YkrKy3OWGQYxU0xxV8nuYlrZ5f9JF4UOZ0mLvds9IGo0WJk8e3l34plt0gUWTy+G2+m1
    WUcY2go2cbzlBLtRSTWggzdDU4wowqeokW/kO285OpVszi9Tx0g2Ui4ARVgYWDhl6PuJ
    /1gFvnsHqhoWxQyVO9LaRGt3ymN9qwnXs5+4kSkFwuCoEbfwCYzhxkOX79UbjXMhdAiH
    1RwjHOq/qITxJ5i+95xORI6NaWNxVn3+mq+ROKDk/igVWYe5tyHbLnLafqxnK544iCQ/
    8/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794987703;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=J8iywWCu3u1SRjKvrbU+7bxJu2y547QhrMHFb0XfEnE=;
    b=DPjqC0Gsc0XNoYZvha58qLm74uTqxg+WHfiHdLM616Xhv/RWDc9OeS+xpV6GFHHTGn
    81P/yopiZfneE7sqQ7+k6LJ1n/pMw6L8v4eOX1vnR5LpCxi7XznixUMcKcsgPWgvgSiX
    tjFY/sMp08tzOU4rFEveE14oZUMDy+guX1jMDENnCTGQkFpmZQrX2tgFDS+KJ7HL1NQz
    Vxi6vvqvcAgW9IpGT9CwNVL6p0deLGolKj8awLRZDlV9f80/VLfPSfC1RZkKuTbNamVA
    Wv2lC/BT3QpeDx3sodN6UnzMoeDHoFpjCsnIRedsl3LVILyGIGt9BGMb3SRR0TxNGwYg
    Uuag==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794987703;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=J8iywWCu3u1SRjKvrbU+7bxJu2y547QhrMHFb0XfEnE=;
    b=F6AiDftb9XHZlCiOGCZUrddicw6AJloYdQ1PtBuUE5MKin8PnQ9Qc8FqcEsW+bGAmA
    YmeSSw2Ol4la7n6sseAoopurni/qSnmDl8RudVM6TD/oyp17thMiZRH+cGm2aUH15bSr
    IPlydlL685qFwFdLS5PeDH81RCmnhS75K6UZH6gj7DPn82dyA2hFezlOVzAUuplzQtFP
    8OXgBuvnnwTYDTkN1M1nCWyZlGXZ5wMmxAMJs3H0F8dk/PQCc16J+iRKOTANpTBc0zMD
    mIlR3kN+EpjiKUXM8eJCbUcarlX2fJWmVW3Uu7A3UBO4d/1K1+fPOY77/o6eLWM4a+gh
    0cYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794987703;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=J8iywWCu3u1SRjKvrbU+7bxJu2y547QhrMHFb0XfEnE=;
    b=dX09hosYD/cn2aVG9VoTJXXspjsY2WcQSrcR+lU9RKQ0r57xfQSParU0/vmZtnKnUi
    z7Y73Zxua9oyxV/qGXBw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2Jpcm8iNZLZ2IBizV+3wFb55dglUeZzcEX9J"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AI7fhaVY
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Nov 2026 08:41:43 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v3 2/7] pinctrl: ingenic: Fix hardware dual-edge interrupts on X1600
Date: Wed, 18 Nov 2026 08:41:36 +0100
Message-ID: <29961993f8fdc1db97854f940ecf3883c2d32cf6.1794987700.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794987700.git.hns@goldelico.com>
References: <cover.1794987700.git.hns@goldelico.com>
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
Content-Type: text/plain; charset="us-ascii"

Use the hardware dual-edge detector on X1600 and X2000.

Set PAT1 when configuring both edges and program EDG on X1600.
Keep software edge switching for older SoCs without EDG.

Tested on X1600 and X2000 using GPIO buttons and register readback.

Fixes: 943e0da15370 ("pinctrl: Ingenic: Add pinctrl driver for X2000.")
Fixes: 4da56f9c6f14 ("pinctrl: ingenic: add x1600 support")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 88c5edeaaddcc..dc5d38c16e18d 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3622,6 +3622,10 @@ static void irq_set_type(struct ingenic_gpio_chip *jzgc,
 		break;
 	}
 
+	if (type == IRQ_TYPE_EDGE_BOTH &&
+	    is_soc_or_above(jzgc->jzpc, ID_X1600))
+		val2 = true;
+
 	if (is_soc_or_above(jzgc->jzpc, ID_JZ4770)) {
 		reg1 = JZ4770_GPIO_PAT1;
 		reg2 = JZ4770_GPIO_PAT0;
@@ -3635,15 +3639,13 @@ static void irq_set_type(struct ingenic_gpio_chip *jzgc,
 		return;
 	}
 
-	if (is_soc_or_above(jzgc->jzpc, ID_X2000)) {
-		ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
-		ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
-		ingenic_gpio_shadow_set_bit_load(jzgc);
-		ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset, val3);
-	} else if (is_soc_or_above(jzgc->jzpc, ID_X1000)) {
+	if (is_soc_or_above(jzgc->jzpc, ID_X1000)) {
 		ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
 		ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
 		ingenic_gpio_shadow_set_bit_load(jzgc);
+
+		if (is_soc_or_above(jzgc->jzpc, ID_X1600))
+			ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset, val3);
 	} else {
 		ingenic_gpio_set_bit(jzgc, reg2, offset, val1);
 		ingenic_gpio_set_bit(jzgc, reg1, offset, val2);
@@ -3718,7 +3720,7 @@ static void ingenic_gpio_irq_ack(struct irq_data *irqd)
 	bool high;
 
 	if ((irqd_get_trigger_type(irqd) == IRQ_TYPE_EDGE_BOTH) &&
-	    !is_soc_or_above(jzgc->jzpc, ID_X2000)) {
+	    !is_soc_or_above(jzgc->jzpc, ID_X1600)) {
 		/*
 		 * Switch to an interrupt for the opposite edge to the one that
 		 * triggered the interrupt being ACKed.
@@ -3758,7 +3760,8 @@ static int ingenic_gpio_irq_set_type(struct irq_data *irqd, unsigned int type)
 		irq_set_handler_locked(irqd, handle_bad_irq);
 	}
 
-	if ((type == IRQ_TYPE_EDGE_BOTH) && !is_soc_or_above(jzgc->jzpc, ID_X2000)) {
+	if (type == IRQ_TYPE_EDGE_BOTH &&
+	    !is_soc_or_above(jzgc->jzpc, ID_X1600)) {
 		/*
 		 * The hardware does not support interrupts on both edges. The
 		 * best we can do is to set up a single-edge interrupt and then
-- 
2.56.0

