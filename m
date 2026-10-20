Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501231;
	b=IHTmUggMhgZQ3O/0vASKy4ZPENcLfslq6io0/9FcoBK8V2ZjzyO+i2dEblrh+HuxwSuN
	 lDx0psHWgGJeVMJSaDSd00fswMLbwKgb8Va8T4l7vCN+Ji5cgzfTNuwrxz5VXrI1wNjs+
	 VJNp1PQ3mzJOlo0Uuo0zwJ1lVS8lURWhyyqstTOyFwm1dkoxisRBoqccoktXgV130dLfs
	 EpxSSVgkbbRaeZPqkkS9LgpnUFlFtkMNcUYdo0nnI/YDyRwTJ3gs3YAgmS45GKXPsTjjX
	 O9rc6VQvI9y2t4rDzR4vrnH3KRYWVfXycxUv+ysTPZOaPMP70gFe+KIa/YHCY/Kgv9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gDnFObZ0K2X9/qO2ilzZd80c6UZ6TUK8OX6LvufmLAA=;
	b=NVR0lF00laMpjuFsBrlNX0XVS6W8NDQQQLTEccShVWEkA7GBTCEES0U/h7qfc+zYehOY
	 65B9sEd0fEPhrrFxO0LZQM3Emo2AUZh+w0m33o86OHGyo8XX8JNumLIXd5TtbK7mE0UbH
	 bB2ydabb43qJ8/jsKVuVvIXNlUWwm50zO3H4CyAlyfzUO9BkDjDgg3KjLmB6HO4WP8+ns
	 xc2wyApa9J6Qo9+jyOvc46V2qPFIhrqnnk1ycUnMpwyV13EOOjrCT27W+OUOrrqFOL5iG
	 T+2qSirx0h6UYTUxMgRLyMbjdVVLxcdchJe2O0M8TMjLJ1h+zEavnESLqcu+v6gS4Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="p4l/8DF9";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3D860A4AE2
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE3D860A4AE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p4l/8DF9
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1935195f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501228; x=1793106028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDnFObZ0K2X9/qO2ilzZd80c6UZ6TUK8OX6LvufmLAA=;
        b=p4l/8DF9+/kYzcvHQwOneewQdIXFBAmaAIofNK4rYogA0p6b2j/4k28KAy04iAOQ+v
         Q8+DfkO/hKDcSxybfRIB/8oGAkscX0EMrg0N1JIRBHIhmHjDxc7gpzxJvNaM7uamfipj
         FQbgA11uYbN+ERU4IiiyOgZhWX6v7sRYJZBzWkuMK2EVtHtek6ObeuyA0FbWaUBVRg2i
         iOaFZ3M+c9VQuy1OxKyUIP/kjUGSLEheSnAiCfnKqofRPPslBWn1sMhSPAK3c+dq4AQf
         5Aer6fU9gvSOdpYJw408drds4U9ySb6zuO/55i8bNFqdGjukPkM0kDIdyU0IuHXi5plR
         W0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501228; x=1793106028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gDnFObZ0K2X9/qO2ilzZd80c6UZ6TUK8OX6LvufmLAA=;
        b=zu/z9QUC6g1/N5E+Os9OzAaP+xEa9K3ROI28smflCGk2kaiIKCQKTZljFigXooPc58
         Pi/Uk0W5WwdlpR2FrGwPzXFQI7lt6Tpe8XOgcO27ZwbA6KhPsS+UPTJe9HgcBeoDFgDY
         SvVof7+xO8n9TwwNfP4kUOmTN1qT1dGpHCGGEmXSeGTtVcy6rJFMuw9/wI5RHdV+xuqB
         HxD0nasfMTU12Xcze6bLawlxjq1YrS5c8I0w5B+OC0gltr/RxhlYRk3Shsf/p0GzSkr1
         jOsclrYVLlI2lGyhZFwNAYgdxyK1tbXcPNnTZzAgF5hJqQIVsezQw5XJUhAh5atdQXD2
         EizA==
