Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.104
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987720;
	b=y0a02G6NycIEbyGv8CygS7zqBR2bYmmljQTheWPC1U3WFaCF4Er9wQOgMLDTULXeo7d1
	 tXzGMHPIomoYCv8cpkHEZtv3IV/fCyJ0I/1VqkBTaqdpfKZRKANtFITh9jPlZFL2BM13q
	 GrWW9rdxijBr75xIPye3v1QZT4qbT4kfYQSEwlDpLv9kGc8s6zVMnAgU4bqNf/H638/Hx
	 AuQabJHaIToOWFsHjtN+UWrt9fn8AKQNk+ZrI6jpPUCP15a8lHYmWWH0wYixrLTW7yTky
	 DBRTnLpauUR5KNAsfA+g+bq0LSjJPbv3fGOqKZst+bMBZC2WElkJQakyi0gR8AhGa/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987720;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=hgsWW3V4VdF0R/JiApKmthQphnR847bk9goQhkE+1AE=;
	b=UNbfL/fb+ujzkaAb8PKLJLpaHuUiZmWUtKBQ6oxRMdc8NERhpcL9JeaHKJZ3+aOxJA1B
	 5bFyRbYPKQoh1YKaa6/UfcgzYwfcq2rIt3w5QRfgBTR1Y6BgDRUyiPvdVUeSEfjUptV78
	 WwRpcNRv2NOYgKpo/g/jrtIqCUXSyRjgLxq6oWd6Zi8kC52LutSB9kkgy6CmMwGRmQM7T
	 pNM+xObHwCMlhDiQC8oj1p6xc9gsj4U5nAPB2PwlN/7/GmQAyDo84bHFMYo3Gh0IHOgAd
	 eKEbn2baUjNvgHB1fiBnMG77kbf3vg4UdhunykcECJh08JRIqbnRRhhAshlVWIYmAzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ATlU7vwN;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=IbvwBmTs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.104
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31C7606A8B1;
	Wed, 18 Nov 2026 07:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A31C7606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ATlU7vwN;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=IbvwBmTs
ARC-Seal: i=1; a=rsa-sha256; t=1794987705; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=NLFH7Vhnv1DMxAubfgIPEjsINwAWcJeso/BRYYaKB2CVIYhrvKkDd21HYhQ/Bngy/s
    qfZIGxTTAwNMOmrnrjrq+d3BaQHLh1sNQESLZIqFBvDjN+/wtOk71HLZbgYfnG45epum
    wh562gSpif+OBmx5DXJtfJd2L9bYv6HRiOu2jutNsKLdX0xM798et+mV9zv4w6nzq8Ml
    z7dtQcTFAdUQxQgvOR4iTmFnw/qA5tb87hYLDMnRdN/h0+uM3w3mgxlHmbfGHrgWWjoQ
    u+eFMNBZXcyLEMCMLaltRx7d4QZU/eVoPDfNac2gysDiwnJizqDGKZna9B09ygkvv//I
    7S4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794987705;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=hgsWW3V4VdF0R/JiApKmthQphnR847bk9goQhkE+1AE=;
    b=Fu6fn6HvV5ypH9S6zcooO7hhzgJri5Bdcud1ze7dazwZB4Q/vZq+k9vW4M4U8zlOzb
    K1jtIsP0z/4JA+Ag6Fx6v5ZT52ViCrMdtTjkzhJg2SAMw4YOaKSogFj0wL1XfKCyg5gQ
    M0iFIR3nWpmVeOOTMgYO4zzqN3lmBju7uKT8q5EWPxgJ0HsWOFD/EMtsGXtAMzSd4+Q4
    CtSp9BKzovFORQzkFs09jlNryn3A9HqEU25yX2KkqJYcQie5O4YmSRR5gI5xa2YJHVth
    vZ7+22kbYwV4ey2sm2vrkQxERhy5WTE7XmNuw9xc930hCvYlAtl/85vtazwvJV4xpM/r
    Iaiw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794987705;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=hgsWW3V4VdF0R/JiApKmthQphnR847bk9goQhkE+1AE=;
    b=ATlU7vwNCgHLvCNbhnXDq3dVls2JD/TdS7p8b9qXPFqcgSfvYjayjYRipn79WARTk+
    lQYfGOQIUOrAujNVO8wFpsY+4legDRYZBRrNapu992Hdy1Zsd4foRlgZoNXhNLanXaLE
    jFLnZ12gq/hWnPb7VHK7lCuqVoyblkUXcsBaY2kQoE7vFb+gCPNw91MLNadP7pvncwAA
    wRocdSaaxPI14GYlR9Bk+l/bOO6Ca7RsjDeWeaqenpUwkPqoEIBSFwC8sCAP2i71aoZM
    jfCCfDBCAUPVYyRxFL/i3tXdwgCsJYmiH7B89Nexi6bVC/t0IuNHvO0bIjlThuINsWeZ
    xZNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794987705;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=hgsWW3V4VdF0R/JiApKmthQphnR847bk9goQhkE+1AE=;
    b=IbvwBmTs6vifhP37El0cDkDgorLjckJEDBRS9tgeaESnhBcbNc16WtiKyD7sC1gpzD
    9o52qC7etgaNixXbRUAw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2Jpcm8iNZLZ2IBizV+3wFb55dglUeZzcEX9J"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AI7fjaVd
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Nov 2026 08:41:45 +0100 (CET)
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
Subject: [PATCH v3 7/7] pinctrl: ingenic: Handle X2600 Port E pull configuration
Date: Wed, 18 Nov 2026 08:41:41 +0100
Message-ID: <c7e87f36e19bd2663e2a2ac03f079220a95383f4.1794987700.git.hns@goldelico.com>
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

Port E uses PEPE as pull enable and PEPS as pull direction
selection, unlike ports A-D with independent pull registers.
Update both pinconf get and set while leaving other ports unchanged.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 33 ++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 0491b135c1d11..2c8006280b943 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4637,7 +4637,16 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
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
@@ -4706,7 +4715,7 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 		if (is_soc(jzpc, ID_X2600) &&
 		    pin / PINS_PER_GPIO_CHIP == 4)
 			arg |= !!ingenic_get_pin_config(jzpc, pin,
-						X2600_GPIO_SMT1);
+							X2600_GPIO_SMT1);
 		break;
 
 	case PIN_CONFIG_SLEW_RATE:
@@ -4731,7 +4740,25 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
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

