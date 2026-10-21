Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578963;
	b=beatevudmlpKoC6EQdRnQzslEXP1emZMPPztKqtPPvrKcTuo6XRrD5SSNBOtrlLPkW4S
	 eWeqimz7bYXIVXy9lffFFHfZT/buwUbWRahDCP6v77FfGMkVPWfR9bfafs2rpgI8fjMy/
	 gb2OIhf+5lWgPY978RxloCuNXKKroY0ZNOvtBILlf0R5Mj0sIiGDvKCb1DIijIGqH/Gcz
	 K44rEx1LilnWwwY4LhqXeCAVimaP8jnVo2b8lgEkrNpxCSAlKBnOdXOfCrMgAmoWGlccx
	 Hl6F7TdUAAw6mAFZqfZVoAIfbNULebXhT7pxmn0Xl2SXG8JTb+R3uffxWzOOdCRC3Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578963;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=nWFWBNhzQ/o5SPq4P+1ZXI8VyINKN2wnBvU97up1HzY=;
	b=xRrkbTvAVUklnbJu+e9wX0yNIipblLArscH7q7fWvy1WWzZmKrDGM0WbOtzBH41eS8rB
	 7VORGtb12uZ8d0YgtHSYLrv6rtJT/eCTLcuf0VtcIklosIJkpNj8ItM4W3CJksRYFR2fI
	 MJ1yFGk4w2Oo8gzTywfKOmjLiZEPhBAJhk7NUG+WArKT/X6dwR2xWvjBg96C9E+bkd5+x
	 Kj+fsXJ2nPL7JUG7KVNzUyLeRYTzUqOXgdwd70px/4vZRVq1rp0PFdtjwtQhJRGt+ZbDk
	 jm3a4PEGevm0QfDsbg7q6HxhK4zWb3FguR/QZyL0sREqvpJ3gphnxzUhsHyx1Q7MFfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fsW4mV0x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA92606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fsW4mV0x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4D61F000CF
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792578962;
	bh=nWFWBNhzQ/o5SPq4P+1ZXI8VyINKN2wnBvU97up1HzY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=fsW4mV0xCvh7j07oQDA2DaxzqRvPG/7NKHO9fINk7Tj5SvoNuuPmfTiC2qb0PrKTV
	 IVfiKHGkb0IT13LKthWOt6f5pJaxl5u02EoPFbuw6e0olBZOmxLIvsuY0ZWzEEw+Zg
	 +an+0Oo30m2iDY2JrZqF+6r7O3TuBAcmTFeYR8G1dA+m2yduoxGh9/+5CYmQQerP1z
	 L5LN1vx8XzAm/NO20fgZtSX9v8CJBWnf18hbNBWpDw3fU3OXws79P/JzE00kWTQkvi
	 4aYomHJcyaDNeCyXZ8JQCLsBmQd79RKE2jwzOoDWjYiUMdQWRkkU+C6+8TREdCxINN
	 xmtBuon8n9/jw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso638243e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 03:36:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzHNDPaqt8iAuqClihY7jtjwTerlMlA0cVpptJ5TZ/U01F8I8BLg9wRiVwNFnda9XdnHOScCtjbcO35@vger.kernel.org
X-Gm-Message-State: AFq9FYJmDgzEgqCq24uE9UzEyVvlRXgp9OfjVqL8WelFeBRB+czaaPDe
	q03lsGDY6seG18XzaAhIlv65tqnP4SPJxI1PCxS6yOebaTOrpQdO2Ne5Rynr52otYwiGHKLcjeg
	YJxgrpc+kvmbn63mcaci83jg3RaApbCL9vq65ObPn4A==
X-Received: by 2002:a05:6512:31d0:b0:5be:4ab1:6f41 with SMTP id
 2adb3069b0e04-5bfa1c0476dmr651187e87.52.1792578960961; Wed, 21 Oct 2026
 03:36:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 06:35:59 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 06:35:59 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <atX7Z9qd_plw-Waw@ashevche-desk.local>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-gpioctl-v1-0-8770622679b8@oss.qualcomm.com>
 <20261016-gpioctl-v1-2-8770622679b8@oss.qualcomm.com> <atX7Z9qd_plw-Waw@ashevche-desk.local>
