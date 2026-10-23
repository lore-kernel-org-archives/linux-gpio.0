Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768344;
	b=cjDDgiCwab4cSjt2eW8P6lIi143u5BqE4Xy2dFrrpdUtj91qYsMxce2BHE1bwXgVkaFl
	 72T0PZapP7Bj7orNstaKzBNBALVENrLjT9Qz/6ahVP9aeagSuf93ftfYJnKqTU9LejSSJ
	 4/T2ywcsWj1b0SKW8coutnM+f659x62ZFOq85GZ5StK/eszaTvzNUInfJRG/mbk2aWza7
	 22pnQOz7/cFDaX16k3MlEy//TiZGKEieitNTv+Tw4BrowrIcYc6vya5FOjvWVa/DVycgk
	 ZTkZWdCjdMoR1v71UNXSLEKaj4e9DwEOYvRvlB/aYRPKzi0SJCO3zGp9d5wuhfNJLDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=i2DdF1NogOAu0rP4dvG0xeOHjMzgZXCJsumVsORls2c=;
	b=m9dplvUQIOVxvMJVl0Zek45zrAwQ/NDt2jtsFbGPDLRHxG8v70bmfP2vbgl8LKI/mfqq
	 Ccv2tlRSvXHsC1Y7OVmHovESZ6k0jCeNcg0moxDlLhG6q1fyOCSrIbu4YEpfhR7RxCbn6
	 7GoDJ0pxY1zeuVffm1PyYOgZAO/jeOF8NcTjRlCTM7l0axf5xyTwlG76EaxYcgR2PTZo9
	 HrJagVXCEjf0S0IEhNWpGjyBFJ1CYtvpLFhIs/+PpgL4u42dWDV/Hvwrjc3BMYWIVz7tG
	 5dg659MU5VEWRj9TUzIhsQg3mnX5V/wGuPFWCVOhigJEh3YsRZ14ib3PkNTJRMlp7vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nepXCm5S;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDFD606A5D5
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 15:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFDFD606A5D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nepXCm5S
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-354ba08cfd1so1725312eec.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792768343; x=1793373143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2DdF1NogOAu0rP4dvG0xeOHjMzgZXCJsumVsORls2c=;
        b=nepXCm5Swo/3Ms1WrVitqAVhv3oJ0sb/g8QnGtg/02BKuKTwTUer6qjjmQVa3bPs1k
         /jkLm+EF/zOJLoUDfPjkO6NEVV+0sQIBCW4JFP4bYDwVj8ouVGC0VOBF8j6JvibRO9tO
         sn2BpN/POY62N4zf/JFZItb8l9UFSRZXVGEDY2/pPNamj2UI7NyAkfHbYxBIbTiDv9V9
         c7szMB7veCAnOxZeMtJu8lobCPi2wh0eN2tniRUa8Q/XWSLzw+ZFyFRNeFyV2EmwOF1R
         MH9tIhTk/YLB6jFRFz9hTqvzDqpsQXmDRJM5NmmQsYC6kMJ1cWsKfBo/ZsJxdZJZAyCs
         U/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768343; x=1793373143;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i2DdF1NogOAu0rP4dvG0xeOHjMzgZXCJsumVsORls2c=;
        b=PMnmbmSKedfWBxDJo+tMYJDgJtEZCB0X3NY0FuKVwtNyguhXwWXfh9GQmFayFZTqSb
         UCeUwJ/jENHqsZgz9PJ599wKtyPEeZcNfln8UkskomirV9STjMvmKZzUniCKEiWEW/W3
         LSc1vohZjcr179vD/KHQkzwlAnX9iudVa/sfTGDfsj7RW83CD9cGL/xLOaunLSwh9vgd
         joxD5jHOHJ/4zElWmJt0hYzW7kwZUm2o25UTPZ7SjgP+EMrW5PraRSKn0GYSzdxmo5wv
         WDBFUEvZREVanTKqELphPkdlSpacV/72IB2/i4SRAcKkdICr3OtBY6XVvTd95dYCUfb8
         T+BA==
X-Gm-Message-State: AFq9FYJb2m6igsHagy+3S6flwC8Q8AzRMQ2T+XFJspLvvKmUr3qN1oiV
	w62dK5DmNXyGuM5ew2jmoi/sFKK4EYOsNBFhiZ7gbjXddJawnjI95bwgfucJXQ==
