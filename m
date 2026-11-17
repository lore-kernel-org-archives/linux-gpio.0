Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.104
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794940197;
	b=MrCiETH3l5aNtuKftome+jjADl073CibdB9uFde3og6PO3CgOC1vMxlEJHHndGEcb3xt
	 KJKfIDOlTkE5y5HKLvAUJF/9LUItgZwOBx9RIdKpWaVtL3dBihGY5DgtG8HuvaLAWX0td
	 N0k/8tRKYigGYC3k7YK2axv6qf69CQGi1DhVKbEEbeEZC+6LAvKRf/GxWt9WhZYE3ajOc
	 bfnHHflHZ7A28XCRJbh9keUG1hb4/Dwgao55PTwdc3j5YlaNsUrvasrn5JmX8rxRkzDN/
	 7pSR3o3ht6BNX/TFJ6DFIhuZTvZKfZCVUL/sVSLrDGvvqNE0Is2L/SaJVRIEsY6ZErg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940197;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=vndt8b0E47r0vM1Dpj3RvqTm+cSH+1atVdtkAKBOCfU=;
	b=VWd9GAAyqLkTS+rICvWmaaSadYueJw8vfHxP1/lk7d5Jq6PpHkFNlC0kh/6uYrNsMrN8
	 1JidkiofEIZ4m7gCKFA74SyoDgJUQnIZcQQpCr5r6AmFSIqhZzrEgSl8qqsLL+b9B8SKL
	 RVGbWrvre1tksQ7LjB7PqauE/V62sf6dM09HxDop0uaMkG2cBX7LOrCv0LfqmbCmRoMg8
	 PmI9T9m7KCm+RcBWTTxT9uK+2dvql0L/bE+4gUP01+xuGdUtRfTUsz5sWqoL0Hx7WhLmh
	 3eMKWuhnlNwv7TCzegDWpjTJuM3ClfX+4FnbnDKa5zztzi3w2Ee02LBPp6oAbdrDXWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b="ZAfb/SPP";
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=1P31gyMl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.104
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86D5606A886;
	Tue, 17 Nov 2026 18:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A86D5606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ZAfb/SPP;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=1P31gyMl
ARC-Seal: i=1; a=rsa-sha256; t=1794940175; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=O2oORsoEncLkiKzun8vN6JBPJjgcvMRKkz6pbytKSX50ZlEpSraKL8vDdpkmpcBpHH
    jnt9T+p6THqGm4DLvSOCOXcEkVcim888wY4E8v5VinlqPke6JAcfhvGS6FyvgmAgbnr5
    3FVA93/75qbHhabCra8QHkih2FpoB0ZlIOMbhzS3sY/bwA2LIz0ZrheJvXbcQKQU5ysG
    s2obd0FvyOviqdT/7R2omzPk3lLMOwCTgHUmoXM9aHgJ8gkSWAw/mx/rwzs7CTKIRhNR
    viOkm+usyUx86y3CvnckxCE60grP14flG8FuAsRaC9c70YFa11CYyF/sAK0BBnS/928C
    +lFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794940175;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=vndt8b0E47r0vM1Dpj3RvqTm+cSH+1atVdtkAKBOCfU=;
    b=beZwadUpIRSPGpqLrNA7JnN5HsQk9hijnrlXzzxAgQkg3K99bJiBKcc/wAvWXo20oo
    E8o2SUvYCbuWZTrCWfg6FGzLjMeGt13lsmMvgXf/nV9r5K9aqsYwgLkms+j/y0qNdQgG
    +53z9N2YTqq+D8dV0JQ4i0SNR+Q3aml+RDBcsxglLY0+7+5Gb6VnFHrVcF8ruulM3XiC
    ru7Omsy2nP39+GtSDc0MPtjWUOPAWndQYCoao7344lrJrxAKg+8ux/Xvme2rSba1xrAt
    mua9R5JoJs5M4PpOTvsub90qx8nreOnLtPeMvjHPIzMPY+5VjaT+B0Mhb9h6GzDoHv9z
    EVxg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794940175;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=vndt8b0E47r0vM1Dpj3RvqTm+cSH+1atVdtkAKBOCfU=;
    b=ZAfb/SPPqhINfu6um0Y2271sBTlWkWV62rBJTTHAts8dh6W0eksyZea7FDZCiKyIGc
    kzzpRwnS8hDB1bMpiiuDhDwez17KlBUApczojQRgPpeh//ElkFPU1TQZIlN8hCsKbANk
    B+zRtIxQVG3rX7iIt143nkQAjMMNHjF2+SvQMxswgzBGDfTPAzMo7mFdLgukE4dHksFq
    3VuLojBowBxdVBIfXQ6z5EpntG72JFzpEMfjbjedZ/RQfk6iTcKteenpoSKWpa/LDRtp
    LGV5uGlxC7eTS6QM2nViMYGWEpfheYnjR9mP9tIynu9UtgHjDT8A3lRsqJfMXUsUnpdn
    BgzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794940175;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=vndt8b0E47r0vM1Dpj3RvqTm+cSH+1atVdtkAKBOCfU=;
    b=1P31gyMloKXw62avIxj4ZhDhXpzS0+yeXQKDc9sJz2z+6WIsPDmaBQ++EPhfbMzuBz
    8Xh1klRLde0XMln6PRCg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ppelMiNKoEY92nD9kO01+3QZuyyF4VcrvHZ"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AHITZYbU
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 17 Nov 2026 19:29:35 +0100 (CET)
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
Subject: [PATCH v2 7/7] pinctrl: ingenic: Handle X2600 Port E pull configuration
Date: Tue, 17 Nov 2026 19:29:28 +0100
Message-ID: <8b8e17aa82e7912de8fedea404e6936cf8e2039b.1794940167.git.hns@goldelico.com>
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

