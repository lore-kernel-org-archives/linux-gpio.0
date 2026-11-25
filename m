Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.100
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795589414;
	b=N+oFmnioS1pR073ppy3LX2Bf8MbcsBoFzHDDzRAh5DVR4hq0Pgl0siXl5NYzggV3FDSK
	 U2VFJmfxQOMYlCw4sYK+WeItxQ20hCR7CzKI05+zATEfST1ImmiOYthCD6BTjT6Tdgn6C
	 y+hlqkla7IBxWbiwSJ98kVZsqkaEJJU9U4hLRHliTAR4X7G0L9leafxd1PTTUHrIome18
	 7DFKG53KHEYnICIuhNFz1OpU4Sao8JZj76b9nFRJcZtrjGhunX+r4oDhmORjrI8fJJBJn
	 2y5ZQuehrMNYoxMCg/PXLbQjfpgOaXLk5w/G2dbCijjfaFfPUDTmbpxDTAiOIgTj5CQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589414;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=3nMtHpnv+qQm91PygA24IXETPtBeso4wJN4QKWYYQz4=;
	b=KutTqHLX1ajV3PZxUgc2sZWE0MmcqeaG0m+ns9iAhYf35jdS4PD2fdv/RN7AtmAfTTgT
	 1SuYgiAcKbuaUx3cSrnnhG5aZu0IrcUdLITtxFdIHkcGJvppDDqi5KB9+ERkAYbcZlR7k
	 B/QKp7tkgo+BDyiN/aS/pxSPrmUNX3bErsrr/ytOTaSUMg3fiz5O9aGG8PNoXa4iENKfv
	 xPwcXUKlEqOUwRNpf3DXG7TU5tSEASdbVaxARnTvKy3mlb/93tzgbwT5yiD0Ln5RUMvdJ
	 uuo7Bzsh36fB9rrLjliDCw2UfCsWleAHl8VNC5jxsOM7GGP6dJSlPDgwtxTj63wvYVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Z9UphJ4z;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=hEfGqbrV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.100
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC016606A338;
	Wed, 25 Nov 2026 06:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC016606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Z9UphJ4z;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=hEfGqbrV
ARC-Seal: i=1; a=rsa-sha256; t=1795589393; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=HaDSx9FIq4aMIE4dlboi/uXKOWDtEGCWb9qqvFwC/3qhis3WZu7kZ8e1j+TAZbJage
    tCXSX4lm/z3RVwqj3KTaqU9JS3duLoiTJBvDTaoNJnvfepK9m4wU7Z6aFD+XIyIZVMN6
    W9hWBwUzndEj6X5dz2a/PresejQZLkiTYYrpOxs/MJfQM/JblqpyoTW/LOML1v9vHcD+
    QVl5WSPY6Jwk3m+eqgkzPIT+xep58zQxtUuDAxEMlJbEeYspmiOK+k0tjixCKbP69L8S
    Nelj3jNJPdeBECfIcTwQBz2dUU4JQyzSjHx5Jd+EgKVftG8XeFsgOpBqpuszbYZNecHO
    wsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795589393;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=3nMtHpnv+qQm91PygA24IXETPtBeso4wJN4QKWYYQz4=;
    b=pE63ZpOzgUUtSoGjDhNeQfNQbRMdv/+m3gyxN4hF/XO25x9s+j9bjc+scXJubk+WIz
    81oqhMyiyWabjqUszNKzIYPfFSkDKKOb3GARLfEOBpOR4YRXHtjphryNkpvRjeea7qKM
    jhRkxoeNBQ2Z6Xv+489lE5T3lP1iHq6k2gHZk5+alZQA9GvRg8B0TwlaiIiqhqtsdLZm
    1E/H4AdQVESdIS4Q1vJduzNm7XOIj1G/NnFdWkqbFlmiX/YuXCDRnfljezVJUM+hcF5M
    Xm7grkrbW0k/0Vpa1Q0Hjz/VqdRkFAD7VL2kFrmRti91BO44LDBddaSaNdz1CbE8A7BX
    Dn5A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795589393;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=3nMtHpnv+qQm91PygA24IXETPtBeso4wJN4QKWYYQz4=;
    b=Z9UphJ4z/g+OQ9EjWa39W4m1PZ7heolej/d0b1VM3h97sTRZMC4VnF3TEI+pydYlD5
    jmcDd8Ibr0yh/UFD0tsyiFpQ73V9glYc8vJ2CKInWBlUaygvjJBGkxfo/NKB+bTXfh2r
    di+0LnVrafsToyXruUJ+pCe3+SIxOwp2GHk2Fs3YJOkZdLZBKTtyRjV7rkZ6neURKC6d
    O8sG2Mijz+GeYhd0Cog2HbXVey1h+Da/nSewSfqUhpRaR0bAE+/0HHuYdBxngHW2tfka
    0RkM/nESfy/JINT/kzeyCUwsbE5J/n9eE2WjvvzwP860iE6/EYT34lHOvRxS7IhaLdWm
    4cqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795589393;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=3nMtHpnv+qQm91PygA24IXETPtBeso4wJN4QKWYYQz4=;
    b=hEfGqbrVL+/2Yi6uSS0SZkWD5Jw18bV9RBLV0BCSle8hoYP/BLxsLvBb1pLm4h5z18
    HkR1JS6Xt/+g/AIvFrDg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS25oMlMiNMn5e/Npe6SVDIvzG+5uG4p/zkDZq"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AP6np5q2
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 25 Nov 2026 07:49:51 +0100 (CET)
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
Subject: [PATCH v5 7/7] pinctrl: ingenic: Handle X2600 Port E pull configuration
Date: Wed, 25 Nov 2026 07:49:43 +0100
Message-ID: <1738487a3aa443d688d9845b18b5231d5d454be5.1795589383.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795589383.git.hns@goldelico.com>
References: <cover.1795589383.git.hns@goldelico.com>
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

Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes V5:
    - Drop the unrelated Schmitt trigger alignment fix,
      now addressed in patch 6/7.
    - added Reviewed-by from Paul Cercueil

 drivers/pinctrl/pinctrl-ingenic.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index d253674accacd..a8639a202da1b 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4628,7 +4628,16 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
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
@@ -4720,7 +4729,25 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
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

