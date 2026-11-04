Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829115;
	b=nDPyO9kDo5g82d4W4kFuWbYyMAIYZ34WiQ/qbAvUaDev4No0hHva0v14b+Oisgtge1pf
	 JIcmP2Yt1ABoUzXJPROG4UJbXX2tEy+zXej1MMSXaJkCsuivzzMTD9DRWKR2chcmRfELT
	 HviliV8sQ7XFSVlNjM/kvpa/1wyoYvJm7ac9Nx7uVRFP04qLE2mo9Wste5vVEh9t33eLH
	 mqy+PqpjlSnRwjYFPcdP58aMZAksVmB3V8yGObpbjUnws5Vsc1UkHPaSxom0jBVfrVvMn
	 8ij1c11n1gaqP9cdiCRSf38FAyjq8JMUwN0nv3NJD6jnhPVTtVABgnfualUuxslj+fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=zZRdp+Pnl1LNEQ8jQE4bngp2jSFFakeXxxoedfEkBQY=;
	b=4XvpJnIJ5VK4hEscgWbLttxgKPrTT5L85u2telAArSXfGhv9zh8LV9Dc2RgJUgXrlaU3
	 9oal6aqy1dcfUziaesN3+P8PhLFwyXr1MDaTOu2ux+5ZEwdrIlRkD7JCHynmVAjydgKBo
	 SYm5Jsn8wZqtb+oUCrqQhJqsyeO9Xly6kVDxU+Gl5aOHLbfra9omFDxoqrWjD5xwZMxHA
	 AlDl7M8yuVO98CCAFIloPRQ6mSkIp9p08O8aawaxaMcYWaPetL+6X7rohWlhFO0IeIg4u
	 sk3kj035anzEuLsoHvN+rcy8faThNSyvMffodzbvO3e1uy+tdKhrStFRLEhAdrbrmDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gDOLe07a;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A506073513
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 21:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36A506073513
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gDOLe07a
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2653850c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 13:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829114; x=1794433914; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zZRdp+Pnl1LNEQ8jQE4bngp2jSFFakeXxxoedfEkBQY=;
        b=gDOLe07aeeSZo+hexjBhYUbSOKzXMNjSjUYplS9Gs2EAZf12Rozr8fHDc4iMibE+9B
         agPXsS4u/taQA9jc0rHGDEismieEaAw2MzGgOfNqF0VEY6pg16kAqDaRqA5r3Kj5Kbad
         BpAcp9jiBxrpqIZsaKHP1AKrYXaB5Mh9XW71/pdGWbBG59sjDD6NhyzUaBbKd2S98TS1
         GHmN+9IYWvZELtc1Hq7eCI1bNvRC0oKCBOXvLhvlgNPNFR6w3+dmOKWNW9CE2j5UNcW6
         NxSYVAsB16QglFwPq74tlWAdMdtqs6ogRLf6VG0qdtrUTCp/AQw/+y1M0gsbsm72iaWS
         tA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829114; x=1794433914;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zZRdp+Pnl1LNEQ8jQE4bngp2jSFFakeXxxoedfEkBQY=;
        b=ck+eTNMCirCytBwPJM7CTrsZx2IlxCeQI5fsaLA79jaZ+qLK2DP6aJBnL+pa6zBWeY
         kECawmOJ/fU0nBR0wuqiB7bIac7zGKFpjOgH9Rz0SbaWLP2TSkdQACW+tBCVuYUAwP5Y
         hoSI0KMfIG8WJOmJgjSZ3PZNw29B58HFP4CHRsftVb8h2Lw8/YssBSt+z2YZuOjSxm53
         L4OP14oLuz9E/nYM9Y4DtEgFtJUIsVufEriwsnsQFfqw3gKotrMGntFWQip4Q2mtKJuP
         PbSEWY6TtsBTqavFtm62t1CDRNpO5LrdD6N+2dNQta6Dbcw0/ak7v9F0x/lCKDnlB5N5
         B2vw==
X-Forwarded-Encrypted: i=1; AKwUvBz2OUe/Ngw8v/RARJ4DCrSW7GOwOzhfkC3OC9KEWwM26wOu5Rk9sU28EsCLLBgmaHBkxCtqQ6OnW7hd@vger.kernel.org
X-Gm-Message-State: APuU4Z+lU0NKr8Lhzd/DgBlP/luRj+1tdbs3N9vHEUXc4NXymYVoW32c
	h8GW6WdG7EysmxY7J9yBp8RRIwRibPYba5Et516SmXmZ1VF0l1krGXJleUgAFQ==
