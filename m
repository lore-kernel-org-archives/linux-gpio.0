Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098232;
	b=09FGvN0hwFjfn/hVwhbC6Id5fEw2ozQy3YTIpeexAnXMUKToGz7A0FXNU3LLuX+MnHiX
	 LgcgMLFx/cPQPela9WOVaaFx5IAzackXT3zpiBF2TazTIngkzA1FXOz6nXP+Q/jkF8YFn
	 Gf2I1Ep3cLPUIedW27YbJXRHMA1pRuAw2oeV3otGxVh7bNK/iGYnJy2Mkaat2Bu5qPAyr
	 Ie8UmtJGIaQHgz7JeILEafi8TAr0m6pAhJtk4NVmPQp29CetAJfrGvpwLvGfr4AUOdk6O
	 x+qnjQ7D3BOK+GfTRw4QVWUNPk9+gCo3aWFkDsGW+rMbDSmT1+iUAU1yFxb9l1pFN7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=OYv8EXHvJRMuMkMYBGGipYHZCbhiodU9PiArP5nrXCI=;
	b=nfF2Czzjc3PMEs3rziVki3G2aMMO/K+Bmumu4zLvtKCkFqoPytXSVfAS28AESPlAHFtx
	 Q8olj8RZtnjnq4YrkxHJPqqR5KReHyNq6ELoD0znQzsMT2szbGmB40N3XCSUroL5k0AY7
	 f9PzUymhfe9h3q3NgvVsZJww9SYK6rJrhejxdhE61FEVig9t/5BBhbjjRu4EmdZtAEA7s
	 leha5Er7tFL681csowvfAp1rIOMnbJWLWyKKt/kKWBIwWlZusdkf5+Tqwg4Hf7eFwUD3w
	 iD6r2epOoDGTP9TznMhPLstzDLDK8HXepZiyKR4kg+2V05biykit/57hM89pHmJg8hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XBGgq8o9;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7610460A5BDA
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7610460A5BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XBGgq8o9
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2184974f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098231; x=1793703031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OYv8EXHvJRMuMkMYBGGipYHZCbhiodU9PiArP5nrXCI=;
        b=XBGgq8o9JbOb4l46j2L+47pvl2lkQ13eqUdWXV8qlOY3Cp5KOr4bkNX9G8mh1D/AnG
         9f6hBwSZ1oLg6AEAHTxYxWZKpiIxKY3EtVMobh/ce1pd0DbuwBrWC4muJ7z2hekULjDJ
         rTltdNO0INQvd2u+aQGjsz0CJ8Z74ifG04klP5zrw3KLxBptFuG6GzRHTPzCqf2zQ05t
         i36I16dlt2uThYXqvuYW/aO+Vkowcld6cCakPTu1Hl2RIgFRGiqOzsnuwQ2BEvwuJxc0
         wkU+27EOW+AHGLorYL5REyQ4mPaFW0kR1wMf8E0M9BQrB3J05EGwIyjrgnyBqJ9neahp
         ZJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098231; x=1793703031;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYv8EXHvJRMuMkMYBGGipYHZCbhiodU9PiArP5nrXCI=;
        b=AgeKX8/H/KAq9VKPQ8hD5pk0yeTLNjv5Qtx3zOnZFCVBuQpeSRfTJLQv40cFNmX2m5
         FZGJYK3PO5kA0fqAuZnIDEUBvLZQhbAWB00iPJQFMlaAopGqz/FF0vREg/ECcazSjeqZ
         13I/ZHhQxVuRLL5X3heJfg6e1lbxLoVwo7dVjxBf76yzrCmG+PdekkKbLtraBCTIoLzH
         OxgtokCWiudT00rQw943svSlyfGPA+0hGY0RLkLxsQWnhI2XPe4PqTgHpf3kwxTDHPVe
         1G7UsfsiqglhiDdHrNhEViA9VxN/8UDAfD/ybYz4j0FJo64DyvU38PBdP9kgKAQi+FjW
         W4fg==