Date: Wed, 21 Oct 2026 06:35:59 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mc_PL7hXTxiw2NPKU4L2-Fd4p2KRBRjiC5EMcuWzRKe1w@mail.gmail.com>
X-Gm-Features: AclHuK9w2hgolWITiLxATTHEiojs2dNAyie1bEOc_h4q6fg2vkE32I6SGJsvsEQ
Message-ID: <CAMRc=Mc_PL7hXTxiw2NPKU4L2-Fd4p2KRBRjiC5EMcuWzRKe1w@mail.gmail.com>
Subject: Re: [PATCH RFC libgpiod 2/3] tools: factor out line event formatting
 into tools-common
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Vincent Fazio <vfazio@xes-inc.com>, linux-gpio@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 13:13:43 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Fri, Oct 16, 2026 at 04:18:09PM +0200, Bartosz Golaszewski wrote:
>> Move helpers used by gpiomon for formatting of line events and printing
>> of the help text for format specifiers to tools-common so that both
>> gpiomon and the upcoming gpioctl can reuse the same code.
>
> ...
>
>> +void print_event_format_help(bool include_line_chip)
>> +{
>> +	printf("\n");
>
> This is really confusing. If you want to separate, do it in the caller.
>

We've been already doing it this way, for instance in print_chip_help(). I
don't care enough to change it but feel free to submit a patch if that bothers
you. :)

>> +	printf("Format specifiers:\n");
>> +	printf("  %%o   GPIO line offset\n");
>
>> +	if (include_line_chip) {
>> +		printf("  %%l   GPIO line name\n");
>> +		printf("  %%c   GPIO chip name\n");
>> +	}
>
> Hmm... Personally I don't like such an approach. The alternatives are:
> - having 3 (if the order is strictly requested like this) or 2 helpers and
> split the function to two instead of boolean parameter.
>

Or even better: just implement the two above in gpioctl too. I'll do
this for v2.

>> +	printf("  %%e   numeric edge event type ('1' - rising or '2' - falling)\n");
>> +	printf("  %%E   edge event type ('rising' or 'falling')\n");
>> +	printf("  %%S   event timestamp as seconds\n");
>> +	printf("  %%U   event timestamp as UTC\n");
>> +	printf("  %%L   event timestamp as local time\n");
>> +}
>
> ...
>
>> +void print_event(uint64_t timestamp_ns, unsigned int offset, int event_type,
>> +		 int timestamp_fmt, const char *fmt,
>> +		 const char *line_name, const char *chip_name, bool unquoted)
>> +{
>> +	const char *prev, *curr;
>> +	char spec;
>> +
>> +	if (!fmt) {
>> +		print_event_time(timestamp_ns, timestamp_fmt);
>> +		if (event_type == GPIOD_EDGE_EVENT_RISING_EDGE)
>> +			fputs("\trising\t", stdout);
>> +		else
>> +			fputs("\tfalling\t", stdout);
>
>> +		if (!line_name) {
>> +			if (chip_name)
>> +				printf("%s %u", chip_name, offset);
>> +			else
>> +				printf("%u", offset);
>> +		} else {
>> +			if (chip_name)
>> +				printf("%s %u ", chip_name, offset);
>> +			printf(unquoted ? "%s" : "\"%s\"", line_name);
>> +		}
>
> Independently on the original code, I would go with positive test
>
> 		if (line_name) {
> 			...
> 		} else {
> 			...
> 		}
>
>> +		fputc('\n', stdout);
>> +		return;
>> +	}
>
>> +	for (prev = curr = fmt;;) {
>> +		curr = strchr(curr, '%');
>> +		if (!curr) {
>> +			fputs(prev, stdout);
>> +			break;
>> +		}
>> +
>> +		if (prev != curr)
>> +			fwrite(prev, curr - prev, 1, stdout);
>> +
>> +		spec = *(curr + 1);
>> +
>> +		switch (spec) {
>> +		case 'c':
>> +			fputs(chip_name ? chip_name : "unknown", stdout);
>> +			break;
>> +		case 'e':
>> +			printf("%d", event_type);
>> +			break;
>> +		case 'E':
>> +			fputs(event_type == GPIOD_EDGE_EVENT_RISING_EDGE ?
>> +			      "rising" : "falling", stdout);
>> +			break;
>> +		case 'l':
>> +			fputs(line_name ? line_name : "unnamed", stdout);
>> +			break;
>> +		case 'L':
>> +			print_event_time(timestamp_ns, 2);
>> +			break;
>> +		case 'o':
>> +			printf("%u", offset);
>> +			break;
>> +		case 'S':
>> +			print_event_time(timestamp_ns, 0);
>> +			break;
>> +		case 'U':
>> +			print_event_time(timestamp_ns, 1);
>> +			break;
>> +		case '%':
>> +			fputc('%', stdout);
>> +			break;
>> +		case '\0':
>> +			fputc('%', stdout);
>> +			goto end;
>> +		default:
>> +			fwrite(curr, 2, 1, stdout);
>> +			break;
>> +		}
>
>> +		curr += 2;
>> +		prev = curr;
>
> Can be in for-line.
>
>> +	}
>> +
>> +end:
>> +	fputc('\n', stdout);
>> +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

Bart
