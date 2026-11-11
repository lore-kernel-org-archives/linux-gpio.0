Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392739;
	b=F+bkuSLKNiK8zYkdEiWXYaHwfwn+/vVIHS7G7dcZ/qkJB7Xq85F2YIQ4BrEv69D0rOLe
	 2wu8hKeiSqONsy25HEdCMnCBbY+6G5nBxuwPvaDJDv2X72B6ceDgLIEl/fp0CkZNzbPml
	 +fjZShDGWFKyuPDZLdksWJFIWXLXBdMcyJFLccEC+I7SeGmqwmBCC/3HbdJRdBmlhcg0B
	 80Y4yVIjKXNcOwiZ9neVNHKrrVnmiae2ECAk2m5LRau9WjU3e8tnG4xdk5IEP7ZUgRPAi
	 GuPdBIQVX9TU6DGuvqE1M057r7Sg0rsVxwDhCOdI7LJBqhTRryiJ5a8ExymlQmqT35A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=WCGh2v7nU1b/qpgNrVkksi8LEcAJjTlz9SScJQHog1U=;
	b=dVYaEK7TVKD0WvwpBRwZdI/j3ed3kS20Wd+PbuGcGaYHW25+VwkYl+KmbfCqWcdual4t
	 AxF7g9h440KnCZZen6yLUJtMhd/xureQj/Jbb+bmUtP5FX5wSaHdAsgsFFAaJkwgv3vH8
	 UirA9pSwE4qyDAc9JEu+2yg8jT4Pkz7zpXmoztQI3E7KRgSXcmOhoQg3vgFJCS+7MkFr9
	 SfapM+Iqn9P31e34ujF+ATcDd+euV+GDim20vY8knCk3+4UvUxKcHq2qiXsswzsRELJXl
	 uT7tIExfWKNmb1kFGV1hmfB3/rgywcGBpWlbdGhR/L+aYEquRSGCMvzmGSj9IoKLbVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mb3uhiUC;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD63606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 10:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CD63606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mb3uhiUC
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a210470b49so24528995e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 02:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794392738; x=1794997538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WCGh2v7nU1b/qpgNrVkksi8LEcAJjTlz9SScJQHog1U=;
        b=Mb3uhiUCOo+9OL8nkk0DPqlbHMU+U3YfPJtQRGohaqBLQ8OevIfv8dsETu4ueSqwRn
         NFUTwQnpCyUxKUDcsxzqJiYueO55nV4pkpQgYg9LUK5WPus9n/ERdDgHae8RQ7j2Dw+4
         fM3ibr2Y6ts1e/OTqbgJiTQW3L8WDSaeJuxScEHyWMzPN+bGBiq2tlQqZ+g6LQEpKD58
         mnmah5jGdWJ/FHCGptkaUokAM2nmjVjDMlQqXY1Y0+QNVEBolaI9RZeQ+wAs3afJIVDJ
         0j7wdyVZa4FS6RKopL2kvM92RArS1Tu/5W/MXYkBtd4iocmh7ndrHYxmSyr8Mi6yyFzr
         +H+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392738; x=1794997538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCGh2v7nU1b/qpgNrVkksi8LEcAJjTlz9SScJQHog1U=;
        b=MHFB7H5YCopJr4P1Jg9ufZWBVTo4OW92gx9/JOFnBfOKPhAa4KdOcWxGGaI2oPqXSi
         mcPlEO03XY1b9ElZRNpYnkzeFOa5/YB4g6jozDGtS1JUoDtcfQaQlrPEDSfUuQjirWoS
         qmo9XJnXhTT47GMZiBdD6P/AFSNOcWI5N1IDzhCxN1qptYDllJhiW1pwUldZetjKw9hY
         x0Mw0ge6gCA8m+p+yyPeFKHDLlatTfW/iOrrKwu1V0OKM/tN6FPSrl2f1cc2SHmtO9fj
         XotcsoJEma3y929yeXNNaQrPIxxl3l8vu2+4hHHZx2cXujT15XI/+C5t/DtW58WZJOfJ
         5qJg==
