Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B1A3E7647;
	Mon, 10 Aug 2026 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367079; cv=none; b=A4luHoMjn9YEsfUw0EKbjcHI/tZBDFV4yD4eC/i8yayoSZLhvX7wAIXq6Rtr08hC4VUVpJQL1+BW7yNAd9w2RbpNQ+AYnG3E+/HIlqTgWgzllPTp1rzuEMi7GFq0veecvyvi66geu7kYRqYuv5YVuDiXFY+rqBIQJuqJYaOaEm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367079; c=relaxed/simple;
	bh=9rgQcPPYZjjypoUXySh5HLkrDxYI2QsEfEd8fBjEO3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c9HlOhqhBmD8J2+XB1ZO8HL58uE6p9O9rGpeNzC12jUvBWZozEqk2ZZ2sO1A84ush0iSSplRtKN+a1WrL4a2gj9k0FT0qWQufxhalXtlAClOjZwgc1Dmwyj+scRFaH06zgIiF9r4wQyM3lo0nYwtUgBWP0G3pEezcEc6N/+K02A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWiWoslh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWiWoslh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74E67C2BD04;
	Mon, 10 Aug 2026 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786367078;
	bh=9rgQcPPYZjjypoUXySh5HLkrDxYI2QsEfEd8fBjEO3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HWiWoslhoNSICkwdpUK/ukfIlsYF43P89hqbf6dx58tukeMGdTAU8Fnkjh/kW4vxG
	 R97C23HirbpM0UFokrLdp3hR7XAcZhZPABq5MqAN0qKHi3xBz+dyCpGrUfgB6FxIiA
	 qgF9MyY6LblLt1UjcB3Le2aPkhbcJYFkdGcOUM0NqA5CAASATlxd1Cr+TozrTHB7y0
	 IL0JVYkOLutPScvbVZOj5YOehcqH8rBRlnDv2bOx/wNRonGN30jYGkZy9xC/s8n0AT
	 nlYGjDVvz5prdciDJmd+FC5/baN9xkh0AWXw3P/XZtQHZsjPf0bZzrm12d2hikU7qN
	 A7/iErfktO3iQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FE4C5AE49;
	Mon, 10 Aug 2026 13:04:38 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 21:04:29 +0800
Subject: [PATCH RFC v8 6/8] gpiolib: add gpio_device_get_fwnode() helper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-ls2kbmc-mod-v8-6-16e44f7322f4@gmail.com>
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
In-Reply-To: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=TZFM28+jBaBa8iuXdlwWyQ1gE02lWVl9BRxh0Scrj4Y=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqecxjlULkZ4X60g/XRmeS6crNRMHWhmHGqiM9v
 wse6/LGD+GJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCannMYwAKCRCwMePKe/7Z
 bkqgD/4x7yxBnYVahId7LUwoDFHlX2WIvHFRTnXw38UTrnQrsXkL4SrKdCVzVzMY6/UfIcWwAq4
 I4QG4cP80i17VpuGzgCtk9df2eVcAHJnpbHlAKxgvMDkgSJi0bAlbjdgAzI5s/VdTcN1tPOUuUJ
 n4SFznBarVBxEKC2r7RctqTKxr+bruVbprr38P5VlMcJwOgw6l6+MVcMnntjQOcdcNhdPZc1g1a
 hLvMOiLOx1IEw+c28F5HJNrk4HTOjVEDMosi6f3DjdPxIzuujg9krS51kUuWTMtuI6L6kLCnWiE
 P8XNN5jSJ5yMZvTTam4GUMhFH3zUuGPMuQMwY9sEQdOe4AsIjFvvftLLQB+zmQuDelk3cWKbmtI
 vfKiTl+DD8qtKgRigjO/1dMctfBPij2+rrM9dnHKvj4Oe5jOy+mbD4OvKUiM7M4pWkziyjjYQjn
 HqGlDtUYeishnaif1tF3hnqDHXXlqWwKY1MjEfqdjw15DP7KGN45kIady26WI90oPXUlAmpA5Mi
 BKW+t8ptSbwy/yeTXlAVGN2EqFena4xZIPy40CkDMkNjCXbx3zQeh4f7Xfxoht0FmkzFRsHzWSO
 qBrR1qditRMfg1VvO8wpt+iZsMsWeN/TdmKRu2s8J+k2Xh2eYFBjPdK/GKHvXjktBjUYWzlgZjG
 OSxA7CxT185DOYg==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

Add a helper function to retrieve the fwnode associated with a
struct gpio_device. This is useful for drivers that need to access the
fwnode of a GPIO device for various purposes, such as creating software
nodes or handling GPIOs in a platform-specific manner.

Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/gpio/gpiolib.c      | 13 +++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e5fb60111151f6de20b424551acf213fb058e190..3774ebbbe550cdce0989a2d06f2ab658529c3bab 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1583,6 +1583,19 @@ struct device *gpio_device_to_device(struct gpio_device *gdev)
 }
 EXPORT_SYMBOL_GPL(gpio_device_to_device);
 
+/**
+ * gpio_device_get_fwnode() - Retrieve the fwnode of the underlying device.
+ * @gdev: GPIO device for which to return the fwnode.
+ *
+ * Returns:
+ * The fwnode handle of the underlying device.
+ */
+struct fwnode_handle *gpio_device_get_fwnode(struct gpio_device *gdev)
+{
+	return dev_fwnode(gpio_device_to_device(gdev));
+}
+EXPORT_SYMBOL_GPL(gpio_device_get_fwnode);
+
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 
 /*
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 17511434ed077dde8807bd7630c342e146e5230b..4dd9120707ec72a978f5f916cc5473a91b65d2b9 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -641,6 +641,7 @@ DEFINE_FREE(gpio_device_put, struct gpio_device *,
 	    if (!IS_ERR_OR_NULL(_T)) gpio_device_put(_T))
 
 struct device *gpio_device_to_device(struct gpio_device *gdev);
+struct fwnode_handle *gpio_device_get_fwnode(struct gpio_device *gdev);
 
 bool gpiochip_line_is_irq(struct gpio_chip *gc, unsigned int offset);
 int gpiochip_reqres_irq(struct gpio_chip *gc, unsigned int offset);

-- 
2.49.0


