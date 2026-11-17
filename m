Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.84
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794940192;
	b=JZaju2aWaTTGkHWtzWAq2K2MyxRGB+mPbHw9O0PSb8zOeaZE4m/RlBpmuo4REKGfMqOU
	 p4xXRuqft7bcDg4FRh3l2AYzzBV11m4So+pc85Ww0eQomaiUUacfUrRbV7M1KtmZ+SJB4
	 VefW4dgI80UGdfHN0VrvJlHvORq2a41C3z4r1looeyeBRHXNpQXN89A101ctH3nC/E/ur
	 MGSAIqYV0DY2EdDrO3nXchoN0+QVcOBiVQPLhb2dN9h05aSDPOgYMBCY+sSnayfYcFc/g
	 QFA5YPxKqOQYSbrdvVpEhgfeTxZ4OaJjroU4Xe3bJOVg/BFUcgCnBUb0pQX941ioGiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940192;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=55OKLBqPJHT4qZAJWhAGfYaaNnlWLrb7VEXjB5ASwjc=;
	b=kaCtN2hKN84CKLBXrFJHbuUeP0SNoCwgk1pDwLDCvRh/0HviN5r0ulUGD9AJ9JaQLVJ7
	 Vgj9GJm+Og1AKxoTryiTs7nXl3ZbTmZcUuZdQP2Tid9y1SSlDxWn5eCdXeNcd6yOVd1rM
	 S4/XG2wtEdBlc8KT81hAp52yzXEN6bgPqLXwUocIrzHfqumRQ/w4nMqGmidghdOfTyMLg
	 uLtS8RH4u5URMTR6JuIXYqAhizjE39qVF7aaY1uEMBCaix9D7DEl4tB1+J+dMQzZz4/wc
	 ulNtRyDeyNVrVD8RNYZLfErEppLfqTyV5x24AebfnA4Nw0xiCPnjltbq+ipME4gn7NA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b="UWf3Qyn/";
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=0c1GGWQH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.84
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9F1606A31C;
	Tue, 17 Nov 2026 18:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA9F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=UWf3Qyn/;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=0c1GGWQH
ARC-Seal: i=1; a=rsa-sha256; t=1794940175; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=eFsZpYgx8icOfSLP/W8tHkKtzI69eOPaB3E9F4+68ywjT7FV0Z6HqVUIl57VgOf4Ng
    +rgXzAf21mI9+TI81a66kb7tFut2dYIhfN6A4XyUXWmdG23AhXofffTy/M1DowCb5m8k
    6AclOy4Rd6pIvmgdmCDQrwPfvYQchlS5MEEE4PHmjtPWAIOc6XZpN0aRqSD7H7kjMWHu
    QGFPVSO3LVYxKpowqPn9JHPsRD7Z1p0lfNAH2+5z4gc4Ri4uMVyER/kID3Y3XIfCoeeC
    Npk3UZ16KXSfCiCvf21DPGW7EE9GGA7csSjaHEONRGctNKqXy3cekHMUjnY25k+XurRp
    UCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794940175;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=55OKLBqPJHT4qZAJWhAGfYaaNnlWLrb7VEXjB5ASwjc=;
    b=lxmOZP4F1xr8QKqPBjMbKjUY41z79yQw9fCDhzhuAWG/BiQ9to46e2bXB3PfXKWg5b
    7WGL9UiqjXyyTFm//0XXdEPt4qv3x2dmxoyb9RXb2z09r3Xk60q2wUxGSYF/1oml+rc+
    zKyTXqWgH/Dp0IrjIgeYAdR0bc6/vX9UGSM8lCN7NbWjN2xxk6DzYCMfkBpdlZ61qKht
    +NjexbNjKlFFSgpdAsj0YQdA3iolPZ5VzW4whRmdY/q2NrTUnwbhnKcWl7kjyW4nDvcC
    5oElgbdH34hQ7+qvAXMkdNwtKB8lA3MCuzrtN/anMeNfQDZElSGO+hqpuIsayMrUgyXP
    ZtxA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794940175;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=55OKLBqPJHT4qZAJWhAGfYaaNnlWLrb7VEXjB5ASwjc=;
    b=UWf3Qyn/5jSkvpwsnyVgJKinNrg0GMCJCyS5uxiugqUrtrGd0q2duPvLNQ6/4/e1TV
    2iHzk4O9RChjxKzxjSZT2CzREFCr45CidNeo+FRKxcW1PqjmrasJJOA2T9rYIrQZCouO
    64bRLWdAS+zDFeZ+U31t+4GV1qkYfzOWd3Qr8h6+GeXK4EI66cxhVMLMPNOIpSNaxQG6
    dWz/ZuM+3KzTHnbGhqTkFCBiZQRG2hznTcOYUWAVb/3vHvDOvsmV7/gkWijDPtsLqLyw
    +VL7Vo8NcVC/DpGQ8Hi14A1SasGkxIU2ZYr5prJEJ9j292QqVS3j75C95yBDx6fBvARu
    m4Gw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794940175;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=55OKLBqPJHT4qZAJWhAGfYaaNnlWLrb7VEXjB5ASwjc=;
    b=0c1GGWQHc5Xs1dof3ZgZT2viYUdK9IpPkvXFmAiGsRQbd/Vo9RY73CdT7kyZu4nDeI
    CadNJFqitr2CNPQoYUBA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ppelMiNKoEY92nD9kO01+3QZuyyF4VcrvHZ"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AHITYYbT
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 17 Nov 2026 19:29:34 +0100 (CET)
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
Subject: [PATCH v2 6/7] pinctrl: ingenic: Handle X2600 Port E Schmitt trigger
Date: Tue, 17 Nov 2026 19:29:27 +0100
Message-ID: <63eab06181d62c60df6332d252dea40f4cd40182.1794940167.git.hns@goldelico.com>
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

Port E has two Schmitt trigger configuration bits per pin.
Select the lower-hysteresis mode when enabling and read both bits
to report firmware-initialized settings.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 0aa29d6cdf4b3..529bb31cbbec0 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -69,6 +69,7 @@
 #define X2000_GPIO_PEPD				0x90
 #define X2000_GPIO_SR				0xd0
 #define X2000_GPIO_SMT				0xe0
+#define X2600_GPIO_SMT1				0x100
 
 #define X2600_GPIO_SHADOW_OFFSET		0x800
 #define X2600_GPIO_PAGLD			(X2600_GPIO_SHADOW_OFFSET + 0xf0)
@@ -4707,6 +4708,10 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 			return -EINVAL;
 
 		arg = !!ingenic_get_pin_config(jzpc, pin, reg);
+		if (is_soc(jzpc, ID_X2600) &&
+		    pin / PINS_PER_GPIO_CHIP == 4)
+			arg |= !!ingenic_get_pin_config(jzpc, pin,
+						X2600_GPIO_SMT1);
 		break;
 
 	case PIN_CONFIG_SLEW_RATE:
@@ -4781,6 +4786,11 @@ static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 static void ingenic_set_schmitt_trigger(struct ingenic_pinctrl *jzpc,
 		unsigned int pin, bool enable)
 {
+	/* Port E uses two bits; select the lower-hysteresis Schmitt mode. */
+	if (is_soc(jzpc, ID_X2600) &&
+	    pin / PINS_PER_GPIO_CHIP == 4)
+		ingenic_config_pin(jzpc, pin, X2600_GPIO_SMT1, false);
+
 	if (is_soc_or_above(jzpc, ID_X2000))
 		ingenic_config_pin(jzpc, pin, X2000_GPIO_SMT, enable);
 	else
-- 
2.56.0

