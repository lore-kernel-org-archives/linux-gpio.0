Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEEB49CF35
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049823; cv=none; b=PjY3kRTiVzFTWbsR1VkPZsBDjDdcV6WpwE5dHq7330XAwI1OxSfRAphFRh0p4t9fQvRAgEbZ5lBvaTsKKgOfIP0t9OUHilNQKdiCnWTzqKexpB4zA5Ps41IDOdT2aMCT0CHysNDNjTFAsBc902pGslOgQcMw91YQF/R3/xX5A28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049823; c=relaxed/simple;
	bh=CjNNNaVv9KXfLBZwpOPF/OJsIKss3hZhjwJRSj/WrbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYb7arwBxFeOFkxw+rnyXiEFJqrmehh0/oqCsMnj3JDnDa/AsNsOk4/V+qX9WUQrCB8gi82QiTTYAK0STjkV+FqBr6ZVSEpOqw91wmA3wJI4wiHBi046VtZunptGJt+05FmvD+fXM+3+VsUtJ8916bgXdcMW/M+dtbmjQ0LVuRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzxWmu/b; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzxWmu/b"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so14972445e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 07:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049818; x=1789654618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZNv1IJHXjclUxxs9te9sqmzRhOxAa9ASWy+fWccWYN4=;
        b=gzxWmu/bwG7kMmhfPbwGcJVHzzupA/7iTAJIfVa2xLu11niHy2pEnDrCxxUeN9JOMB
         vYDd2jMfzCYv1sTvsle4+D4rRRq4DnOv6PrM2iO25Yh4amp6ZsRxxt4Jz5PSoKcisqmp
         jBsYnMuO0NFa/MNaIsRZhMR1V46RdIv2/i2Pl6yd6rtpWZ+iCnS3Mr2UrNtNJF32wYkr
         VtWGfsDVEuGurmtzKyVebwJ6YF+obp89tJ8KBcaDBX4Gp1ixkZBtNN4BphUlN6jhOG2L
         P8qasAhxCIsJsHNLFdZunbFaduagVFH9OWB26QggwmjtsyTCOJzuP/hCbknXgyyPjbm5
         QfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049818; x=1789654618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZNv1IJHXjclUxxs9te9sqmzRhOxAa9ASWy+fWccWYN4=;
        b=WoH5KcnV72S72w2H9UbueLOaCaljPElR9uMtz3PBi5574z5RjOAFuehggKcIBSGv++
         VQMx7NujG/hLZ2T6saJ3V7myxowuYWLUQDH7vPSmQY5DROWicUb5plEKddZuxDNS0QoV
         y6yrw2ipJ6EReW3J0P9PehB/eZeRSryMgQeeWGH/Mtu3lWu9Q02dB3STeHdnQrAUlNgz
         5uKNiV7oYZtua8Fh6sBFRcdvRu9KsSkIiYGIDLwMRGlDJs1hXloCvIUd0WEKJnGsnt8d
         KUEFuS2t02jSV949dXSBzmH2Xrpnjpg/J0r6yi8xKRBXk7va6r7+mhqoWtpj6f0A0NeC
         dB0w==
X-Forwarded-Encrypted: i=1; AKwUvBy4WXWdI3CDyOo1mUoYcZlYkbvMtJJ5gHOF+IgolimRShimIv/OtSDrPd4Cw5TaBNzK0VS11Mpxo99b@vger.kernel.org
X-Gm-Message-State: AFuF++ncuEas3J5h+O5f4F4Bmknpju7RApmjnuORCCX6cA2x/+lZ1Ddw
	Zky6Fm2uAHNmAnVYodKqIbFhhls5C52ozNsNQAwQY6XuTHR4HR9YscV+
