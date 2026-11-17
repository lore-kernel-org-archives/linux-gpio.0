Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794940190;
	b=KreEizU0v9/CEXnUPm2N+6fY1/La8XdPIN+HLw0zdCAVn8hTmZ2HI7rlMZ7jS9H0ejtk
	 tnS0B0X6+KRGVZggiAQaY37iKPgswHRYKA5Y5kLUogeRqTu41wmBi813TIXRNvSXphtbK
	 7f0PLD5Uv0zmTFtJmFXIOIa9qYD0nUg1loXyWtwuyLG4iS1W2IyI2Df89r25zpe68rUd3
	 XsGOg98huHIuIpqG+33z4IcAGlwubGtVmj0iVgidETIUPmtQn960aQa/ammJJ2thrKE6m
	 sIm8cxcxRMRqnP0AqKRPaMb5lIfrZAbNmUiaXTVn2+KxpvrNG29gf/j0BaJyBIHyqvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940190;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=SDQ1RqXwbzzB5y54oBPJYOMCHoMzFvGnFsQhYpgHe0Y=;
	b=rViEtBKx+A+YFlzq5TzoqBxtU08hw+4vGJ2qmSKWvcku5c9RE2dEyUDNi7Fa1IuEqR86
	 0brVtVqfg4UpuUfsUXflO2bbpF4wN+YiSC90qb4+dw9iHfuouyjuYrV/iZfhJZgl/vwTm
	 MmgHiGeTVHaxD/rFJneIVkQD5tgXT/W7f842oxsE5OP0D9S+9qBduYCd2Di7vjyro22tl
	 4kKE/g5mnu2gGyQk2HZlbvBIc6zvI9dDp+L8cxDvIVF4s0LhJ1kmHqMR4hkkEqFnHoz+4
	 PpyoQ7GUPrViZzSVlVZ+w065LwoU5fj49f/RYqG+brNHw8JrVtKe4wLSJcga5rcjhbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QBgrxjfz;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=FqvVyF6V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.171
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4FB606A337;
	Tue, 17 Nov 2026 18:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE4FB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QBgrxjfz;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=FqvVyF6V
ARC-Seal: i=1; a=rsa-sha256; t=1794940173; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=nAE1v2fumHDyAIFCcMgtwO6yn10NzZezk0eYyR8Ekb3dwNq4BEy+hpgUdaKw0O0IRu
    2mGasL9oVaQ8Pbnt61uzq5kOP8DE3FV8cdLqw99ZKgR9PJ9YrPM6eh8H43qcWRtC/pnx
    MWDj3uFGuBAUyIzg7DWL8zNlPbDyg8QGAG37WJN/PROi5/Z0ds9lZdAOmE0r/+rReIcp
    6utSFdrmon88WzCk+c1TcjAsR6DPK+sWmWWTj5GpygQlAzVv4emup6aLgiBsXl4Z0cxI
    FxlEMEP75LA403cH1r0t19fgMhEA9zydo3vQrE7JNMFKgMw9kGBLJA//xwOhQesn6RJX
    UFFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794940173;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=SDQ1RqXwbzzB5y54oBPJYOMCHoMzFvGnFsQhYpgHe0Y=;
    b=O3pZrT8YFr1I/zZQIh/iWOvE0A16uQCeI1qSDHnsky3Pz3jAju3AOUNh/H4t+1va46
    5Z5MVbdTSuxOf8ve5EE+WLGR/AoBo7EntwO8ACK6dNRwE8KC5Wb9h1hE6eX5mmnvHTHT
    k4r1hebBaSXe7MVWIt8buNBeOGi/EBX4sGvWCLNJhIZ8/WkdvaxhvhUiJxF7uMmcwkqe
    YQYJ2IuPSQoc/fgRqewppJDjYxrZH4X/Nk8HGt4F9/Qqe8ZvD/Zvx9AYiIMZR6P/d2CR
    QmCT53Nxp4UhSJF0nrqy39Tho0NXXjp63mpcUKSHeQRm80cznPOsrZXVykXXgMSN3I3t
    /e5g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794940173;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=SDQ1RqXwbzzB5y54oBPJYOMCHoMzFvGnFsQhYpgHe0Y=;
    b=QBgrxjfzfVOsuZmws7tIhvo5/88QjU4bwMDwJH2SZz71sm7ZY0c63xYlDdDop8PKeQ
    /+/ZcEz62GXjdbELJj3oGCN3qi06VpLvcqN8103/MNeKTl2oOuowREfibL695Aj7iSs7
    z/Xm66H4fumo2MJjenTRpdKJolOxN14bb8N2hD9NR+DMEd5VVEjWgbqmQN+c2NEK12NK
    U2ddsIFuHRU9XgZCnKvA2HJbZfdzRqroSZx+Awz5SDEb61C8gI60P7BzAfAGrZZLAdvy
    Tn63xiD+pAPE8n6C0s6N4+sTSK0nSlR5GuYy+w09MbDSm96N9+MeqCQUKS3HC7Ya4nAj
    U9bQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794940173;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=SDQ1RqXwbzzB5y54oBPJYOMCHoMzFvGnFsQhYpgHe0Y=;
    b=FqvVyF6VFsRsztJM8ZtCO3teab6qpQYwd078iXHOAHQHDSKSyMqHlZOv8V3A/bxAb3
    7LwMos242TbYrYPceJBA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ppelMiNKoEY92nD9kO01+3QZuyyF4VcrvHZ"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AHITXYbP
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 17 Nov 2026 19:29:33 +0100 (CET)
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
Subject: [PATCH v2 2/7] pinctrl: ingenic: Fix hardware dual-edge interrupts on X1600
Date: Tue, 17 Nov 2026 19:29:23 +0100
Message-ID: <b87494f8bd72efe7d4c8b8c7c6a5f37686861aff.1794940167.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794940166.git.hns@goldelico.com>
References: <cover.1794940166.git.hns@goldelico.com>
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

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 88c5edeaaddcc..51a4b1839f42b 100644
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
@@ -3644,6 +3648,9 @@ static void irq_set_type(struct ingenic_gpio_chip *jzgc,
 		ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
 		ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
 		ingenic_gpio_shadow_set_bit_load(jzgc);
+
+		if (is_soc_or_above(jzgc->jzpc, ID_X1600))
+			ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset, val3);
 	} else {
 		ingenic_gpio_set_bit(jzgc, reg2, offset, val1);
 		ingenic_gpio_set_bit(jzgc, reg1, offset, val2);
@@ -3718,7 +3725,7 @@ static void ingenic_gpio_irq_ack(struct irq_data *irqd)
 	bool high;
 
 	if ((irqd_get_trigger_type(irqd) == IRQ_TYPE_EDGE_BOTH) &&
-	    !is_soc_or_above(jzgc->jzpc, ID_X2000)) {
+	    !is_soc_or_above(jzgc->jzpc, ID_X1600)) {
 		/*
 		 * Switch to an interrupt for the opposite edge to the one that
 		 * triggered the interrupt being ACKed.
@@ -3758,7 +3765,8 @@ static int ingenic_gpio_irq_set_type(struct irq_data *irqd, unsigned int type)
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

