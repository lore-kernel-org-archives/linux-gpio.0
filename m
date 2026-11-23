Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447302;
	b=sLw3lqMpfx9eT3il99e18pxNGkVkw8qEQs0/vYvKwiKR5MolyUNpiqykEw0h7xUUdvQ7
	 98xIfosh/kDjUntVTdxoekOvSyQlo/xJ4qOPz2lretTibzGWdMYyMXRuZ5cUE9sTOYTRM
	 VQk15LxJ7ZKuDNNMEHWGUEp2pWrp2vPl5Ut8j9DlMG81pD/k7eqPXbhBAaOyvzUzT338k
	 SiOzmfUMwE+s9ny79Ds13mbGBSCD6gMQjj4aU8u9WoeOiH4cyKoAOLv5uRlVy859VzZgA
	 TFFjaqgp2+mMfUmSx2frLG1fj2j9VIWZGSvQl7evtTzpDivMbPrKsh6qKhfTUcneUrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kJxGN8j5p+C8+Eg72heXebT/KYzEG6NwxGdULWQFRpM=;
	b=HlsOTiSZSafjIwnTlNUhqCqnj0urLOi065H032bRH+GnX7I6PWeb6dhhRCM6rXaDY+3X
	 jTBBUlS1eWex/dOL250vcXcFfk/qZ+8w9CWGoJ4eIaMH15tL5uSimgtdbc7Eyzp3ttcx/
	 MzhZZf+PK0Jl/gwWIRSQt53RRDSEvGo6aMi0RuK59uzL+S0uQIUJAgDBVuoyAjY/Q+Yvl
	 8fnS0ctZADgsXuQ/kTgn7l+meURnhFzeu/VwdI9cb3RduDmFCpAx/uXs3A0Z/oJ5uw+lZ
	 vC442FWdBbrOCb/ZS69bhFK6Jauc7mYIUzdjQ4RRRw7DlPyNPcr6lauhXzF/TlinCMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CS02sU2T;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADBA606A6A7
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ADBA606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CS02sU2T
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2218638f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447297; x=1796052097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJxGN8j5p+C8+Eg72heXebT/KYzEG6NwxGdULWQFRpM=;
        b=CS02sU2T48ouIFEjHaR+piUhoPocCqtgzhnP7+Rn3Zeis3+2Np/FzAal1oPnvHoL/I
         /2rloZ/C9sR2G8k8tpRsjryOimYjiD48RS9InlSalSYXwoEkj7Zhq2giNRs05gX7e+U7
         +4oerdbLK1kgpv63JcaPwUFvYGPD0lvy8/HQ6ikdvcwdYqaFmhdBtTkyVWk0JY811gkz
         Nm/VsM0GxnqJkl2ywyXoZJJu4dh9ERVTZo/f/KCxZ6DeoY8ZkLKYuze2GDrPT6r5n4Yu
         ezJs/B8S1TeMj0xJ9taRfOA727n4fkw5NiKi90ZaySsTdAHZ6yXiBwdsPicqhmnhnQNe
         a4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447297; x=1796052097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJxGN8j5p+C8+Eg72heXebT/KYzEG6NwxGdULWQFRpM=;
        b=e69+b9aBdID7Ujm27SItJi7CV8tP4YMZvDruKmp8yL6V74hjEpxKVVAcJkzzloQsKn
         t9CqyXDFQhyZ0PWboG624nlPh1YAszXmV6mqI19xHNfC73UbyElJwYvgfNHI6fEcX1o4
         2vDb3MZRTigA4zTTWEweie/BFR/5klASVT31w2eTQ+7kfICXxxUTa5nYsymIeocPQmeO
         p2yXMId0BbM9aa4QM/sSG1dQHXt/IkpeDiMyHskxO11Ws4uNqiLONAU4ItE6SD9v+wiC
         NxGoQNSKL0mu/sXP28eMJSaavqxTNbe6ZazVEuV/vqiN2BXJkVi1/k6bZAF2s3XlRHXj
         cylg==
X-Forwarded-Encrypted: i=1; AL+hErHgJZRtD7mN2En9REwBHsJ+c6z77v5f4nGscS5pfcikYJCzZFWUnXj/CrdG/a/CveWKf4XhOeO4SKto@vger.kernel.org
X-Gm-Message-State: APuU4Z+ssiuZ7UlcsXhXzChiyiDM7iu+aR/TSW1uyX6f8tnd9Lh6zpHP
	f2ZI379TchWiTRCTC1j4SjTBbE+88TKfqvHxciIZiYvuCjZsJ1U8jgn1VNo87o9DnKA=
X-Gm-Gg: AZFdTZfZWz12IhDCzT2tyMJ3RRStJW4uH6F2YM/iCHOeGAZzvCMdqg0WQXv4Khmp8Ws
	d+7lR3RUoSmKOpiM5vl5u3vrCUG8NAAD6cRulXEUx6lWH2CGRmcx4m2nZwXy2lYLK5+3JasgN7o
	SiY824RhBLyq8owbE58CQLawzpirjhtBsYjAab2YqAiJL11MWO9f/DR2qQrXj2AD2Gylmh6j0h4
	YI81vKoafOv/hLord6uaz3PRRkRKlfckGtjwa8w1vSPtAHFf4v00PSMk30BGSqWdTy/b56oo+2E
	lg4glaC+LaWpXcmq/biikSbTBEOKgA/Wrb4SokE1bG4BtuZHFLxHoiuqmKaDNcIutmO9MAb9qjU
	6R93YdhMA/qrlx4CJPzZlQ+PshgbyQc8REnwt65rLOWlY6tc91JsvJmR03IDYwC5s0EQmq+1Pdz
	zg3ZMk3aGBfLXsMSD3W05tQYDz2zmLFlUXkSs27sVG9ulADPVEG/6mlu5+EOnui5gfIKV3893WF
	dGl+KG6ge2aw8TcqWboJ7q6p1RN6WLoIfCuFR3n1Eai3R1S45wevBmPu1u2UHSXAzGhHLlAibXE
	+SxNomzYuSRq2G2NSJSGgMU0wW7cjUr0el6BVkyv49xx2lqGMQk=
X-Received: by 2002:a05:600c:6749:b0:4bb:8508:7fb3 with SMTP id 5b1f17b1804b1-4bb8881c3b3mr226405515e9.11.1795447297388;
        Mon, 23 Nov 2026 07:21:37 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm666128495e9.4.2026.11.23.07.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:37 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:29 +0100
Subject: [PATCH v3 07/10] pinctrl: scmi: mark the GPIO functions
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-7-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev

Register the functions flagged as GPIO with PINFUNCTION_FLAG_GPIO.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index dc3282126d54..3965f920851b 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -444,6 +444,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	struct pinfunction func;
 	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
@@ -485,8 +486,12 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 				return ret;
 		}
 
-		ret = pinmux_generic_add_function(pmx->pctldev, fname, gnames,
-				  nr_groups, NULL);
+		if (gpio)
+			func = PINCTRL_GPIO_PINFUNCTION(fname, gnames, nr_groups);
+		else
+			func = PINCTRL_PINFUNCTION(fname, gnames, nr_groups);
+
+		ret = pinmux_generic_add_pinfunction(pmx->pctldev, &func, NULL);
 		if (ret < 0)
 			return ret;
 		if (ret != i) {

-- 
2.56.1

