Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725228;
	b=J9rPVFnz9WZvBTlQNA3pVhmez/C+RWjY9IEIJpHR0lsnnNO5FjWliu9C26HVU5CWwzBw
	 KCJTY6AUhWYakK0eblelxQ0Oon1fhS0YGFLZhXmDgGB7cNZ46w1bHdLht9Z+oqgsgqbr4
	 eAz3iOddgoXRW3v3W73LSKyR7+eQg1rDeOc0BIAh3XF4y37EkJ4vpkcheREbXcWVn/aLU
	 HTokzgzodDNUi7W9mDcEMXyg5BMNxIgv0Nkm2CKa8hy2Xsc/+uSjivgBobLEUF5xBejrP
	 ri0YGpore2JFaBJImz8eUzfGEXYIO2RZJ0Lq/XeRMuWeprMfc7DVMXdDyDim1aVFetA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=PPjhTscMvfM24X1rYGzlpf74+Z30vVLRif1XyUXWgAY=;
	b=E4yYqR51l3WjEgGUpXUEszkYdkob1pXcmBn0ONpVh19w1O/QhNDq/P3eFOMNVcX+JLy0
	 JAsRSmVIFxKN9RwrgRDvOh0dv3bwCi4VhxErR6aes7PpGqdsRFk/IbBog3YY+LYWqEM+8
	 8FGUaWGj/QfOv2RZDNOf5+HX50b1JtUtsGMU1RrR7D+ELVWbyi+L66gDH/HtqNicdbWKZ
	 DIF3PZnfAzSQzVH88i8eW+JsuhfNSsFZpWUxbkSQhPt4TBJ0nnPx3xvHMbPwy4wvhzm8e
	 cbQuSOfZlQ7WaWcjoRltZnPfN7UgS1ByzMLbC+6O3kG1nYXoiHgcZtqYm6714pl6NBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WM5pywaE;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084AB606A323
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 20:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 084AB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WM5pywaE
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-862df509ccbso3698975a34.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 12:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725227; x=1796330027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PPjhTscMvfM24X1rYGzlpf74+Z30vVLRif1XyUXWgAY=;
        b=WM5pywaEWxaYrD196hNJokrEB0kNq4Sgdtp/vgFyeh5/CnEIhrEV5z73vSddNT3wRb
         9EaD61P+480eK1dxKlNsgcyOilbtI+sisc3tXIGoIn49HmscxIEJUYkT3GkTofXvcvJ3
         h8jp34Rwadfbehibssz5/wwEjL3IsAH94NrTwdVi5lXVGlQiJcBUloJPG6wemirmtT/1
         XklbmkhlchN1GIrqQnGqSN6KfbbKywNdZBu+0nZyYUQfh9Oal/cFBW31Jq+H4dc2hPnc
         CpJLPIo9tYgKDaEUH77jqvS0eScnBcDo3m4/ywOTd0DO1Ly5ztffWu9HN9zi8f2G+ILQ
         Vtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725227; x=1796330027;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPjhTscMvfM24X1rYGzlpf74+Z30vVLRif1XyUXWgAY=;
        b=VXWmj3MffmcepeI6knol95z290urtdkLBFpJGKglWJVYkiRe/7jV/Vw2MQf8HYaBpf
         PntO0SVRJIWywuIskAxK+bo61+8rLjiKH7s/7AZFXHkRWPxgsFKqCgUKA4SjYFsXXzTp
         e4D46clVbjRtad14xLUGrJuPBjwiyCnNJGO1KOknx2/z4S22X0B3ZdzSZVKWtuet9lXA
         WwX7gkhjc+8jqLNDHmrgZSvibdsLWDV9gbjJooPMAitjX+D4vovg2by93/7RMHu53pj5
         2OEw3oTulCEQ1lfGFwfSrBEyXiru9gK3wHgz0ceqWEKNQ08Ev5hCz6i06cFhKIUvMm+/
         /UOQ==
X-Forwarded-Encrypted: i=1; AL+hErF/8ltQ+uvQrbbMKINhGmbquUtheWTDkI91u04n9gJpbVQS1PCZ9a9vCBGRG4kmx0RTp039epXH7996@vger.kernel.org
X-Gm-Message-State: APuU4Z/+paURaWJqtJ6rTAYpXQP9v4HWgbVZTJnNwZtIppaHlJWDJ0qM
	tolXQMeqb1m89SLUqxgTKOKLJjbZ1Zqe7XXjUosKzLnoGfbhNCOL8jD6
