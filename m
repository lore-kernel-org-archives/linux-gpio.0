Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501228;
	b=PuIovUi4jpCnLxNCdjA7dndXMH9XsTNX+zs+8fPkiIUuf9fQEl8Uy9w4sTfMlK9xLQmv
	 NrnzhsIeGoWRKSpvW+qXwjoQRXX/7RQ5JyCGo3I94TZ5t8eyvQGlWwyEOQzGWLtRWPuNA
	 posb6LiLzkMEuPr8FJTXI38LHV3JkrtsHi1o/GwJERPRdKxxCJCtYdS1lnTlNhEcnUUEc
	 IBSY6ZJ64H8hgMHXr8wf+fiYxGwQG91gKE35Uz4G6zqst6tnqY7s4Y1XVQTjGLzIR5RO+
	 7g8xk9j+VLuGaDCRVt9JjX1gFS9u7npz2W33JBj8QolX0Te8ITH2zPp+2lUNvo3UCiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ThcckzMwPNlQzjyX8+RLOp31Su+73AzB9RfMA4Z1d2Q=;
	b=4jEh+Fem+kYzas5LQO2ZM9Dt7gCecCtenUMr/qQI3Gkrmh+opPWhcWICNi5tmdCxjgUX
	 QP3LPW16KVTkkQ/lSAWiTNZPplDIR8VS7SmRy/he3PGpyYK1ZD/NEKus6+jG7EZzK/6qa
	 +qitleoVvwMGdEV5T+X2A0w11ZaZ4RU60v3i36fybFrdpQAb3g9CMxB15g0PZdIi/p0MW
	 t6DPSMG/tcCk8BiyWt8uCe+lD7Ww8gUNmoD/omS9yrmQmWMSSxoQRmpw266aMRjUv18wf
	 tcxA3JnbFjkgiiOl12X+fwQKZoStnKuO+lmq8gkZa/GIvY7APqfD8qppJFFHCCs3Q1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bkPIlHVk;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3A660A4ACE
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E3A660A4ACE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bkPIlHVk
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso22662135e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501226; x=1793106026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ThcckzMwPNlQzjyX8+RLOp31Su+73AzB9RfMA4Z1d2Q=;
        b=bkPIlHVkl2+6DyV+bms3fSk0DUfaEBzatJ2hLyXeVQ6lKCBHOkuXcyYp2ucasQV7Y6
         Bzktlgjsblk+BT4Ms8druX1pFOKQE3DjybW8t7BeTCoZMIRHkrCGr4t/AdyRfIb6VFic
         +4CyCGDl5Ta9QPiLfoJHk0EALsoeuo1kuuua0HCYtIJMqR92YGEsJsjKnlqTAPIheXo+
         2I5c596M8g2SjCgjuH9KoREHp6KRO7jhmZnYPC90YCz2cr3KAsnMqyCge2ecpPMZszVO
         hVFKSV0IefGdfXTM9Bt3w1kMdXB7p0rS5qSP655OOQwtXGTDhfdp9EKuG9g2hPbBYlCP
         at5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501226; x=1793106026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ThcckzMwPNlQzjyX8+RLOp31Su+73AzB9RfMA4Z1d2Q=;
        b=NaPhqib+p1ed4gp1qXGt4XB6odMjxhbr0C3tuPInhT+MNafunyZMGmufxzaobEwc+j
         W4h+l7jDfhFuUA5K3vLdTVPz31fNclQ8+AaKLVQFOsbl6Kr1X73ECepuB3txUvRmsYio
         NZklniEDuu6LRwLMqj8//IlIh3i8byv4eDoj/xHAIwnCWjLxI6mrb1R0aIVpx+/Xl3WI
         70zTOMOjZLYaN20ybSdNPea0j4nWGNzWb3peQxTtZhhXCMZMyFjPNGBwoCBvg7eHPtsp
         IVkz523+l6iDM75eujoiOaTmRYz1bwMCtkRlab4KecZBCzkliG0OPHdvJAs91rrP3Kpo
         ALfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfEr/CE+jnKmsA04LfCXAkuafmOv/PdwysT+iu07rlVfir8Y2ugKn7fQLMDLhOV5JQPnJYt3Nzgbef@vger.kernel.org
X-Gm-Message-State: AFq9FYKnBOM+j21H5lY0zN9nFQtBQ21O9uTas0R0Wa8snU9etbT28PEw
	7rpKkQQue/v0X6FxrGwrfqfOGPWlDf9rdxSrUGexmp/y/yoeunAFplJW
