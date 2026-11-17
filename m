Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.166
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794940185;
	b=vIDk8w85Kwtfoj30Alv/nyMp6F9vu+ScdeIF7azqaESaAI//DIBIuMx4L6XKGMdY7sDp
	 VlpO+kswWmBrFgnD/OMxWYuOwBNNkfJvDseMUmnJ7CMBVJGKCdWDT5kH9kGADRv0zPiwT
	 kCWwmdG0Qj0No1AvgkkXqsAQN77tXgCGOgps1J/y7kAsAKAGblkoZf9jm7siEGOa34xcq
	 gSHc07YPj4/0vzcpKogoJT6rVP1deihto/YZ6njxzdpVoOwO3VzkEkODGpfAbZQKPTGJR
	 CGRankf9X00kGebbkJWN8a8xMII9Jg40kzFJS0nXvyXjntTwNJnvPXXKBKQ6BKK0q5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940185;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=l+XFBccrYuDhtVAQlrMd+uvqRXSMqFNcK/gVZwMFJks=;
	b=gdCrfHp2MeYpr2yUGZuQShPjHEEwZU2lsAZC1v65i65FDnGYxEp9gFR2NxHxJyJBoo5Q
	 V08yBW6R6ANtagv+y1luV+FchRmsx/1T8e8o5XLHlfBLQEf+10C4WlI/yjAhei0/jsJwC
	 s/p+J0Vfuk9xNgdd9/ayjeoOy2RmaMhk3e7FfbPSRnITvv+bHqIDAgdb2EYJKKWbTYExL
	 gFf0ljZjqYfgLwZ9lJsL2QwUWX+dV1fB87R1SSbEjrCh+7ORKKAVV1vKkACZmBPTbNSWP
	 HtGoz+j3FqHvGigANFGI1pA/FXcGJF/rsaMttgqKlhqOTFui5yulhn2iqn1twEfWWRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Fg7PwePu;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Mln4Z3qp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.166
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA82C606A31C;
	Tue, 17 Nov 2026 18:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA82C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Fg7PwePu;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Mln4Z3qp
ARC-Seal: i=1; a=rsa-sha256; t=1794940173; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=r4/2fUO9uT4ytL/rgwwjYtBWpbHWj1KI7VTsq4N/icXsQBBJK5mncPKoac7g51XHJi
    jT6WHNzQZVNqw28EflW+nqBVOfQ/FwsZl5d55LAKLIxlnWnrj5aKFgU8gytvl9+NCKfK
    jUe+YoMMpKBFqMxTI3fHCWqfP6GmeuDf3txwjhJYxHowEgy0h0Tp9KKRY0KZlBZoHBAD
    m2zSidNXd0YToxW0O7b1dVtxD8BEd0xUkjjApdj7vFlhXJgsto+KWpTi52HHjDxw9cKE
    7izql6ACMw3SE15D6RR+b8baqlkA6xcjWrxzXxN9axtIyjfzkUDm9dVMzKo9GoPwFkHc
    dXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794940173;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=l+XFBccrYuDhtVAQlrMd+uvqRXSMqFNcK/gVZwMFJks=;
    b=H18kM8kd88OuXMTIkJ4SQ65oHi6an+ew5o7jwOp+vHQJ1jGq3YxcVotAyCsiPCy2lA
    /ze8wAOvm9e+AIsNG2WkXarOB2LDqXiJUg4IwENOiakrWXjetRO8qAkKL260STF5kBMo
    e/te5VfyW6G1sGV/UDcLuFFfINSGLXFZjG5F0PwhibSUIAIYrpRObYFaRYGRdtvHHntz
    3UgU/t/unsji4dWydhvIRI+eDjLiYmxbd3ZgwMG6BX1L64gLnaNBKIohu3lbODKQ5CnQ
    iG0HMAVvSap1KnZ+09xiTC/h4ZykvQoQfYaZG/f4MHuAb8ku6pJ6Bh5aYdVd5mqIHYwb
    Kktg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794940173;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=l+XFBccrYuDhtVAQlrMd+uvqRXSMqFNcK/gVZwMFJks=;
    b=Fg7PwePuBiIe8MYHGxudhFyymWA5FNdAHJovJZwQ1YZ/9KaEXDD1PAQxwHJsS21mmD
    Q0VRDxtbwgN+WjqHm2H6/9XxjHG6WMDJ0tztYfiGakcAQcrqrjxv7GI6Xu0ai8/F1uMl
    ASSv2rCebdvIBIAKhvU8BMMBjaPxwRdiAK+Lz6qv47JK33D1NhmilUx8OvwHDdf8Endf
    cGFWLcEwONYipu/BpYi5yCt1DDObnwBCJ7fDSKEke61zrK19fRJuVODQvKZBK8sVecfT
    TybaK/szqnnW4tmti7Ze4lINkMrQlB3ItrEIDz2eTfyo1b3lI4nXGt9ZV3UQTj8UE0OL
    lvyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794940173;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=l+XFBccrYuDhtVAQlrMd+uvqRXSMqFNcK/gVZwMFJks=;
    b=Mln4Z3qpC1X6hAChJIJyS/bk6wPPWMh7aIyVDlgrgFruRVyMIK3oSBmuECoPSEbPo4
    t5aJ+MDS8DA7QXRQctDQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ppelMiNKoEY92nD9kO01+3QZuyyF4VcrvHZ"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AHITXYbO
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
Subject: [PATCH v2 1/7] pinctrl: ingenic: Swap ID_X1600 and ID_X1830
Date: Tue, 17 Nov 2026 19:29:22 +0100
Message-ID: <31af98bb343c39b76f8c59d247a9ebf45ddfb541.1794940167.git.hns@goldelico.com>
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

