Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB2F345EBF
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 20:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786479892; cv=none; b=gaxxxnTMhWf6FtVWqYR6RzwRNUxHiLVdL2OT98YftFRNmHuZKGcaWwGCb34Pf6u3vFW/Lt6evTACdozM45sgrtqE/+Qknwu9//OdTvfNLWNtnn8N7To88bLGQZVcS50wuIxBMbxrRx2+gLSjXMs4OSV9Ec+z3WpSElpddr2QIWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786479892; c=relaxed/simple;
	bh=quDbQsJGb6koaXpsmI594tuHCkLSc6aFZ+niZKclNiA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=OLdP/sszzIQV+pas/HxslCdLL812LspBjOxV1zQy6JaHpvFJX4RBonBF6s7DnbkC9m/dwonJUo/4Cx4nzLMf9JxD76GfBZSX4cG2xGU2yUkDQpAzlNXA4h7r+bVHoCuchxCPVXNK4mW0Zt60NYHAV+O6oUEke9pInLB3tJBGLFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIIYTzET; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIIYTzET"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-74ad03fa605so140083137.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 13:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786479889; x=1787084689; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mO1x/6yM6Ei28M808ZCFVWGu1W0NOiFiZrV/cB0FA8E=;
        b=GIIYTzETp7jIC5Gg2Co+4Xm66981tfTL7OKkphTVzVYu6lxmVgbEj+k9XbHj1YgAwW
         T2ciO8il3RVeGUY0Biwuta22Xv3DIVH3lGtb+TAskKPVZ8j3m+18E1TR1P7oJETp6dvG
         79k6wc7RGfzlkFkcacQzg7oPmNBVfDzNTVahTdqQVD0f3TB8rTIFEAIxdayuoiRGYncn
         JJloGGqTMRHNaUQl3urkXcHuUT1EgPrHbyMt2sJHhcfsZApBh6brthPt7pQSfQ1b13Bs
         va9LseqAli5kpGU1FlBoc6Giht+aVZuYJBbdFtwPeKoRdJvPtFwByG52i6TBsLY66VAh
         m9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786479889; x=1787084689;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mO1x/6yM6Ei28M808ZCFVWGu1W0NOiFiZrV/cB0FA8E=;
        b=Ad/pu3R1q6ENhQymZH71h9yEhsH4VgO9fLCTIiU3C+ajq/RK7bVldv6vHOeA7M0byC
         /gkVvfem4MEADfEyKDbwod3p/ZABDLl2hLXFk9/AYOYAFuL+FYP9Q7+KU1m/dpjtsHYu
         5Si8BXBYm4dAQB4g4VGDlXdrj2S5cJ9L12rC4pMibgdijjZcjTBGhE+WEi21opRtTieV
         rmMoTlj+wT7BHe3oKTBcwXrVbulOaq7ccglkrYd6/omX1g8pt+PCwwDMduqs7x/c/sRs
         3YUgF4p7NP7Y/Hztly8IxEhDkDZq71WmTYP8lQDF7LAtvf+x6vEUNiE/krdbvxU2PTn7
         i/5A==
X-Forwarded-Encrypted: i=1; AHgh+RrmqJv2vRHDK4gSKMUDk2ntlB3UobqkyE5UAIByRWV0JlQhmiyMEKT5/AaG7e6guEA+cvPQh2hk4eLl@vger.kernel.org
X-Gm-Message-State: AOJu0YxkrN/gtaYAgxS0+9S16IO7cyzzPh6Sspm2QWC8d8wwM0FQ87/b
	mz+3zLcojIj34JlG4yViwBq0O9EQAI/8UI/q+f78OBn298gPa6gjfKrb
X-Gm-Gg: AR+sD12UtSTFXf4N95SLRTgx+8GHlkOHAi/g3jloIHP7qiz5r0jUJJjVr/cee3tA81x
	/aJa1VI26bs2TEWrSKkZ9/EVKxQahtiKScoDgqVbOCbfXcWRMhPMXblpld163kepmioaFwK4nNp
	bjTam/t1iqWblTDVX8Xn/4Vjg1Q768aj8Y8rppPTwZfqstwIbGuZ+3Z4xj9tIVLFOlaT8tUsfWV
	pXwaJXbSxjbvtM51nvTUKDPqpjxGa4rP6/RiWwR5iHbuo7GY+88ZEAvMgb3GxU4zBiZOnmDwWvi
	WXWY95NQxEeOqalE0/eSsYshwHm4DtwwrrKVEr6EPmQQDiGJ2y1bRYiio3hidNzZuC65zpQHH5b
	7Ri/n/f10fFw8DF3kJAX2IkaJTHrDggpMvOi2ObhCO/Vv4aE5RvQJF4dGv/s5wPX4JI5Iz/2Lc2
	f/rAgJnY182ByS95FoVNQHU6Mgv3P+GudZhsstDy2fFZTkt1eGxFT0AA==
X-Received: by 2002:a05:6102:1496:b0:763:ce80:337e with SMTP id ada2fe7eead31-76b54d84d6dmr1981033137.1.1786479889229;
        Tue, 11 Aug 2026 13:24:49 -0700 (PDT)
