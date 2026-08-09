Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAD13ACA54
	for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2026 08:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786264199; cv=none; b=g1SVcVmup3NUj74ARGFfEytqSGfw3G5o1TXPZpfNH+w0lcIcib3XlKWHqWWVNl0vwYcUbGum6Up96IjqjEcgZWgVzRVmEBnuD0lRLV9nV1HDaNRu5e/NASs5C18MPSOBdHHbxhF1mfXIk9fhoiowTiQc3pm0E7xA4B5LNqKX9P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786264199; c=relaxed/simple;
	bh=Tr0vhSlpYrIm8pUdtGcembVGsxzFGAswf+yCpBXcDns=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:Mime-Version:
	 References:In-Reply-To; b=bvtAuzU9xnyrJAg+cpnVDt7sWGDjSshTx8tf7Ofu8xS8294p9ATzcEF3RwrTssz/a+u5YxDaSCyWB7Duyu2X4waJw5hb4w+5JNI5nAP3LNus8mOpWgacGPuttA04iXxCo2fRIl3OlQQ8UT279cZn5GCIpFO0asC1s+/vxOzgqRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYVeFaCw; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYVeFaCw"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97723f98735so547688241.3
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 01:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786264196; x=1786868996; darn=vger.kernel.org;
        h=in-reply-to:references:mime-version:content-transfer-encoding:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8UdgNkOqkWbZyhRHf5OOeBdpskYt04c7oStZ3xaPyw=;
        b=NYVeFaCwJ1w9W8lBSg19+M1n3++sgJndS1B6Kr4q9aG8FX8X7wfBVSr7SbyNrOLK7E
         k69KfK9vKh4MA6o0kig3qc4aZEKaymfh5VozEHOgULEXfDM0IzJX9450A5BeK/0+YHfH
         6lmyWnZMNbk4HEcL/QEMDwqK75x3H+iun5OmTmQCIqo3TIxvgsYrefvmYCXLCV8vEPN1
         XxXwVR5T63KbKQirbFAczjeYLKVrb6iVuyy/5mfY6Zdf1JO9QGux+sCE8Mri9Fu/h7z4
         bmm7FG7sdVtZ+ZSWP+O2MyJ2IvvEysedx/MPzvWUH+Uk6DzDNUe4uaR5d47TedF/LFwU
         QNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786264196; x=1786868996;
        h=in-reply-to:references:mime-version:content-transfer-encoding:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8UdgNkOqkWbZyhRHf5OOeBdpskYt04c7oStZ3xaPyw=;
        b=RKkuQ+veUaKxuh93ysCMR5hd3/2sShIcQ4e5iamrAApY+IhBwfi3ZVxZV832dmuZng
         7DeQW41WjUOF4vqh/rEj8wpMWjJMDb4rI3473FIYkpZARoN3Q5UEe6T0I0KjlBIk0SfC
         cDQIxXKdtAuZRKkBu2drtNWEwick54OY797+37yprCR69xHZLHE7hClLDcd4SMd/o9+Q
         uXzT3jwCpMO5irObQoxK2HI6yX97ueb8URUxTe/bMy1XdeQkwh2lZHOujrcBinb15+r5
         OtKmc/6OZ0NKtdMo2Td3gxnWzoe18yzj/WWv5laTZmpX3i+g0xQUPwLKtCK8wry8/UaJ
         wLNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpK5TKl1eyMJdqrroTx18B/cjVTTjb7lasu1eX5E22sY6XO/AtD+JfKdgbSR6Mt/AU42modqjfz3rH1@vger.kernel.org
X-Gm-Message-State: AOJu0YxQSfA+FDxAIgFVKku5hM9j64UhSPvRnzN3bdGdWM1HAOsG0fU1
	Wt1Fhhb3QZYTdVo7JCNT0p0vp3ldspPOpV9eINKhXfb4G4MrdR1mx0GqkNKraQ==
X-Gm-Gg: AR+sD13et/oq0eOy1vjWUWyc/qx5XjNpp+tULf8FPLlYrTNqr+SfoosCf03L+3DDftl
	jCCP40dJ/V9nh/BCseZO69Nhejo25NfAF8htxpT0xIisDSrjkC2gVjeQt0qqzl7mwBN8uUNPV2B
	xpRZZGK9Mz6pT+VxPStLFKNpMEEWDeBDt9Hg5c1NrY7vyK1qt/3OXXFcq95NPP9dv6Ny/t/5wIr
	Cl8PxBA14I9k3runlWw3X8kj8Q0hiDBuaUEQOqL0AvDNGOjN9PIvjEwitXjkJEfqh2Yc3BCvA7p
	ZxUHdMrxLBwIIBCecdJyqW/yzOal2DAFCy22LKITn2RCdXDm+YrxjKUGXtBnHl63Lyokz4+S9bj
	zs2RpzC0h+KKx5hfZBu9i3syp5dW1duSvaZpR/uX/5MZ3UKsBlQi6LKR9GNNPt+Yc942A+S5Xdk
	KdmdvsElYb9IajktqhYzSLv+42M1+N1YXBIOXgofT/p6RkrVNTeYc=
