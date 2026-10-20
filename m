Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501227;
	b=Va0eo8he4EIPCteKKXrQa4CJH44uCFFAwQ0h1LEZ5JFyh0kXyQZfYXJNCv60r44y6VOS
	 9rtQ27VmBjjon8Tg7aJR4qfKr4oWTDgVQsXK5iw3rOUJ9qqGkSK0/ChUvYMrL401901tC
	 oIl/SZ1wmrbthSJEJYMyEMl3A+UPwNjuWg+4ckiqh0581tp8c0bJl5t4Jv8K+SMMhV2oB
	 yEi07RhqfXdk4IhBM0bbXXh4sheVZYynUlaV1WRaza6B4M4mEigg3SY9h9oILuo32T2gr
	 xo//0cQvuYsieyj9f3ICjOar9fM+CpUvyOP5dXWVKvwBDTwGzBHO3NnmEZqlxyUsgIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=QCVq48Hz4LWuB9OejIcWVFo10GsQgpT90RAtohh2YF8=;
	b=wqImej+hAQQZo1EssFfrtsl/gb3iq5IFLXtgg+lyhICieFFxX5MnoAbi6Y1dDlvJU30m
	 aEfIoQW1qEzu4yIkYUz6x4N6jGBkqQ1ALsmLLKlxbVs1446pfJUE55wpPaJr0QZ+DYaYz
	 ql83ZmhleUX2gIiGbRON0Wq7pjqe8UGIfgqNtW2CuK2BCTZ7l7r1EYM3IyRxVlVwT2Tdz
	 Ime3gooHDZR3SFwQwTVbYwEyJqvByixK0EN4s+vygdJaDom2HTr+WN7chenXvZ3NM4RkJ
	 KJ/s0oTdBBDqKQPkfJODqt6nYtE5TtcgeUXjYOPjjXddH1+UI/SwR6kKM370SiU9Pxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ou3lAhYX;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FC660A3835
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3FC660A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ou3lAhYX
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso4891125e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501225; x=1793106025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCVq48Hz4LWuB9OejIcWVFo10GsQgpT90RAtohh2YF8=;
        b=ou3lAhYXfr1/j4oQcWn4lcxmFC2fRwECqiBFa15n/+ItE2kULX3IyewYF4VAU/XBNa
         agICyytnveBnQdZlLGNxF+mAP9Dvdw1PLZbMOcxWTfx6p55vqzBSx4TwBEMz+ucjNqRP
         rtEamXPCpH9Fbrsl6t1cr0wDEfT+lzhDKSKaeVQFjXO/7tJEkVW/7pzKJkzCeYoEVogI
         9OYBe7le3Qw8uPChl5GbrmO+7F8/wn1O11gANpi2Q84ck3Kca9n4vQqtAXwcC3/9lEOy
         Uazm3kSlfM8OR0ymWeowO8VC4lNoqtWbjSFRc32wEMm8dtcfQeX1tLpebvBscyR8zipQ
         BABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501225; x=1793106025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCVq48Hz4LWuB9OejIcWVFo10GsQgpT90RAtohh2YF8=;
        b=L+iK/hAxr6TlD/IpM4RVYhL4AqVZhsuoWPyCG5TybS3YwdshAi6Bmj8+WEnJvdHZjw
         AlD1GyYAhv6ksrswhOTKWl30CwAWtl2IdrIwZiVzdxM/GN/S772KMPzXpQ8H4FU5ZmlH
         pucwctP6OkjVzRF4rTY9IPAZ2Hm4DrLxVpecvi65O/u/hUNZNVm4pi83iAUo+3PBBx0X
         gwktm4W+jBYBIzWu5RGTYWzoWWoykm2wSxqhxZzEePFMiOh3yfS22cs8d629M9NMjNdU
         ElpwUIEXYE6AMOlbeA479OZBkhl0nJ2D/982mKwFxgfZNtUeq/AE1vj/UhNTQkQaDAwa
         SU8A==
X-Forwarded-Encrypted: i=1; AKwUvBzQQTAaKBIdc/VgyJu/wjOgHoRHkxHZDXq2fpV5WzwAL04SDuDCqraG0QYbP81iCShK0fczrp3q8vxo@vger.kernel.org
X-Gm-Message-State: AFq9FYLkGvkVwkdkGMCmiOkYsg+/4TSb6tEIuVaDUGH3meDBh2NTfzgr
	OL/SM0PoMdfhfj/pTENXPqbAi7/anZlXwrAwXJl/dDqCE4YQ1eC3bLaI
