Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501233;
	b=g6GEfrlbEdNI5UB1OfcENtT1ODA8uqEGzmk4Kf0i2pPEj/qQcVj2UtxZIOuZ7iM9tfWC
	 NdlzmTPhJN+ZZuAhA4SZpHq8645VYZYvfeZviPKItlqWG7sIGExfr95azhSiHekYnq2B0
	 Wb2C7n3McH2/SuhZTxKymNJlar3JnXOF59a6w3DR3qBvm4tMLVa3LODKuIbGUDpEkBnON
	 +Q9iNMxzsynO5UC+j0ZiNgchr5dDRTk5gJO6dppSdIDSQvL8uEaUPAvSSvg5nS+MLWw3N
	 vksFpKNFMn13B5FCeI1ibbE9yKtvqckWdqFifM3pO0vn21qMMyBwJpUYdhB7fnZFAXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=V5mXplAJ6XQpaLaAHpeez9TEYogaPUChaxNtZ24iXK0=;
	b=d0A66Jv97LjiOD+PqjRehoyUJ1xkMKYAHDIjXU6KFii3okofdesuJnxIe3D/0/ytdIGj
	 iJHAn10O0UGk+eTEE6rDHmL3w73BgXu26IKgRJU0Ucy7T5YVjyPfhG2q4N1/2zo2yo+si
	 H7McQrL49vqP6DQCqB4T+18SjMyfpefRs/WR55QkJV8byxB0jAykDur4a7cN4salwhV33
	 M6E8CDjV0ctGTWunro+t5OZwG7xddy9EF6iCxC+vfanrCFs2EixGgMBd6XobzaL0KEbcQ
	 lyS7PlKeszHAeVdEl/CU7z+1r0M73xu0jjcEseMrggvLv85r4mcIAv0W/v9C9Iy0mgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ecLSa4Oa;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28CD60A4AFC
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C28CD60A4AFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ecLSa4Oa
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b0584ad71so2339346f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501231; x=1793106031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V5mXplAJ6XQpaLaAHpeez9TEYogaPUChaxNtZ24iXK0=;
        b=ecLSa4OamAr1JXHnOVbC+LVGLjRHmAV5oQgnEndvWjkaIQemPKJRMOAcS1Dc/d3hIg
         beCl8Py+xnZ0AWDS/juvgzrRfx1cjCwOJrXwBpBUT6mnaGczVS9kPxNiayrdrswmRdCi
         IzdM7KTvmGYuFt7ylRcgODLLIFWn6YqVTxAPYE8r+BFkSYrMM9TBoqh8FIjzvigp5dng
         GS0L4w2pBBLKs3GZmHRz7vygWdyA4pG9O80y3YZIDmnb0ISvIiiAR7dAw7v+BKQWXldt
         W9WaeUxCQGjkEytozN1+6Ow4TGzPrbi51FyVqSmfWWy/UEgNdKulJZFowC3hzmn99Jtg
         YTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501231; x=1793106031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5mXplAJ6XQpaLaAHpeez9TEYogaPUChaxNtZ24iXK0=;
        b=D8k/W5D3Kd/7sljuOPsRy4fGsclGsscbGq0XwfQZm7sFWmZEfE39xS074kdixzGNK6
         9kqfI58k9K/u2r43sdFsaYRy7wR8DEM1v0Qo3ik1esX8psxN5e81d/IY34nSKiU0oNKV
         9Q7JijHB7luH97tAANI96069QKlgCM/ijPli0Y0hN3EMKEMDnAPFvuz89Sf20lmXS9IZ
         Y5BGbAWnuz87PW3O9B4GXa7jope5GtD5ajnTEm6yj/MDYqhRlYLRe1T+dTgQhADe8QGk
         8O/IyqGmSoDfeywNtRIPE2sWsu2qgGItmKg9dP5dz3D8AAOkn7n+FaFZYo6/Un3PJjYt
         GEQw==
X-Forwarded-Encrypted: i=1; AKwUvBy9ncpJGVQ8kM0SguSvU6kUAeEt68dMdaqb3iGYFZMHFOASU/IrWD2MNqin6Va6EUR0s2fbWW61y5sq@vger.kernel.org
X-Gm-Message-State: AFq9FYKDXVi8kmu6T9BXE6Cu+lYds4d7raGYFBmXtw+mSgFWq8Kx5uUt
	ZmksYrAh4bfGXWEDrHfdvBQO3He33io5BlVTXIqnYRaI6dVXhPyBRz/4
