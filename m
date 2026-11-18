Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987709;
	b=E7uGRUtilrtnI7r0zifnZGWxtrDuRjTascvESM704+JAEeJiuBQ/vYSpm5vpUN5hKoZt
	 kBSm34OSzjZ0/X34FZ5nOnHCqwFT0PcGWXhgAPPq/+O/LvC62GeFGnYsM+TLHQ11Wj4YV
	 R/YQUS2gk1QuYTyfEPh1cJQ5s82b4bt3JJo6Ow/iFEO6oDBCvNVsHW2n0ryD7DhVTcWkY
	 oENwJqP6U5NzprcQ5Ja6APtRsGplEOL3XSNvymskZD6syMiSqjCYCR5792/DJKrRWFq9I
	 fN8TfcSg3EbesSuqpS8uo1nX9DE0jZNvuZndZ5Q8m6KpmOyOrhTfx+tnDPlY1ji7gLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987709;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=iHrippdR706dEsbKJ6HBFT2o15z011ikCp/nGo385C0=;
	b=2Zj88rndGjdk2lYUiM2ivpVNzHfGXJ4A0Xx5zfp5QmrgL2M/RmRrDwiutByxwRcdiUHZ
	 m9DS1s8b9F971gZe/atq/2CieH7Na86kWivQh1FTAbP9iHIbPXg6cFT4C1KHYlMfzdZxI
	 Umq5/1RFaAItOQuCTLRjsf25EDDW2mEjemqD7jwrkOrJuFHAKnDSCq3fWKIDMLBce0M6F
	 uXmotxpNZcPnFvPeZiYSq6JUA72RTdmdZR9z17hnAc4Znt/ANcMCvbA1I/Oxvp4mT3kYK
	 kFKKV/oH0sxsIvZSdG5EIXl0NluVhPr94g4buEvVeUL37z14Uj5HOlDRb+oRsb1VOeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ts+x9DiZ;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=3OBiX9hG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.168
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB68606A325;
	Wed, 18 Nov 2026 07:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB68606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ts+x9DiZ;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=3OBiX9hG
ARC-Seal: i=1; a=rsa-sha256; t=1794987705; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ojrXcvx25wa+XhqoDFFTnq3QHMe19l27P8D+lEA2xRKkpwyUs25mIWsH+wuug34PpY
    MGtXFfTBWawa0IFdQ0h/Kgax9kHKfAAOalnl273J7Hspvd0Q2lMe4KE79N45LrgZkMNb
    ZiuP6jqRUatAUUPhREZsQ40yMic92kln1Ctn+mo8x7bAQ11WuoiZ7BQk4yh2fPZOvxXe
    PnchHdP3rLptOS28I0R50DXGRJJNmJn3Th0PSKh/0+lX+EtxlKjCOxMyTymV9T9eCHqG
    c1JWF759tJ4TVyIMH1Dsr89uffzzOOcd+wiKWAq+TOS7hXkkaeC1dWJEUm6xwyItwTcf
    p7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794987705;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=iHrippdR706dEsbKJ6HBFT2o15z011ikCp/nGo385C0=;
    b=PqMLsex0oIfSjjQkGohMrj1g/k2hRxflkIIILBAI+5IQThRbIN9vfE1xTZodCoHEyX
    w5L0wlGzo9u2n44Z4y221668GIJ0QEAfoBNs6LIbB9NCIpPJgjqAPH290Dw5n6bsg3WH
    6ftWTw53wYolKEQjF0d5DzF7nhMqQ0yGet+57Tgf2yWrld9NDwmXCA8MiLPz0/It5v8w
    6kkTtOaeHdGDttjaHCg0gGfC0k+s+c0/1owNFxY2SJKjJCgIZug6d1hAsEmCKnzxJozv
    pm8bdLvRyPNAGIgFIvvKCDzAK6lAdBi+hUZg6LbrI3mZL3A6en/vogkgyMAdSWAJeUmA
    EFew==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794987705;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=iHrippdR706dEsbKJ6HBFT2o15z011ikCp/nGo385C0=;
    b=ts+x9DiZ9bLFRz6Qs/pz94WRY1tQiD5obrsBC4JZ7URf29THPbK4q58Pd2lKPKSBXQ
    6U1FbOZL5ifJU8ie++2HghelTcpXGgNjIJ7KHcSilLg34QeeYHDwl536YeBq9lx8pTuv
    edvSFLLN9hyItOdPN3AxR69/RMy+tEe6lXIlKTd3aDbiUWpa9qRGD3meXVlKww8MEney
    6rPBj9jJLdvcVr1RkGHXwu1gb6TVP1hTrrViJQV3vH3OJiIz+B/hrDZDEADU/LwyYyMA
    IXVnmG3wmGLIwCWSXoBzvTs0rRIOSG0E4L0EwkkpLLYdE8dczW3RSfFyxGZBHbwkzca6
    D77w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794987705;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=iHrippdR706dEsbKJ6HBFT2o15z011ikCp/nGo385C0=;
    b=3OBiX9hGFF3NX8AIXF4a8KyjD3E84ateFegAZtE7MFrxJrzpQPh9H1Phv4JCmlGSeU
    jrlYk6/b117DlRWmq3DQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2Jpcm8iNZLZ2IBizV+3wFb55dglUeZzcEX9J"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AI7fiaVc
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Nov 2026 08:41:44 +0100 (CET)
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
Subject: [PATCH v3 6/7] pinctrl: ingenic: Handle X2600 Port E Schmitt trigger
Date: Wed, 18 Nov 2026 08:41:40 +0100
Message-ID: <72b70c8ca88dd0e0e2c6f637627addca4ebc4e49.1794987700.git.hns@goldelico.com>
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

Port E has two Schmitt trigger configuration bits per pin.
Select the lower-hysteresis mode when enabling and read both bits
to report firmware-initialized settings.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 05ef31604dc58..0491b135c1d11 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -69,6 +69,7 @@
 #define X2000_GPIO_PEPD				0x90
 #define X2000_GPIO_SR				0xd0
 #define X2000_GPIO_SMT				0xe0
+#define X2600_GPIO_SMT1				0x100
 
 #define X2600_GPIO_SHADOW_OFFSET		0x800
 #define X2600_GPIO_PAGLD			(X2600_GPIO_SHADOW_OFFSET + 0xf0)
@@ -4702,6 +4703,10 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 			return -EINVAL;
 
 		arg = !!ingenic_get_pin_config(jzpc, pin, reg);
+		if (is_soc(jzpc, ID_X2600) &&
+		    pin / PINS_PER_GPIO_CHIP == 4)
+			arg |= !!ingenic_get_pin_config(jzpc, pin,
+						X2600_GPIO_SMT1);
 		break;
 
 	case PIN_CONFIG_SLEW_RATE:
@@ -4776,6 +4781,11 @@ static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
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