X-Gm-Gg: AYBFou3yHrZaxi7qjo6KAuwV6CXT1/tSQ5s5+PSj4octvr3NX82IRutjBM8/ciAKytf
	6Nol9odYiyK6mC/aCu9SLYDZU51J3/HfregenT5eqAJO7l1iowwyVAy9XqhBTwfokPZEOjwVr1z
	mxBn/nopUc7h7jtAct9uw25N6ptbQtnAEXdAErNPNZFJNMrCvj6RfpEpg/bAiakBE1VcY69/znx
	G2YP+A4UO9eNKxYusJykvCfR4lzlTmE6ElIaYU4DoSuTKTauwPUZHPH6D9DJJxryNXG+cstxjwN
	R74WHi7t0M1dR15gZ0J6IXcYR/hxiZE40K2NxpK7YS65CmVuxQAoZ4n0Bi1kMtzAUABFJYn8ciX
	/GmtypawrzL8Zp7iWg3V5KkwjyP9LEKKI0gs7TX61bruiR8c6IV+rXR7elcHvS0mumnqZRAIKKL
	/nc4PxejoixElv9VbDnflHvjqISfAVH0l6eB1hPUynriw5sqGnora9USgMYtVxULUmconbcG0sI
	ya42KYpQJsrtOMFCisPYYCL/OEtVYtK3XLCeGelGTLKq7hkjctmGdAflwTLov9FP+2bFF/17OE=
X-Received: by 2002:a05:600c:255:b0:4a1:e478:7878 with SMTP id 5b1f17b1804b1-4a1fa092b29mr12610135e9.18.1792501224980;
        Tue, 20 Oct 2026 06:00:24 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:24 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:16 +0200
Subject: [PATCH v3 5/8] of: property: fw_devlink: Follow PWM nexus maps
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-fw-devlink-nexus-ready-v3-5-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

PWM consumers use of_parse_phandle_with_args_map() to resolve specifiers
through pwm-map properties. fw_devlink instead parses the pwms property
as a direct phandle reference, so it records the nexus node as the
supplier rather than the mapped PWM provider.

A nexus is a translation node, not the PWM provider, and need not be
populated as a device. The resulting fwnode link can therefore remain
unresolved and indefinitely defer the consumer while
device_links_check_suppliers() waits for the nexus.

Use the map-aware parser for pwms so fw_devlink resolves the same
provider as the PWM consumer API. Direct PWM references continue to work
because the map-aware parser returns the original provider when no
pwm-map property is present.

Fixes: e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings")
Reported-by: Leonardo Costa <leonardo.costa@toradex.com>
Link: https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf/
Tested-by: Leonardo Costa <leonardo.costa@toradex.com>
Cc: stable@vger.kernel.org
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/property.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 99381c07848d..53301cdac6a9 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1331,6 +1331,15 @@ static struct device_node *parse_##fname(struct device_node *np,	  \
 	return parse_prop_cells(np, prop_name, index, name, cells);	  \
 }
 
+#define DEFINE_SIMPLE_NEXUS_PROP(fname, name, stem)			  \
+static struct device_node *parse_##fname(struct device_node *np,	  \
+					const char *prop_name, int index) \
+{									  \
+	if (strcmp(prop_name, name))					  \
+		return NULL;						  \
+	return parse_nexus_prop(np, prop_name, index, stem);		  \
+}
+
 /**
  * parse_suffix_prop_cells - Suffix property parsing function for suppliers
  *
@@ -1426,7 +1435,7 @@ DEFINE_SIMPLE_PROP(extcon, "extcon", NULL)
 DEFINE_SIMPLE_PROP(nvmem_cells, "nvmem-cells", "#nvmem-cell-cells")
 DEFINE_SIMPLE_PROP(phys, "phys", "#phy-cells")
 DEFINE_SIMPLE_PROP(wakeup_parent, "wakeup-parent", NULL)
-DEFINE_SIMPLE_PROP(pwms, "pwms", "#pwm-cells")
+DEFINE_SIMPLE_NEXUS_PROP(pwms, "pwms", "pwm")
 DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
 DEFINE_SIMPLE_PROP(leds, "leds", NULL)
 DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)

-- 
2.43.0