X-Gm-Gg: AYBFou3OUCE4SajMmyuYkwYmd6X7opsGCtdFW8T3Msf2G3fyhHFzCqZsWGg+dLCiAf4
	OxHTrprpQMVRyszbTozsawUD865eYPFLW3xhUJBVMxGvSh/kj6cSmUaBmXGP0NIdyh52/W5gynX
	EpN7plNb3wowkyHu7arlnWs+zPNu1tkoDOuCEPwNrs3dEhYnhEE8cd83/aOYTc+bTlzhPQ77PCg
	E9333TQepVhTc5ZjCEeQhYLg7KHMn6c8tz6Ux3rFmVKt39/XLZgWkbLBWuftzcmZBt1r0XKgK76
	ZBbgELTjz+5JeV359q8UQJkkrFNa6od/lnWsknYzoZR729upy18eZeV4mmo56YaDrQ6K9GX4jG5
	Ed5NPIin8Xo6xCf3NK3113zf9B+X1Kz8pQujhlxYEnKCLq2FOS2D0O+/gPM4WmuVbn7WpWAPEFQ
	VuwK0votnbp6IzTiqLty22+PZ1awrU/r9Diq+exw1zd5CWiNmsKdI3x/dNtoZ7KJFrM9TWoiLZM
	YHbd1ql62i9ykmyszT0ywGbhpiB9yF0etKVI9JYvETwkRIZUH9J9hU6tywfOjBFTe6EdinX/Q==
X-Received: by 2002:a05:6000:1050:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-48e07fa82f3mr15476118f8f.43.1792501230056;
        Tue, 20 Oct 2026 06:00:30 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:29 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:19 +0200
Subject: [PATCH v3 8/8] of: unittest: Test fw_devlink with clock nexus maps
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
Message-Id: <20261020-fw-devlink-nexus-ready-v3-8-fd6f1c17e16d@toradex.com>
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

Extend the fw_devlink OF unit tests with clock references routed through
a nexus map. Verify that the mapped consumer has exactly one link to the
final clock provider rather than to the nexus.

Also cover a direct clock reference to ensure that it continues to
resolve to the original provider when no map is present.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v3: Route clock-map entries to two providers, use a middle entry (Herve)
    No clock-map-mask: only clock-map applies to clocks (aacc54c67869)
v2: https://lore.kernel.org/r/20260910-fw-devlink-nexus-ready-v2-7-17ac82dbe226@toradex.com
---
 drivers/of/unittest-data/tests-phandle.dtsi | 20 ++++++++++++++++++++
 drivers/of/unittest.c                       |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/of/unittest-data/tests-phandle.dtsi b/drivers/of/unittest-data/tests-phandle.dtsi
index 1fd465bb8f79..8f86fcee4093 100644
--- a/drivers/of/unittest-data/tests-phandle.dtsi
+++ b/drivers/of/unittest-data/tests-phandle.dtsi
@@ -81,6 +81,14 @@ consumer-b {
 			};
 
 			fw-devlink-tests {
+				clock_provider_a: clock-controller-a {
+					#clock-cells = <1>;
+				};
+
+				clock_provider_b: clock-controller-b {
+					#clock-cells = <1>;
+				};
+
 				gpio_provider_a: gpio-controller-a {
 					#gpio-cells = <2>;
 				};
@@ -98,8 +106,12 @@ pwm_provider_b: pwm-controller-b {
 				};
 
 				fwdevlink_nexus: nexus {
+					#clock-cells = <1>;
 					#gpio-cells = <2>;
 					#pwm-cells = <2>;
+					clock-map = <1 &clock_provider_a 3>,
+						    <2 &clock_provider_b 5>,
+						    <3 &clock_provider_a 7>;
 					gpio-map = <1 0 &gpio_provider_a 3 0>,
 						   <2 0 &gpio_provider_b 5 0>,
 						   <3 0 &gpio_provider_a 7 0>;
@@ -112,6 +124,14 @@ fwdevlink_nexus: nexus {
 					pwm-map-pass-thru = <0 0xffffffff>;
 				};
 
+				clock-consumer {
+					clocks = <&fwdevlink_nexus 2>;
+				};
+
+				clock-direct-consumer {
+					clocks = <&clock_provider_a 1>;
+				};
+
 				gpio-compat-consumer {
 					gpios = <&fwdevlink_nexus 2 1>;
 				};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 320a992c4310..40d010c55b8f 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -765,6 +765,8 @@ static void __init of_unittest_fw_devlink(void)
 		const char *consumer;
 		const char *supplier;
 	} cases[] = {
+		{ "clock-consumer", "clock-controller-b" },
+		{ "clock-direct-consumer", "clock-controller-a" },
 		{ "gpio-compat-consumer", "gpio-controller-b" },
 		{ "gpio-compat-singular-consumer", "gpio-controller-b" },
 		{ "gpio-consumer", "gpio-controller-b" },

-- 
2.43.0

