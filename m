Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953D3411F8B;
	Tue, 11 Aug 2026 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786435663; cv=none; b=ESkrU7JYcZhBrj8h50xhpQbDloMrxtIC8BTkMhxt3IKGUmXkrw4PQrSsB4kRd5mYV63TqOuQtfG4fSMmziVNtVkdDxJxKxauwbpUD3NrgsLnMmXIXCT780WWrM26KOrgOlsjo1rR6pjJIslKuwKnlnQkLkuC7If9iM+KMIyvpkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786435663; c=relaxed/simple;
	bh=Vtc1gFlK8mDkyp9lP3Iwz6kPPnzTZi2pW8iBHWl25Gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1fgDXABXzeLmqQBsGwsi4axryhuepAic0svLkF4unoXJCvfxEF/1LLqfu1ZtNn+bUkjmsUtjFDcnALzfTth+T6nTebFjaQgvazfdhBnK3dd1vSQYuMlS2kHz/2uOM4v1vfxDlDLFHYwthQ8fHjkCT/cPl9pFdNhkz8u/Hx/cbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjCJyMmq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjCJyMmq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CA7BC32786;
	Tue, 11 Aug 2026 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786435663;
	bh=Vtc1gFlK8mDkyp9lP3Iwz6kPPnzTZi2pW8iBHWl25Gs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PjCJyMmqj6GBo2LCkIyfAPcmbx8By1aylpciz2hyNVt/RKpDpYJ5zUFgmcpMO/Tys
	 Bgz73G6io3Vyi3O/HJQ4L37B5r3j4UHK9JnwYpGfjdAxTIfgZLFRsNRVGgeteniHgD
	 aZtcz73HqVBWvsOUwm5rcV8mOdp+3XHiQtd8meXUdqzkYwjb0jquT+bly3wCa9PJ7u
	 fs43Uhmw8cn5OsJzRedfUw9bgHZLsNCL9typ/chlTm228GOFynqv5S09JXgU8SDPv8
	 trgrjWkY2Mqf8zAD+Z7e/MD8wNSO6JMa48mxvpY60eavzE7w4CkpxkVAwAG0KufmSr
	 duSpJhcGgwlXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD98C5B574;
	Tue, 11 Aug 2026 08:07:43 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Tue, 11 Aug 2026 16:07:30 +0800
Subject: [PATCH RFC v9 6/8] gpiolib: add gpio_device_get_fwnode() helper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ls2kbmc-mod-v9-6-4fa9a5584406@gmail.com>
References: <20260811-ls2kbmc-mod-v9-0-4fa9a5584406@gmail.com>
In-Reply-To: <20260811-ls2kbmc-mod-v9-0-4fa9a5584406@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 Miao Wang <shankerwangmiao@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=xIF+rWpWEtgwD48krsfguxlqXyBIE8iGj6NFoNM/rno=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqethMf+Df3lWmFbxRzzoRdmptHxyd4fYRheAGN
 bEt5C5tJMaJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanrYTAAKCRCwMePKe/7Z
 bh4yEADNUya1u2lql3CMHoSEQPNQCdNst7M/AjlZFDVeiEdx5CVX6A3DbhQwGU4DbLxjYKUmUt4
 oYDAnXk3paNfH96O3djElU1yWh9/vHFx/BVSSCvbBGy2GcgvPYjZiQsN+L+rvgOph6KZntxzpsQ
 DPLTujgqhqevwQZcTd9vhF8AFSHnHXO+ahmtL06vPLq7sNsU20wJIx+9Q/xzNLDVIkvckvyDhZF
 Ehj1vg15tvZk8T2Oyzt872ZIY0C5z/JBX2KzKz3Wce0u8LsBNukJ2qms+AsbR9UjDoOQYm5ory5
 xPLqrvXB9vWyyF1Bi7kg8q3Xe7G84ayLTAcaKx+LJrKhnKouMl+8q5Iw+VsFTGe7+tFDJ8qGCEH
 7jxi03fmovxEscq2qu5ODOmJac16SQ/snYnjAjmyNo5rCVA5j4Qzrx4j2czrG3upbs8wbwQcfTX
 EqtO7fU2nZRnj2qwbQbIZ2+P2SA6vO+t5DEbEMkDu6IByTyxP9NfL045tvLHNOWz3lQjCK+7dAN
 VsjwvlhGYh/fLBsk5dShWra+z4yby3nfERdMmdIqzPEwxkVlc1DUbzn3Kz1thQMHmHt7t2Z5IV1
 PqvNzMydnSoBMbXxzOxP0+lpdHK0tYwkPaxz5jArQzqn2Mx9KJTX9EnYxDzWoRos4RpWF07u/2t
 JVIuyYDHovOPWvQ==
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

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/gpio/gpiolib.c      | 17 +++++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e5fb60111151f6de20b424551acf213fb058e190..bf3e7f67a90f576d137fd7261b0afc741eea3245 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1583,6 +1583,23 @@ struct device *gpio_device_to_device(struct gpio_device *gdev)
 }
 EXPORT_SYMBOL_GPL(gpio_device_to_device);
 
+/**
+ * gpio_device_get_fwnode() - Retrieve the fwnode of the underlying device.
+ * @gdev: GPIO device for which to return the fwnode.
+ *
+ * This does not increase the reference count of the GPIO device nor the
+ * returned fwnode handle, since the caller is expected to hold a reference
+ * to the GPIO device, and fwnode_handle_put() is thus not needed.
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


