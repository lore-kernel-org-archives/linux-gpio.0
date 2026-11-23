Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795406521;
	b=2bBMjVQORzT0isN9DPJXnaxMKipyPz2qctHwzheAoq5fmo2Lyvy8y95LLmHhyl0wo9Bc
	 ndcwmOnHsH7VkDdwqgbTMhsOMO6d9CY33/GhU+qHt5xN72eg2ctBdYFTzXdZLKqPhigFP
	 Bf6G9f7gwh8wW+yJiaizpFl5po3bujc0QDPO0COpO7dN8nqRhm2tdAONG8CWJ/EWOMtOS
	 08CWX7Bvs99SCrA50l8O6WcjkUYHnjf2PCmQaiVTGpC5uoybZVd8AdLz0Rd+ypfUnrd8X
	 VI0HzjGnBAxh/h/vrOZ7+fraAh8vSw1mbGUTDQtYCbYimH3SeC9vCha+o0nTDSb/cmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795406521;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xIAsVGVtPyP9fXWaXMVuARlUn/cDK8XAuH8s23G/FDs=;
	b=m+rB/UJ8nmtWsZU+z0Mqc9gGYYkicFx5mj3iM7XZVHFSFw0Jv0ZKS/6bNJfgdWq0ynpX
	 y5Y1DO+L8N8Y8QS6RLsTE6qCJ0axmOmfAR+KNYxSUzJVpTtDJELyIt0zB2/2Cj2N/ggR2
	 qMohPhUxB8VRzV6AI+NSpCXkWH8CeoShAXk7bSmrctmt4ttL1ontF7Z1LcGOtV7O3KvJb
	 irA48BMUd2Ya3Ch/yYo8p8JQAl8AvSDXQlka2mZgu48yIIsjgxkR9u/OsljHbFRYJWnbg
	 MGIRp7Ct1gGYtpeNbWbwGa4XQOW5nmYD0ZEsRE/GsqmTVDBKt6jRe1TlYWRTnpPrhgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBF6606A31A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 04:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EBF6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4fb5d96b3so41510507b3.1
        for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 20:02:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795406520; x=1796011320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xIAsVGVtPyP9fXWaXMVuARlUn/cDK8XAuH8s23G/FDs=;
        b=vABu8oFxwb59xddA+inwkCl/TVg95iP7N1JMUAwVnSVB6wox7+tq6wQ9xI6k7Q8xQr
         P4EDo8cJzsZ147CsGJPLrXRiZkF36sZ6vXoySk5jYIswLpJLfqCDuSKPNZ2hry634HM+
         DwXoxVy16Zz6WXzI2bkxZKYo7DkXXPC9613ROTxuoZwMxiDs78isA2bph5sna/xfX01F
         ka1IF3wpuCPPM8oN2grElPlrfKO8W8wkH7LnAuJGR+RCgJR4jKR/N9CChxgXI4Q4J2i1
         n9fdUMCyQaHJXdVlLmmYk+OTN9kKCuDUukpTDQBTFVIHpMkXpKXwMo9+xnxQ/Ni+KlHS
         p4/A==
X-Forwarded-Encrypted: i=1; AL+hErGj8ei85DULRzXU2qCuml5xvjsBp9Gf8r6tzw0gPuVboNcb0BfxXHrxR3CaGENLeLnBZV1O0Bd7puI1@vger.kernel.org
X-Gm-Message-State: APuU4Z96NQFsOIaZdc2q7QfsjNYyx5bVMKnxOeg6TWEEqXiCGZCDbOFs
	0D9K4JdFt/9Z3p0ZAeiH4Z7uQyEicVQw+gXCOTNSNDTDkQ0QaVDMhgmuKuQC1XaWnl4=
X-Gm-Gg: AZFdTZewTQ9pDDbS9xcTXgaItuYdGKytomBBuRHKpuWdNoUTbQpyqoJ0KptnPs8AfjI
	hx9wrDRzM9roWcpSzjnCHnuYm2hznW49KHqa35QYGIcp2AGH6zJVfsx5EFTpS3LjFURfkZ8ufcs
	/ff15krPgtp0Mc5OnNBREHAcmafb04zGsL9ZRj7hO9cRmEkac7zQJEcpMmLUpifVXa1NdkBxmrT
	xG8TVkM6nVHeCZz8oFx+vccgGUtXl18/s/T5yj+iqwHpD+9uQ6HYqZaGJXmUnbNnvzx1FxO0rn5
	A9eHkB02Cfga7boH6VbfGAl0ZOlnhy67pxfz/M4rg22on4MoBGAzlDAwf94RyK04KKrLpxaF23+
	YlGWPKFoSgT0vAkCWN+mqsnhkoh7uRl2SSrhE4khJKuW1nrX3qfwPm+SHbOMkel4hVuva2mJqJG
	bY7G5m2ZinokgFb6NHSorXEOHBpoI90RhdCL8yVqzLDikNKxOHqMLvIf+gho4PasTHZWVPYu+bc
	7ak9dgXvwa8QspUvLzLniejBamVmqLX1fhBNFl6U5HWdpOa/plDSQPPGfPEuSIMYPzO+K88tnAo
	cBAZzJG1U/daYhAZ/ofaDQjpCUsBMmmWTvIq8ZmDC3Qsmao/xYo1WADSeKzLSCOrrklU2sc6JGT
	td8ePQRN4Z7JDtBG5mh00N/wvLRqpQgZt26ibABU34fhi5Kkl+ZTK
X-Received: by 2002:a05:690c:c513:b0:8b4:e4b5:485 with SMTP id 00721157ae682-8b518f791aamr44178197b3.32.1795406520494;
        Sun, 22 Nov 2026 20:02:00 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028d628sm40344847b3.8.2026.11.22.20.01.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 20:01:59 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: sashiko-bot@kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] gpio: Add Siflower GPIO controller driver
Date: Sun, 22 Nov 2026 23:01:42 -0500
Message-ID: <20261123040142.48880-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <sashiko-outbox-228534@kernel.org>
References: <sashiko-outbox-228534@kernel.org>
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

> Is MACH_SIFLOWER_MIPS defined anywhere in the tree?

It comes with the MIPS series:
https://patch.msgid.link/20261111-sf19a2890-mips-v2-0-36730fa4f5a6@telaak.dev
Only the SF19A2890 is supported here; the RISC-V parts will add their
own dependency with their compatibles.

> Should sf_gpio_regmap_config set .use_raw_spinlock = true?

Yes, v4 will set it.

> Can irq_chip callbacks dereference priv->gpio before it is initialized or
> after it has been freed?

For teardown, v4 will follow gpiolib's own irqchip order. The chained
handlers will go in after devm_gpio_regmap_register(), and one devm
action added after them will remove the handlers and dispose of the
mappings before gpio-regmap unregisters. That will also cover the
undisposed mappings.

Probe is harder. gpio-regmap takes the domain only at registration, so
the domain can be found from its fwnode before priv->gpio is set, and a
consumer that requests an IRQ in that window passes NULL to
gpio_regmap_reqres_irq(). gpio-rtd1625 and gpio-axiado-sgpio are set up
the same way. I see two ways to close it:

  1. sf_gpio_irq_request_resources() would return -EPROBE_DEFER until
     priv->gpio is set (smp_store_release()/smp_load_acquire()).
  2. A gpio-regmap change so the driver gets the gpio_regmap before the
     gpiochip is added, for example from an init callback in
     gpio_regmap_config.

Linus, Bartosz, Michael: which would you prefer, or is there a better
way?

Joseph
