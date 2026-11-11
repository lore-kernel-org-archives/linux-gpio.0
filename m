Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393283;
	b=Q5rghPCwUmN3tyiipbEKzV6tteXAU/UsRyO/fSN3qB5R+/hVZPyIEg41kzAe46CbWp/o
	 8zg9VYYe+Jq9E0z+OJqCLKImGaxORHNyT82i5BNYSKIAkf6eCyYo2GwdVn0OUPft8XeZ2
	 Zicdnzc4aZ8/pPEO7vmlLnB7MwyLQF3DBqzfFXuZdf7C4Iyj3qeIVg+CxBlQWcFKrm38y
	 ZEwXUkvXkDjFO0ezrZk/boNHUsR7zzyi7LedN2xLQtHJNTIp/uunvH/kdA2EbAC5qqFwb
	 wNGcizYtxUxU6nW14lZCHPsKckg/72G3gRLhv2G8lkbWWFB0N3Pn1be63dQhq4LHFCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=B0BstBB2s+mXG455PQXyfJhRhSXomdgOjXb5/JFNaGE=;
	b=Ycuall+ns38ZQJC5tN6KkgQQ3RpMqe+68pDJmUD/DUOhByh3dVtAwbpIHxNdtMpD7c4U
	 GL/Z2jnl339YdXTtB5xd/kjHqFs5Y84KlvvKkbov/TyU2Drqq/1hHRPrKt4GuZZ0GMzb9
	 9ZThXFCt1BAgZOc1wDuUg/26DQ7UGiJbR/hFV8ikOBg3lbMJd/xXBluw4qoY+/JagbKyC
	 E90CVhgLsVDif5unhroABIgJd8MDhkoQz+dhJXhXrVq6+dONDze8W1VJkaJ5LVOmovzwh
	 l8lbCiazVRnA07slua7jvWjlnpQSPOINYkf70B8gusTA0CeIhzkfrFQctL+kdi7tgGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wo4+YNlr;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27151606A330
	for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 10:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27151606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wo4+YNlr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so36880325e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 02:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794393281; x=1794998081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B0BstBB2s+mXG455PQXyfJhRhSXomdgOjXb5/JFNaGE=;
        b=Wo4+YNlrKrnltc3dTrFhFyp8o565rovrnVKvkcx3eVzs7mE3qiNP4os9f3zKzIUO7q
         Mo/E6HxBENrz/Twy6Hr0jn0S9RD9and66fqE4mLAn/XVoQ9oGhz/5FprThWZmcB1lSHC
         Xw3GiW0FU0e05EIYsy/TOTtxkzFOG4Rc7Et1sma46iXKPmLCVl1BoEbBdP3bAJIvboW5
         RDrss8nRI9XAY9vaYK8uPgGc9tmFypYAcAnxtmeiIEQdKL+6MGcergbBBIDQPsOYUs9v
         8reLcEbCJIqvaqTXvPspIf7k32+QOuydWVQAkHaiFp6OoRWnSK1pNXkuh2Jp185lV3Xr
         MWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393281; x=1794998081;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0BstBB2s+mXG455PQXyfJhRhSXomdgOjXb5/JFNaGE=;
        b=hgqLdmHOETC7MMFyAcgcANMzp7UN/edTpGnHsOtGf1faTxL2abq2IEaOV/XaYhY0js
         EaDV2eYQZSs0ALHEDjBjHaToIcvusyxN6KHS/n04FsEMyr5peLeoKQoUAIe6VVN5pf5B
         le9uTK7g5AJGtI4kiv6zivkKa52P61OI9QP3jqh4l3RR0sHFSYfbEu9nW+0a4jMRZWkB
         GmbFwvd6hWr5t6KzgMUP2tHUK7EXZYOqVhCT0+5lT+A38fC8bwgR6SyeeEUitBK4t6V5
         Tro85f8ng0DA7pZ5mf6XdbLPi/AvlE6g1v1BRKF2FUOrmjCy+aYgPFD5CATN6wXXdH+m
         kx/A==