X-Gm-Gg: AYBFou3tdDBxQTWXxCWk0mfNq4cEOPq59JK92b7IaFwO5EcvEtSRuJ2wHI1+ZAUDFep
	AB7Og/dx/ChuoQfQAowM55QyiAZdzY4Jx08Lr/kNbqBtlklJerrj3io7viDXZhvHT1CEhLKQmcl
	7aCGTY57le0BEh9tRyWYouOWbQkviP44Q+kpPMkPSsVzbehBWBjguYIJF9tAfqvd8Nz10Aomsq9
	8VI1yFRRXphoLAcSFIvm63OJJXSPsuX4gip5C6bPDERjbgzgRL2Lttk/eqohGZOCGIuzir3caGa
	Up/NtbnAPHIKz1GgSFMeTk7NgAqbqpwoogdqzWcrdWCPVR98UbiDFVQFVNuImMuQ2l2MFftFJJj
	o4c2w1SB0fUB3AYUqkQPusy1e8vJQAuHVBKlNSbNQcEgcW91iMiKv17eceNiEe17+gSm2oWWnfl
	ZIKXDv1OwjPwPQcg36g/AS7fqbtJ8SPgMKJkwNXCaMNX9wfdPZqffnLLsWFAUCJP1Ai2ea7wR+L
	kKA+trrzNCiCZE8MufgwxTno1t3saHGHqAAfvwp7IZWxb9YfUikELO9KZ080wKORBW5a5lY2Q==
X-Received: by 2002:a05:600c:4712:b0:49d:2705:7030 with SMTP id 5b1f17b1804b1-49d270571ecmr49038005e9.7.1789049818180;
        Thu, 10 Sep 2026 07:16:58 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm293895575e9.4.2026.09.10.07.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:16:57 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 16:16:48 +0200
Subject: [PATCH v2 7/7] of: unittest: Test fw_devlink with clock nexus maps
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fw-devlink-nexus-ready-v2-7-17ac82dbe226@toradex.com>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
In-Reply-To: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
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
 Leonardo Costa <leonardo.costa@toradex.com>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Extend the fw_devlink OF unit tests with clock references routed through
a nexus map. Verify that the mapped consumer has exactly one link to the
final clock provider rather than to the nexus.

Also cover a direct clock reference to ensure that it continues to
resolve to the original provider when no map is present.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/unittest-data/tests-phandle.dtsi | 14 ++++++++++++++
 drivers/of/unittest.c                       |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/of/unittest-data/tests-phandle.dtsi b/drivers/of/unittest-data/tests-phandle.dtsi
index eef966615b22..aaf0b871c01d 100644
--- a/drivers/of/unittest-data/tests-phandle.dtsi
+++ b/drivers/of/unittest-data/tests-phandle.dtsi
@@ -81,6 +81,10 @@ consumer-b {
 			};
 
 			fw-devlink-tests {
+				clock_provider: clock-controller {
+					#clock-cells = <1>;
+				};
+
 				gpio_provider: gpio-controller {
 					#gpio-cells = <2>;
 				};
@@ -90,8 +94,10 @@ pwm_provider: pwm-controller {
 				};
 
 				fwdevlink_nexus: nexus {
+					#clock-cells = <1>;
 					#gpio-cells = <2>;
 					#pwm-cells = <2>;
+					clock-map = <0 &clock_provider 1>;
 					gpio-map = <0 0 &gpio_provider 1 0>;
 					gpio-map-mask = <0xffffffff 0>;
 					gpio-map-pass-thru = <0 0xffffffff>;
@@ -100,6 +106,14 @@ fwdevlink_nexus: nexus {
 					pwm-map-pass-thru = <0 0xffffffff>;
 				};
 
+				clock-consumer {
+					clocks = <&fwdevlink_nexus 0>;
+				};
+
+				clock-direct-consumer {
+					clocks = <&clock_provider 1>;
+				};
+
 				gpio-compat-consumer {
 					gpios = <&fwdevlink_nexus 0 0>;
 				};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index b739a69997a9..2859a44c3fe5 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -765,6 +765,8 @@ static void __init of_unittest_fw_devlink(void)
 		const char *consumer;
 		const char *supplier;
 	} cases[] = {
+		{ "clock-consumer", "clock-controller" },
+		{ "clock-direct-consumer", "clock-controller" },
 		{ "gpio-compat-consumer", "gpio-controller" },
 		{ "gpio-compat-singular-consumer", "gpio-controller" },
 		{ "gpio-consumer", "gpio-controller" },

-- 
2.43.0

