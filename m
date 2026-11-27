Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791164;
	b=XzzdJl2IDDOEcqp+SA5GtYUzaY7VES9PbfOZJJ94YZ04e5HgWaio4TW3DIRt2iU+RAaN
	 uxHZAFsD+MiuuFwEUN4x1+WMLPCM0O+qIPqQf+HCP7fTUEr6GZtbzrH+yt9HN+k5OAkfb
	 0dOhCmY03ybQirMRftYMshd048Bbwv/3F84OxmAnASrJ2+g8biATbAOnFVyOFm17sOf7x
	 OI808vjvr2JXq5JzZSN4h4J3O7pxPUT1c4yADLfHY0DOCFz0LdNrd54c2rCZ66DHFJL0R
	 Xx2NfJnd+UCJzpVoNMCh6Tc2DB9vcQKwVf8X2T1C0UbvCKv48yft2yzMnVlS2OSdzRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791164;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Z3RMPIOTCKavPC+NG+Y6yivskdZ9UZyuuvcCiUIS/fY=;
	b=aK/pHl7O8AnQ05v/Xgq0ZrAhfB9BeX90hANFBZC+3E95eJd70X81inge41UEG/BdnAYj
	 XjL3mYqjPEe9wc26HCklYhzAaV45hg1O5nnBrFKGLIQPMTnIJsnz20IYgVMTBz4FySLyV
	 /V4OgVjsYa198Pl4MXqajQ7bPFn6+QMwjtbKtFdEogyRDzP4OfQ/T6/KXjyKaXARn1NL9
	 4sV/7Ybv2s9yjXxlm9RVaqxUep6GNpytnt1RMD3stA89TpsUqRy9YRYNl2ZxjZHliRSyd
	 9tji14YxlaF+MQouZ5VTl8Xof2/jRLFx4uaWKUf2dxyNZDNRmSqshWWYEcxiWO9+CFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+quoZGj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BA9606A323
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 14:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+quoZGj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A30B1F0093A;
	Fri, 27 Nov 2026 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791163;
	bh=Z3RMPIOTCKavPC+NG+Y6yivskdZ9UZyuuvcCiUIS/fY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E+quoZGjlUyU+0Jzp/qpok9YFfkzhLA8TvyGhDvAl1JvjRw6zw1ZMVvu97Ltq0yic
	 vlps6kg3cqHJ1gRr7ucyFeiXBwDNpxwY12H/U3e8Y9jOTRwUuC7blc84OUTBa6TOkF
	 Sf6iaATIu2Mo23mEZAs5l2XiIie3HuKhSeda7D2PTJplaBSJXHvwXZF8xHPgofa5s/
	 DQbGhSIGJn8MEePUyGQpdJs9zxwf5eJH4TYljsW+YOfIVagNauv2Lh97zEYB9p6CYU
	 53IKc2yNbt1330hNVbzrYsRGe7CpYuIfPwa5GEyUklYV0tScWYVFDVelFzuvQG1bvo
	 egOCAhSzu56SQ==
From: Michael Walle <mwalle@kernel.org>
To: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Petar Stepanovic <pstepanovic@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Long Zhao <longzhao@ambarella.com>,
	Joseph Telaak <joseph@telaak.dev>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [RFT PATCH v2 01/14] gpio: regmap: use the correct number for .ngpio_per_reg
Date: Fri, 27 Nov 2026 15:52:18 +0100
Message-ID: <20261127145232.814492-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127145232.814492-1-mwalle@kernel.org>
References: <20261127145232.814492-1-mwalle@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting .ngpio_per_reg to 0 means that gpio-regmap assumes there is only
one register. If the number of GPIOs comes from gpiochip_get_ngpios()
config->ngpio is still 0 and it's taking over the wrong number.

Fix it by using chip->ngpio, which uses either config->ngpio or
gpiochip_get_ngpios().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-85577bd9-c441-47ec-b415-cd40acf50e01
Fixes: db305161880a ("gpio: regmap: Allow ngpio to be read from the property")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-regmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index ac6ad56f4479..65e87177baf0 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -523,7 +523,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	/* if not set, assume there is only one register */
 	gpio->ngpio_per_reg = config->ngpio_per_reg;
 	if (!gpio->ngpio_per_reg)
-		gpio->ngpio_per_reg = config->ngpio;
+		gpio->ngpio_per_reg = chip->ngpio;
 
 	/* if not set, assume they are consecutive */
 	gpio->reg_stride = config->reg_stride;
-- 
2.47.3

