Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616315;
	b=L6x2EJ4j36nqAYCCP7gRp6F15QHFTSSAPl71xGYmpbYUNLx3PcxCFsjh2lzwBNQmEX7q
	 BmXfPxontNec+muSk9Q67Mu8wPOvKjAabuUZ6UPGz7kQMwAyXdePt13uyVueHofkamKZA
	 /KdDAzvoCzwLgOyvd2RJiSSqHUnwTfjpeCUtrHYb17VUgU3pAYfA7JbIjhv/xrBBmHd++
	 YWo4bNU/CJpTh766Ud5Gaqa3F045sdCUD4REp96gZaHFD3w8Mi7JxOxJ6z5enhIxaQ6gF
	 x1QdrLllmzktP3BE97sY3yX/j9oOOJyIcnU1LaxREUgk4H0Jo6udvzuyjG8xV9lfCuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=B14YIwzQj4vDx9qqNqeB3s7xtGauzc15dvusC2lDAYc=;
	b=lq0gUmRnc2CcH4+HydeGhyz9Qw8hALX/cyMmc/uyJrhqpKL9H0SFpl9xlQK6H0+a9TM2
	 4Lj9LEG4KingPJ6pC7hOn0CpThFOjjeAfmSqwCptWA0fZGfYtW5+tyUG7KeQ0LIbI07Ep
	 yO1MuPu/o0lg4odGU2XSzGt3FBJhuAqB6EY+3Rm11vWttkFumlFfqfI3rExW4IjWekAs/
	 2QiwF0PKP1kvNEtnD6zg4ZvdAeL1DWcrJqG8OH0DDiE8jDqTCTyA21BsZXuKqRnUlyC57
	 TgVskD74OD5o5BNSLkFpbs6dGsPZnY3rjbrQUp+9cb8QXirX0Dh6Rj4X6xuGSjLPxrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TSy7Vyzj;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626D0606A323
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 14:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 626D0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TSy7Vyzj
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so5438541f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 06:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795616314; x=1796221114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B14YIwzQj4vDx9qqNqeB3s7xtGauzc15dvusC2lDAYc=;
        b=TSy7Vyzj+c+R8lZjCLwPIBq4Nzjavo8M9vRLirQDR48ceNNNVGwAVnDBze+8oJqrKo
         k43V8rpqp0t7cGwC828so5GxbQ4jdO9XHvG6etxEGfge1m4TPhurA6hHqM92RlLoMazD
         KhxUr8J5qLGNDfKTlXoWujbt6njAfWjfPQ0rezraFLIqR+qopDL4DSGB4tOuxHiBemUV
         TyvcXQFskia7SvGX/eo6yhhkqTgj6WHMz1p/uC8JpBGGIN+1h94NPOGwqR1omD93qvmg
         5epKK/JOlBnbfnTfwEyBiAqPuLBbTXpe0BlyM9oygrkasSPQ5095kmDzd79PB6DeD9N7
         m2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616314; x=1796221114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B14YIwzQj4vDx9qqNqeB3s7xtGauzc15dvusC2lDAYc=;
        b=Q2iMUtS4P/6FBP97KJGbCYOPekayLxBTVKaAjmfVMrNe4PYA3EY9gDY1ZMBj2+aehR
         PpBDghnrvewis+y/l3X4yGaNKFQZXauKtu19KPLn00Hzi7BUVxu0Pb5P1C2OvOhFmFOJ
         +cyUG9if0AYDIvjkTUovizkAKksP3wniJSaE4uhXk/tg4EUUykEF3KvCHqYaLRA/mfpR
         Xn5BdtsrQkMhRu0z58SfXR2dRG1yvYy0EQTOXSKEgmKVGoKG4Pg7Th3IARvgJP5VSgpY
         hvKa4WY8nASo5HQ0yB91la0t4dUS/KbC5CAAzyP8Vh+MvL0riaE6TuVFO9sssZ6qvJ2U
         7SuA==
X-Gm-Message-State: APuU4Z+yUWcPZPJLpdVu03ROgWJXmJAGZZQbtqypxbY0Pvnks5OlG+Em
	KJ3zj87SLWUQ9ohOhOC6BD6+FYCEzaAll/y6lQMQAbfHsoV/2f/XSJj1sk3GW2NB3Is=
