Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567967;
	b=R5m5cog7Yfsqy7eJLnYbQX87ZtWA9/jj4hzFiAGgf4O3rbZyFCCt7tu2Nl5xL7FKtURz
	 cxZc/fbgTkHOBu6MrgIhOCJ0cSJcJkeDsFsWJvR44Nsy5kuFzgJgpcD26VE22OLYZ7xAd
	 xmc4fzfZbGsqfOVTQAiCcFyDJUTdeVmfKrZ2ZBS65GWop4GUGVeN3t0lbXeBvbFu2CCdw
	 ZX+ObCTZh5t3x4gKJEcJi2OaShYvQJfLVlQ+rY5mSIAVW07GpfW6newIS9dxG4WVZPKBZ
	 UO6MweGejiiLtZM4gESP0dDcTWy5Mcomv1WyjO8IhuUKzTWhU3IknBgtWX2cejPlsJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XrW7G5FyBzep2SPN1JxS+delxFE3whqu9e2tanyOyU0=;
	b=l77VU8ePqvZT1wE/2HINPyO1bDeNTMcDWzlIXv6c0vIzPdBCmoqN7ykLM1jU6kkcyf/J
	 WybKJHwf9uOmHY6PhrEzsbM7Sf0bTb9B8DY+x8wObaFgj2cXQ/3A0Kop0IZsoxPeDdtr+
	 nI1mzjeCZCl+flk3pu64F3VqeVq5mn01RWi8JSx7/qmUbuDODPQwXxvC5481ZkuMPZNyx
	 tX3Xj1O65eNR1q0vXXyCAVagO9GGL4E4UV5btpf0WH71b2KIlh0dL1YsOGwQCuEGnDuNt
	 /jneZY96UxWVQKdC076ScmecnCuG3Jan93XmX7PXrXQMJ80/fl/gZJraGys9BJttTuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZY2nfALx;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AD260A5BE6
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 11:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62AD260A5BE6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZY2nfALx
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso5185905e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 03:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567966; x=1795172766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrW7G5FyBzep2SPN1JxS+delxFE3whqu9e2tanyOyU0=;
        b=ZY2nfALxjoIqtLxDWq+N83+aq2JVAXblAHXir6aFsW98BH9XPWBy4Y1gAQeaeXhRDn
         bjsUR8vRn0SfmxaPk2IvfN8uy87kSzl8GWgcOEf/HmuCQYg2THqN/zT2+GgmA2avUFm5
         Kyr+SBAkEExe5JCwvLzpJzZdFccOn/KAJ/7wwTFO9k0z9jw1ioBZmn6ZpuRhrwNUliT3
         QAqB7Vh35a1o9xUF0akov74l+QM6ziVV1YMuX9PqJ9YEMV02bL2GnWZUhfkfsoAxk+2R
         dI4PBC9AT36vP00ka2prF757t865oXHIrhPyNv3wdRxZj28+o1vZa9bwCFBUZYp3pgny
         ytmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567966; x=1795172766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrW7G5FyBzep2SPN1JxS+delxFE3whqu9e2tanyOyU0=;
        b=DrAlRU2cMn2de2PaHLCiuu7+TiMt0sKhe9N3p5c9peuKg/FFYyIqzT7sQ0uSrY9Bpp
         rciUzvJDxkajxM7jl9kAMW7hI7ReF0cqx2DUsh6nCv83BULvaf90nVBakWgveyzwzyMI
         B3Q6VM5L3v45o/9IckHQT/1ICS3SZhsgKZqAbVs8QV69O6ldrz64fNAo3Vj2WmlVYA7O
         ROvE4M43dbSj+2w19kg3QGr9SUzIJMvWkSVhD4i4YbcUSCmfL+0hF19LCcDI6Uxz88yL
         BQ5YhqixXU71HxkPEHDOK8VwHJNSLcGo1V5+NwCCFP/2EI4sQmjXQvvDUolvNUZpaTDm
         ucWw==
X-Forwarded-Encrypted: i=1; AL+hErHHpv6jFChuZdp8SxBSsaW0H2oyCDbOX2M+ewnXfBL2a+n9NyVL5VU9hnLn2mceR1v+am7EbeVt9ZqM@vger.kernel.org
X-Gm-Message-State: APuU4Z/sBghUu1o//8OUH7mhpTjwrLWhKBiyQPC3I0jzyfatknCmiMLq
	HmfBZTrhC9XLi1fnXguCrMPhUW2sXMb+ePok7f6iW9vmaQz65MK1TFjlnOYhIgUC8kM=
X-Gm-Gg: AYBFou2KownistyphI0J97Tny4xnSjqt8YkrwAnXyG3zwy9EBH5fxxCZ5d76YrpAq48
	j8JQEoqKy3zWNkk4p2IBoFtckJKbk/mVs0rSc41JhH6TDSaSM4C38JFDbwGeQ+YMDlj/cLRIXMd
	agkg3VE+EuBtFxfA+8qto41MidYUk6jCOgWzeYVPODKRJyLJXMOapNmGr3ri6lrKFvYSi5jqWIH
	wR2NHV9aBcl7v898sewMUq2Qy9fnDYciblvTu9kecKC1AZzBX5f2DQ2GiX+x3/KXgoe1Fbdn+Vl
	BQFl31hA0JgCqV2UfqOSOT41p9ZP5hsq/26XopXSskqquHmD/SQSI65cruWsizqBse11Lk2BQ16
	1MPeblEAN6a8Lkev37DrvVOuKjxQFOO0OXh1dOuN2o282EhyRSimv8DDNMGmxCMtUp/1afBPc2M
	qg5xWFHMWwBfhM5hPlpzhAvopdSPXdueOOwRxOGC9y3q13PnBserRrSq8waBCumRGAltNO6tug8
	ImDebNahQ7ieWs+2rfqD+GyE7/Hrn81/g1Emu48HcXqHEz+Jm20rmycwM4Zn0P+kK5cS/uXWFpE
	Ukzc6QP4+9LIlKSUdD/6MaQhLcIW+qvyAPUAUeKsfFms3LXrCg8=
X-Received: by 2002:a05:600c:3b16:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb55ab4493mr46428875e9.35.1794567965726;
        Fri, 13 Nov 2026 03:06:05 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2969e7sm128332475e9.10.2026.11.13.03.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:05 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:31 +0100
Subject: [PATCH v2 05/11] firmware: arm_scmi: stop reading past
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-5-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

The transport cuts a reply larger than the receive buffer, but the iterator
still reads every identifier the reply announces. Return an error instead.

Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm/scmi/pinctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm/scmi/pinctrl.c b/drivers/firmware/arm/scmi/pinctrl.c
index 18761ffbf893..b071d31b5c33 100644
--- a/drivers/firmware/arm/scmi/pinctrl.c
+++ b/drivers/firmware/arm/scmi/pinctrl.c
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

