Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039184;
	b=Ex7awCzGSjp/qVHXkHU+QVpiCcZmBUdoEaieYIOpXXm2NpLxYtiDuHKDc60WczqqrcAC
	 bqVOuPGoWIY5943RV16IlD/6+MM+76h7IXLKtxoSERIDG/UlTt8T255avOeFhOXLnl+zU
	 dBH9JxwTBQwZfm3TZGSIxwO9h+E9OE9ufrbAVAeVz9peripawQGgfBLWax+8S1+itbHQA
	 RpauYK1vrRznidNx7MwlNpQF3Xejkp5vFQ0QGXgUxfGXRQ0YlTkKjvhxaOp9GbSuz2unm
	 jdjASMoBhSAeEB66TmXAOezi0D21v4PwFWOwqnvwIXzZHaZGax2mdQfwq5qmExxP3Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039184;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=TrlYktlz+QB1WmS75vmLbDabB1fj4HW7gCbD4G0RvVE=;
	b=MnXo0W9vqDIcb7V1Oxoww+6pE5qN32wg5quoFlGNCPM1J3lkhnQ0fY/bQyt0FSkEhEkI
	 Y+WO7zuxn6KID0Dds7jUsgPzKm+Srj0SQDRKHjY5ld6U9kt7CIVp8KMKkuVOcySX/YLLI
	 2ab8Nboq/OSljTHgoQKMaBlmQSQGIMl+ZvFSDAX6f9cpv7wxwFdGq6ZwwX4Njawgym2Im
	 70DE61VB4L9txAHMQys3c6ZrzCblaTYDYJgrlYKeuCpKzMGxRAZ/nYDO5vxCnfsqlNu+h
	 ILuhO5hN7IrG3fcwtl1GUnkuSHzNwZHeOK/nSbfUrVb1JBTQOZyQenVr/VGdTaablpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DEC606A32C;
	Sat,  7 Nov 2026 08:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32DEC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jM81Q6Kdcz57HS4;
	Sat, 07 Nov 2026 16:12:58 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 6A78CrQv025375;
	Sat, 7 Nov 2026 16:12:53 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:12:55 +0800 (CST)
X-Zmail-TransId: 2afb6aeedd87fbd-8ab64
X-Mailer: Zmail v1.0
Message-ID: <20261107161255426IYcq8bz4WVHRTuqOH1BUA@zte.com.cn>
In-Reply-To: <202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn>
References: 202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn
Date: Sat, 7 Nov 2026 16:12:55 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDMvNV0gZ3BpbzogMTA0LWlkaS00ODogZml4IG1heF9yZWdpc3RlciBibG9ja2luZyB0aGUgSVJRIHJlZ2lzdGVy?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A78CrQv025375
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 07 Nov 2026 16:12:58 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDD8A.000/4jM81Q6Kdcz57HS4

From: Shao Mingyin <shao.mingyin@zte.com.cn>

The regmap config declares max_register = 0x6, but the device's IRQ
status/enable register lives at offset 0x7 (IDI48_IRQ_STATUS /
IDI48_IRQ_ENABLE, also listed in the readable/precious ranges and used
as status_base/unmask_base by the regmap-irq chip).  regmap_readable()
and regmap_writeable() both return false for any register above
max_register, so regmap_read() of the status register fails with -EIO
inside regmap_irq_thread() and no GPIO interrupt is ever delivered.

Raise max_register to 0x7 so the IRQ register is accessible.

Fixes: e28432a77365 ("gpio: 104-idi-48: Migrate to the regmap-irq API")
Cc: stable@vger.kernel.org
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpio/gpio-104-idi-48.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index fb017569cf..493d1fe708 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -78,7 +78,7 @@
 	.reg_stride = 1,
 	.val_bits = 8,
 	.io_port = true,
-	.max_register = 0x6,
+	.max_register = 0x7,
 	.wr_table = &idi_48_wr_table,
 	.rd_table = &idi_48_rd_table,
 	.precious_table = &idi_48_precious_table,