X-Gm-Gg: AZFdTZdiBAYRoTuuS8omDuSKkGNy80T5J3PQoVOe5Q2eEbxKhiBmv66peyI2GabWgtt
	wWFa1++xhCQPXn2JwQVOsOeK/T4r1u9uReKcfPKFk0iCBEEXV3C8g5CaNNW8agbTXUFV4WDRJa1
	qL4XgS440QN3DuYjPsN/8HPgPiM8j5oEEp/UvFAmXp4SNuwnLnxl1CDwBZaA3TUIZ3Jvqpwdmdx
	V/4ACoEwvmjGv+VOKz2WuIjuV8pf0J0SUi5y8iD5UFJmPLunNc+BYCU7B7bFqq7tS1o+c5PE0i1
	vxFEad0/8/mghQ5Gcq6vcvQtPRzL71wQd/baJowu6RI0ELmayuCglw8GapHlJR3cOqG7CuD8FH7
	1blKAsBjEHEqrsqaQqxeeUGjsSrG42nRd1TYOz98CSHEhne1bE5ndqv+ei2bPpLnGSrMrbEDrBT
	sKbjhN/PGNk7aRj7ZSHcP/W11FraVZElaE1mhcj3eEJDwg7enmlAfouBaN2cU2NnEAN0yBJAblU
	TJO8FX9NGMeEg7kt4+bQDWGoTzTB3gbxcy+kWked3+WhinfvesiuqJwlfmoUHrtGrM73xvSWlW1
	XRFm3MmOAbhBeroTHggEZfH35CcT
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr422155945e9.6.1795616313498;
        Wed, 25 Nov 2026 06:18:33 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm552250035e9.8.2026.11.25.06.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:18:33 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: rp1: Use ARRAY_SIZE() to compute group sizes
Date: Wed, 25 Nov 2026 15:22:30 +0100
Message-ID: <20261125142230.18076-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
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

Coccinelle reports:

  drivers/pinctrl/pinctrl-rp1.c:343:39-40: WARNING: Use ARRAY_SIZE
  drivers/pinctrl/pinctrl-rp1.c:444:33-34: WARNING: Use ARRAY_SIZE

PIN_ARRAY_SIZE() and GRP_ARRAY_SIZE() open-code the element count of a
compound literal as sizeof(array) / sizeof(element), duplicating the
element type from the corresponding PIN_ARRAY() and GRP_ARRAY() macros.

Use ARRAY_SIZE() on the PIN_ARRAY()/GRP_ARRAY() compound literals
instead, so the element type is no longer repeated and the array check
in ARRAY_SIZE() applies. Wrap the compound literals in parentheses so
they can be safely passed as macro arguments, and include
<linux/array_size.h> explicitly.

No functional change is expected.

Fixes: e3ce7b897388 ("pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/20261117140555.KfUW4BDK-lkp@intel.com/
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/pinctrl/pinctrl-rp1.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
index dd0e85c2ca33..da86bbc40f41 100644
--- a/drivers/pinctrl/pinctrl-rp1.c
+++ b/drivers/pinctrl/pinctrl-rp1.c
@@ -8,6 +8,7 @@
  * pinctrl-bcm2835.c, please see original file for copyright information
  */
 
+#include <linux/array_size.h>
 #include <linux/gpio/driver.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/pinconf.h>
@@ -338,9 +339,9 @@ static struct pinctrl_pin_desc rp1_gpio_pins[] = {
 };
 
 #define PIN_ARRAY(...) \
-	(const unsigned int []) {__VA_ARGS__}
+	((const unsigned int []) {__VA_ARGS__})
 #define PIN_ARRAY_SIZE(...) \
-	(sizeof((unsigned int[]) {__VA_ARGS__}) / sizeof(unsigned int))
+	ARRAY_SIZE(PIN_ARRAY(__VA_ARGS__))
 #define RP1_GROUP(name, ...) \
 	PINCTRL_PINGROUP(#name, PIN_ARRAY(__VA_ARGS__), \
 			 PIN_ARRAY_SIZE(__VA_ARGS__))
@@ -439,9 +440,9 @@ static const struct pingroup rp1_gpio_groups[] = {
 };
 
 #define GRP_ARRAY(...) \
-	(const char * []) {__VA_ARGS__}
+	((const char * []) {__VA_ARGS__})
 #define GRP_ARRAY_SIZE(...) \
-	(sizeof((char *[]) {__VA_ARGS__}) / sizeof(char *))
+	ARRAY_SIZE(GRP_ARRAY(__VA_ARGS__))
 #define RP1_FNC(f, ...) \
 	[func_##f] = PINCTRL_PINFUNCTION(#f, GRP_ARRAY(__VA_ARGS__), \
 					 GRP_ARRAY_SIZE(__VA_ARGS__))
-- 
2.51.0

