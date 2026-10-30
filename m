Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375923;
	b=z3af5UsahGsraZDBio397eLAf0UBQvCVqYU4l2uVTwBbTyoeoyd6uz7drrv79dKdsn8C
	 +9HkjjxdrZZbDrirfrzyULpeNUweo3TUfUw1nb7rtIHlymDNqyUxkKAHnIT/8DoMHBpoG
	 n461j8bu7w+4MrYB2JU8E6zZK6y+1qArlOaONybBKI29MnA4rUdfLup5bVjkz5NuNU1Pk
	 1T00ktO1D9x6NtPETmZh3cew0byYHUbhUFphqhJ/u+x4yTGZklNaOHApIG5A7NSEfWbfH
	 3aXna0X7HJ5o3r4bnUBhiJUO+zulOmOzpaFpF4dYvFQ44N3BbtFyXy09LZdCModMNZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LeFt7P1mVFRjUvJApqNjloRcS0qu8nw+PQFMs/A+hxo=;
	b=bMZFfSuOSfVsRbF5NuP2UvwZ/K/1/UOd8I9up9hABZLnP7PZ4PLxSOCJH9g2VDBdwRCU
	 AHOYnjbHrn2IuN2MNR9EDL1eO2ymgJ8CpaZ36w/L2Sr2ik9P7V/QUx0zTtMY4i16RD9Ez
	 J+c7chNa9F02mgLYGl1vSbRMnRdY5Lxucc8yxFLepc4kkM1qAHNDS+R7ycs/NKT42RGyO
	 OPq4LDjEE4pixUyxP0F9CBnrrqQ+A/YhTAVN9DyueBQTinnub0RzUQeU+ynywCS6IGoHC
	 gFJ85X5WbN7MJ7RUXnurJRBlz9wnFIPftAPGYeRTmxu6t4XZwR6ay11j3eJJ3aajnQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eQz3xZcO;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E208606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E208606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eQz3xZcO
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso6245585e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375921; x=1793980721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LeFt7P1mVFRjUvJApqNjloRcS0qu8nw+PQFMs/A+hxo=;
        b=eQz3xZcO8fhc80b9DM7dIQQPIRJUL4XPzLVpWMQiIlok8e6xOugHJep8E3TX6aFz6t
         Kr22/j0ACfLsAC2e3VQsItC9FP7zxT2UdGhgLrb3Mm8yjZ+hhEw7ZFxgft28wl7cAtE0
         U+MmKtgwF4OJdmXW+YyAJffKpXh7guCkYD9AqKT9wiJauIQuI1QnUVB5n6nUtnlhS41e
         wNCk2OeLPTw47q3fvByvzsUcziKHUSQMXbh7n/jZQ47WaIKOmHtfI31h2BsTkdMXKUjE
         HgZDGRsz8p+ty42QpR271uR8myGQddMWYuymIF+Ol3khVPOFwBtZUwXw5Y9joYnzJi4k
         9Bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375921; x=1793980721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LeFt7P1mVFRjUvJApqNjloRcS0qu8nw+PQFMs/A+hxo=;
        b=OZt3Wgp1Aq4et8qbxU4Fs0ksO43BWcqb6ZeeuqDF57dRu4BNO29hPOwl08h+EH4YlH
         D5og2RnwXB8i83YKPXjOZLUYU3ywIo1kTOktpWChqIQkGRWnjdeMFuPumvjAl4ibaUES
         I969Vd27LzEyycDnAsrP4y+3DvoEd9zWTLoSPdeZ9rG6STA08w6X+N/+Oh4wehOTn3ua
         6bFIrHNh8utTI6yT9lqpqalGS/2l3wJTzIleG0lXMQSPfgN4P1CX2WvHAH0jENSEr/0e
         eppOS+Dz7O3s3SZjcAtybfzrokDJoijLUUIJSCH169dy63vlEwovXcIExH2e3z2yRBIr
         x9ag==
X-Forwarded-Encrypted: i=1; AKwUvBwddnoQMkgSX9u9b9IICTja4c7t38VY2oS+i/vTYsyzg/vi0y7XhGJ0pzlWOxJQ+u54kKOB+3KH4JSv@vger.kernel.org
X-Gm-Message-State: AFq9FYKpxfDKNDCpvtyAa9ykAL5rKoEKQA6Rp0Y0/EihXNG/VIs/r3i2
	/i5BqGmqvUcr6P/1+/zbMZNxrFKs4RDI6/2jSCq38/dSjnXLsy4pgeRTEWt0EU2l4Ok=
X-Gm-Gg: AYBFou1ooEI9xbfI3bjj6BtzdkhPivQlduPihphQdlvFMsTcaWr/kiucFMxSwnXlKhz
	8tYCUwkRYj3ZsgQZJJY8Z8XR9eq/m/cusNanmdto2eJGXe+u6aznt3d6CyLAMKyULJ4DYcAG6+9
	YsoMjcaxCVTQwo1FBfYgDA6R9uf6HxsJxc4dTGCCnL66zxs/agczEZo9+Kl20QDg1nMrz2S3Lle
	T7sVc7ZGWq6J7Vw4C28KCopqBp8d7BnKUXJMTkTEHmSeD2/6aBdvmjZ3uV47FbQE6RjpKm205EG
	e47qMqbJr2GlB0XsB3sh9fJSuoeFtEBJ+4DwJcLG5YXpaSQ3dDTtUEdWahtO8I+/Dwj4YXyn0Sk
	8NI7JzIi4cF49SmkE+H5Iz4bz7NIOflgQL37k6GiiFOf6PqZtORUvFrZM3QLNExD1H5Gl0UnB4b
	56+FmDKgD/379PYv4K4f1eX1Iy5TRP9eDK7H8MGKGlRTtyWnJN4vHV2cxxB2BuWQNeEIevtY/7Z
	vHQMBnBkRBVOt3yvvfaOXNq9L+wloLSom1CwpC/4lnlNH7P+P7FbI2amSqmpkDr+bLSS+9P+IHL
	ZIm3Mh75XAnmvArbg8BOUhFnDUL2mROh3swuT8M5DRmcdUY5GrM=
X-Received: by 2002:a05:600c:8709:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4ac181e75b7mr66361365e9.31.1793375921690;
        Fri, 30 Oct 2026 08:58:41 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm3802033f8f.51.2026.10.30.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:41 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:38 +0100
Subject: [PATCH 07/11] pinctrl: scmi: give no groups to pin-only functions
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-7-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
driver registered them as groups. Register pin-only functions without
groups.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 355ad26cb215..1a14e254f011 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -443,6 +443,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
 	int ret;
@@ -455,13 +456,20 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 		if (ret)
 			return ret;
 
+		ret = pinctrl_ops->function_flags_get(pmx->ph, i, &pin_only,
+						      &gpio);
+		if (ret)
+			return ret;
+
 		ret = pinctrl_ops->function_groups_get(pmx->ph, i,
 						       &nr_groups,
 						       &group_ids);
 		if (ret)
 			return ret;
 
-		if (!nr_groups)
+		if (pin_only)
+			nr_groups = 0;
+		else if (!nr_groups)
 			dev_warn(pmx->dev,
 				 "Function %s contains no groups\n",
 				 fname);

-- 
2.56.0

