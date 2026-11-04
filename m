Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821554;
	b=jzJjC2qy+3I41M5Izoh/VhKvbeZYqpLK15FK2giwpDFZqUGoc0nnZ5HXhqpJ3gkQJ/6h
	 BSl4V0eQos9W8aiPVirqSP1Z+kikjhPKBqEdejXa/rv2/9L6F+AREQ6uc3skm12C3m9+P
	 rbwcBT51PO39x89KRstGUy95RdaDc4GH417y5ozfw/VvaYbBFpigMDooR+Q/2yplucAfH
	 BU5+jA7rP9EvgMltrLIpM8rZv7Pacdc+5fFBva886vaGzU1g653JT6A6h0zGiKUgJkEWw
	 6QR0agKw7PtSazDw0+s/c+j0c4X0CjSjJA5WPGY/BJeWoF2M8BmCvuHODKsu7RPtseg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
	b=V41fvY8AHJ2TaeHUrdeOR2FDzeGF60XDEQA8bXZ2b16UO90aCTWy4+fggPIwA+UWUrYE
	 q40aEJnT/Dbk4n4sK7hRwrn5Osh6oHgWOP4Yyac6qnYZHWV0g31JRp8B3oJhtws0zimfe
	 VSf93+3qNasjd3bkPACNEr2cqAmMSClm82TR0S89NVc7w29C6bAQsRZT5iBRSTrEDxpOc
	 XL5pA18Cohi5RYlKpjoTQ2uAGfe/BG0vam49VKQbmVnhp86/6UdMxQ9jymeR6X2nOHfft
	 s8/Qb/A9R06QLmgjK9oWTSFqyW7R+MwjP32zwjyz9JCQ1A6BBojRvKf0YnsnqmCM+Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhgChsRR;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155C4608337C
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 19:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 155C4608337C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhgChsRR
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1adbf62dd31so1554464c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 11:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793821553; x=1794426353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
        b=PhgChsRRxoaFlSlkRP6+eJT4KYEi14DqTMP0leDLu81FxLUk2LAC65QwDPBooqvAsn
         iH6XkP8S1MK/SwZxO3AJkItw8VOGPpqeDmiiYKv7myO0lnlZgnop7KC9K2NAgM6ukplu
         Gjsdpkx1k0Dhr49FqliSxtq+PV7zOW1rF8RqXf/q22186XabS9LOxL3XW958WfiYw+PV
         JBjD6srBvq+hK2XBFDtCmpOIf+gS9iJ5nhxA+IIgHZhp3x3Dcb+TLxzecX64kH4ggJZ8
         fI8gag+0WQBADwjfb6rFBnw2H4YR37v7+5aiBzykie/3yy5MmRaIYgT31jdFJ3lzFtA6
         N3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821553; x=1794426353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
        b=xGB7WjSFAkp5yQSu3juxtjRhCi0ZhTMVeC/k7N0GP3UzS6qg81hqHMwxTD+gRe+blE
         rW4oyXawTM1WJnlBCqsmONSIOMcB2EkyijO75j/EonwzJs1WLtdGkn/S7bIvwrpPqCtY
         WhB2eenhAkCsZKAIT/zQBjuJbuXayqgw/hFD3TJg1cMS5yYI/xDTaSeoI5mLbxg53O4r
         A+JTkl1IWYLCHMr7mh2yLJN/+v9RyQEvuxtk7dNx8bjZLVply6E9rm8FRxTKdBqAj43h
         3gdEuTwyG+oXc/t5ZbiIWlMb2tZHRnqeBUxX4dBWKYOvghc8EuEvI7ZSlbSYavzSP746
         tG3g==
X-Forwarded-Encrypted: i=1; AKwUvBy6ePkdDaC8XS2d+biyLHBbcr1xQzT30Ok9m3jPy7UabUPv3uxk9r+1RxekGcaL+/XByqTXflHvHg8x@vger.kernel.org
X-Gm-Message-State: APuU4Z9zvaDvis44TfLWWd8gUYlFFQUVbiCwhmtPlb82DbRrOi/vccu9
	VJcNhiyThnulPUOox98OHfcueP3teno/lG2TS9Pwl7gQ3DYFjTaC9eA=