X-Gm-Gg: AYBFou3td4VAIlwdD1dAXeCdx+KtmMsOg5PZHbB0SP3m/SSjyHNw5h+OtgnnLq+q1yK
	krh3uZAAe60SNuUSeT+utS8iNgQn/zSTSVug3EtMubA/XfoZ3aU8cMOMELn0o2tHzlNRiDXSia2
	ChCp+Yl1kRfPDqjZKndMtoZcn8L4vRNSPlEX8camhm86jJSQZ3Y9T3XmQLDGCe79TXCXMpPj3hM
	/uyeoSdJKx8CPL8x82isB6EXJ+rW/Td+/wbEdcaIa7ylRVdY8N7+xpohcuQ1Zoj3DpqBPkiMxly
	a1GxZACBVljcmUTcIE1bM/VQkMcre8Bh/t1o8GeQT2dYWJfDDjU6GHMK+Smd8oXfhqFI0I5KrrM
	NibOF7QKpie8ur50WGb7owqwnOAAhlrA9dK7sZ6IQVx5K42LJfINLnHBzFosWjsKiOsWrqW8RQL
	9ddCp1JiiC5AtKg1Sb/ujx2v8jc3P+e3CcZ+xnzk0WwrBwVyWx5QsXWc5IwsqBgwNa16T30K7iT
	ssJPdh3so5jqct+pHgYEwMA/BYnpk07R/9R2mK4R33akCz7R1Msqr0mUH6YJjBxk2bjMvDnPBbz
	WUQEGQCJTQ==
X-Received: by 2002:a05:600c:6298:b0:4a1:96cd:2f60 with SMTP id 5b1f17b1804b1-4a1d75ce285mr218735335e9.3.1792501226292;
        Tue, 20 Oct 2026 06:00:26 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:25 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:17 +0200
Subject: [PATCH v3 6/8] of: unittest: Test fw_devlink with PWM nexus maps
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
Message-Id: <20261020-fw-devlink-nexus-ready-v3-6-fd6f1c17e16d@toradex.com>
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

Extend the fw_devlink OF unit tests with PWM references routed through a
nexus map. Verify that the mapped consumer has exactly one link to the
final PWM provider rather than to the nexus.

Also cover a direct PWM reference to ensure that it continues to resolve
to the original provider when no map is present.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v3: Route pwm-map entries to two providers, use a middle entry (Herve)
v2: https://lore.kernel.org/r/20260910-fw-devlink-nexus-ready-v2-5-17ac82dbe226@toradex.com
---
 drivers/of/unittest-data/tests-phandle.dtsi | 22 ++++++++++++++++++++++
 drivers/of/unittest.c                       |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/of/unittest-data/tests-phandle.dtsi b/drivers/of/unittest-data/tests-phandle.dtsi
index f5d7ee072c90..1fd465bb8f79 100644
--- a/drivers/of/unittest-data/tests-phandle.dtsi
+++ b/drivers/of/unittest-data/tests-phandle.dtsi
@@ -89,13 +89,27 @@ gpio_provider_b: gpio-controller-b {
 					#gpio-cells = <2>;
 				};
 
+				pwm_provider_a: pwm-controller-a {
+					#pwm-cells = <2>;
+				};
+
+				pwm_provider_b: pwm-controller-b {
+					#pwm-cells = <2>;
+				};
+
 				fwdevlink_nexus: nexus {
 					#gpio-cells = <2>;
+					#pwm-cells = <2>;
 					gpio-map = <1 0 &gpio_provider_a 3 0>,
 						   <2 0 &gpio_provider_b 5 0>,
 						   <3 0 &gpio_provider_a 7 0>;
 					gpio-map-mask = <0xffffffff 0>;
 					gpio-map-pass-thru = <0 0xffffffff>;
+					pwm-map = <1 0 &pwm_provider_a 3 0>,
+						  <2 0 &pwm_provider_b 5 0>,
+						  <3 0 &pwm_provider_a 7 0>;
+					pwm-map-mask = <0xffffffff 0>;
+					pwm-map-pass-thru = <0 0xffffffff>;
 				};
 
 				gpio-compat-consumer {
@@ -117,6 +131,14 @@ gpio-direct-consumer {
 				gpio-singular-consumer {
 					test-gpio = <&fwdevlink_nexus 2 1>;
 				};
+
+				pwm-consumer {
+					pwms = <&fwdevlink_nexus 2 1000>;
+				};
+
+				pwm-direct-consumer {
+					pwms = <&pwm_provider_a 1 0>;
+				};
 			};
 		};
 	};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index f15c110dbf4d..320a992c4310 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -770,6 +770,8 @@ static void __init of_unittest_fw_devlink(void)
 		{ "gpio-consumer", "gpio-controller-b" },
 		{ "gpio-direct-consumer", "gpio-controller-a" },
 		{ "gpio-singular-consumer", "gpio-controller-b" },
+		{ "pwm-consumer", "pwm-controller-b" },
+		{ "pwm-direct-consumer", "pwm-controller-a" },
 	};
 	struct device_node *tests;
 	int i;

-- 
2.43.0

