Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795022759;
	b=tZOYebhJgq8AO5/EZtHAH6Yq+geF226EMrMmwRqOz8s2Ix21wEloodnDaLIYwurWo+s3
	 P+41Tn9/oIjDf9WBcccJzmF7JXS/IYFRXwSRKYBC5QVW7EUMe39OLcx4y4Lf27Kr6vnfM
	 pkZ0ZdPsrIEBinWML5EiIlrPv/AigXWbDLrWITZXX5xmlJ9WbbdOuAZbw5XqeZHAvkX2d
	 bf7xpdukKEqLwmzTXJEwBCNxbNS7cGhoJHfQS1txt3CQv9fgKkIzgaqzujKoNeZSlAbLI
	 vQA9MGXpl8Xqf2U51zAVzhvHQeCkw2krq8Pw/Pr5FUay96ZL23mPo0cBhLudg5ri7vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022759;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=G0N4LAL8zcXXZkVBLCU8hS5dRaDXB0L1Lj3z/VIvoEI=;
	b=wIWCrAwSXPK87TqnjUyQrF8eHrD7Ft4EVe5+W3nBPs0WSlij+oLmdueAVd66ek8TIjUd
	 1wKIkQNmryVxN2/ZprIbGfFtcjtVC9qYaKhTTplnIAW6hsT9V96pGpuAbXYUgciVcGe2X
	 qcJKpvYhH8NmZEUmkvNFDk1EdVPhoGy1qr7WMYMw4EI7XdgIQoVlnlgZLtgnmlS4az/oc
	 ikP5bgo8ekirendkYfXkUFFhmraN2tSOX8Xy+qYRAWzSLpNHOJqNmCuGmWLTMX/A+Do+i
	 tHtNcWcKEgbUAlvhMuAPtYaPVKuk1qpiprlm2moyr6so5vcIl+nT2xeHLmXmKexMOGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=lZ2r3iqL;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=iWhhz0fu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.175
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [81.169.146.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9F0606CA5F;
	Wed, 18 Nov 2026 17:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC9F0606CA5F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=lZ2r3iqL;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=iWhhz0fu
ARC-Seal: i=1; a=rsa-sha256; t=1795022742; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bvrGGxmnuoOTHBrznaYWmntQ4wA3voCcmQmwu1kTuvCJU6dvrfF8JXaFWH4fGywANw
    qFqQfVV/J4LF0HKznjkKvG8xfZIWECnQyTqKdbWUEqM45aOO23pCilRxaXdNRB34HYz8
    4GpP3+RBVWJ0Y2dcwDwSARKbegqR9kgQr64L9pqZSL1wsncju9uN2iG3Db+e3SsCP3+d
    87pzpFe89qvEyJiwkuf8dbDxCJ3sygUx1NulYBq+ljKbhc+h6Dc/4uFVN5rYJ2dvSJM6
    6dES+JVNr4/S/pDcHtgkRMg9x3pTKHLJlPc+lHUwcZhIyL0QfaCdQGVKPGubsFsCLeJ9
    XmSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795022742;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=G0N4LAL8zcXXZkVBLCU8hS5dRaDXB0L1Lj3z/VIvoEI=;
    b=oqRdVBUC5ZRnPcYWFvift/plLIzoTGTipWv7NBOGHOpMpGd04noMp7Z+SeT6ECjWBT
    plzNvEC3fEcU74M1dhnIZz0ewAefn7wb72RZEBEtoMZu9WBbcjS5EKM2AI3OP46DBJM7
    scwXjiiSFxgxje1kU4fCAFFrhNt+sOnr0cWjBGrbXayhBWI2C0SoE1Q50u53E3Iitg7S
    MSxPp2bJ44PAQaMbtzrX1WzZmmIffTDu9+u4F1csnkYoY5nyFORus44r8YZQgTyBy423
    5BogGWoCJCGtOwdOhAu6jJYhgFjLaP8InKf+41eMSM6nOXOrg3EhOEq0I5TDYOHomH7X
    hesg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795022742;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=G0N4LAL8zcXXZkVBLCU8hS5dRaDXB0L1Lj3z/VIvoEI=;
    b=lZ2r3iqLhmCi3tuFJF/fPMsUp1/gqtdNc50bpD8VdZ1Eqt0HWzme5a1IZWFPcQFrb7
    fYIwS4Mx/Vzdwhtqf2EfXgYAuJN1Hn0mUT97MnFObbZtLP/nmNjcgEuVmV74YNfZVQ9t
    MlO/KnHUzWPFLj4uUldwxZwPnmAaPZy1YzpDBm92SgHA8eE0MtQXRPe0Z+DpzBaWJtZm
    2/I0UYfFIqxx8pm+n4zhNiJeA6//PYLDTWSvz/9KMle5LF2PwiSUHbuHRB9E4kPFwv6c
    FNMm+qpRKB7nlfT4gmrnQV2IgnSoazY+29ymmgh0f6EAW0/MKFaCK8szKJJvuNeBzy5i
    Y4Ig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795022742;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=G0N4LAL8zcXXZkVBLCU8hS5dRaDXB0L1Lj3z/VIvoEI=;
    b=iWhhz0fu3uq/5eAHHdNTDy3RZ6Cgh1xp6HhmeMlSsbEPp3Z86L080Jn4hRrTLrjEpY
    ynGB3LYhmllOyneg3NCQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2Jpcm8iNZLZ2IBizV+3wFb55dglUeZzcEX9J"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AIHPgdia
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Nov 2026 18:25:42 +0100 (CET)
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
Subject: [PATCH v4 7/7] pinctrl: ingenic: Handle X2600 Port E pull configuration
Date: Wed, 18 Nov 2026 18:25:37 +0100
Message-ID: <c5923b0330b605adc5dd5c05370bad017015edb0.1795022736.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795022736.git.hns@goldelico.com>
References: <cover.1795022736.git.hns@goldelico.com>
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
index 876e8e9e00c45..5feae90c8cbb2 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4632,7 +4632,16 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
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
@@ -4700,7 +4709,7 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 		arg = !!ingenic_get_pin_config(jzpc, pin, reg);
 		if (is_soc(jzpc, ID_X2600) && offt == 4)
 			arg |= !!ingenic_get_pin_config(jzpc, pin,
-						X2600_GPIO_SMT1);
+							X2600_GPIO_SMT1);
 		break;
 
 	case PIN_CONFIG_SLEW_RATE:
@@ -4725,7 +4734,25 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
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

