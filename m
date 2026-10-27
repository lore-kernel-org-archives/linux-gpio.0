Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098219;
	b=v334lcUIzzujPrbmTzAMfMsMtZIIxXB4nYbqN5VD8sA2K4mcoBLqDkQxBBe72if3M/Uj
	 Uu+N/CkeLHtMkad77mX1JJjVKt0qerAtusJlY0dXY+nxAl+qrxzt7+3zf2RuNPrAavGt9
	 eUD8sewOLBZlMfBp1++VbAqAetuxaRK0+hi6CdCSvs54eLEOZgS2nnoeCMELOC5q6fa2U
	 UbInNBwnEUq3RFYXCZ6sab3MIFvBIvftLh5xSPP+VvC+/w3gul9fmfUCGQdxACwEx5MMd
	 SWq3Un3dSMwwooq4EHAaTo9PHh0lmJucaNl3UrbpRxDQxfCTrr9s1oebKdsIk6ZNnoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ETEsZCw2EQD8kVp0lMlhrVaMPxfQkKrwcVthkx3hqKQ=;
	b=5T777uRD3kKN0YSNBetJidzC5NUga8DEHbfy9qSeeH/cELQ9ksR5xymcp2q21ajqUVY9
	 CGbGpoWvEq3T6o8cwv1Tx/vfsWmadIYGz9MyMO+XDUa7CDg+9cwRy0e9iGlrQf533NL/5
	 G74iQS+pgKr/XCfEnL5J8mlTb83u/jeaa8DaSHVZfECHvb8n3kwiD+M3gdj4uB2S486KQ
	 pBr37SyL/vYwUUAxtwKZPa3IbUurKJfbjmdM1JqqiwwXQS7EgwnPPCSmCBZb7oVH09h6j
	 yCUqxyL6CxhoMwH3RfDF4dHAt4eDFip4gs86p6wrfqwc/NU8hiyn2Wn3VWBssLJv/Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ezoGoNS8;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CA3606A331
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35CA3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ezoGoNS8
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e0d1da913so780337f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098217; x=1793703017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ETEsZCw2EQD8kVp0lMlhrVaMPxfQkKrwcVthkx3hqKQ=;
        b=ezoGoNS8Pikx9g4SymUkplq3lT1YHsxN2XV8/G0eT0FANhqaoNp0aI8G//LysLEyzX
         BqW8ssIITqluCzkVnScue1HtjmAJvpaI9qJr5zJcdKg3wj340Vgo3ihXkbXWKBou16l9
         IPP87rCkUFIYzPzDfXpqOXsTp/viVowERjQuBivA0DXk8rxBseSQzERa/dau4pyvYpsE
         lpo07+eyvSs9SwkV+7I9uGVIz120JvHdqH3vZ367IJWzWjJsTdEXdk0QuvBWObwxLnWx
         gWey/oO47q1XplOMxoiKLkUVOSmIK0VJdPNDS55V5VAWvo79A0jXCsSocJdOpWrnbqC6
         Iauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098217; x=1793703017;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETEsZCw2EQD8kVp0lMlhrVaMPxfQkKrwcVthkx3hqKQ=;
        b=SOCVpTo+cfDE4tMq8372/F3TsPqfgNXqclLHG1I0ub9j+6P5u9RhXTX93YqLEII4A3
         4j7qo1AhN4yBiFf+2bI62YVoTSWUjaW7S73cX4xkMz5MEgIZtyCOUzfH0nGgOvdjAOwc
         u7G+yKxZaeT7uZeEmhvKtjb5+BEhXwKQpQ+O8fJ6rYEv/7NVTR4uIBhCsB2ROygz8C5I
         uw+caDI0MptsHcONS7adC1u7H19xnjifoph6jP7MWW8h05/oKUrjOg+r7HCp762Afvhu
         PYe+NfCCzhI74nWZLdVgnzmR9i3AdSfAmstGRjDvlDMfXZL7dWBk/8WsnSW5Bq/HDDD9
         Y5ew==
X-Forwarded-Encrypted: i=1; AKwUvByVwzCVcBAb9Z9+jCsPZINFwVd8n51cW9ZMIeF1X+Wzya9vB9ko4Gj08Hs3IIrvz35V1ElmI2xj/5X4@vger.kernel.org
X-Gm-Message-State: AFq9FYKen8tEw12VTRrHA1E2QhzIO86mDYiDce+0VpOVz6TZhlT6fkDG
	udWvNOfdVmOX0B+utusTFcj5G4M8/SLfF7fRI+SXBfHZ99WkK26poel0Zd0+3b9SQnw=
