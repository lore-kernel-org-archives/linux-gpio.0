Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B054378822
	for <linux-gpio@vger.kernel.org>; Sun,  6 Sep 2026 15:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788710027; cv=none; b=UvbCQMwSjUbex8fGcZso70aTwfVGu4t7AhwYyNvgUbtfo1WNqsOIhCATt014BeoNxxS8mgW7AGNIPtv+NYjpaizTUVK955jfGVNKdVhC03d4njUQzVhTl0dmfKntQr4UCzrvfrwH3etwko5R/HdUTQNUKnm5txps4m8oAWHDFRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788710027; c=relaxed/simple;
	bh=iXeuXZinLwPRHtHoRD2Ox32yQacS6fb88foD+iwKC5I=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfY8cyfOP/oBs0swGtdW0RGnULszRiJhN3elUzgAdsOHguYw76+NkGBh6SemvLSNkJvVZXbdbRZIFjZl5yTSqtgqL1ibWlHXiAgXEvNsQfaV4mz40jqw/N731MHUGLdkF+19ZS2wI1nXn5vBzsawIW49111tcpsgipXKRxHTo84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0k1WdWs; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0k1WdWs"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2414832a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 06 Sep 2026 08:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788710024; x=1789314824; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZKG0N4Qd9s3jT0vFHcSeVc0433ACE4MO/8edec8Z6I=;
        b=I0k1WdWsx9WNfUFzK3BCcm/BNEFTWwsSSN1wsCkjh/W3e03sW3FrKRgga6+nkV5OIa
         GEqvcSuepfem0vtcK9eRFpdHfs0fsmMrFwXcXObxNZ0W/5MTQfFnnzXgCch1vdFT355o
         AKlgGOiBw7NXbkXRQhWgRlnS73Soey6eW/4SWZOlLv/qlWWc4yF5Zc0UfmVCgbtRfA7p
         Rab3z+XWQZPxKy0j9hBclzk5skPzkXj9IYYjj+lQUrExtfpo0tRP+TGkOLjAtcwVM+gS
         0vg5gESMA1idbisUWf9LZEANhJ3vno7R5txyykz0JKQOhgbsYpBSQcA8B5+Q9QZbZR9W
         4V+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788710024; x=1789314824;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZKG0N4Qd9s3jT0vFHcSeVc0433ACE4MO/8edec8Z6I=;
        b=WknKrgkA48NFGVcmwd2IHzvW4myowo16nNTeHVlR8XxsJOliXU3VU4Fwqf5cNOtn7E
         vMACgQfSW0NvB9vWv/GTAP6aYfcn+mo86lfeXoYr4tBcpVmpg05G5a7Q3JN57JYj55+X
         uBpWydOGpLf95S6quzIt/9OJXqF8/rUyACpRBJfugfx2lpViUbWasUwvc+DtT0Yk9he1
         kIquZp89F8w6BZpbrbErkqf6NK3vvXpBthZ6EeGjlJVbx+/LKW7DHe8D4CrezIpmG2on
         bvkdAKZjU9sMiNNhnPU4PmmfMofGh3mHr/JZbm67szNPdxXE3Xwm8GWMYGALt1TxNpTE
         Vafw==
X-Forwarded-Encrypted: i=1; AKwUvBxoeuGdJl5iBqmLtWi3Z/Oe0W4ZczDNgdmkKCexkvNUqbDMCr5wyCSbihtz5VJDvDyyLkMzXSmEVqHr@vger.kernel.org
X-Gm-Message-State: AFuF++n+jaQjYVR8MhBKfznNwM0ndc9HlTPFfUOT/KU6/UNWLeKuAkSu
	SzhIys//qn8tVW6Aa9MRIUGLbPp7N/kYwcJRLF/Ll71sP6CCYfuxz/3f
