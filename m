Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219715;
	b=2Pz7yj1kS7mbxjB9QLGofyj4W12WzxmGnYkh+J6SOcw4gOeT8no1Z1OTl/X1GeNPotlH
	 O4ds2T0VjqLdejmzcIoc/pZWVxWICdO4JY2zWrG/diNQzGUOzIseZnzzE7FCKGOV4Yn+d
	 jWN1y7JwoVLmixoYP7ajg0ZrcGvdHULPg/Dp6UYSWltkKi+vvd6bRptOxESZROMz3QpaY
	 la7N09L7THZIklZKd+9JxnylLzabqKBpZqqW8MklKr+YT0Pj9MwdULBCzAsg5F7NpW9rf
	 oWuObp5iJw6XSaIw58Ts8llOE4i78Ckn3LaJuQKVUrKsY6dolwnzfmUqQLR1oLJ7/vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219715;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=8g43I7Cgnwx1eonFXL7K93eWn2TK/exzsb3fDJyMmvY=;
	b=HqUGr0iw+CpbMmwoF+7Ou2gUEdVL1w8JH3/nB3aKZEqSajxnnLzOkOZLTdYuVCHE9XSm
	 OSpl4ZtaKPB0nB4UhUkn5mS7F1LBoLcjTzX4jJ/IaDGdjH2ZPk63v79pbSYnvHxWeFvxn
	 82rawt9ARJMVkL4muO3JVe0IEax/d8eUP7bg7d4V+/bkRgbBuxFjecX2Wk2HzEwbxTWQx
	 iAUm2GIUShNXhL/0Z4L4URG3OEaBKb9BQ9d0TAAkYNlsgBaqJMN+GCdD4MHSp1XM5UNhw
	 CDVklJVkewHbK4ywpGQif/5Qztr9fLQk3S1Qv79wFQB3ld48GekDA6WyCBydZsX9m7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=WCBIPYmm;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62E6606A31C;
	Mon,  9 Nov 2026 10:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D62E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=WCBIPYmm
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jNQn74RCHz5B13Z;
	Mon, 09 Nov 2026 18:21:47 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794219707;
	bh=fqAiLI6U4FPrPRNJ1BhImKvufSq1G9itncyFGqt+m/4=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=WCBIPYmmjByDuxMD32Iv8u16zdxODlUz4V0M/+HjJ1wVdBXcC/2zmLN7RrllO6HAu
	 EWfv/maadwFtgNv9cLtsEGO0omZQxTcjh89Cmk4yNA8E3MsDRTO01DHr7nB3qF/gS/
	 Xpe8LExQuXpuCsTga7CaEkr/kcHdnUtM84ARiSgfs8Zn3zUMN9lat4qrmWEkZdFa2X
	 l+sW5p5pPXTWVYqpafOb3rVOpofOVknVB/fS5Pw/bYtIF512J4eRvjlUT84LzOfZyW
	 Xl5Ub4DVcwMagPTUAhVmf3XpnId+P0znAoJSuVJiQIHRaAna8UyVrgkPzG0hQ/ATd7
	 KlSrmKjj8mZ8Q==
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 6A9ALidJ091273;
	Mon, 9 Nov 2026 18:21:44 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 9 Nov 2026 18:21:47 +0800 (CST)
X-Zmail-TransId: 2afa6af19ebbd80-03cba
X-Mailer: Zmail v1.0
Message-ID: <20261109182147347ZmJrB3jgSM0GHweaMxJm7@zte.com.cn>
In-Reply-To: <c9e116f6-ce3c-4cda-83dc-4e96c7d58aa8@gmail.com>
References: 20261107161258203oCy-Pa4_0rNe65TqrzFWD@zte.com.cn,c9e116f6-ce3c-4cda-83dc-4e96c7d58aa8@gmail.com
Date: Mon, 9 Nov 2026 18:21:47 +0800 (CST)
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
To: <jelonek.jonas@gmail.com>
Cc: <linusw@kernel.org>, <brgl@kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <geert+renesas@glider.be>,
        <andrew@codeconstruct.com.au>, <wbg@kernel.org>, <opendmb@gmail.com>,
        <florian.fainelli@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCA1LzVdIGdwaW86IGxpbmUtbXV4OiBmaXggdW5zaWduZWQgdHJ1bmNhdGlvbiBvZiBwcm9wZXJ0eSBjb3VudCBlcnJvcg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A9ALidJ091273
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Mon, 09 Nov 2026 18:21:47 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF19EBB.002/4jNQn74RCHz5B13Z

On Mon, 2026-11-09 at 09:29 +0100, Jonas Jelonek wrote:
> Nit: Please adjust to keep reverse christmas tree. I think 'int ret' and
> 'int ngpio' can be merged too.

Right — shrinking "unsigned int ngpio" to "int ngpio" put that line
before "size_t size" and broke the reverse christmas tree ordering.
I'll merge the two ints and keep the longest-first order:

	struct device *dev = &pdev->dev;
	struct gpio_lmux *glm;
	size_t size;
	int ngpio, ret;

> Maybe return the error if < 0, instead of -EINVAL for all?

Agreed. device_property_count_u32() can also return -ENODATA, -EPROTO,
-EOVERFLOW or -ENXIO, and folding them all into -EINVAL would hide which
one failed. I'll propagate the errno and only map a zero count to
-EINVAL:

	ngpio = device_property_count_u32(dev, "gpio-line-mux-states");
	if (ngpio < 0)
		return ngpio;
	if (!ngpio)
		return -EINVAL;

I'll repost as v2 with your Reviewed-by.

Best,
Shao Mingyin