X-Gm-Gg: AYBFou3Cj4z3HQHsqdRyBmE0PhXuw3nnhJ1O+vjNrs2WsrTNL4jSCItOYwJvY7oXISH
	X8Vm34xY5RjSYDj9c6HrtAm2jCFVEIzGUc6xSaDD70q1s1TtJsNJ+AeDD4D8FPUGrAvBD+DXq2q
	hbLtMndsZ1ke4YTgUxRStTlQhQF5gaylDZlD+YisNyTGbvI4DNNSiGKvJfjwY3TlU7S2QMlHLao
	MSnBdNyAREeXU/oUVzi6L8v2bhUCkN6mMrj/Xaolarw9muPhUS7N3FeGPyA9mrplK795cnyPhhw
	4/WZK6KgYZXssgIVm8HyI2LwHRDkdt5hz+/chSjTcrA3smtjNOKDn4ga5+MSiAVPJmxO93skf8n
	NjzSyPXhVXtnxpAcYVdVTMA8gK7e8j7OAZHxvP1xtRWssl7QjzpKjPgD/mqog+utav5Dr5KJVs7
	GlCxtBsWOxzrC8oHhaf6J2nD6lz8tQ/rYe7TGq3svse/jUcZO7YOThd6t+02IL0zsY2FCsc4/Qm
	LEpLP1HFXx3fSqpmClIVAxUuyUdBoJdK35rJ1bAVboj+lv0TglQVAIUCtFjeJJRyeFf4e6vSi+d
	u8t9yKnCOpPwTl5EvdCp2WjmKjA6Y/0LP+zdvngXyv4=
X-Received: by 2002:a05:6000:1a85:b0:48d:efcb:1fea with SMTP id ffacd0b85a97d-48e559bc0d3mr5212733f8f.0.1793098217507;
        Tue, 27 Oct 2026 03:50:17 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3eb8f37csm17981730f8f.8.2026.10.27.03.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:16 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/23] gpio: Remove __maybe_unused annotations from acpi_device_id arrays
Date: Tue, 27 Oct 2026 11:48:38 +0100
Message-ID:  <9d9f0d81695cad02de8c0516c85d0b16c9cd51b0.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1499; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=cOZ+9x4xpZu4jqMcVJUumxSmFjEiphgP8TFgVdGEb54=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IGIqA6euQvoBlkmcuUXcw/PhJi9pqLaEpKUR 9+Znv/HzvaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBiAAKCRCPgPtYfRL+ Ts/+CACJydjZ6T4QJlLgb2TaNOcUBTVRmCSbOU/o7pkYAcbRLQWWzbbBK/MogfnWqxhUSLRRheR ND7Ch7FsHIG4ise8YqPugsPjAHd3QgJT0sVJHxQ88AqIkpzDs6qb1NWY10X7QePPDmYZAtVmoHl 1lNNnPLZuxM1GEdcgzUgQM2jmzzkC8XRNOdbtIg1W+vxM4C9cOPE2GvJ12aW+YKyhJDVocTWVwX +phFrKVcV8uDDJ6SdnyxX4cf8tRmtbs66u8bzXh0BBbXBod/G5KYD85npo1qPfFHayk4Uvud4ZS pdPwcb0Z/ZUHM2dVqMTLJ+dculyfIrf34zL8luR5RjyHOK7s
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So the ACPI device-id arrays are always
used, thus the __maybe_unused marker serves no purpose and can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-mlxbf.c  | 2 +-
 drivers/gpio/gpio-mlxbf2.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
index a18fedbc463e..1d338b24d52c 100644
--- a/drivers/gpio/gpio-mlxbf.c
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -132,7 +132,7 @@ static int mlxbf_gpio_resume(struct platform_device *pdev)
 }
 #endif
 
-static const struct acpi_device_id __maybe_unused mlxbf_gpio_acpi_match[] = {
+static const struct acpi_device_id mlxbf_gpio_acpi_match[] = {
 	{ "MLNXBF02", 0 },
 	{}
 };
diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 4e5c5d196a50..5e4726d583c1 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -450,7 +450,7 @@ static int mlxbf2_gpio_resume(struct device *dev)
 }
 static DEFINE_SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_resume);
 
-static const struct acpi_device_id __maybe_unused mlxbf2_gpio_acpi_match[] = {
+static const struct acpi_device_id mlxbf2_gpio_acpi_match[] = {
 	{ "MLNXBF22", 0 },
 	{},
 };
-- 
2.56.0.rc1

