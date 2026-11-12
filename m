Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522672;
	b=uZQUe3OzGDY7t8YsOkjJ/RwesRp7+fHK+sgInAooJNr1mx6N2p7ZEXX4X2F9VVNDdqnQ
	 zbUQ9ii0iJ2JxKNzNvWvoL8NL4VTAO3Wrbj919qDlORrdGtnJjxK+RGsRNZU0/omV/7td
	 zBb0CJi2XTCQ9aRhf1jU4ejXUBCKLrzudUWofeACKR3LpzTCDhoxnfPMM0t7/YwFEdllz
	 aC3GYwOnnwoIuqWWCp1+vOCitzPufMVFxwWqUC+WMyOSR7UKt8woS/YA5u/D1Pods64eh
	 UBYwqLvgq+Qo/9el0ldqERZI8VCg+NfQRPFIR43wYSiroSlSqI/9GoOHZpf2bpQ5TrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+JTSqev9V+WnU5MiL+EzLENGXn9aXmam81GQLiwSL0o=;
	b=Jv5VmuVFcOpINkIRzZlwAfN0O7IE3KtuSNHALcsZVbOFO5uwfG3Sq0f9DgisAtbXOHT8
	 eTq3Oip5NkBFOvycDm16t/NINBzStq+PQG6RpvrEK2Nb+RRTh7ixg/pGL3jr7Vr0kKtzj
	 1e8Q5nWgc0aJcsm7KNC7NGpaM8IQH+1y/p3tawje1RZ//pzMWk8fAYMc8QWJK8LIDeUkO
	 7xFZKBbZGxVSgj9bahC0+zMS5qO8lBB1aDYB6OmWxBBwRs8UOyz6cfuFDkLWNrdZLmOr/
	 Un8h/u0yrQ/gHc/USq/gWYOPtDDFU6ekz6V/vY3HwWjPnlzirRB5yXYctSF4nu+UAiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QK6ov+6P;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E27606A331
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 22:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E27606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QK6ov+6P
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so2260995e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 14:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794522670; x=1795127470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+JTSqev9V+WnU5MiL+EzLENGXn9aXmam81GQLiwSL0o=;
        b=QK6ov+6PfLWnModUmHpQoTJIO9mbqa69iTI14JlGFF9k8M6Ls+sAJSveNj8g+ueWnu
         8b1zPQX2xIDQFGLZZjP1wMJvqMwZrq8x4IVPtqAZCLsofyk15O0AyKmBHtJfr6U8kAvS
         onsPYX4BfCr1/z4vKD/vtm5bTh4Ke0Nf0vZ5qmaap6QPuXT3JM5d70mPl8hNaMJiiXOV
         BS69sbm1OaKF8ENOfh8zbA3xf8oTQrmKxdb2EsE2Sq6SkJ/ifxcWmEnu3XuTthkueQEB
         tQEoWykjpdUTsskQqwORhSWLyFmUa+cB2XJayhfwgqwrS/xatUifmK6gAIoTkDZfBdkw
         PDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794522670; x=1795127470;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+JTSqev9V+WnU5MiL+EzLENGXn9aXmam81GQLiwSL0o=;
        b=jpNGUZbKW6N2h7xX7FjKXD06TyE0g1HrqLAbfEcCxkylYeDtH6tu4S3nWe98UuwHLs
         JlXeotKd7Lc51JbI7Wzaz1ROnB/cMyCvJiSSypnE1VbffwUdTyqOlFajRmZeO6aI2eEU
         /GcCKAkrRdfquVyMm5lb/X4JttJvAsoNYvIuVXVjYoX4dzdqWj9ynraRA+hVtdH9Ktnp
         bqI6XzXiC1HsNI8bZfrdVPVCG+x9YTVObxWUGvASb/zkaTujMjfC3wNJYfBo0iguOLY3
         dOAejrsWFKMKCGKRW9rkKifv6qmo8TkadHfmYjdvwthAb8cu9HSGSR2YwrNW80QUeNZh
         oI/Q==