X-Forwarded-Encrypted: i=1; AKwUvBxxUnONw/FkthGXtFdtQiou6SrCDNZdZm67Y2fnX7wkZ7V9jNzVYqolHnbG572/wsjd3WeQO1JojAMV@vger.kernel.org
X-Gm-Message-State: AFq9FYJPceD13/Ps/L7nRd1L9kFxUnG+fqRwfd+KN5TUA20020gFP0Ow
	ewn5xDi+SOF0Mg28hHrkkNf9SN7LEWEmo2gaqgOQ5JNg8DGsjXANDlqQ
X-Gm-Gg: AYBFou3AjskBlKHW8Hgr8NqHmdZb/NqtaS8K/C8igv3oYLpYzBw5A+u+ib952Qa82Qi
	orLCXpYA1/ngmYCfkXGJQuL4r6XUBw0Wte1mCKXuf5ggqyeYLtEV1AYTK1POq3HXQn0vnF94XgA
	RfhHVvWQy5gfgGUMufm9RXi82qZ7a+R6TT3oJjiShkytVZfRuqS9+Gbt4ZkAgOrJ3Pme2YXzxK6
	GnmRaYYUEh/NJAiuz8UCcZLWsVpTHdmz3zppqAcR/TRso0vq4KkVnEumKYto8fvRYs8D0rKUjwt
	lh/0SArer8ilm2i82zPMyB3py0ieyDPrzTt+2n3/jV8T2aeqD7AZXEoSCMfx7ONbOP5sHCkGODo
	5vNZm/fUkCuKTlKQw4I9PAcDcp+6iBRmCO/rsKweAUtPYrcsF9b1wRYlT1nTwBu5pH4XhKD9eyg
	uk8IgSYFwSbNfovWC9RO5wpzpLsBkheXxa52AkdsR4Ote8kIbACyj6tNDuIbjv4abm4y0L/LSn2
	DUsUI100DjcLBHlfgOCCWw5zqHgW7Id7H5f29PGccmILCZkRa8SnL2UIq0SuKUZBrCJTEWeOA==
X-Received: by 2002:a05:6000:4205:b0:48e:dee:52bc with SMTP id ffacd0b85a97d-48e0dee52f0mr18975446f8f.0.1792501227440;
        Tue, 20 Oct 2026 06:00:27 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:27 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:18 +0200
Subject: [PATCH v3 7/8] of: property: fw_devlink: Follow clock nexus maps
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
Message-Id: <20261020-fw-devlink-nexus-ready-v3-7-fd6f1c17e16d@toradex.com>
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
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Clock consumers use of_parse_phandle_with_args_map() to resolve
specifiers through clock-map properties. fw_devlink instead parses the
clocks property as a direct phandle reference, so it records the nexus
node as the supplier rather than the mapped clock provider.

A nexus is a translation node, not the clock provider, and need not be
populated as a device. The resulting fwnode link can therefore remain
unresolved and indefinitely defer the consumer while
device_links_check_suppliers() waits for the nexus.

Use the map-aware parser for clocks so fw_devlink resolves the same
provider as the clock consumer API. Direct clock references continue to
work because the map-aware parser returns the original provider when no
clock-map property is present.

Fixes: aacc54c67869 ("clk: Add support for clock nexus dt bindings")
Link: https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
aacc54c67869 ("clk: Add support for clock nexus dt bindings") has been
in clk-next and linux-next with the same hash since next-20260907. There
is no build-time dependency on it, but this patch should not reach
mainline before it.
---
 drivers/of/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 53301cdac6a9..2388d607136f 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1422,7 +1422,7 @@ struct supplier_bindings {
 	u8 fwlink_flags;
 };
 
-DEFINE_SIMPLE_PROP(clocks, "clocks", "#clock-cells")
+DEFINE_SIMPLE_NEXUS_PROP(clocks, "clocks", "clock")
 DEFINE_SIMPLE_PROP(interconnects, "interconnects", "#interconnect-cells")
 DEFINE_SIMPLE_PROP(iommus, "iommus", "#iommu-cells")
 DEFINE_SIMPLE_PROP(mboxes, "mboxes", "#mbox-cells")

-- 
2.43.0

