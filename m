Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324555;
	b=qmgUf093++JhP2IweKYMi4X+/E6xR3vzOKVabGizkfKMIq7SWQ+wBn18Oty7zhEX2JUA
	 W/o5R1/A6M/YHaj8fYsU/3zezhjeZ++JsnYu2uoUBmrMIHAL6rCPoNjRbHdRpqip7WsKq
	 cikcUCrW0ipbdecLol26JVd2xzdbcv0zWDMubv+kj4ItZ1bza2f1f5ShF8EiPhENLVNIA
	 l0s0uHZpR3OYfUVWCJp0dYcBh8mCW3LD0xUKAjyMXx8Q22FpkkJmLtxUm1g2v09E7545i
	 C0z7KkplwI5yau1xUMOSiB+u0Gfe4veKYLDjRvGtb2SNPukJflfmoOSB+ahcXrlRLWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=q06Tp2htaUPPNUDEEtHiSZgCYN6JMZNDET/mtMfto6U=;
	b=o3rPBAxJ7MnUZ8vj2mNNMuPSg3aVfQ4zmmwBqyX0p48ugKbwd+fbLjC44EovteEb4KhH
	 zxCUIAJYhbSRXyDbV6g4Npjo+eK2UEMYFxS8EA1upVBNIatLj7Sl6NuTjr1ScV/slKXmx
	 LkmUH9iwVeoeuPOUYLzG/cq1QIem6/+RTCFgoFYGbP1ihS61RGSl8GWR/8WmTuwE0/4Gv
	 Xkm5LJcwlKm1r+QVUuZN4WRdDCNJMbeMiIi9lllMzAPz16i8PbtGwobj+oO9sNadPcEvO
	 jpRqB7ANgBDGBZmE03WtOlbrrOQci/NrXbWtV5jVf4bQKg0TjdxteAgEwhqRzeG16fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b="0K/2NRSd";
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB9460A3811;
	Tue, 10 Nov 2026 15:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EB9460A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=0K/2NRSd
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jP9YP5cVcz8Xrnt;
	Tue, 10 Nov 2026 23:29:13 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794324553;
	bh=37cgLrRL9DY4aS0nbcfh4iJiu84rqjbhYT0l52+BKF0=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=0K/2NRSdiZH5wnL6DC/wlytNXwbwBKNIYCZoddMtyGFbkjd3sHzABpRkqDNI6+Hcx
	 uS+gqrL7ZXfDqXvrWYhNgce4EcnH7DxkWiGtlCeel0sfRXxPOikVmOi2/LTApr5dcD
	 D9cgl4BWcnUwqo8lluCpj2P8TnV5/evV9iz8EN4W/6nMImOh1BQz3wRwOdzZKRMPRA
	 QM1X7qxminSjvd/RVsh44BY1RsEOr05iXVYE3RiApQTHiZI+uP77o24hb8wTzfToWL
	 N0ceii/weW+B+TbB6JVw3Mn4yKaX/KUZw0GR9YG14/i8RbtkLwBfhfjpQm0NFmSbF2
	 RQqpGokohHxAA==
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 6AAFT2lg023883;
	Tue, 10 Nov 2026 23:29:02 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 10 Nov 2026 23:29:04 +0800 (CST)
X-Zmail-TransId: 2afc6af33840bfa-1c224
X-Mailer: Zmail v1.0
Message-ID: <20261110232904967-Z63K0esKmN29dOe90mk0@zte.com.cn>
In-Reply-To: <20261110232858050VtOdBBpXCW3UEgZXA69mH@zte.com.cn>
References: 20261110232858050VtOdBBpXCW3UEgZXA69mH@zte.com.cn
Date: Tue, 10 Nov 2026 23:29:04 +0800 (CST)
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
Cc: <linux-kernel@vger.kernel.org>, <andrew@codeconstruct.com.au>,
        <wbg@kernel.org>, <opendmb@gmail.com>, <florian.fainelli@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <jelonek.jonas@gmail.com>
Subject: =?UTF-8?B?W1BBVENIIHYyIDIvNF0gZ3BpbzogMTA0LWlkaS00ODogZml4IG1heF9yZWdpc3RlciBibG9ja2luZyB0aGUgSVJRIHJlZ2lzdGVy?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AAFT2lg023883
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 10 Nov 2026 23:29:13 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF33849.000/4jP9YP5cVcz8Xrnt

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
Acked-by: William Breathitt Gray <wbg@kernel.org>
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
