Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580723;
	b=QjlMW4ZXfaFC9RdukJsIVE9VUbimfl1b3YQwQD3WkKwLDsqjeLjeQQM5UU2zD19pY0Oc
	 m5PW95GyQ/jO1a2CQNAWSbdiEaeQ57jklQsC46ypILkG7TiyBsirxFRAEGVHQOpOPVfKc
	 xDCQ4CHICTkA8DR0IAfDmKRD9k3NUCcPQs/b9PIKgglesRAvmEyCrJn3oyzD2Zyx7bXuM
	 hWQN0B/4V7BH961kV1Nnr1qxGoiZ8/CqN+iZGsx5vh6DV4qfyjfaeG2CuilWAZAKJMZz1
	 64IDa/C4IYKxTBrqylVelX6mIzYyOkBmBvn7zilEkYvIicazvFTChtc1XPjaffCiOVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580723;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=izXYLEjvY5H58Hoy1BiiCBLnL4wnWL1e+XA+j8Yu2b4=;
	b=Oy6yFahfUKcGo1N4s26+vAKB+Ixs9hduSHT3FcJtnHzXpl7n3w9tvs2O0/NvB8prJr7v
	 T6Yt4cQ7/OhJzOenV8N75VS8edjHkIjGWbvOB9jn5ImWQH5gmC+sxI/Cy4CyQRroZp/Lv
	 CroZRMGnO5D9B6/JpceHETC5tyLH3Jg8q5ygS+Qs/aSgU2si4wYvR+qBvNZd5HEbvnFFf
	 5a3EIlBS35sSsLMR1kPGm1zq2zy5vamozhggZqo9Hl5kiSRYEV2SXkt2ILszrjiLNwY/S
	 1pFt2B8h1tKp2VU8Tmg/p+JTPBSIzpk8iFpfo6eGLYMX9tPorpVNUglRgO45yRnNVhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=TYRS9ltb;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0CE606A327;
	Fri, 13 Nov 2026 14:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA0CE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=TYRS9ltb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=izXYLEjvY5H58Hoy1BiiCBLnL4wnWL1e+XA+j8Yu2b4=; b=TYRS9ltbNsubU5kWA2yfAnpuD5
	Ju5OtluKxXfhWof38dKSMpLs3/l9/boLTzzo36yBWbxFI2kS3XqlOnx4KR5//wQPRl4r64bMCeQHH
	J/v6FHmvUgwlJG0WizVDEYtWJ1/I1ELA37lXYwbm15j3BOgGziN+Mm3yWU99jDUyM4i4il+721JOb
	pqyRscggn/VKdDtWhipTKrOSDzfbQBfNzfkE/RP66CYJ5FJffiJ2YuxhA9jA2dK7TshK2zsMDTlMH
	xUI7TO6NhqDght1LtrlUgZ4B21zgegiF/UXZj6hTpRZVlvIE6lWiX3DomOkhV8SysM5W9RVi9aV1J
	awNs3Vhw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRsQF-00Eozj-0W;
	Fri, 13 Nov 2026 14:38:35 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 13 Nov 2026 06:38:28 -0800
Subject: [PATCH] gpiolib: fix leaked descriptor labels in gpiodev_release()
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
Message-Id: <20261113-gpio-label-leak-v1-1-c6c00f8ebfff@debian.org>
X-B4-Tracking: v=1; b=H4sIAOMg92oC/x3MQQqAIBBA0avErBtITaGuEi20JhsSC4UIwrsnL
 d/i/xcyJaYMY/NCopszn7FCtA0su42ekNdqkJ00QgiF/uITg3UUMJA9sF/kYJTWq5EOanUl2vj
 5j9NcygcX4NmtYQAAAA==
