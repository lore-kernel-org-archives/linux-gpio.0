Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447293;
	b=O5sVLu1xN4Yd1dF99jmZSsx8JnmZk/ID/f73BqVG1znSUGy7MbLx5WajUTylz1gVTn70
	 8iFOwjyQ0sOHHePZ4edWgtOj+vphRwH8fo31wPgol6kbw+X3z/OB+JSkksFtFLQvKB950
	 IgvKdhBPbqzsI4KCcl5QezdthWzzGUP9PgR3D6/u0IGeDBbdl8vyY7SBPTEdWBAgxSrXH
	 dQ8yoWEzRjXcrqNDHcy3FyQYa5p4eFvSTvaaz6W11NAoWEcfNgVY/d4TcYPezuxyV9hWx
	 mk/kfENRmDyfEmysbcVl1qN7oodCLwqpN6O+wI7fi2t8uJR3L9Z90+5cPF7BZdxnPJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=v0mLXkSc8oXvNntVTksK1Jt854YRTKZVnh554yKeFIk=;
	b=nXD8u7fEnRGGmbVqhNepA1XaC/9hS5WtqEDiEh8apCRL3A8cUe21CQxXGilQOOglubAC
	 gTi8+nzbFkU/+EJT3TWt/+pjhoLgUzJj353Swt/h0kOFbIRnzQ7ESR9tGvEQV2KWJMnX/
	 F6Q9xMp+znnJ633difYlV5DzUAgRWunvt2fN7752pL6A9YT0UabOIfrG4m22CEkDxX64N
	 pOMqy4CLDQnbDpK76wwV0CtnzkfWcj86NfthmIL7HAa4kRmVg24QKSsmy3vsoRIWGdzAR
	 F4d9zMS1UvvgXUe7It4//GEOT5onmDlnwLN543YfZiSbyvRP6hI1ARUoof6saKPYdwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K8Hh2hKI;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C5C606A338
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50C5C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K8Hh2hKI
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50933bdf4bso714822866b.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447292; x=1796052092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0mLXkSc8oXvNntVTksK1Jt854YRTKZVnh554yKeFIk=;
        b=K8Hh2hKI+q9qtoFkFiwwkPbDWbfiIH+6O0ziMm/VuQLybG4goxo6XGBsq9EjVm/Mvl
         3bwj4U3lqM27HDzy9c4dZj5HHIk/YeJvBxCu39C77lukSPxVzc25JoGnCuWCmNQFkiHO
         0ufA5U0Br66Ac16cthppU9aZ7QDKal13zgvBPa5pFe9qCocMXUi0WVFzxDq8IT3UaX24
         H3HHiTCKC3ELUMDOtda58vBqsTGdGFsHqQ8pw2TD0EttSkh1Y9DnptwJ/WOZ2kiCAqva
         mYPd7xMdurMblBQ3Ie4C48lAGmRDotf4e6+BKXuI1XPWhpgDYoKsnAsUtyiyFQdNj0pw
         CyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447292; x=1796052092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0mLXkSc8oXvNntVTksK1Jt854YRTKZVnh554yKeFIk=;
        b=r1ugr7s52OCpDWfbUA1E3/293FTUOfai7q+l57BgcXowuam5O6ndFwTS5LYTYmKwsu
         UA4rJNF5MH+hu4DEub/eXg7xP9eoB9UozqTGtLQyANYL69l9JdlliN9nawtX8LjRoBeX
         r+R5T+Ea9t6PnKWWENFgvaGhFGfjchc2lUC7VH5mA2Jyv6T+i+XjpS9S+Wsaph4UJwea
         HMzU7dyLNjURgFcozfXRfSTZQG0A89VLkp9fMg1SSbjCXN5ZGe1PDDnf7uInaXzR6/85
         c8mJykB0sJUx6yWwlvr6VCTu3pbSUpBNXarEn0yZgzozpTSk+J+/JgxxH2kKGO/QlmCn
         JUNw==
