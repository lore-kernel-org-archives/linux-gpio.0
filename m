Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78863D88F7;
	Mon, 10 Aug 2026 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364749; cv=none; b=TkA74eoCmU46Bv9g8wntZDJK9sXTzR2QKvLY48bcRcbDg6eFYr1KofIvRdylCGC0cRmKpO0cMPFY3GpLtaTnx12nC/m2tgo5o4ABOfEGDwIhfY/JBrECGSAXSCg5Eq49PQSkP+XKq5/MaHVxWnzCfwlBlktH3/R96DPTPwdM+IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364749; c=relaxed/simple;
	bh=9rgQcPPYZjjypoUXySh5HLkrDxYI2QsEfEd8fBjEO3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FLOY+7eHtcgWSSHShMD+DTjP+X3jTCaJ0qM33a4Z6qTF/YNdRL63LAHOj3mMM1EDYu89e6PRLULSygkOETAH4rmRDxghH7EUEF+PuKRjGM1CZSce7xT+Z5c8jARPMl9+ljdHyP00tMXTnwjZ3kzNy4vlELuNuQ+dKg+pIKcme60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/xrzXYs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/xrzXYs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98051C32782;
	Mon, 10 Aug 2026 12:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786364749;
	bh=9rgQcPPYZjjypoUXySh5HLkrDxYI2QsEfEd8fBjEO3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P/xrzXYsP1s9OrFUsEqkBtBG6TFdkSgIBP/zfq0PgiPpOZEehA5JbST6uDwszLjjL
	 EY+lvXQwyhMM5+QX/4duUODBjjnXHq1aa1LrpSM1k5OU/vAK2tyqY69IPHY9ClmEXg
	 u6zmBj8eYUEYO7+ARUt5ajHk0/3yIOnuHleI+vlVHrG9Jv3HAAoxG2ekMcarXJoGLp
	 oSZVwZ2JSmCl7GN/Il5mK8k4/0NqPxWlziixFb2COa/zzztBr4chnJfsJomYrLi+P3
	 9QA2PuTFUSvXi73e4O5PjimXXD8cLxVEYt3wvrDxwK+wrSV5ahiBlulr79h78O0xZZ
	 ID/nnfaiMInwg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83454C5AD7B;
	Mon, 10 Aug 2026 12:25:49 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 20:25:33 +0800
Subject: [PATCH RFC v7 7/8] gpiolib: add gpio_device_get_fwnode() helper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-ls2kbmc-mod-v7-7-8aa0fb5a5462@gmail.com>
References: <20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com>
In-Reply-To: <20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com>
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
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqecNKChiHV4FlwTC2L0MKnFagxhv07RZPj/lej
 xw6UtWYSbWJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCannDSgAKCRCwMePKe/7Z
 bgQqEADK17apNRntZZAWqWEN8HBDJt+fUEPafcOrgvFld88aL5msNBZGPSg/fQXZCMliCLcCKs2
 gEdC52dfxsJ6W3oezQIuLrLVtqoe2amUvcbBPRegWXJa92F1tzqzuqG7EYGZkU3YRHOCylYJCe9
 c0PmDaGXdMOIs6PZb4/vYd2CXvGNGB1It8KtgKBKewwftmC5Li68jL6MCEE4zg/nflUsWCZYaML
 OYgP2iIyHe7dRtonrZbfqrijbJf6CUynoXGhFhCnjllb+FlUPiVKuG9/PayXqZ0DUdUrZJ2rbsm
 xToA4tuX2M6DsltHKXmhThmQlERmcRq4ref6JU1iDUccJ7qziXga++GE/vA7PN5Ws9i4K1lWCVI
 EpCIcjHudXZ/6KdLjotCyDalgAt/hwv4M6lAolEIZMa+oo3wm+QDorOjmjtbqpSbLQk9MTqf4ki
 f1YwXR09YJfewd2X7yRKOgaOph9fxxQ5Z8g6+ex3EnJOvmrgjYQfrYxQDOK1EzUy/63nYWy+BZ7
 y4iJGVcQP+v4w84BXCNPPWMQh/tDzztxhDJPuRV2UaKexhhNBmI7zwVuLWNSBeJ1t2y5ENB7rlO
 c2iJ4qqgaEgLTvC3XM6YcEsm/3SAIQgckzTGBqTCdvkvL6urUIewESAlMFLAdE+JNGNCWVmu/ye
 1VqG35IO5npnHeA==
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