X-Forwarded-Encrypted: i=1; AL+hErGcw1G96KVSlTyCrBZFRaYxzWrgEj4WYOyECmgKtjakIzRkssalmF/yZZZHewG9xiNmZ9XUP1VMPnJA@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tv1aQ3/nzOJwDFz/0UNhthgjKvzART38n7qlmdcLKI4I3ulOx
	P6WxFbOyDWoroWh4DbspyOwLF6vEjVof4FJcDsT567cs0RAHV/UxcI/x
X-Gm-Gg: AYBFou1y3Yj7bCxkujUdhuTK3E1CUZB1sy0mHhEYE3Rd2y8eql3JsZVdCCWoZswO7fp
	jP4Y/s9TYA1XN6RITOnFRwckkAYNDEojSMrvo/LCD96DwY/tm4SyYY/2jNSRRdQSmuOYXCE7uE5
	91jlQEIGHsXA6jqMZRiWYuEKix782wJww1OEddwaWbYqYcgRfozQgcK2aC0SrYitYNvThldOe3y
	66p/vizKcOvyDneu14tVkWY/6ASOgx2mmUZ2g2sxnG+SiVmWqd7eVNC7OpNVEXPKlSjN6PRb4v2
	9iugQHRAl0YZ3fzcp9kRkqCqe1P1aj4vz9r+h9iqIxCDHnS7NRWfLarCCSU+Ytp3XLlPXYNfsQ/
	OyIzYGvIh6ixLdQrEqyyXKuwbaSABF+CJXdC/hsHlMtDrCqDcNdM0NwZdGNo50bMfjvStPgJSla
	PVH1RMPEoWf1RIRzyu00iJKzS4FbnGiMPZ4yl6hbvjANO3HY0U/IV9cc3oja/9ybpTWTZmfMMO1
	73uQGiQiS1llCkqYP4b4KPuXRIoWs9dJd4uZt4gFqzlYhpIu9YiUIpIHIA49rJrIuwRzhOKMkgw
	3CBzCU83AYhB0lrWsR74uvsa3Q0+uNfQjX72xNmd8VFKnuYH34vN0hFo3j0DOFdlebs=
X-Received: by 2002:a05:600c:4f14:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ba093b5ec4mr41235955e9.29.1794392737707;
        Wed, 11 Nov 2026 02:25:37 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988f5b1ce3sm8610917f8f.14.2026.11.11.02.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:25:37 -0800 (PST)
Date: Wed, 11 Nov 2026 10:25:35 +0000
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
Subject: Re: [PATCH v3 3/5] stddef: Add const_cast()
Message-ID: <20261111102535.434c2eee@pumpkin>
In-Reply-To: <2bf5cf7baad87b5b7b7f833df390596a033fd6f6.1794323750.git.alx@kernel.org>
References: <cover.1794323750.git.alx@kernel.org>
	<2bf5cf7baad87b5b7b7f833df390596a033fd6f6.1794323750.git.alx@kernel.org>
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

On Tue, 10 Nov 2026 16:33:40 +0100
Alejandro Colomar <alx@kernel.org> wrote:

> This macro serves to cast const away without risking unwanted
> conversions due to mistakes in the cast.
> 
> It's similar to C++'s const_cast(), but it is more restrictive: it can
> only cast away 'const', and not arbitrary qualifiers.
> 
> Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>  include/linux/stddef.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/stddef.h b/include/linux/stddef.h
> index e1851c50c89b..d79a81406b78 100644
> --- a/include/linux/stddef.h
> +++ b/include/linux/stddef.h
> @@ -194,4 +194,16 @@ enum {
>  #define TRAILING_OVERLAP(TYPE, NAME, FAM, MEMBERS)				\
>  	__TRAILING_OVERLAP(TYPE, NAME, FAM, /* no attrs */, MEMBERS)
>  
> +/**
> + * const_cast() - Drop const in the left-most derivation of a pointer
> + *
> + * @T: Type for the cast.
> + * @p: Pointer to be casted.
> + *
> + * If @p is of type const @T, then it is casted to @T.
> + * Otherwise, @p is returned without any casts.
> + * This avoids mistakes that change anything other than 'const' in a cast.
> + */
> +#define const_cast(T, p)  _Generic(p, const T: (T) (p), default: (p))

Should it be de_const_cast(), or just de_const().
It is a shame you need to specify the type, but why not:
	_Generic(p, T: p, const T: (T)(p))
so that you get a compile time error from the _Generic() if the type
is wrong.

David


> +
>  #endif

