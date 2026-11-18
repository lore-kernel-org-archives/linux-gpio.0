Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987718;
	b=qutPZAvy6Imn4B0fGxZCLLSSo2GulmsIECpB3Yq54M0odF/FRXx8p/LnAwqGkbF0ERH8
	 1VG/+ee6+rqc+cNWejyCUNBh+3NsIuuvF2GFj//LEb5yo4nYBdA7omKou8EgQluco0Q26
	 tuZHYn4/xESjCPGDyx6/Ksap/VDFs3E4gx+UGTe6s2f1jKWWNZiXamyNRcs6oZQgT32H4
	 hj8Ta3SJsYD0JOFsnzPY6bIPIEXC0wNHwgaysTIs36DTdIDcJ18fO7OeHtQQHfqMb4GTD
	 hjmSZN1CoW/4z+P3LD7tpzYo8++0yWJGUoYT6YWG054tQ3FKUP9MOB+9GCAt1DrnXBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987718;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=l+XFBccrYuDhtVAQlrMd+uvqRXSMqFNcK/gVZwMFJks=;
	b=GqSuoc89vp0OKXnevC77piqTOu5gCnGCFajLf5wv3MVPfkXyyR9J0VuThhuYYf/jUz84
	 RqGN5SxN/jPLcD3H0UYS+pb/qOvdNLDL7hv6iNkKxXjQDFESY95kz9xnbwIFc/bK78zMW
	 g/EPuNUt8TpIQxh3VCo1OvLUHVNPsS7KcZ+AJCbatGwggdtoTdlub6Fj7e/FgvKh0gx8d
	 VsZhos2fBSaiBLHF/LqcDLqKY7Y7N1FIp17AbnywfIK3uG+1H28GRaEV/Tyc2R+85iYA3
	 zCCgRW9zPReXw5AheQG/wiOyGqv2bO1XOTXXEszBRfj5RKXuUsXEwHDo9EKmzx9DdBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b="a/iopO95";
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=pEaEGrqS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.53
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19BC606A88C;
	Wed, 18 Nov 2026 07:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A19BC606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=a/iopO95;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=pEaEGrqS
ARC-Seal: i=1; a=rsa-sha256; t=1794987703; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=eB3KguLUcjFXeujdfd0ikXZy8xTwKraGBgLB9gUVH//Eco70zctkBciH2U09+AxQOd
    DJI1gP+0GVifhjqLTr4JfSnQnCpHb+Ef+FGjRvHvgNPPPj+8yMGvdAmhWghHax7vi+p+
    xrmFKSWIVkllTA96K7k1DXoXx59nCUSNc7ko/GZ/Vq7jzgvg9omJU5IJhX6Is6k8S0rQ
    XDCZIBpUMfz89u4WM1BES1ipKLwVnbKy77UKG9zBFZIlLg839QCu+Nmdkr/K/VOqNnQq
    LZ+9tf5IBL42BTY+x0u9uqHIZSJttYbrp7UAYMm9FFMSrLnlfExaastrNASBtAdoSS8D
    phpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794987703;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=l+XFBccrYuDhtVAQlrMd+uvqRXSMqFNcK/gVZwMFJks=;
    b=kVqa0WtE2DrBkP4ElMsOmW7h2lt8M6Vl4kd5+DasYpFvfSzKtZ1lVBa4DHRr9lSU94
    VdLHSsFZpmbyXuPi9KskuqB7+8hPp9OZ2M0IYRLf4gwtu74uAB3zv+O187NssBCTkHqU
    ZzdIJlwn9NQWbZ1t5ki30u1X9ohf77KD4aKf8bFMyDKbtKZw7HYv2f8KpL5tKxkqNont
    J8ws+zDO7zI0xVoZu+3YYHMTbPz2hs0Yd6QNoP1m+7EbMm+PIz9o4pS6P5BM0unH0Vtg
    fbuNqpWVXbqo0MUYhQyn4iM4KCsvEBB4blbprXU4ydBbDb1RX8adFCt22klJoyDkDvlE
    TfzA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794987703;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=l+XFBccrYuDhtVAQlrMd+uvqRXSMqFNcK/gVZwMFJks=;
    b=a/iopO95sPV4BlAcA9hfsv8UTznQXk3XJjfq289pD3LYKWdceUw1S+IEi/0OdkCzS8
    7bar+8Hiw87oPfcZHlx/5wDhtL7b/E/vP7kntaVRircYvN6jlYkufAaJYD4FFcbGjpfS
    yXTwfxrg5XfCt9Eel1R/YTK4rS6hbSW6H52QIRpfzoistafEOoX7iWbKBsY34pKPRb8e
    aSHHFqlGuU7658QM5PsaBfpTDPdrctIE4Qh2u6jCPU9Ce9xsGRDIbeKzg9Em/c7InFwe
    T4qOapKIQCaL2SdXzlXPuBMF/fzkQ4vHJ11vejtVAHZoQrIHzBCTbovH6M3sL5lSVIr0
    f/uw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794987703;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=l+XFBccrYuDhtVAQlrMd+uvqRXSMqFNcK/gVZwMFJks=;
    b=pEaEGrqSo/84O/e4d1Ipugko3mx/unrc2n2YJmAgI5eMlNmXQYByNy9gVFYecg35KQ
    6NYJBJcf16syVQNFBaDw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2Jpcm8iNZLZ2IBizV+3wFb55dglUeZzcEX9J"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AI7fgaVX
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Nov 2026 08:41:42 +0100 (CET)
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
Subject: [PATCH v3 1/7] pinctrl: ingenic: Swap ID_X1600 and ID_X1830
Date: Wed, 18 Nov 2026 08:41:35 +0100
Message-ID: <31af98bb343c39b76f8c59d247a9ebf45ddfb541.1794987700.git.hns@goldelico.com>
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