X-Forwarded-Encrypted: i=1; AL+hErEM2girNyh7sc+rlVrYjjz9Sngbdp+8cUerS/zFuJUWpQTKh861JZ2yhYqvOMLtzeeKd/8Si7cvgMma@vger.kernel.org
X-Gm-Message-State: APuU4Z82HSSnBqXoPsDQasiwy7sOzVh5g+Qro88971wil2YaWBBiw6xx
	xrH1rAz2tcqYLcpYhqrqW1DTHK+2s2Lj+RDCECi8de+1Z5O8O7gyzdG1
X-Gm-Gg: AYBFou3G/xWAC4ZQYW7eza1nkvgxAF0xhTfcshzpFeeOD6JVJZg/c51cX+xOUyNT/Zw
	5kJPMYJ26cZLIYC7h0ynxkeT021g+EcyEwgVIhIMcfS1R6KJqBt/tANmBSaA2ZltxOhPv6YCNAk
	kIlpF0sc3l7sFhuRIpLS3MG0OUlTKGagf3EJCldli8joEOVX1VVys94e3gzHOX+O1sFYVK0I/td
	zPVGi8tpoaHn7i5W8NeVQMvaJJdACEetRO7Y8ZXmKz0uvZI6TE9Cfjtt8NUvVzV9IPQFeBeJzCf
	x5tzXFO0+keExC4F4wMDAFvTbYgfHiwjJy9WGozo6uxQhSbmeDrfMiErfjhuxcsaw+pK+/clmJb
	tFQYwcmQ3ktD2+WlhDIk5tZPCCnB4IrBD++c1oQKTjufSsYRiudzuZqFjXXhjCzrfMdS1ZyNLH9
	/zWk/IciKwdkG1PMgPS7wCd5zlHBkF3D7uUGxvkJTlyG895H/vJlViKWLrzFA51VIV8FqybMmjk
	oIpuaE8fBvxabtuD4ubf5lv77Onjot8gd8xkwRwc8jBf+qOQiY8Tx7l+CBohXZsr+kGMXGvnS83
	yuYbVr5j7sUSjyKGe6vXOGZTCxkL79C+D+n4IvCALvj0H5kqlR7MP6mJrEGxbLz7iA==
X-Received: by 2002:a05:600c:8b8a:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4bb55abbadamr13368985e9.31.1794522670201;
        Thu, 12 Nov 2026 14:31:10 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720e9c2sm42715e9.3.2026.11.12.14.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:31:09 -0800 (PST)
Date: Thu, 12 Nov 2026 22:31:07 +0000
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
 linux-gpio@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/6] string: Add strprefix(), and deprecate
 str_has_prefix()
Message-ID: <20261112223107.3a9efb85@pumpkin>
In-Reply-To: <a74fabd985a874da7556ae1601053b4bcc100f13.1794425425.git.alx@kernel.org>
References: <cover.1794425425.git.alx@kernel.org>
	<a74fabd985a874da7556ae1601053b4bcc100f13.1794425425.git.alx@kernel.org>
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

On Wed, 11 Nov 2026 20:55:15 +0100
Alejandro Colomar <alx@kernel.org> wrote:

> As Bartosz reported, str_has_prefix() has a bug: it can't differentiate
> between an empty prefix matching an empty string from a non-matching
> prefix.  This is a fundamental design flaw in this API, and not
> something that can be fixed.
> 
> As always, this is a consequence of choosing sizes instead of pointers.
> Sizes are often the wrong choice.  In this specific case, pointers are
> more capable of differentiating these cases, as NULL is a special
> sentinel value that doesn't need to overload a valid value.
> 
> Let's implement strprefix(), a function that returns a pointer
> right after the prefix if found, and a null pointer if not found.
> 
> We'll slowly migrate existing code from str_has_prefix() to strprefix().
> 
> Move the description from str_has_prefix(), and describe
> str_has_prefix() by comparing it to strprefix().
> 
> Reported-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Link: https://lore.kernel.org/linux-hardening/20261104-fwnode-for-each-prop-v1-1-6e28fe1c72c4@oss.qualcomm.com/
> Cc: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>  include/linux/string.h   | 28 +++++++++++++++++++++++-----
>  lib/tests/string_kunit.c |  9 +++++++++
>  2 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/string.h b/include/linux/string.h
> index 6cb5cdd01158..d08ca10c39a2 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -545,16 +545,34 @@ void memcpy_and_pad(void *dest, size_t dest_len, const void *src, size_t count,
>  	       sizeof(*(obj)) - offsetof(typeof(*(obj)), member));	\
>  })
>  
> +/**
> + * strprefix - string prefix
> + * @s: The string to be tested
> + * @prefix: The string to see if @s starts with
> + *
> + * A common way to test a prefix of a string is to do:
> + *  strncmp(s, prefix, sizeof(prefix) - 1)
> + *
> + * But this can lead to bugs due to typos, or if prefix is a pointer
> + * and not a constant.  Instead use strprefix().
> + *
> + * Returns:
> + * *  @s+strlen(@prefix) if @s starts with @prefix
> + * *  NULL if @s does not start with @prefix
> + */
> +static inline char *strprefix(const char *s, const char *prefix)
> +{
> +	size_t len = strlen(prefix);
> +	return strncmp(s, prefix, len) == 0 ? (char *) s + len : NULL;
> +}

I suspect this would be better as a real function.
Possibly even just a simple loop rather than based on calls to
both strlen and strncmp().
(Even if the strelen() is mostly a compile-time constant.)

Something like:
#undef strprefix // Or put it the name in ()
const char *strprefix(const char *s, const char *prefix)
{
	do {
		if (!*s)
			return *p ? NULL : s;
	} while (*s++ == *p++);
	return p[-1] ? NULL : s - 1;
}

And in the header:
const char *strprefix(const char *s, const char *prefix);
#define strprefix(s, p) ((typeof(s))strprefix(s, p))

David

> +
>  /**
>   * str_has_prefix - Test if a string has a given prefix
>   * @str: The string to test
>   * @prefix: The string to see if @str starts with
>   *
> - * A common way to test a prefix of a string is to do:
> - *  strncmp(str, prefix, sizeof(prefix) - 1)
> - *
> - * But this can lead to bugs due to typos, or if prefix is a pointer
> - * and not a constant. Instead use str_has_prefix().
> + * This is similar to strprefix(), but returns an offset instead of
> + * a pointer.
>   *
>   * Returns:
>   * * strlen(@prefix) if @str starts with @prefix
> diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
> index 0819ace5b027..73d2614b1474 100644
> --- a/lib/tests/string_kunit.c
> +++ b/lib/tests/string_kunit.c
> @@ -287,6 +287,14 @@ static void string_test_strspn(struct kunit *test)
>  	}
>  }
>  
> +static void string_test_strprefix(struct kunit *test)
> +{
> +	KUNIT_ASSERT_EQ(test, 0, strcmp(strprefix("foobar", "foo"), "bar"));
> +	KUNIT_ASSERT_EQ(test, 0, strcmp(strprefix("foobar", ""), "foobar"));
> +	KUNIT_ASSERT_EQ(test, 0, strcmp(strprefix("foobar", "foobar"), ""));
> +	KUNIT_ASSERT_NULL(test, strprefix("foobar", "bar"));
> +}
> +
>  static char strcmp_buffer1[STRCMP_LARGE_BUF_LEN];
>  static char strcmp_buffer2[STRCMP_LARGE_BUF_LEN];
>  
> @@ -891,6 +899,7 @@ static struct kunit_case string_test_cases[] = {
>  	KUNIT_CASE(string_test_strnchr),
>  	KUNIT_CASE(string_test_strrchr),
>  	KUNIT_CASE(string_test_strspn),
> +	KUNIT_CASE(string_test_strprefix),
>  	KUNIT_CASE(string_test_strcmp),
>  	KUNIT_CASE(string_test_strcmp_long_strings),
>  	KUNIT_CASE(string_test_strncmp),

