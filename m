Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032166;
	b=qFFPrBjwy22twFXemNYGBU3Xq/G84XHLiseL1Htb/l7ivXVePfdyQSO/dCEpsSfDgZKr
	 c4+JHJi7d/Gu8YV4JZsSFnjQkp9LFmmxEHXosuVp6yvzG+ek7Os8HrBSkfKHxVkIZ02rl
	 SP9pF8vCWxsHJP3dZbQhi42bGVsR2kt7NyUzcGY/0DHaB6lZx3i92LuapBPq0C5LNjDCV
	 vaA8mkVrTUEbFEccczjEv4NviK144CNYjdr07D8jkp6+uiu6EQy1+YuGp0P4eDTpF2tYe
	 q8nMDxCiqMpIl5GnpANCHc84e+ktYbRfqajSkv3UAvDRGs+DZhJZvx3xjJYxDY2LY8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ETEsZCw2EQD8kVp0lMlhrVaMPxfQkKrwcVthkx3hqKQ=;
	b=n0u/NJ/y9dsW+oDskPEIPlenEwthB/nhcna4uodpSkfykGlepep6MjL9ENJdvKAumjdz
	 TXp54E6kZiQ34iWo5mjix1OiVnwUeptXPXNjUcvEu+0rjQ6xC9Hw5ZUyjPyo2BlJj9QFB
	 ah9+vWJbxjNf7ApS+zeySMvknjxTKpPrTYct01F/E9GjbIi3hh4EmmfnwYAPbPTbMHH4u
	 IMww4Iots+igbTozB0GCMZNgrddEWIKVY+eja/DnYUgK6+p2WYMYmb54FP7Lm1fEFPBtd
	 hkX+iP6X1cxJTC7m92g8R1CF2e1JxXzws3ilM6r6udhUK74B7840xfri+ZmMIlv7Q5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IwxrFln+;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92C3606A32F
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C92C3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IwxrFln+
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso2423515e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032164; x=1793636964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ETEsZCw2EQD8kVp0lMlhrVaMPxfQkKrwcVthkx3hqKQ=;
        b=IwxrFln+KNvvf5jPfSC3rCv+83Wi9IMJzbozZvZyz9DIL1Hw92ouSvcScAeVPl6UDA
         U44+CWgT1Wn67cUaIo+qlbzTd5tj8vZpHRhzXkmciGI/kRVcuQFjqNM0GUbXoVHhaXTK
         kHRwba1vHTEdh3lfiAyhYGXyXbe2pghX3UTW3IE4ndI92TGiVqhpNP/cr5O2uCzMcs3T
         5e4NTAIdvMc+XB0BS34XlWXeSFHQPuy1qm6ekva1q6g3TUVRU3HrloEBcMM3KTc7hHr4
         u1XkyuuwFbaDAemczNT0OWSTgWtivGBBGcwRZ8xgBlqcFwzDPRx9oV4MMI+yJTlvYRcT
         apdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032164; x=1793636964;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETEsZCw2EQD8kVp0lMlhrVaMPxfQkKrwcVthkx3hqKQ=;
        b=BoBDNdTmgw30i8cF8eWFq8EG+2+iAnfzbBGbz2I4Ua51OErR4/LV6Je4T3kSkH5/is
         AmXML0bUpICJXm0kg4CJJ+pCxslEZCpgzynXUrI+H7tCDk6kPk5Gq0LM0VF/Z2PswITM
         GW3ed2h1iY5LvSDHps7/RxeGduje3tGgtydjlbg3Evpg4+y3l3d/3dgEPoIdVWi3h3yR
         m4mQiVk3u7C/8LIvVnjaX6Jx1pMz/AFZlJ3Ni43F83pZdEJoc8ZAkEcCoz0F7ngCbAnC
         KJ2JmDAZiPAqNYRJToFqU1ehWW6Om9n/S6Xr3V8euSinXES/m+/UM/yaUNJ/TdMV+Igc
         KUug==