X-Gm-Gg: AYBFou2eakdkdE31P2moMd0rZero446XJfBE6tpVzyHXCO8ko/x2HJkr5kv0VOmnwo7
	uTq5Nicxl/ECyhKBjcqGtuzIQ6HYVnuFfvtlYMLpHEWkTTE6/zC1jWbHClaHF86detSAtm6KEfI
	+e/kifoCA7q/W5BOGq0M0eM5k4xUfth8j0+rIxmlI1L42eCBx+nZ/wXE+xQ2SNvo5jx0+wYs/Qr
	uPR7w1OdZSEc2/fIwoyjycsYBBEJWpHDkgd1zDjqLjoUCATgnThR/r8kTbwcbsDbH3HRsSQDtYf
	yKwtRy3k9wTrKaqopu9x2+fj7TKLvOMQ7FAwN0ZsGZjUPaFzVCwf2FTMPyiUGnaf8gTFyNDq5je
	Q3uUCn2das/GhXcOtX/8OP6qSRAyNAvcz1CfBopXO7uRol3Wy8i89eispo8PeYRMIfSWrXk8Zd8
	Cf0iro5lMfw6VGK1MLjcqsdt56ZS67pIy9Z6n93F6AcN6194151HNMT6F3IiA0kAvgNGQ/rwoLn
	umdqpvvyr5Yi+8daO8KeorNqdHod2YfhTWFnoNeiTaeTuc9YO/jmils3eHr0YT3MEAbO7Z1aNvp
	bZ8vG2Z+G9UBPHN0rIw38Z3KMUKFx7DnEp2nLA==
X-Received: by 2002:a05:7022:2511:b0:151:7f08:5961 with SMTP id a92af1059eb24-195c0180fc9mr3997851c88.4.1792768342629;
        Fri, 23 Oct 2026 08:12:22 -0700 (PDT)
Received: from localhost ([220.196.228.78])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-197ea7d28ebsm721053c88.6.2026.10.23.08.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:12:21 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Liang Hao <haohlliang@gmail.com>
Subject: [PATCH 0/2] gpiolib: GPIO line irq_set_affinity helper
Date: Fri, 23 Oct 2026 23:11:03 +0800
Message-ID: <20261023151209.58772-1-haohlliang@gmail.com>
X-Mailer: git-send-email 2.54.0
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
Content-Transfer-Encoding: 8bit

Hi,

Several GPIO irqchips omit irq_chip->irq_set_affinity on line IRQs, so
user writes to /proc/irq/<gpio-line>/smp_affinity* fail. The helper
covers hierarchical domains with parent_data and chained gpio_irq_chips
that use parent_handler and parent virqs without parent_data on the line.

This series adds a shared helper so drivers can expose affinity on GPIO
line IRQs: the mask is applied on the parent interrupt, and the line
IRQ reflects the result for proc and validation. Product init or resume
scripts that restore per-line affinity depend on a line-level callback;
without it those writes never reach the parent.

Patch 1 adds gpiochip_irq_set_affinity() and GPIOCHIP_IRQ_AFFINITY_HELPERS:
hierarchical lines use irq_chip_set_affinity_parent(); chained lines
resolve the parent virq from gpio_irq_chip and call the parent
irq_chip->irq_set_affinity() directly. Unknown parent: -EINVAL.

Patch 2 enables the macro on gpio-dwapb (snps,dw-apb-gpio, DT chained).

Tested on arm64: sysfs GPIO export + edge, write child gpiolib virq
smp_affinity_list/smp_affinity — fails without the series, succeeds
and reads back with it.

Thanks,
Liang Hao

Liang Hao (2):
  gpiolib: Add irq_set_affinity helper for GPIO line IRQs
  gpio: dwapb: Use gpiolib irq_set_affinity helper

 drivers/gpio/gpio-dwapb.c   |  1 +
 drivers/gpio/gpiolib.c      | 79 +++++++++++++++++++++++++++++++++++++
 include/linux/gpio/driver.h |  5 +++
 3 files changed, 85 insertions(+)

-- 
2.54.0 (Apple Git-157)