Port E uses PEPE as pull enable and PEPS as pull direction
selection, unlike ports A-D with independent pull registers.
Update both pinconf get and set while leaving other ports unchanged.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 33 ++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 529bb31cbbec0..763201bc14830 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4642,7 +4642,16 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 	unsigned int bias, reg;
 	bool pull, pullup, pulldown;
 
-	if (is_soc_or_above(jzpc, ID_X2000)) {
+	if (is_soc(jzpc, ID_X2600) && offt == 4) {
+		pull = ingenic_get_pin_config(jzpc, pin, X2000_GPIO_PEPU);
+		pullup = pull &&
+			 ingenic_get_pin_config(jzpc, pin, X2000_GPIO_PEPD) &&
+			 (jzpc->info->pull_ups[offt] & BIT(idx));
+		pulldown = pull &&
+			   !ingenic_get_pin_config(jzpc, pin, X2000_GPIO_PEPD) &&
+			   (jzpc->info->pull_downs[offt] & BIT(idx));
+
+	} else if (is_soc_or_above(jzpc, ID_X2000)) {
 		pullup = ingenic_get_pin_config(jzpc, pin, X2000_GPIO_PEPU) &&
 				!ingenic_get_pin_config(jzpc, pin, X2000_GPIO_PEPD) &&
 				(jzpc->info->pull_ups[offt] & BIT(idx));
@@ -4711,7 +4720,7 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 		if (is_soc(jzpc, ID_X2600) &&
 		    pin / PINS_PER_GPIO_CHIP == 4)
 			arg |= !!ingenic_get_pin_config(jzpc, pin,
-						X2600_GPIO_SMT1);
+							X2600_GPIO_SMT1);
 		break;
 
 	case PIN_CONFIG_SLEW_RATE:
@@ -4736,7 +4745,25 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 		unsigned int pin, unsigned int bias)
 {
-	if (is_soc_or_above(jzpc, ID_X2000)) {
+	if (is_soc(jzpc, ID_X2600) && pin / PINS_PER_GPIO_CHIP == 4) {
+		/* X2600 Port E: PEPS selects direction, PEPE enables pull */
+		switch (bias) {
+		case GPIO_PULL_UP:
+			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPD, true);
+			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPU, true);
+			break;
+
+		case GPIO_PULL_DOWN:
+			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPD, false);
+			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPU, true);
+			break;
+
+		case GPIO_PULL_DIS:
+		default:
+			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPU, false);
+			break;
+		}
+	} else if (is_soc_or_above(jzpc, ID_X2000)) {
 		switch (bias) {
 		case GPIO_PULL_UP:
 			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPD, false);
-- 
2.56.0