X-Gm-Gg: AZFdTZessch+0jqBtLbB+Zt2Z29+5EQboGryONCUuKKc4u5l9zucvVDwfPqeIex91Hq
	YMgpyYDqSpQ/tIytn6hKs+n3fpgNpI0OFz8GXYXOaSiMVttiJQEBteo0hRg4JwZ7Rw2teDMidWN
	x7uPMQRqEsxyoShxC8m2kOoBkVd8N1rW3W4vpfkIp5k7iJXrSsEYPYx8PmeQrMoLs8eg8Qky91S
	v/yM7RgkqCMgqZiw4pfNfW9rjSyYFv84JzktKQj2jhbbnhihPHGlIMhgcCP3eJ4JSCa1b4uMJvQ
	copGMxvLBGSudAZhWhh9BLnYOywk0MVsnUR7AxD9/3Yj/WD92Q8W+6TT9d+/UJdMMatqDJc5zWP
	7SNSiMkJJeA5lT/gyqGtHKO6bvdc9sVmbB2yG3ixhHJ5F76gMKuaaH16qTA7brFquRZCZ0bI4da
	6NzWar9xzrbpn/ZHk4u2feYd5EY8mPDf9PsZBk3lqneCejKxUI5gMsJKbCwemzDWX8YXH0WBbny
	GLJcm7f2ARP2xXgcOmf+MFQbFTWMM6FxBvxg3vPDZ8ejUy8k2vDgO+Jxpr3w2aA8ZWtVkAcv4UG
	7XEw/S0YwQVguED+27aUabmI9JEYUQB+shgxZSAaXZtV9gn4slgI6XP97G29z0SIHjq94a+pwBy
	CpqAQ4A==
X-Received: by 2002:a05:6830:2696:b0:862:c9e8:5788 with SMTP id 46e09a7af769-86314febd1cmr24635150a34.0.1795725226996;
        Thu, 26 Nov 2026 12:33:46 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168c1bc5sm15139167a34.6.2026.11.26.12.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:33:46 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: alastair@d-silva.org,
	andre.przywara@arm.com,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 7/7] pinctrl: sunxi: add support for the Allwinner A733
Date: Thu, 26 Nov 2026 15:33:44 -0500
Message-ID: <20261125-a733-04-alastair-pinctrl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125115703.3724690-1-alastair@d-silva.org>
References: <20260910133519.459011-8-andre.przywara@arm.com> <20261125115703.3724690-1-alastair@d-silva.org>
Content-Type: text/plain; charset="us-ascii"
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

>    Adding a 2-bit variant (writing 0b01 per bank with mask
>    0x3U << (2 * bank)) enables hardware auto-detect from PIO_POW_VAL
>    and fixes 3.3V RGMII TX (also addressed in Vinicius Pedrosa's
>    follow-up series).

Vinicius posted a separate two-patch series for the same issue [1] and
later marked it superseded by my v2 [2]. My v3 [3] sets every two-bit
voltage-mode field to auto (01) at init on both A733 controllers, as
documented in the A733 User Manual v1.00, sections 18.14.6.1 and
18.14.7.20. Vinicius tested v3 on a Cubie A7Z [4].

I've posted v4, rebased onto the EINT-mux fix in pinctrl fixes:
https://lore.kernel.org/r/20261125-a733-pinctrl-v4@gmail.com

Could you test v4 with RGMII on bank H on the Orange Pi 4 Pro?
I haven't tested it on that board. If it works, please reply to v4
with your Tested-by.

Pablo's IRQ-bank v3 resend covers the bank offset [5].

[1] https://lore.kernel.org/r/20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com
[2] https://lore.kernel.org/r/20261106113425.28936-1-vinicius.eduardo.pedrosa@gmail.com
[3] https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com
[4] https://lore.kernel.org/r/20261111122013.35133-1-vinicius.eduardo.pedrosa@gmail.com
[5] https://lore.kernel.org/r/20261124215048.42074-1-pmazzini@gmail.com

Thanks,
Enzo