X-Received: by 2002:a05:6102:801b:b0:744:dd70:a364 with SMTP id ada2fe7eead31-7634d10f5c8mr6869570137.9.1786264196337;
        Sun, 09 Aug 2026 01:29:56 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763feadc5e1sm3238702137.6.2026.08.09.01.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 01:29:55 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Aug 2026 03:29:49 -0500
Message-Id: <DKK9T3XRZJEV.R83PII0D35H@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 0/9] iio: adc: Add TI ADS126X ADC family support
From: "Kurt Borja" <kuurtb@gmail.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <9c2e2c46-32de-4e8a-88c3-bfc2cfe8157c@baylibre.com>
In-Reply-To: <9c2e2c46-32de-4e8a-88c3-bfc2cfe8157c@baylibre.com>

On Sat Aug 8, 2026 at 1:37 PM -05, David Lechner wrote:
> On 8/7/26 10:58 PM, Kurt Borja wrote:
>
> ...
>
>>   - @David: I added support for the monitor channels, but I prefer to
>>     parse them from DT instead of making them static (similar to the
>>     ad4170-4 approach too :p).
>
> Why? Unless there really is some property that depends on how the
> system is wired up, it seems like this is just making unnecessary
> work for users to be able to use the monitor channels. And if someone
> decided later that they do in fact want to use the monitoring channel
> and it wasn't in the devicetree, sometimes it can be very difficult
> to actually change the devicetree.

The only thing I can think of is the reference source. The datasheet
says "Measure the supply monitor readings using either the internal or
an external reference".

I saw that the ti-ads112c14 also allows the monitors to be referenced
externally but you didn't implement support for it. In my case I think
it's okay to leave it unimplemented too and make the channels static.

>
> The monitor inputs also have many restrictions compared to a
> normal input that it would be really hard to describe correctly
> in the bindings without allowing things that should not actually
> be allowed. (can't have excitation current or burnout, temperature
> channel requires internal reference, most should be single-channel,
> etc.)

Good point.

>
>>=20
>>   - @David: About filters... As I mentioned in the previous version, the
>>     data_rate configuration takes precedence over the filter selection.
>>     If an incompatible filter (given a data rate) is selected, the chip
>>     resorts to a sane compatible one when doing conversions (either
>>     SINC1 or plain SINC5).
>>=20
>>     Now, I don't know how to expose this in userspace. Should I limit
>>     the sampling_frequency_available attribute (given a filter)? Or
>>     should it be the other way around, limit the filter_type_available
>>     attribute (given a data rate)?.
>  I figured that the filter type selection would be more important than
> the rate so when I implemented it for ADS112C14, I made it so that
> one has to pick the filter first and everything else flows from that.
> (I didn't expose sampling frequency until the same time as filter type.)
>
> The thinking behind this is that if you do care about filtering, then
> you are picking filter type and sampling rate to get certain notches
> and/or frequency response of the filter rather than trying to get a
> faster or slower sample rate.

I think this makes a lot of sense in your chip because there is no
plain "data rate" register. The data rate ends up being a consequence of
the modulator divider + OSR/filter settings.

>
> And the driver also allows using an hrtimer trigger to do single-shot
> samples for cases where one doesn't want to sample as fast as possible
> in continuous mode. This would be more useful to someone who just cares
> about sample rate and not about filtering.

Why did you go for this instead of just leaving the continuous mode
running and reading on each trigger?

>
> Just posted the series yesterday:
> https://lore.kernel.org/linux-iio/20260807-iio-adc-ti-ads112c14-filter-su=
pport-v1-0-4d3ba00caf18@baylibre.com/T/#t

Can you Cc me this series too? The settlingtime stuff is something I'll
implement too.

>
> ADS126X seems a little less complicated in this regard though
> as the same sampling rates are available for all filters with
> the exception of the FIR filter having a limited subset. So I
> would go with the option to limit sampling rate based on filter
> type, not the other way around. If a higher rate is selected
> when changing to the FIR filter type, just have it go to the
> max (20 SPS).

I'll go for this!

>

Thank you very much for your review and tags :)

--=20
Thanks,
 ~ Kurt