X-Change-ID: 20261113-gpio-label-leak-4c296355d62b
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: catalin.marinas@arm.com, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2150; i=leitao@debian.org;
 h=from:subject:message-id; bh=e+jV4AfvLVV6YOXIpKVBvYeRj6IY1lG7eJPMVQH+eNw=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq9yDo/HuejNDKbs9QtlJLeXvi9dRfsKdfC08VY
 XlBUq/a2TSJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCavcg6AAKCRA1o5Of/Hh3
 beqTEACGlccFDsfHvw53geRN/XVkVam1Um2Voeb4767yLYvfijqgy/DV6m9L6XQUFkTlRSfWqZ/
 cJHmVCiuxnDmPXoOjyWuDm3ZHagAM7tnHvIizn9oxOfSfUe/2wb3bzfPZbDilXA3IvBc59A9Sy3
 XZHFNFU6jpkYFRoOM81UeXCGb97vQsBTzVkVguW5ssX8MbAnBb6ZjRlwWsKtW85Kubkp9xW1NVC
 Y5vk1nqBOD7CDNU1jgDF38NY+5/ytmX7YrSNluEcYMzYt7B1kPP1XwHp436cG5H2GrsytCbQCXO
 1VI5FbUzleo77rq5A23iMPJPqHdW19tqVXojsik1UHFMB0tdBpDI9EG83xNwM7e7Q2ssc+CStXP
 TNRCgxEXCcSlFEn2WQyKy5iLkMcJchr1jsH4TgAHsyWYpT7vgNzf8TDCVMBUZ6P/PVB4h5Q2GEB
 Wwd0T95C7XcmLSJ1EvGYZZAhrfgDHOlMITMcDC6Ymi5ubeN0hK2ldgsl4v88Xnr0bXu21Suneaq
 8Z2h5fa5OrYMLTiPsWqYCfGluNxTmFIX18DWwkSIACPS2dwpVGPPCBBm5TBoAHBF4eTvPVb5VMB
 v8gHZyRlLGFG9I5TvpgGgaBQEEoygBMucZTlliwqHGIKMAq8fsgn+R7uDrmRiajbVDgnw64eC5n
 wQBetmjM6VUuOLw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

We are seeing kmemleak report a leaked descriptor label on linux-next.

  unreferenced object 0xffff0005d420f280 (size 32):
    comm "gpio-cdev-uaf", pid 21987, jiffies 4297166145
    backtrace (crc 7ff222d9):
      kmemleak_alloc+0x40/0xd0
      __kmalloc_noprof+0x300/0x670
      desc_set_label+0x50/0x190
      gpiod_request_commit+0x1e8/0x358
      gpiod_request+0x88/0x290
      gpio_ioctl+0x7e4/0x1b48
      __arm64_sys_ioctl+0xc10/0x1360

The test requests a line, removes the gpio-sim chip under it, and only
then closes the request. By that time gpiochip_remove() has cleared
gdev->chip, so gpiod_free_commit() skips desc_set_label(desc, NULL), and
gpiodev_release() frees the descriptor array without the labels still
attached to it.

Free those labels in gpiodev_release(). No reader can reach the
descriptors once the device is released, so they can be freed directly
rather than through call_srcu(). gdev->descs is NULL there when
gpiochip_add_data_with_key() failed to allocate it.

Fixes: 35b545332b80 ("gpio: remove gpio_lock")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/gpio/gpiolib.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 033c6fce4fc8da..3d301234dff44d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -896,11 +896,16 @@ static void gpiochip_free_remaining_irqs(struct gpio_chip *gc)
 static void gpiodev_release(struct device *dev)
 {
 	struct gpio_device *gdev = to_gpio_device(dev);
+	unsigned int i;
 
 	/* Call pending kfree()s for descriptor labels. */
 	synchronize_srcu(&gdev->desc_srcu);
 	cleanup_srcu_struct(&gdev->desc_srcu);
 
+	/* Lines released after the chip was removed still hold their label. */
+	for (i = 0; gdev->descs && i < gdev->ngpio; i++)
+		kfree(rcu_access_pointer(gdev->descs[i].label));
+
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);

---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261113-gpio-label-leak-4c296355d62b

Best regards,
--  
Breno Leitao <leitao@debian.org>