X-Gm-Gg: AYBFou2bE+lHqsFaeko/LH2WbjWfAF3+Qguf3+Wlj6V1Ubg6VWHng0onAfh8s6ovVNV
	AyC4sWGJoVpxx/4hc1Nmlx0DpLhtxFNy3IcKDcCTEqrvi9iRvO1iaa7AdVhjkLCTIxsx7loxbAC
	zP+Bxg/HR5w6yT3BP0jVH/1yk/OoRJN6w2a1Kb0kMXspyU5EPHSQRO0vuAVwMEgYbXlBUmXR5Zk
	gBLD9stUS+KXu4xPThipJ7XfKddADbTlszzzAN9Rp5uAoBE+m+fGgrHom5T783oQ/w+1TbFwuag
	cAYfEf0g2R9njh7s0X68IlOv3BbAkUN3QAovFtw0Ni8iAlAz9CNG1XQ+RUpI9u8w7z0ZUUfhFqI
	l0/7z1rAsrLRNYyu+Zk0pXCCrBjaC1rwppklKZd3ZmThfxnLQXor9BxUB9XMxg+ePArOIjfSWbK
	I/PpAe3fS+Od7JKUX+yQbm+mqfX/wcYCM0S6T7xSmw8g4pfp64qIT0irSyU2Ox43z7Zb0UgEl4p
	hxTazU/srh7Kz+l6wCsbqBpNZZ3x+rUVBD+UBnBZcFZQPoZ8+Q9h7fl5VPtWeLI8iXGjz76g2wo
	3KDUp2Z+ftmpL8jKj/hZ6fvj9RDdLnR/LBDpx7NLOE4/lUrTwBxHH5iE/oDyI/1S/CX43C0=
X-Received: by 2002:a05:701b:260c:b0:1ac:9ecb:acee with SMTP id a92af1059eb24-1ac9ecbb353mr21410890c88.39.1793829114147;
        Wed, 04 Nov 2026 13:51:54 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c127sm10459946c88.6.2026.11.04.13.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:51:53 -0800 (PST)
Date: Wed, 04 Nov 2026 13:51:52 -0800
Message-ID: <73caedd26b375ae7671d24bcee115f05@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] gpiolib: avoid krealloc() in gpiod_get_array()
In-Reply-To: <auumQhqJwIl4XZDM@ashevche-desk.local>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com> <20261103-b4-gpiolib-free-v2-6-ea46767c9cf8@gmail.com> <ausjJSZkaGKNfykE@ashevche-desk.local> <4e7b28ae9ad5de3708c549d62a4bae68@gmail.com> <auumQhqJwIl4XZDM@ashevche-desk.local>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Nov 04, 2026 at 11:40:18PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 04, 2026 at 10:14:49AM -0800, Dmitry Torokhov wrote:
> > On Wed, Nov 04, 2026 at 02:20:53PM +0200, Andy Shevchenko wrote:
> > > On Tue, Nov 03, 2026 at 07:40:34PM -0800, Dmitry Torokhov wrote:
> > > > +	bitmap_set(array_info->get_mask, 0, count);
> > > > +	bitmap_set(array_info->set_mask, 0, count);
> > >
> > > You don't need these, as memory is nullified.
> > > Also note that we have bitmap_clear() IIRC.
> > 
> > bitmap_set() sets bits 0 .. count - 1 to 1, not 0. Both get_mask and
> > set_mask start with all count bits set (assuming all pins in the array
> > are eligible for the fast path), and then gpio_descs_check_fastpath()
> > clears individual bits for pins that do not qualify.
>
> Ah, indeed, but we still have bitmap_fill().

bitmap_fill(dst, count) fills whole unsigned long words with 0xff
without masking the tail bits in the last word. Here get_mask and
set_mask are sized to max(gdev->ngpio, count) bits and passed to
gpio_chip_get_multiple() and gpiochip_set_multiple(), which iterate up
to gc->ngpio bits.

When count < gdev->ngpio, bitmap_fill(mask, count) would leave bits
count .. round_up(count, BITS_PER_LONG) - 1 set to 1, causing
get_multiple/set_multiple to touch unrelated pins on the chip and access
value_bitmap beyond count bits. So we really need bitmap_set(..., 0,
count) here to set only the first count bits.

Thanks.

-- 
Dmitry
