Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9C64A4406
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 14:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001502; cv=none; b=jrQb86zNJFLVK5hyBMonYrq0zdWC5rZEWz9Avhs9XP4SotlmHJl9WUCcZP9IVjzl6ORCA1zO2un8ybxhwea2LQR2BBRVGPFdyCm16YBdcMbQ/+CCGPZBz2iwGGRdzJwe7BEVPpHLaR8I4uSxwBgcD8yBjmT5WXeW1iY2s1j9T3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001502; c=relaxed/simple;
	bh=s70//DjY7BeA16evbTyuVKF24c16SPe1db7Dfk/NSa8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfr8Ulsv6fH2F5NSAuXm3VNRwmd8Az+5m6GfcPOSvOEJVLLq3uAxZO0PqVlAVEb4m0+clqxNzmnQ685LRocOTqAXOSrcxWyTL/BKcpz+djEA1OxQnltLqzj7fGn3veqJwPcVJCHusdMEcxwBRCduI2budlYscuz6J8AXIGdYVec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsPS1mzL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsPS1mzL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9501F008A4
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790001500;
	bh=s70//DjY7BeA16evbTyuVKF24c16SPe1db7Dfk/NSa8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=fsPS1mzL6YW/pR8QWs5xNlAotEZ5Yjnnab5fOOa7KIIThRRacMD6k4fIF4ZpVJtOF
	 XLqlS9jasQ0AKCSGpS4YUDyK3I0L7h+aI+S4ALNjEIKBu1KpAUZmtjy5+5+KsDUpiz
	 O2qWbFY2Iseq9fEYoG56CVQ+MXwLabIiORMmRw4Taz0ucIE9d9Ld7U2MgqPMySuY/+
	 IjH3SVsRFeGnyIj3+p0uyLmc233wU5Fp1Yzs0r1kXqDxzxa/G1XXhawDLShPNCbo3c
	 9RLCFOsjOu36BUdnHiOUt6WZXL8L2mR8gQDLRbb2zn6wiAhG+YE1KrhuPR9mCjHsEc
	 G8OhBs25DUoYA==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff17443dso32331361fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 07:38:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBym8GBOa9lQ3hILRO1Sv6bZ+0YIZkYPNEyc0dwzht4mUxcG8mvBEsVr3gWg+FwBQXoXen756IarTJ9q@vger.kernel.org
X-Gm-Message-State: AFuF++kh8GqdN4gltHEn1V/nrsVQjc5AL64BjwwiykGDh5uoZf3UHqjE
	CN142DrjwS1vv3B9s3rEzGnIPNfbdQPQQf3RAL7bULqz4LzdeL4jFa8IBrHpNQFYLbOhMcHtUa2
	Rj1H7hOv2n9BitbsCyxb0hlM6c/uplJb1P3DoKLRkVQ==
X-Received: by 2002:a2e:be10:0:b0:3a5:b6af:2973 with SMTP id
 38308e7fff4ca-3a5fbe86f32mr23755041fa.5.1790001499128; Mon, 21 Sep 2026
 07:38:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 10:38:17 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 10:38:17 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <6ab12d24.a3d4836d.3b68e.d0f8@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
 <20260906-add-rust-gpio-consumer-v1-3-24d192f93760@gmail.com>
 <CAMRc=Meei7Z1f1n0M_Hy1LdxG=NVhkFeEiT3=p5QVpw6BTv3EA@mail.gmail.com>
 <6aa662d7.0ca013b1.1575e3.0a60@mx.google.com> <DLENO35F39LL.2YNA66D9FCXYH@nvidia.com>
 <CAMRc=McV2YKgbmnknLZTSGoSa_9eCHDiOLzuPPyPHHnj=vRuvw@mail.gmail.com> <6ab12d24.a3d4836d.3b68e.d0f8@mx.google.com>