From: Paul Cercueil <paul@crapouillou.net>

The X1830 predates the X1600 and uses an older GPIO register layout.

Swap their IDs to reflect the hardware evolution. This allows
is_soc_or_above() to distinguish newer X1600-based GPIO features
like X2000 (and X2600) from the X1830 register layout.

Add an is_soc() helper for features specific to a single SoC
generation and adjust the existing pin configuration checks
accordingly.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 37310d9679457..88c5edeaaddcc 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -110,8 +110,8 @@ enum jz_version {
 	ID_JZ4780,
 	ID_X1000,
 	ID_X1500,
-	ID_X1600,
 	ID_X1830,
+	ID_X1600,
 	ID_X2000,
 	ID_X2100,
 };
@@ -166,6 +166,12 @@ static const unsigned long enabled_socs =
 	IS_ENABLED(CONFIG_MACH_X2000) << ID_X2000 |
 	IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100;
 
+static bool
+is_soc(const struct ingenic_pinctrl *jzpc, enum jz_version version)
+{
+	return (enabled_socs & BIT(version)) && jzpc->info->version == version;
+}
+
 static bool
 is_soc_or_above(const struct ingenic_pinctrl *jzpc, enum jz_version version)
 {
@@ -4090,7 +4096,7 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 				!ingenic_get_pin_config(jzpc, pin, X2000_GPIO_PEPU) &&
 				(jzpc->info->pull_downs[offt] & BIT(idx));
 
-	} else if (is_soc_or_above(jzpc, ID_X1830)) {
+	} else if (is_soc(jzpc, ID_X1830)) {
 		unsigned int half = PINS_PER_GPIO_CHIP / 2;
 		unsigned int idxh = (pin % half) * 2;
 
@@ -4142,7 +4148,7 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
 		if (is_soc_or_above(jzpc, ID_X2000))
 			reg = X2000_GPIO_SMT;
-		else if (is_soc_or_above(jzpc, ID_X1830))
+		else if (is_soc(jzpc, ID_X1830))
 			reg = X1830_GPIO_SMT;
 		else
 			return -EINVAL;
@@ -4153,7 +4159,7 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_SLEW_RATE:
 		if (is_soc_or_above(jzpc, ID_X2000))
 			reg = X2000_GPIO_SR;
-		else if (is_soc_or_above(jzpc, ID_X1830))
+		else if (is_soc(jzpc, ID_X1830))
 			reg = X1830_GPIO_SR;
 		else
 			return -EINVAL;
@@ -4190,7 +4196,7 @@ static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPD, false);
 		}
 
-	} else if (is_soc_or_above(jzpc, ID_X1830)) {
+	} else if (is_soc(jzpc, ID_X1830)) {
 		unsigned int idx = pin % PINS_PER_GPIO_CHIP;
 		unsigned int half = PINS_PER_GPIO_CHIP / 2;
 		unsigned int idxh = (pin % half) * 2;
@@ -4298,7 +4304,7 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 
 		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-			if (!is_soc_or_above(jzpc, ID_X1830))
+			if (!is_soc(jzpc, ID_X1830) && !is_soc_or_above(jzpc, ID_X2000))
 				return -EINVAL;
 
 			ingenic_set_schmitt_trigger(jzpc, pin, arg);
@@ -4314,7 +4320,7 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 
 		case PIN_CONFIG_SLEW_RATE:
-			if (!is_soc_or_above(jzpc, ID_X1830))
+			if (!is_soc(jzpc, ID_X1830) && !is_soc_or_above(jzpc, ID_X2000))
 				return -EINVAL;
 
 			ingenic_set_slew_rate(jzpc, pin, arg);
-- 
2.56.0

