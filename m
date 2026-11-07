Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039174;
	b=vqeRsXuRZwSh3UCoqaGcC8MANfo7LbLNitTQxkXbAyFIlIiQATrTBquBDwOVz1PfY4Yt
	 2dfpy0hu74mziNfsbvGfhmX3TLEkKHgbLqChMjKBUGAWzTVXLZMxt4lzHwvDIraz39g+4
	 KbjFxzudZaHP0Kbd/5GT1YKYFGjdrnGo3rgBJCCGc7T38RY1Ge59bWDl9jRb3JDbJntNi
	 w9W4MHtkya2eVTvQkmvKd3PRvZKFm97/Pmyen6QeB9z8TOy7IcxqSB4IffsWlGKUkct4y
	 r4lQWLo0Y+ier4BtvnwFDIzXeWzQ/SiZpzwrLsZSFlHDASU3IKjYjAnCBU3HVbkzl8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039174;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:
	 X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:
	 X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=WpvuV2PrO86PTBgbhjGq5F23h01FEdz6D48Cuk2TlKc=;
	b=TZHFtlSdWhEcLJ0Om604JD1m3WhJlXUh3juTi+BosSy2tzR6Xse70t32BfyENvgq4Haj
	 Wz4M9/iAzjv/pCK0c2qI6OwIc71gtZwjjAVpCEGIQOr6XQtuQL0GsQ/LF7sddvGs4yW7A
	 2uXfKXaYC99tZsYsLLTgPudu76arlMffCQ5e0dwJlQla+JNHfJvkx27X0GjufTJ2a2rZl
	 Ajpjsq03zGLH7K00JoDyGkcDRInUG4JfqOLBHpowrVm3WsGDolSprShXcUxDTRbXRV3Ch
	 OMLzz07UWCMEAMgCrC6sDApS8zCUH+gJsy63Tuok7r+p5vMNYy1vkrp4GSq90GvNAew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B663606A32F;
	Sat,  7 Nov 2026 08:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B663606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jM81H45lXz5BNS0;
	Sat, 07 Nov 2026 16:12:51 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 6A78CiBf025360;
	Sat, 7 Nov 2026 16:12:44 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:12:47 +0800 (CST)
X-Zmail-TransId: 2afb6aeedd7fce0-8a887
X-Mailer: Zmail v1.0
Message-ID: <202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn>
Date: Sat, 7 Nov 2026 16:12:47 +0800 (CST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <linusw@kernel.org>, <brgl@kernel.org>, <linux-gpio@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <geert+renesas@glider.be>,
        <andrew@codeconstruct.com.au>, <wbg@kernel.org>, <opendmb@gmail.com>,
        <florian.fainelli@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <jelonek.jonas@gmail.com>
Subject: =?UTF-8?B?W1BBVENIIDAvNV0gZ3BpbzogZml4IElSUSBoYW5kbGluZyBhbmQgcHJvYmUgZXJyb3IgcGF0aHMgaW4gZml2ZSBkcml2ZXJz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A78CiBf025360
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 07 Nov 2026 16:12:51 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDD83.000/4jM81H45lXz5BNS0

Five independent fixes in drivers/gpio/.  One stops an IRQ mask write
from enabling every other line in the bank, two stop probe from
swallowing -EPROBE_DEFER so that the controller is retried once its
parent interrupt controller is ready, one makes the 104-IDI-48 IRQ
status register accessible again, and one keeps a missing device
property from being mistaken for a multi-gigabyte allocation.

The patches touch five separate drivers and have no shared dependency;
they are ordered by severity and can be reviewed, applied and taken
individually:

  1/5 gpio: rcar: don't clobber INTMSK when disabling a single line
  2/5 gpio: aspeed-sgpio: propagate IRQ setup error in probe
  3/5 gpio: 104-idi-48: fix max_register blocking the IRQ register
  4/5 gpio: brcmstb: don't turn platform_get_irq errors into -ENOENT
  5/5 gpio: line-mux: fix unsigned truncation of property count error

1/5 is a one-line read-modify-write in the R-Car mask path; 2/5 and 4/5
return the original platform_get_irq() error, including -EPROBE_DEFER;
3/5 raises max_register by one to cover the IRQ status/enable register;
5/5 makes the property count signed and rejects non-positive values.

All five are single-file changes under drivers/gpio/ and pass git apply
and checkpatch.  All go through the GPIO tree.

Shao Mingyin (5):
  gpio: rcar: don't clobber INTMSK when disabling a single line
  gpio: aspeed-sgpio: propagate IRQ setup error in probe
  gpio: 104-idi-48: fix max_register blocking the IRQ register
  gpio: brcmstb: don't turn platform_get_irq errors into -ENOENT
  gpio: line-mux: fix unsigned truncation of property count error

 drivers/gpio/gpio-104-idi-48.c   | 2 +-
 drivers/gpio/gpio-aspeed-sgpio.c | 4 +++-
 drivers/gpio/gpio-brcmstb.c      | 4 ++--
 drivers/gpio/gpio-line-mux.c     | 4 ++--
 drivers/gpio/gpio-rcar.c         | 2 +-
 5 files changed, 9 insertions(+), 7 deletions(-)

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
