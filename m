Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567970;
	b=jnLmZ6tMF9W8baVjnpRXpzXKFiJhwZ+fZaLVqIC4k0zYeDM9tUkrGYpzmuFwFdjB//1B
	 70TuCfGsfhHSYs7ki7t+IU/I8NadcvD7yIX0klEb045jhtm1TfPCaTM0U4PGHXV/vQxMK
	 SvkLf8lTyuwgY+coDyMBP+h6sb1iXNvt/yg75Pmvk08gidM5TTK9XlLxR+vO885/jeboT
	 d6FEEKpxwj4/K+YDgrzP11VKDCcjl39fEIFddvQ73pjI0AS03rhyAkJD4SP1dJ6Gvw7Sw
	 PQBNXBrtaCrAwPr4HQCmdgdBekArczsCTUNUZBtbJu5N+xX1YYruATq+oPEpeM7RtWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=teRGzhM28TxtybZMIK8blfwTtPC/WbwQiaC+ARqgiLw=;
	b=SVA8CCP8mRvXnNkhpo7VtR66GhQkrTmjqDQuQ7aiy/rhdfIPU46Y0RtojoqCQ6ps3TMF
	 yaQdGggAZ3U/z1RK5Q3qRkuxO4HtHWRHNvE6PjpVmCj+Bz18vnmi/xScjRiexjef+6vrh
	 EkPyFAsvRuRzf8uzfNtvimeq2m+cdv+UvXduBZ+0KEWF8bWO9IeMXS/d4sp62u46DtbIU
	 Nwhgl7vmypirQdD9MEzejfJS005TEdyFFXgfcmguZWAMvbWFwww7HVQMEAHr/8/B/Occf
	 GoSaGdhRNHYCGCpIiZ0HC2qQ9i0fVMfEDI4BCvkY07P408qv5F2bzpU0m7ZmG/u3zpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K2jjVEB1;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A8560A6F6B
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 11:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A8560A6F6B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K2jjVEB1
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so8076855e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 03:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567968; x=1795172768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teRGzhM28TxtybZMIK8blfwTtPC/WbwQiaC+ARqgiLw=;
        b=K2jjVEB1mLJWjhTJpRB9psU19OPXBvnrKk5tE2lHWk07SqGFTGSWLuQDjNHgFC2o4H
         MSCmk2xHHOTTNcoXvRE8ji59y0bIPLjAR4m+woKr0THxz/JPrlxNgM3IRepJ4P904xCX
         9GdQT/Abq6hm1DkZc6VlrWXJYxQ3bnm6en2Gr5lQSi9j6s0K1Wbj2/B55OMWhs6MNKoV
         ZQy2M2mn83GnUjPD0TE7iBP1wQ1mnoLWlS78X2JU1CFTWQOwu3kN5FChNzifj3g7M+DB
         /sRLN1LU80u682yDaomImL82RdSPepEHe0Jwcm5glOp8PvmdehDBYBmHOn4If9troQfZ
         oRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567968; x=1795172768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=teRGzhM28TxtybZMIK8blfwTtPC/WbwQiaC+ARqgiLw=;
        b=W1xteaHX9veEcQsU4Fhtmh2G+aow9ihn0sypCm7U8XOwtkqlLlHa6XUG7+X6m20IpN
         K/kU6F3AzR/rdF2kw+sszd1TJjTAQvLCNHZIpb1/QZUxfsZY/RdGY4OKF1wJGGf+bPOC
         zHWLy0h1KATuoLMgXUdtoAcJTgrvdPDQeu3e3SRvRrk+srbzlSlMW2iRvyl1p/q2y5t+
         EuNTFJEYo4Erhyo7i0DiqkvE103ELLMIIVT6kH1ADgYXgse2ZK6A0LDtzXVzI98yUfvd
         Z3pyu6Q17UEbXO4TBnDm5B7gm+HnZJWha49ce55O7488ECxvyxiGfSVzSAP0Nr1pBMVR
         Y7hQ==
X-Forwarded-Encrypted: i=1; AL+hErEdcqGR6O/MeOdSP6ow/HSXLRm69n4xHWLX2UtVurpmo8trDh17KKw9LY7Ns8kyG1eq7kYn0396H+2m@vger.kernel.org
X-Gm-Message-State: APuU4Z+V29cEHIhUgctHiSJTPH270QNg/U4RtQQAB2FBfPsSodWIc1Cm
	+Vn9Q6TDE6oVFz4JObRn7Ih+76fE6HwkL5S/sHoh9Bs6GN1A7ImtyeY3GL3PtqSVHAw=
X-Gm-Gg: AYBFou0MLDIYMg4S4HuvfzmdKIKackAwuBgSaklMQnuq72Hz0k7Ilh3BpeB2oeijRLu
	5flk1+v+88VIZmXSXTICZHpF//5ATrqIJVJwylQ+lXSa2NyXM7Ra960Qd0pKMG/2CitvEI3ElO+
	XSSo00ZxA/zPfjWRVSyEdFjNRfeIYdOxsTPZl1JuAUEtzxa7iIIdS9MuY6aqUB0xBHKzgQBlCpU
	EuMH9jG3YKsgYM0R5Y4Sg8SiAPd7SAA4B/U4lbRYqOfcE2oyMPRq6zSKOQMfC1V5+LOOBQd2QJm
	KoGjLVjLvgXgOIH9blM7+gSJwwQ9zl3KZRK/VhIdRMWeeRS0HwmhFiN2MIrHRqn8f+TdP1Yoki2
	l+qs/lXguTVsEgCwaeipcUVERSVW/Ei+bt5lXRAe6AcRjS/+OldEKAtKKA6x4RKF8HsEQf1xEXb
	fuenglQteZobnNPIWYT2xc6ASwCcN1qLoyyPOfFqW6FfZj8sYismmf1uRHBDRe4jJoxlVf66fxL
	8qgVZuSjR/HVWwzm/dm/XZSLLv0KgjkM0790yP0cInh5Umh9grCjLwE6Gq85twO/zqOubm7Cwmu
	ViG78hUIOTFH0npJ1C+TO4i7z8KIMwFntbzZMAL9IM6B+lMzi0D8
X-Received: by 2002:a05:600c:8b16:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb5d382639mr6172105e9.12.1794567968130;
        Fri, 13 Nov 2026 03:06:08 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56fa1062sm29897185e9.5.2026.11.13.03.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:07 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:33 +0100
Subject: [PATCH v2 07/11] pinctrl: scmi: give no groups to pin-only
 functions
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-7-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
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
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index b088a24e4ec0..af9c9575d4f0 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -438,6 +438,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
 	int ret;
@@ -450,13 +451,19 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 		if (ret)
 			return ret;
 
+		ret = pinctrl_ops->function_flags_get(pmx->ph, i, &pin_only, &gpio);
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
2.56.1