Date: Mon, 21 Sep 2026 10:38:17 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfZckBMT-4PEDxr-PjRbUPO4FY3OZw8ks3w+uoEyixbAQ@mail.gmail.com>
X-Gm-Features: AcwNN1Unsyb1UpNAO7uNOy5o7GnFnN-y12042OClQvowlbns5Ay0DOvSip9djMY
Message-ID: <CAMRc=MfZckBMT-4PEDxr-PjRbUPO4FY3OZw8ks3w+uoEyixbAQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] sample: rust: Add GPIO consumer sample driver
To: Kohei Ito <koheiito.dev@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sep 2026 15:12:01 +0200, Kohei Ito <koheiito.dev@gmail.com> said:
> Hi Bartosz, Alexandre,
>
> Thanks both for the feedback.
>
> On Mon, Sep 14, 2026 at 04:36:48AM -0400, Bartosz Golaszewski wrote:
>> On Mon, 14 Sep 2026 03:41:29 +0200, Alexandre Courbot
>> <acourbot@nvidia.com> said:
>> > On Sun Sep 13, 2026 at 5:46 PM JST, Kohei Ito wrote:
>> >> Hi, Bartosz,
>> >>
>> >> On Thu, Sep 10, 2026 at 12:37:17AM -0700, Bartosz Golaszewski wrote:
>> >>> On Sun, 6 Sep 2026 10:45:51 +0200, Kohei Ito <koheiito.dev@gmail.com> said:
>> >>> > Add a sample driver to demonstrate the use of the Rust GPIO APIs.
>> >>> >
>> >>> > Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
>> >>> > ---
>> >>>
>> >>> I don't like samples as they rarely get built or tested. We seem to already
>> >>> have kunit support for rust, wouldn't it make more sense to implement a kunit
>> >>> module for rust GPIO abstractions? If we don't have provider abstractions, you
>> >>> should be able to reuse gpio-sim as the GPIO controller for testing just by
>> >>> instantiating simulated GPIO devices.
>> >>
>> >> Thank you for your suggestion.
>> >>
>> >> I assume the kunit module you have in mind would be implemented like
>> >> `gpiolib-kunit.c`. Based on your comment, I agree that a kunit-based
>> >> approach is more appropriate than a sample driver.
>> >>
>> >> However, as far as I know, we don't yet have Rust abstractions for
>> >> platform_device registration and software_node, which are required to
>> >> implement a kunit-based module for testing GPIO consumer APIs. Given the
>> >> current state of Rust for Linux, I think creating a sample driver is a
>> >> more practical approach for now. I would like to consider migrating to a
>> >> kunit-based module as future work.
>> >
>> > The problem is that this sample driver never probes, so in effect it is
>> > only ever compile-tested. Without support for the provider API, you need
>> > to include a small C fixture providing a GPIO chip for it to be actually
>> > runtime-tested.
>> >
>> > Doing the same using KUnit would involve building the `gpio_chip` using a
>> > bunch of unsafe statements working with the C bindings (which would then
>> > in turn require `gpio/driver.h` to be added), so I guess we'll want to
>> > wait until we have a proper Rust provider API to go that direction.
>> >
>>
>> No, I was thinking about the gpio-sim module which is implemented as a platform
>> driver which you can describe with a software node and then register to create
>> a simulated GPIO provider against which the consumer APIs in rust could be
>> tested.
>>
>> To that end, we'd need to just register a platform device from rust and AFAICT,
>> there are already APIs for that, except for the software nodes.
>>
>> Bart
>
> I looked into this further, but couldn't find any Rust abstraction for
> registering a new `platform_device` (no file contains a platform device
> registration function such as `platform_device_register()`,
> `platform_device_register_*()`, or `platform_device_alloc()`/
> `platform_device_add()`). So, we can't write a fully Rust kunit module
> for the GPIO consumer API, at least for v7.3-rc3.
>

Right, I must have misremembered this.

> The best approach I think is a combination of a Rust consumer driver and
> a C kunit module dedicated to testing the consumer driver. This is
> almost the same as `drivers/gpio/gpiolib-kunit.c`, except that instead
> of directly exercising the GPIO consumer APIs, the module I'm suggesting
> exercises them indirectly, through the Rust consumer driver.
>

Can't you just call a C function registering the platform device from unsafe
rust?

Bart
