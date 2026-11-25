Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.101
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795589414;
	b=ThULJImwc04PG50heFhKOc8s+mvrolUaqT4KhtgCuG0W7+PfCkCVmtyp5n5ZRq4BO2U0
	 s23d8TpykL5agcuWOWJ1ET5AKBUhR6YyXgPzpUdEL2K1Fu40bUc7HlJiAe2MPbATxUzCe
	 ykFWVCWKXg4krKnBIS5gxclY8C/iC+DX60BzQydFOHcFEoLfYpxlGqzU3NR9WKrbc7yUK
	 vMur7blp6y4Wq9pBypoQGLS8pCVJUzONQra8o6kGE8gDLhLGm5HM8UBNG+VCtwpraOpfA
	 BRqUpzk6Ip8gqYmgT85PVa7LCOjbcnmxilANVPlbpuCD/yMeotf4Cm1Oda4inklUaKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589414;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=rDjrk5FWLZNUHQGFSldHheblkShni+m1djRWcSfKrQo=;
	b=cZuY2Kq7Ujy5HNGYKwq9x3/IpIE690c3Cp6RAxq3v7anHURTaIks9zgB7YQ8QWKzrA3z
	 4nmzh0rMQFtKzqPNdTSzvOBN/9A+j6F30VrcoMV7cLye6ShemJ3s4tb891odg/weLU+qG
	 4FcERS81vWEK8690yY7jpiHW8A5NkjgkLWlxMVviWLM34sqC2F3YVXx/ILte/pnZUjccV
	 IvnIfLBG7ITFAKRv8qQxRkXzwuWHGNme3S9YmhYME/q+kv6FDMTMW+wcgRv+Mxv0p3soy
	 nEAxmcgYLeHOs0g4xTZBZMCaZCrdhZa+8bjHV0MO1wWPOaxpT0F2A4Nh5E4rOTrVPfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=XuG+34rt;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=VCxsLwu+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.101
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC449606A689;
	Wed, 25 Nov 2026 06:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC449606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=XuG+34rt;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=VCxsLwu+
ARC-Seal: i=1; a=rsa-sha256; t=1795589391; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=EGAFOFldMfzVrdJvylm8iBfuDPs3+jdWPMeaSVOq7PYRdp68FydqIxskZ9K0fzrzki
    qdhTD0EL0BocGwwp7YIYbmENOlANBPnDGQlbbx5KZEkQ59Sux8y/CpjgvInJh4zSpN3E
    ChUpC5KKivc2qOjUeUTW2maj/QYEkrTjywWIplD+Ecy6XmYYmrktrlvnnDwBNnmvcVnb
    jHR79XA4x20QaWMvMzU6RoRHSMMPWDK8gFggfXkqhtWkMf9vOxUPLNbTMhFTEHwjrFtF
    A5/pgUo25WINh+pwamOGhXcxV/jq4JL/5H8aapkMDVXO9mNIxpqk7d++h9pJmkfulnLc
    Ee4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795589391;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=rDjrk5FWLZNUHQGFSldHheblkShni+m1djRWcSfKrQo=;
    b=pHQav6iwcaws6FlA8jBqKSFWXig+HDUOqgohk8sXFIWv21AutuITC12qXi+Mx/ulIZ
    k4FGjXn3zfDFJ1/4y7rBVXEBh5AlQ2Xb93UY//QHLDtjjtLhN9id3BdePNG3wG7SMtF+
    Y9AJ2i78s43JKpcHMXZi3632j3BXsxAQGRB55hFTlQKw7kIQHgnYOM9xFIwlmW2pJvXk
    H/c57g5bL/+y8x75ei3nOcjrPyTPk3Y7dDae6+gauLkdBVdy2NZxlej1j500W/P9g87f
    8NyvOtBczL9iFVff67jK01IW2C3S6/RoZIvpaA+UGA6U3E5sPjN5Ju+v1U2BC+lV1j94
    cxnQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795589391;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=rDjrk5FWLZNUHQGFSldHheblkShni+m1djRWcSfKrQo=;
    b=XuG+34rtViTLItaREr3vvkrmZEr+9lF9UFTvpEjRBKBq8TG1kQT3Xa91Icru1AMdej
    6VwMh3PcUzihXKHk1Xtlt59Z80O+5kegtdj0Yn7xW/kw6YtczSaBWH9kc5v3iY6BjfPe
    e8uuUj/edQMIy3kZ+lXLZF2PN/SGvR6IxhpB260BVAVqXKEHp4snSdDqu+KPiMEgNSFK
    iY6Aas2enSB8na/Fpe1uw4NbGiLa17RD3wiw36HHegNfLDxPuvDktTahq9foeewZKRc+
    v7snzECi5xJ1aExk4i4wKnfV6v7XfXizks1/dHybBoYlS9Z12zcgZ2hPpg1/8YwpRyuT
    arAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795589391;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=rDjrk5FWLZNUHQGFSldHheblkShni+m1djRWcSfKrQo=;
    b=VCxsLwu+4qf4ijKl7LVCl/ITpCPIB/RxSu0e7JxAL7PXg34SAbBMrK/qHdy5Wsr30X
    3ACV/E370uLVz3mE37BQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS25oMlMiNMn5e/Npe6SVDIvzG+5uG4p/zkDZq"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AP6np5q1
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
Subject: [PATCH v5 6/7] pinctrl: ingenic: Handle X2600 Port E Schmitt trigger
Date: Wed, 25 Nov 2026 07:49:42 +0100
Message-ID: <ec49e1a7da313c8dfe012c17a04d03dc4167ee2a.1795589383.git.hns@goldelico.com>
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

Port E has two Schmitt trigger configuration bits per pin.
Select the lower-hysteresis mode when enabling and read both bits
to report firmware-initialized settings.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes V5:
    - Keep the ingenic_get_pin_config() call and the Port E
      condition on single lines, as suggested by Paul Cercueil.

 drivers/pinctrl/pinctrl-ingenic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 88531d472cd2e..d253674accacd 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -69,6 +69,7 @@
 #define X2000_GPIO_PEPD				0x90
 #define X2000_GPIO_SR				0xd0
 #define X2000_GPIO_SMT				0xe0
+#define X2600_GPIO_SMT1				0x100
 
 #define X2600_GPIO_SHADOW_OFFSET		0x800
 #define X2600_GPIO_PAGLD			(X2600_GPIO_SHADOW_OFFSET + 0xf0)
@@ -4693,6 +4694,8 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 			return -EINVAL;
 
 		arg = !!ingenic_get_pin_config(jzpc, pin, reg);
+		if (is_soc(jzpc, ID_X2600) && offt == 4)
+			arg |= !!ingenic_get_pin_config(jzpc, pin, X2600_GPIO_SMT1);
 		break;
 
 	case PIN_CONFIG_SLEW_RATE:
@@ -4767,6 +4770,10 @@ static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 static void ingenic_set_schmitt_trigger(struct ingenic_pinctrl *jzpc,
 		unsigned int pin, bool enable)
 {
+	/* Port E uses two bits; select the lower-hysteresis Schmitt mode. */
+	if (is_soc(jzpc, ID_X2600) && pin / PINS_PER_GPIO_CHIP == 4)
+		ingenic_config_pin(jzpc, pin, X2600_GPIO_SMT1, false);
+
 	if (is_soc_or_above(jzpc, ID_X2000))
 		ingenic_config_pin(jzpc, pin, X2000_GPIO_SMT, enable);
 	else
-- 
2.56.0