X-Forwarded-Encrypted: i=1; AL+hErFW8DjEOq9Om3qMXvRMZZajJV+tYvBOB9bL55vs1QjMfyrLtKesOK2r2WnGxQyFysKiVyRCG5Lm+KIh@vger.kernel.org
X-Gm-Message-State: APuU4Z9oc4gILW4X7diFi3RjXcj3NZjcPH+BREQGldGtczOw03XseruP
	Ta4Y5BPCQZpawYX8PD3NXAtL7nyZ7QyCZcYT2jqoszjBlTfdYotqPFt8
X-Gm-Gg: AYBFou2B6A1NP/PGMPOq/3ENFVR094et4qTxLO8GRhswgdZoOFGFfO9kBdIL4lqjfj8
	Y38ZXJngawv0e0DvHWAXvlI5RQnFgjAHmdrgj7afyNyfASKSE5vnFDVYmfxqC78NAo8InBYGIc9
	HpJ6JOaVzNWSzfq4060rbD20nzR58IUNf3UZXAbaQmfd50o8EgYH9Tnu3oOGmd/a+8rOppwX5qy
	kKgskOcXgG0s9o6mf9dQqrORuGmMYwmk59EIPiHmHrMtUhjRWwiMpJbj4U8KTi3y+s8181zbe4m
	PAXtFXCmhH0oqWtq2fiLjBKTpULwnCM4ARe6wibkp2+qs5m8cy7s+YH81aVrBecS/eaqK2c8vnQ
	hkoyreucdt3Wkzmugc/RMlw0tpEC0ybhJSP6racGHLvbtL8J8Xlo114FiPM2+vNCwQ0m0MaoEhF
	UfDijcyOttyIo6g085A2V25vCH5NYLK2SFhU7pXu0eXoThivVfxZLjS1TAYYuBuN7OoQqmX+Gdp
	9DzeSzLWb2Re0Fhgf5MrStqgzQSq+YazkBfMEMM6GkhRpL2qbrJn6T6c83uJ8nahorqKlVZxXTu
	ZehiyLy1oW5KcAAzfXdt5au7qdqIYXRXheDWRY49V/I2Z32q/ucPMpo2ke08852YFEo=
X-Received: by 2002:a05:600c:b86:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4ba09377b2amr30972055e9.10.1794393281331;
        Wed, 11 Nov 2026 02:34:41 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba476sm157078915e9.2.2026.11.11.02.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:34:40 -0800 (PST)
Date: Wed, 11 Nov 2026 10:34:38 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Andy
 Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel
 Scally <djrscally@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, Johan
 Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Linus Walleij
 <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>,
 linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 5/5] string: Make strprefix() const-qualifier-generic
Message-ID: <20261111103438.2f822202@pumpkin>
In-Reply-To: <35bf6672f84f07de3f40e8db9e7fcfd643894fec.1794323750.git.alx@kernel.org>
References: <cover.1794323750.git.alx@kernel.org>
	<35bf6672f84f07de3f40e8db9e7fcfd643894fec.1794323750.git.alx@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 16:33:56 +0100
Alejandro Colomar <alx@kernel.org> wrote:

> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>  include/linux/string.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/string.h b/include/linux/string.h
> index 9e59f9697c9e..55ca4cb5122c 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -590,7 +590,9 @@ void memcpy_and_pad(void *dest, size_t dest_len, const void *src, size_t count,
>   * *  @s+strlen(@prefix) if @s starts with @prefix
>   * *  NULL if @s does not start with @prefix
>   */
> -static inline char *strprefix(const char *s, const char *prefix)
> +#define strprefix(s, pfx)  const_cast(CQChar_of(s) *, strprefix(s, pfx))

Isn't in enough to do:
#define strprefix(s, pfx) ((typeof(s))strprefix(s, pfx))

which correctly preserves all qualifiers.

David

> +
> +static inline char *(strprefix)(const char *s, const char *prefix)
>  {
>  	size_t len = strlen(prefix);
>  	return strncmp(s, prefix, len) == 0 ? (char *) s + len : NULL;