X-Forwarded-Encrypted: i=1; AKwUvByd+e/GX3a5wiCRRaWj+ra0hMYShmT6+SG6myx1YzXz9ct0VQiy5HQ0cCbNHiGznrJEmulD3LHhPrZX@vger.kernel.org
X-Gm-Message-State: AFq9FYJzGPNmC08jM5GwTnllH9S/3TWLLBfPyeG/vl8CBETf9XB2G0WW
	AH1FpqiOc6jH7ndq8Sw7NalvPMiRb3lU7gL/FByFrKk8kwNPLpkZVP1R4Zkf7dSi5d0=
X-Gm-Gg: AYBFou32zKdS+yNVMMzccAOV4N6pylIeKm0PBM9gx/9wdrSn9q3s041BfXEY8cWtk5/
	SEraAcGc2NboMYbY/O6ouY7rcYerExRUGrRsWwGuFDU+W9qQkEiqplGdCLjkK8McxqvXN/RpUn5
	qwBXxZ8W2v+j+hE2d08RhmYLg5p0Et5gZFLdowFBQdTbuJpQiSO0Lo5z4VoPZuoJhH1KCTWStWK
	oTRcjKEzcwQyuIxZcYEUXLdGbW6ScR+2hGnPXCE3r/NNPAC/al2egM/Kf18CjDJGHVkv0EzFtg1
	ZWD6T5e6D3eNfUXhvTequQdOkMs+OHx2oT1rPzib5bhQTVDgEphygt7pn4A90eEh23DuluUBC5I
	RJIeZMiVuujohR2AZYqPqeAVLs5qG1Id0E7i5WHFN3xWeqog8Btb1rS012orSX3LHmczGq6+gXO
	2gd8PKKEbeQoWChDpWlmrg9x6FcfVkrrjP8QSngrltq1jtzKOY0MHlW0Y1Zq1mQvjVyxHMpZi8O
	OvC4O1JauefrFgLCvXbYNDWOkrf4dTlZxXQ0ZUzJSTfBJM4gA2Ifpd36OZWd9QLlBWma3zwgxzQ
	C2ZLM97adNZFWp8NCyvLx6RpC3BB7bwAPoiB+bgLN7A=
X-Received: by 2002:a05:6000:26c3:b0:48e:1c2:55a1 with SMTP id ffacd0b85a97d-48e3eba2ad5mr17598797f8f.52.1793098230886;
        Tue, 27 Oct 2026 03:50:30 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e412cc164sm20695508f8f.7.2026.10.27.03.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:30 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4 08/23] gpio: sodaville: Add missing PCI module annotations
Date: Tue, 27 Oct 2026 11:48:45 +0100
Message-ID:  <44f004501d01b664d1bf61de3cf21b4415aef130.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=864; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WtjqA4a3vKGHy0KVRjMPxwLtVbVqn9jeY+O0QX7Ce+g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IGphJAsvuyB2zcGVASwINr+K9dBC0GDAB9De ytk70ao4XKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBqQAKCRCPgPtYfRL+ TmcSB/9bawIqlP18JvgyKSnF9doZWtpD8DWY5ErViVjqoc4eQFQ0qKGn8IgvqJHu8XG28o886RQ TKcE9CWrItKnUSuGYa1sHIjJd/04bziHD43EoKCrvaBtvb+espwN3tg7Xz4qIQw55W8gBmVH1+E JBi9OxLt0bOO3shuaVCA2zfD+AgQzb3U+fKIrBZ5ocV7Vz9KCkYiJulfCO3WdgHRywPxdqN+VVP tKdjsiBcFxFZFoy2qTJKB11SW5wxJhm9rSRYdEi+UOQN4jRoCCaj5FEY2Ds+Jxw898ngnjW8g13 fn/rlbC33yXAetFEreVhXp4FhgB5ODOzbHyEM/UEKp4UTmR+
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using a PCI device id table is
supposed to declare that in the module's metadata. Add this information
to the sodaville driver.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-sodaville.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index e2a784df275c..950aa12815eb 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -241,6 +241,7 @@ static const struct pci_device_id sdv_gpio_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_SDV_GPIO) },
 	{ 0, },
 };
+MODULE_DEVICE_TABLE(pci, sdv_gpio_pci_ids);
 
 static struct pci_driver sdv_gpio_driver = {
 	.driver = {
-- 
2.56.0.rc1

