Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA32383C75;
	Thu, 12 Mar 2026 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773305015; cv=pass; b=oHCNRLHRlUeNNgk+WTqW0UOCg83W30AkDVX10viRD2rRD1niPGIB0AgkVWAQG9wCGq9lfVkPooiryNqPZD3KinSdet0apfWE1t/1d0i6iyHzwuP5+5WAaLh1B3PhqbeLApzch0daiHA48v7e3iTT/G6KfxTuTlQRXaeEDUG71AA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773305015; c=relaxed/simple;
	bh=9MTfGDEAf9YZnyagaSAAFWByTP/OFXhtAXonoK5uZ0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QfaRUJFEY0P1jgS4midOcQVRNPNSIuPp13uW+CXVzHpBZjUbxOYPae/EqIr+RMq7mhw9xH2ZJMvFi9R01W+QlU+OfMxUU1m9hPK/Xo35VSj03yeG/MHw7fl1EK3Q6ST3pGsLnZgaBvK6mzJmxo54d1rStKLZa2JIAaLgopFYb6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=ULc3fNhv; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="ULc3fNhv"
ARC-Seal: i=1; a=rsa-sha256; t=1773305003; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QH0Tdbja1Hfyq9EzNR6QnaIzusMndEOL7prvmnj79KYijmWuqObfY5fC8TLQ9KVKPfb+BxHZGtcFCqEgcVp8QmmpdcDrLlNUk7MKnxpyBU/ijOHrR1s8TlODnvQX7d25i1KAc5l+AwCdgoUJX5L4pmSFAkltS0kcK1z5t88xVy4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773305003; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v47EHelxEqjuraNQyB3mSutNBgUfD8I8NAMJB3eHXcA=; 
	b=i9Ux6dtDUFTjb2xxn+MZpaUw76tCepjr1tq/W3HezILypcShCnXigde2VHHTwo6qHvoI6kXSNeEGnPrRUJ3rWLdR1YlosrjQws+tnHrL4QgngcsomQYB3oGPTTroUwe3VWGC7JZsSB4Ashoi9TBDxDWOKa56ewckuilkpIB18YI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773305003;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=v47EHelxEqjuraNQyB3mSutNBgUfD8I8NAMJB3eHXcA=;
	b=ULc3fNhvD8HwrjdbCZhVnPFiEf6ePL3OuXkP2qzv/WtCy4F1tlULMGR8D1aHhB8r
	+HVxQQ4ivY3Eb7eGVOUXKdzgy+wM0Q6a6TqfwFXTXChQN84jq0Zw4SJy0U9R4Rits0m
	qQyZCM94VzQ/czRbKea7/yacW9vMa9ZGr55J2UCo=
Received: by mx.zohomail.com with SMTPS id 1773305000858359.97959519734354;
	Thu, 12 Mar 2026 01:43:20 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Thu, 12 Mar 2026 16:42:43 +0800
Subject: [PATCH 2/2] gpio: spacemit-k1: Add set_config callback support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-k1-gpio-set-config-v1-2-8c3541da16b1@pigmoral.tech>
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
In-Reply-To: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
To: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773304980; l=921;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=9MTfGDEAf9YZnyagaSAAFWByTP/OFXhtAXonoK5uZ0M=;
 b=DA18ygHHkx+XZ8+b+pvbB3WE1hpWwMHQiwrwKhJ7Hk6Yc7YFAF0bqMqkIRFuIdhyiuMDEkL/E
 lG9i3nNvLUVAd13vZsihfmLz+cxFyRnCwTFnwneV812r1MvLYLuWqRR
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External

Assign gpiochip_generic_config() to the set_config() callback to support
pin configuration through the GPIO subsystem. This allows users to
configure GPIO pin attributes like pull-up/down when specifying a GPIO
line in the Device Tree.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/gpio/gpio-spacemit-k1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
index dbd2e81094b9..5fe813b7f9bb 100644
--- a/drivers/gpio/gpio-spacemit-k1.c
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -228,6 +228,7 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	gc->label		= dev_name(dev);
 	gc->request		= gpiochip_generic_request;
 	gc->free		= gpiochip_generic_free;
+	gc->set_config		= gpiochip_generic_config;
 	gc->ngpio		= SPACEMIT_NR_GPIOS_PER_BANK;
 	gc->base		= -1;
 	gc->of_gpio_n_cells	= 3;

-- 
2.53.0