X-Forwarded-Encrypted: i=1; AKwUvBzJcq/Nmku31zCc+IeyW7JaikTGvf7w5ok+xVJqXJuLo3Lt0rGX5YV2rP9nJJYeAniNBQAp1oHZW+89@vger.kernel.org
X-Gm-Message-State: AFq9FYLG34OCt5y/P+9yOcUa1ezpEVSlHQ/nabUxZvz0qFaOOTRJnCQH
	6avhv2vIEaXn3Vfue2Ya2p8Bi/QkjYM1/84jJfJocPYwns8WadO3HIW3Ed+X/o3PiXSbVvgQ5wO
	LhOfe9kg=
X-Gm-Gg: AYBFou07W6/KUza3SBAfCPxJkFWDbE8TJcFSo+YPocmtkdSJY/jNQMRSXtfxmP0oNW/
	Dz2jaG/uRSgWYudAJwDLzTLLTCtj3H48W0RhjDAf3iw4x7kN0BdGEujaKlo6yUw4hThrExBPHLC
	CYBwNKdsAQSZjLPnR9YxatJFQWEaPgtuZi/E2HBh5jDxUGVuiRe3CHNheQFC3ij7t/8jBJ2acm/
	filLgKjbzNUQH7EEoFc1xpXiJLI41OE5bqaWTdb1p+1WT85nCNP6VpUdo9Sdn/WOMXwfrHTv2Us
	X6mm/Gj51AVkoTr7v5Im1riHo/XS83XKzyn6lwkThLluWdqThnGpR6oIj5MXKj0Nd6PhHObYNGA
	WHdL71PvRMDLf7YJuyB7CEdBz9eUtoSXrMtsPpppfIiO62oEJ6j4tCSnsNTcWMy3L8KLyJV9M+X
	Smt9bRCNNYm9YG8G2WPFQLF4pyo+BDrCmyscjvsM0bW55qzBHaYsBbe8Fj6j3NdTjfNF0FN84Sy
	L5wjzM5CjGAJZEbBf+bYCKrpnqKsYR7di2vCC0/3Fri88PPkKKXWR1rRRrWHi8aA8uAEDO7/qjY
	ta3jfxDRmkdGSR4IbKZ7E9rRXQahakpKWfjO7AE6n6Q=
X-Received: by 2002:a05:600c:310b:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4a35ac9495emr132685935e9.13.1793032164149;
        Mon, 26 Oct 2026 09:29:24 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a046fefsm261483115e9.5.2026.10.26.09.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/22] gpio: Remove __maybe_unused annotations from acpi_device_id arrays
Date: Mon, 26 Oct 2026 17:28:12 +0100
Message-ID:  <2d6462ca16e21d379154cc758dca4e15e2244e5f.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1499; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=cOZ+9x4xpZu4jqMcVJUumxSmFjEiphgP8TFgVdGEb54=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+eWfLBGyl8YT8GI+fjZE/AMB+xHoUmy/B82 +g4NrSbTnWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/ngAKCRCPgPtYfRL+ Tk8dB/9wmRfxIyh5KN++bC6sFGdS2QqJsQDVYaG8PeGTCMq4sbCD5IS60iROxI8ylv4BG85C/+Y WkAgGhFAnZsHbOzSKCQSpoF4cLF9qTC/tXaKY+wyW9lT0roMqQe3cYwL3xLXqSMSq/73bkUThow 1Dc3Sf9mGDm4vlZoWdU5AbMrQFOSX99c4IZdoaG+9Rx4CTuUVt0HFD7uBlkdwOaitZ1Ehr3qwgB /IiXRuxVYLHJbyDPW4tQqANC7VNKiZeeJCx3zzPbc2SkV9LIJxGHPtKS9TZXuK1z7ZVyBhU8pIx n+emvbjM0YGUZCsh+/UHgcwz9fZWH52woXXUA4vFkxoSpAGw
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