X-Gm-Gg: AYBFou38/Iq652a15ay7+bF2RmF9FSq+IpgM1VKx9LJwlyWb0pdhRLN7Nlioqj6DM3I
	tXVfWetyQlcTz6FEU7m/mUI/U9mkk8jaU1jFmhYQqHfZ88nzH6IvslMdN8vnHSOWV89FWpeEes/
	3+4lgVROM4rIbW9f1Brk55QFC3xSRWLHNWJdM1mFJuQhjLZh2rm6WCF6V65guokY8Tm2f6QYUWH
	AfcW9hShll2u/ON0v9/6LsDH8pn1l+MXsIJ85t8HwjhIu7PdsZbQq9HYIum804WiRwoXLJ5HP0h
	b1/7cU20MpRLz94ZCd0Nh0DtaxHIJMJhZmDdWH6wN1HQjJUXhg6y0tKILFs+QaP15Q7QUWUM+iV
	1GGwYKoFCfHEgGR6kOgZaLDr3mfwbwTDj9cPrUWERfPUI1QplFVHzwIH9ZIvF2LGPQdQChGpG6f
	tswwbOjZFy5459SZ5oz1moXdUbbZMTL1PAa7vM7T/gsaYxHV17E0bs+L+mtn72acq9fQH/l8bfS
	oVB+Kpw6mRshl+xYjo=
X-Received: by 2002:a17:90b:2ccd:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-39b27c442f8mr14641110a91.5.1788710024292;
        Sun, 06 Sep 2026 08:53:44 -0700 (PDT)
Received: from localhost (madb688426.ap.nuro.jp. [219.104.132.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c3a526sm21561901a91.10.2026.09.06.08.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:53:43 -0700 (PDT)
Message-ID: <6a9d8c87.7436a696.197962.124d@mx.google.com>
X-Google-Original-Message-ID: <20260906155336.vppadsy6zpw3mlfa@DESKTOP-1P5QNTF.>
Date: Mon, 7 Sep 2026 00:53:36 +0900
From: Kohei Ito <koheiito.dev@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/3] rust: gpio: add GPIO module with common definitions
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
 <20260906-add-rust-gpio-consumer-v1-1-24d192f93760@gmail.com>
 <CANiq72m6YZhqzE7GWEakmsZ35QN5UF_HTcVBavKxbq8cV7yk6A@mail.gmail.com>
 <DL89AIIO0EQF.3U7UGK7JIRZ72@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DL89AIIO0EQF.3U7UGK7JIRZ72@garyguo.net>

Hi, Miguel and Gary,

On Sun, Sep 06, 2026 at 02:09:30PM +0100, Gary Guo wrote:
> On Sun Sep 6, 2026 at 10:56 AM BST, Miguel Ojeda wrote:
> > On Sun, Sep 6, 2026 at 10:46 AM Kohei Ito <koheiito.dev@gmail.com> wrote:
> >>
> >> Add the top-level GPIO module with minimal common definitions. This
> >> module is the basis for future Rust GPIO extensions.
> >
> > Thanks & welcome!
> >
> > I see you Cc'd linux-gpio, which is good, but the GPIO maintainers
> > should be Cc'd too, since they are the ones that will be deciding on
> > this -- doing it for you in this one so that they are in the loop.

Thank you for adding the GPIO maintainers. I'll make sure to Cc them in
future revisions.

> > By the way, it is nice to see GPIO again :) Now that some years have
> > passed, how does it compare to
> >
> >   https://lwn.net/Articles/863459/
> >
> > ?
> 
> This is possibily also a show case for all our I/O projection and register macro
> work :)

Thank you for the pointer. I was not aware of the past GPIO abstractions
[1].

As I understand it, the past GPIO work focused on the GPIO driver APIs
(`include/linux/gpio/driver.h`), i.e., for the drivers that provide GPIO
functionality, mostly present in `drivers/gpio`.

On the other hand, this series implements GPIO consumer APIs
(`include/linux/gpio/consumer.h`), i.e., for the drivers that use GPIOs,
such as `drivers/leds/leds-gpio.c` and `drivers/reset/reset-gpio.c`.

I assume that the GPIO driver abstractions will be implemented later in
`rust/kernel/gpio/driver.rs`.

[1] https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/gpio.rs
    (Current hash: 18b7491480025420896e0c8b73c98475c3806c6f)

Best regards,
Kohei Ito
