Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447294;
	b=F4rSYWY4/OK3t4mOsRdufBVUFLgjxnk7Lh+cP5lAHL/zuL0oBIj4kFi73uMTECGJqG0m
	 cGOx9J0ZJ2XxlIC8woTgRwNUALLfqrsjmSEr3I47QKKzUgAFm4f8F+cP1qdf5pextVNe8
	 YHWnyL9tZsIRyjsyo3Ve8U8gBC/uA+6WzADLXdbqRkPT6s1A+L3A7jtNJtj2uRBUL8ClY
	 c/g2Gbv4hBSN34KXNbgnTdlTeLoOncZW6hO/q0VvvUdLCteUFVXDVZV+46eVYloK7dkNN
	 pgs08VVkGHqroA14X7mAy2jzBO1C6SjafpbfdH2uLv+7kmrkQMdi/5D99+TDzgZOSAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iwsAiO9OeRwcJqZpa6akbJuZXHFjd4eG1osiYUVbJJY=;
	b=zLUlbb54cww4YnJhuZJ1lI5ipZnBvqCP/FTmfiZg+PwYTEuW6zCCGSXukclWAown9fUJ
	 E5Cu+eVeBZPJXGlNUyGC7UCvy9m/6Mxv6GCo4p+2FmlUGDUG4TkBQCjPEjToLahv7Zls9
	 O+FMPhZAHencT4O5mQ66HKePUK+XvwEitEKhgP8bJ9yDKimNeFBfelHNt7PY5CJxlZ7e7
	 5V/7zdbd0jgfJpcw2MbaADYsX1XSr7b9Mot1in24rw0amy9QeG2wgl3pxSRwul8vX2fke
	 HuqHBggFj+CmPcYnTnSpLuL0zhTgg8u/0Cin4F6IkO0mKPc8Q99eQGxblf8pQthkGEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Sevo7jMm;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C4C606A68C
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C4C606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Sevo7jMm
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so5292125e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447292; x=1796052092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwsAiO9OeRwcJqZpa6akbJuZXHFjd4eG1osiYUVbJJY=;
        b=Sevo7jMm6bksXy8/ba9SBgxeTty3YJuD8V9D7GKyrEZ0QtrcKNwUH5/coJbaxYDgZW
         qc50RSzmYf8z8Oci7vMb5EJi8dzR0M8d+Rz2Vx50+ey59Gzoi540F9sxJ8da3UnVJ47S
         AgDAWZgiYl6r/CKoRuILxpGN1ZlTaqYbySmIqlanUOG8AmflyconG2n4Zs0OGzWjOP9Q
         FZVBXCwhkVdoBNPJ8g+3YKAxXKS+dy+gQrIlXY/PTEejOAa0axYO8CFYl1lhI6kRFm7b
         CH/0MVMoRvSp4uFeEYUpnDbHRh4zmWCdhRCxZw1zFCaTf/pSjPsqulNV4l99PJ4gzo38
         gRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447292; x=1796052092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwsAiO9OeRwcJqZpa6akbJuZXHFjd4eG1osiYUVbJJY=;
        b=e3+ClThV1I7aAibLZwwHTGJLVCyHMhh6EWL1PjJQ34xTujrZmwpay2Tn4ZJV1D72cL
         0qPD4RWmb7ayd9xAWJcdiaRaUZrG6NDEPwsN3a2tduYRRhLO/q3rq6CNmOG4Wvlbwd5T
         Jg6Po0MN5l+nWO31o/bS6CFAa+q48ZOzfE8+NOAiXzc7KlgQsCZT6CrUpmarB6mGf/wi
         EzI3uD9byZ1WytgZKuTSbCjzdRPl6QFgbvt5wNtckN9VXrRoKbg3lQQD+4p8iCWEJYhD
         1jSSU2DNQrBPlFDvxiGcmZcf831aFoGeharZFPyy8FAEcwTVHaqysxc/7tcLfqntCQnz
         yJ7A==
X-Forwarded-Encrypted: i=1; AL+hErEQ69Y373Yc36yRIIRObNx6qHIN0Z4uZpAFPZy4lKD90qcpHLEwUPWBeW+7bJy91X7y+2Lr3zMqr+3G@vger.kernel.org
X-Gm-Message-State: APuU4Z+LavA2FEQA+ABNKJE5R64uV33mF77lsJfBMMa/OEcwRgWNsyua
	yje0KhkzXmz6W6K6Lluyi3J+6VQTSIGLNkLivk8y8BBXCSSuT5qIUXlqJkZ6O9saKtA=
X-Gm-Gg: AZFdTZcatxKdcDd48ufJFK7ZNWXedQbCwbztMTfEPLVA+LEWExuQsvtXFfww47TyL9K
	5GtWRHXM4CmKWzrJLsHor/nDFifY7l30mWPb7xWh0xoStxpSfc4T2+ctltGR7b92VA7cuBtfCJI
	13GvbjsdYsxLAG9AvqO71kC5/cOq3EyWNOoYRTcpAM6CR/8S9ADtXnOGG0IE8+ei1Sco4Qna8uK
	KC2WskX8MOqlwzEjU5ir7oLFlbSF9aqqytwP9FCrl6rAqsXfgq5N5NEoiCBhEyMsM6k29ZPyr8S
	JfztVv+LQ8NIrEJzId2sYiDsiInvDVfsDddBmEJJ2wF6zAPuf+SxR9QlHZ8n0yU5JtMpwaD7mOE
	e+mRF6JvfEAmNTQLrxjOG8pPcaJ7h44LYmjUfzXYkRe5alYoe35mzyvRmdnl87ZlJ6brOJ3y1iP
	uyEZYZnXT98jUR1N7AUvsTKIAMNt83qr/spY5bbvj9dQgvnMftCtKsXlawBQkSOfHqkmiwasToq
	Q5U1drV2CZHKwOfl1NSAoY9y4bHSAwxNzEdL2UfMGZxYPyVKKNeaRpyI0w5GYRK33m7ukJuFuRd
	nKbl/16RUlEOlFrN8SHdVwVebR80QUUzpY5GKtZ/mzoouwpLNig=
X-Received: by 2002:a05:600c:1d09:b0:4bb:6b59:aac3 with SMTP id 5b1f17b1804b1-4bb88816050mr253067465e9.29.1795447292523;
        Mon, 23 Nov 2026 07:21:32 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm351526825e9.5.2026.11.23.07.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:32 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:25 +0100
Subject: [PATCH v3 03/10] firmware: arm_scmi: stop reading past
 PINCTRL_LIST_ASSOCIATIONS replies
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-3-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

The transport cuts a reply larger than the receive buffer, but the iterator
still reads every identifier the reply announces. Return an error instead.

Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 18761ffbf893..b071d31b5c33 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -265,6 +265,9 @@ static int iter_pinctrl_assoc_update_state(struct scmi_iterator_state *st,
 	st->num_returned = RETURNED(r->flags);
 	st->num_remaining = REMAINING(r->flags);
 
+	if (st->rx_len < sizeof(*r) + sizeof(r->array[0]) * st->num_returned)
+		return -EINVAL;
+
 	return 0;
 }
 

-- 
2.56.1