X-Forwarded-Encrypted: i=1; AL+hErGYg5a0oTyj2UFyp30QXa9Y6tPIqvuGKuKzY4WzbpHyPEfSF8nJTaxbjeQSCBsDS7st9nRfoUwpVSIA@vger.kernel.org
X-Gm-Message-State: APuU4Z+0+CmTRI/22cLpJnLI+zBCEZGODeHK+DJUxpepZSnjtrwjmuSu
	BAN36BUaRdF61Rm2OPBtcTeatL/z0vA+qxoUqRxRhevVqIUiMA+27Hg0wa+ffcU4LHw=
X-Gm-Gg: AZFdTZdnj5hH/HexUA903pmuA7FwcjSJG2AsrFuQrNSzJeARdRbDegGTfY8HI/3F3t/
	D+4a5Ii1LTrQMk8VIUrSNw8apcvAEQ810goqrDW9b6fkhV2HuX5wgqSxg2UE1buVvA/lgcMozjq
	evgckvrn/SSbBsZHjLpib8DTaa8pcApD61yD+uZOlLoJLhx0nL91s8LYdBhnm07muljdG4p80hQ
	0otZ5r0dVlcfI8u276sPGwLMab7r9GIj3V6VEP4hlxfwQ9N7l4zS/glt0OACnQhJXwrkxbR5II2
	O+lSvKCFtVm930GrZPlWqmOluK2uv0b+q0bijQq8BzNvIjzoCMZdJQ1n92mRwb5n9+VYKjA3wS9
	TA6EX+YyKqhtaky7Uia6NnhdPa3xyfnG1BVpX2Nf8Y7LEwnEnYefxcKh+GqCUWlXsSlBVCFBkfo
	Ma2kSgPkkFn02nqwI1Y1w2vWH/fiq8rQInGF2t3obP3v5z1gl0tFEfrNoESM53DzEXV8Z39L+hV
	ve9MOaltcJRADWK5LwULxzX3TD6USZFXNyomA6gT07LWA0wqzfnwikTsuDu1UUJctD6OwwGyiUs
	WOoRNLCzVfJVr4mrirOa09wWKxM++rB0TXGmNwu0FhvH17FGgvY=
X-Received: by 2002:a17:907:3d4e:b0:c4c:e91f:e1db with SMTP id a640c23a62f3a-c51319a7850mr1124091666b.25.1795447291740;
        Mon, 23 Nov 2026 07:21:31 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm22628600f8f.42.2026.11.23.07.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:31 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:24 +0100
Subject: [PATCH v3 02/10] pinctrl: scmi: refuse an inexact drive strength
 in milliamperes
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-2-d61f039be008@baylibre.com>
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
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.17-dev

A get of PIN_CONFIG_DRIVE_STRENGTH truncated a value that is not a whole
milliampere, and a set did not check the conversion to microamperes for
an overflow.
Return -EINVAL in both cases instead of truncating or wrapping.
PIN_CONFIG_DRIVE_STRENGTH_UA still reads the exact value.

Fixes: cc2f90768e97 ("pinctrl: scmi: send the drive strength in microamperes")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com/
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index b088a24e4ec0..23287c3add35 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -179,8 +180,11 @@ static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 *va
 	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
 		return -EINVAL;
 
-	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+	if (param == PIN_CONFIG_DRIVE_STRENGTH) {
+		if (*value % MILLI)
+			return -EINVAL;
 		*value /= MILLI;
+	}
 
 	return 0;
 }
@@ -223,8 +227,10 @@ static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 	if (pinctrl_scmi_pinconf_arg_ignored(param))
 		*arg = 1;
 
-	if (param == PIN_CONFIG_DRIVE_STRENGTH)
-		*arg *= MILLI;
+	if (param == PIN_CONFIG_DRIVE_STRENGTH) {
+		if (check_mul_overflow(*arg, MILLI, arg))
+			return -EINVAL;
+	}
 
 	return pinctrl_scmi_map_pinconf_type(param, type);
 }

-- 
2.56.1