Received: from localhost ([181.199.46.248])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97a3c18c868sm644845241.6.2026.08.11.13.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 13:24:48 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 15:24:46 -0500
Message-Id: <DKME9LSBXSXA.28PS1V6ZAH79O@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 7/9] iio: adc: ti-ads1262: support triggered buffer
 sampling
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-7-f89925d72792@gmail.com>
 <1b6b6981-1a08-42a2-a03a-4366b980da13@baylibre.com>
 <DKK9S36LB543.2T124NE3TNETN@gmail.com>
 <f3ea3859-aff1-4c15-9302-095119faec78@baylibre.com>
In-Reply-To: <f3ea3859-aff1-4c15-9302-095119faec78@baylibre.com>

On Mon Aug 10, 2026 at 11:31 AM -05, David Lechner wrote:
> On 8/9/26 3:28 AM, Kurt Borja wrote:
>> On Sat Aug 8, 2026 at 1:39 PM -05, David Lechner wrote:
>>> On 8/7/26 10:58 PM, Kurt Borja wrote:
>>>> Add triggered buffer support and a data-ready (DRDY) hardware trigger.
>>>>
>
> ...
>
>>>
>>>> +	u8 tx[11] __aligned(IIO_DMA_MINALIGN);
>>>> +	u8 rx[11] __aligned(IIO_DMA_MINALIGN);
>>>
>>> don't need second one to be aligned, they aren't independent.
>>=20
>> Ah, I forgot this observation in the last version. These are used in a
>> full-duplex transfer, wouldn't that require for both to be on its own
>> cache line? I just started learning about DMA.
>
> No. In this case, it works roughly like this...
>
> - We fill the TX buffer before the transfer. (CPU access to memory may
>   just live in the cache at this point and not actually be sent to RAM)
> - We request to start the SPI transfer.
> - The core SPI code flushes (or maybe I should say invalidates) the cache
>   on the TX buffer. This ensures that what we wrote with the CPU availabl=
e
>   to DMA.
> - The actual SPI transfer happens that uses DMA to access both TX and
>   RX buffers. (Again, could just live in a cache and not be sent to RAM)
> - The SPI core code flushes the cache on the RX buffer. This ensures
>   that when the CPU reads the memory, it will see what the DMA just
>   wrote.

Oh, this makes a lot of sense.

>
> Since there isn't a time when CPU and DMA both write to the cache line
> at the same time before a flush, there is never a time we could have
> an issue with stale data replacing data that had not been flushed.
>
> It does mean that we can't update the tx buffer for the next message
> until after this message is done, but we have to do that anyway.
>
> What does cause problems is if we just had a regular unrelated variable
> after this in the cache line and the driver updated it during a SPI
> transfer. If this new value was just living in the CPU cache, then
> when the RX flush happened, it would write over that new value with
> stale data from the DMA's version of the cache.

Thanks! I'll look deeper into DMA, it's very interesting.

>
>
>>=20
>> [...]
>>=20
>>>> +static int ads1262_enable_and_read_last(struct ads1262 *st,
>>>> +					const struct iio_chan_spec *spec,
>>>> +					__be32 *val)
>>>> +{
>>>> +	struct ads1262_channel *chan;
>>>> +	int ret;
>>>> +
>>>> +	lockdep_assert_held(&st->xfer_lock);
>>>
>>> What happens if something else (e.g. gpio in the future) decides to do =
a
>>> register write here. If it wins the race, will it unintentionally read =
the
>>> data? So do we also need to read the stored data via command here too?
>>=20
>> On each trigger, we are holding the lock before we enable the first
>> channel, until after we read the final conversion. So we don't really
>> care if there's concurrent activity in-between triggers. Am I missing
>> something?
>>=20
> The datasheet doesn't seem clear on it, so I don't know if you are
> missing something or not, that is why I asked. :-)

I thought I was missing something obvious for a moment :p

>
> It looks to me like the way this is working is that that when data
> is ready, on the very next SPI transfer, the data is placed in the
> RX buffer no matter what is in the TX buffer. So I was imagining that
> if we got a DRDY interrupt, but someone happened to set a gpio output
> at the same time and the gpio request won the race for the lock, then
> when the gpio request was made, it would receive the RX data and trigger
> the next conversion while setting the gpio output, then then what was
> supposed to be receiving the data would receive I don't know what.

There are two conversion data registers: the shift register and the data
holding register. The holding register can only be accessed by command
(RDATA1). The shift register on the other hand is always shifting out
the last conversion in a loop *unless* we are reading a register (RREG)
or we are reading the holding register (RDATA1). This means, even if
there is concurrent activity in-between triggers, this activity will not
get accidentally corrupted.

Additionally, reading data doesn't trigger the next conversion. In
continuous mode it just keeps triggering after the first START signal.
In pulse mode we have to keep sending START signals. So, there is no
risk of concurrent activity from accidentally triggering conversions
either.

To read conversions from the shift register, the requirements are to not
have concurrent activity between the DRDY signal and the data read, and
to finish reading something like 16 clk cycles before the next DRDY.
That's why when reading only one channel we read by command, and when
reading multiple channels we first hold the xfer_lock, then enable the
channel, wait for DRDY and then read from the shift register. This
happens for the whole sequence of channels, so there is no risk of
corruption from concurrent activity happening in-between triggers.

Of course, as you pointed out in the patch, the current implementation
is still racy. That's why the next implementation will read multiple
channels in pulse mode, while still keeping the optimized full-duplex
method.

--=20
Thanks,
 ~ Kurt