X-Gm-Gg: AYBFou31Ek19SURscNvv6OuiqTJwGWX0weOZ0LxDARN5sX0lhDQ0NakmHIWlSifwGDx
	Ugtn4psCbW4WzgImMVAtqEz+5Dnnk1Zs0SNsdxrWkRU3VBfR3mwz6u9X/Ve+kXyAYScLokvE+iu
	LgObsPtXF5d5tkvouWj1Y3pXyD2cu6ybpPtog8LyI0dqCSpg92SHfrQrjsQCiZdQY2e7gLK3HQG
	yfiYbyoOWK+xCT0zS8Js/c9nz1fK5JTS4MqjLaXXphXaM1JtaGE3N82zYQvqtngOx9s0mvp0mJw
	VMwTiiMyxrxQACdQnePi9yOrU21fsHfNkNtB4AbvRlPl146UtTaiYVuyXiP7rUNfW8ONTgpohgt
	fSJ5ICusXXNPMIdK0qqDTy/qWVc5OnLKl0lailIyMelputn23pC67YbkJfKc+/auLQfecAsqC8C
	zNOsd3nq1wTglrBwkpdlA7oemMAGbyU0kpblo88kiq4eAA+CjPVrdD5d8xrc5wr3WbmbzUUS3kL
	nMRJczGX9n21zsquNvAu8H1uBHgzEPjlLB8WjK8bBl2Luhd1nmXWVEBR5hn42/15g/KcSS6x1Ns
	umL7oSbP8QL+f4GYyuqvURNMSvEeM1cGwRJywn3UQl3z5fnUqCogMohz98Z+KBtisw==
X-Received: by 2002:a05:7022:3a02:b0:1ad:e740:e51e with SMTP id a92af1059eb24-1ade740e699mr23857533c88.42.1793821552953;
        Wed, 04 Nov 2026 11:45:52 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.194.66.249])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm8652168eec.9.2026.11.04.11.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:45:52 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: jic23@kernel.org
Cc: alexandre.belloni@bootlin.com,
	andy@kernel.org,
	asahi@lists.linux.dev,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	brgl@kernel.org,
	dave.hansen@linux.intel.com,
	dlechner@baylibre.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	griffin@kroah.com,
	hansg@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	j@jannau.net,
	jarkko@kernel.org,
	jmorris@namei.org,
	keyrings@vger.kernel.org,
	lee@kernel.org,
	lenb@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	mfd@lists.linux.dev,
	mingo@redhat.com,
	neal@gompa.dev,
	nuno.sa@analog.com,
	paul@paul-moore.com,
	pavel@kernel.org,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	roberto.sassu@huawei.com,
	serge@hallyn.com,
	sre@kernel.org,
	sven@kernel.org,
	tglx@kernel.org,
	wim@linux-watchdog.org,
	x86@kernel.org,
	zohar@linux.ibm.com
Subject: [RFC PATCH 00/14] Add macsmc support for Intel Macs, replacing applesmc
Date: Wed,  4 Nov 2026 14:45:32 -0500
Message-ID: <20261104194532.8259-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101010737.203951cd@jic23-hlaptop>
References: <20261101010737.203951cd@jic23-hlaptop>
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

> Are we looking at ABI changes as a result of this? That
> tends to happen with split ups of unified drivers and mapping
> them to more standard kernel subsystems.
> 
> What is the plan to handle them if so?
> 
> Thanks,
> 
> Jonathan

Most of these changes now expose the stats using standard api's, so this
should not be that big of a problem.

The worst possible thing that can happen is that, the user will have to
change their fan daemon (macfand/t2fanrd to any other standard fan daemon).

And also, sorry for the late reply.
