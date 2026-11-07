Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039184;
	b=Ba4OuelmSR0CdvpPEqcHaad3YNFUvxz3Yd5FEgEvGRDG/09KHAcEbNuzH/KLu3ClSE/A
	 e5AMWGTXCEAwwE9gfqEHBf1esAkOGwWUt13q3T3TtifxU3ZOlBJAAJ+OUn6G0F55EKFib
	 m9ELt3oRVH4FilyjGjMLxVUxkZUAgY3yUtjTcEmBbcPra6murwHj0ZLW3btQ6wGGl7X50
	 j6cc6uUizN0Sw+5nUZKqKIu5zUWVQmEJlrGKxmyLlbKEgUSkiAbCu4aiP/wqkoHZjyAl5
	 ERpV/gf3qG2qfnsVGQ63I1snLMk3ZVC+PuPAQ+5bFuz3AjON/O5hK2ch4lbYhPT9m0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039184;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=LWMnkT0TZcrNPi5fFhzkJ/BjbqPv2tTb4jg9xdpl5aw=;
	b=hvAeMtIU+3DC/2xq9chtis7U6E/B+n1ux0igV6eQ0TiVrXs1iudLUFsZaDRGba5Nsupb
	 IcI4W6cbvTB5/j5wRi4fGAsW9YBWCrnwfQrOj4FHcMOiOwJQOmpkcoyETJ9LxFFFjD+p0
	 emN1Kx2UetdlxjfMDF13Cj8KYuNbMFxP6iWM1EOxYAPi/Jn5Qrx+Sq8mh3BokC+wW6C12
	 s42NHT0pa42CiuVYdrHx62EoARPhEgFCny1s/O/KRSTDZR8gNATHQz0diSPyali4jEa3/
	 MjVoyyggHhAyzrtk9v8+US/2Hs7colRq02gosAS01uNLjfma1g2NMjTXWFavE29kIoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D5B606A32D;
	Sat,  7 Nov 2026 08:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05D5B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jM81V5RHgz8XrrX;
	Sat, 07 Nov 2026 16:13:02 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 6A78CtJB025397;
	Sat, 7 Nov 2026 16:12:56 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:12:58 +0800 (CST)
X-Zmail-TransId: 2afb6aeedd8a0a3-8ac49
X-Mailer: Zmail v1.0
Message-ID: <20261107161258203oCy-Pa4_0rNe65TqrzFWD@zte.com.cn>
In-Reply-To: <202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn>
References: 202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn
Date: Sat, 7 Nov 2026 16:12:58 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDUvNV0gZ3BpbzogbGluZS1tdXg6IGZpeCB1bnNpZ25lZCB0cnVuY2F0aW9uIG9mIHByb3BlcnR5IGNvdW50IGVycm9y?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A78CtJB025397
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 07 Nov 2026 16:13:02 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDD8E.002/4jM81V5RHgz8XrrX

From: Shao Mingyin <shao.mingyin@zte.com.cn>

device_property_count_u32() returns an int and reports errors with a
negative errno (e.g. -EINVAL when the "gpio-line-mux-states" property is
missing).  Storing that into an unsigned int turns -EINVAL into a huge
value, so the "if (!ngpio)" guard never triggers and struct_size() then
computes a huge size.  The allocation fails with -ENOMEM, hiding the
real error; struct_size() saturates on overflow, so this is not an
undersized allocation on 32-bit builds either.

Use a signed int for the count and reject non-positive values.

Fixes: 2b03d9a40cd1 ("gpio: add gpio-line-mux driver")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpio/gpio-line-mux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-line-mux.c b/drivers/gpio/gpio-line-mux.c
index b4452d956b..19e4212de2 100644
--- a/drivers/gpio/gpio-line-mux.c
+++ b/drivers/gpio/gpio-line-mux.c
@@ -48,12 +48,12 @@
 {
 	struct device *dev = &pdev->dev;
 	struct gpio_lmux *glm;
-	unsigned int ngpio;
+	int ngpio;
 	size_t size;
 	int ret;
 
 	ngpio = device_property_count_u32(dev, "gpio-line-mux-states");
-	if (!ngpio)
+	if (ngpio <= 0)
 		return -EINVAL;
 
 	size = struct_size(glm, gpio_mux_states, ngpio);
