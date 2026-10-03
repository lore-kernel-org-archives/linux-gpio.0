Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3790A4A9D4A
	for <linux-gpio@vger.kernel.org>; Sat,  3 Oct 2026 16:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791045937; cv=none; b=SVHn+g+9XH1C32Gf5ZEobrcMacHqnUPC+zyLlWcOMgRyKsLf5OAuO+G7WlQwPxG+uyj4j85F+YUu6BrTTzY6zufebfKvhLqL6S5N+JlKlo9en7FtJIjfXKJaHt7xtIb4t3yCn+WgUtbSr77NhTqs4+7wOxTrjNbyLYNq+SXpNTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791045937; c=relaxed/simple;
	bh=Z5+z7hNiBBNdVlbXFF76RV5SnZkdJjiqvRRCBvSiz5M=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boIOO4dEwLwzhOMd5FfSfEGn4B1VptyLSSgMayxGxcz9EfjQV1mFBxXZCt54aoemMJ9x/OcQDJaSmOwsGvlpyLgEzejwN175YFRk9wH5jJ6No1i4lEC49bZqx9LHHIPpwdYMWXONipRp09Cf1Fdo2fxTQNrB8+YIGD1qIvIXgk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFphFe5S; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFphFe5S"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso301354a91.1
        for <linux-gpio@vger.kernel.org>; Sat, 03 Oct 2026 09:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791045933; x=1791650733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XwUxbbpJnDbzL/dxfGXuu2rEGUNZ/u1k+T1w6QXAexY=;
        b=fFphFe5SokgvKiDThGaJO86hQ7NU1zNQpWyo7Viy3haREWJ9yV9Xnx55mBbQXgksuw
         fnYpKGgGOoNpudSycsm5bwI+seS6ZwGvuUCJPWx3GxlQWvt47eK8PSFg++Dm1+ue6UTV
         z88C0e3wXq+OtIHy8NBCVriVTJ/L/j4QPpXQEIW3Uh4j8Fmb+Pz6/Ds5eKenhO7RCVcH
         SwlGAcvVjxmh8veyzgVMQSpzuAM6aVkRlwUE1JjT+mVrnztHCuBQq/0WNQZizZcGzt+6
         wcf4g4vLqyOw/1/anbiNzRJCPc8dRHxs2MHIpxAYwVSiEXwqa84mLzUEjPD/vuRJhMpi
         mYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791045933; x=1791650733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwUxbbpJnDbzL/dxfGXuu2rEGUNZ/u1k+T1w6QXAexY=;
        b=1ZdVN/VhMY77zedDYTQzM/rljWuz1kbIS45zyDphk4hUQX6WBCOtdfuSfyrSqbNTJr
         nf/Dl7IMcBEvfIOQ5bH393sCYLpv+WW3rBJPTjI07MHQJEqb1zc5F7YwrwU9bk8CaSgq
         5csi7NWymrsDnrhQO625NrkAVXvLeta0AoHmWcBj6qNQ7Ys/4YnX0dB9EuxwWoUau7gl
         aPfDFwJhwklvjZIs0INqJhQtivxHE2nK5tZoabLgY8jSSEjhhZ+7XoRNWgYUtqWVs8TL
         S7iLZO0eZGTRLUKzZWA95kRlss+7Z6QXZls8oZj6J4e1Ww7okQDIzH+wnFwk7OSs8AIg
         ae8A==
X-Forwarded-Encrypted: i=1; AKwUvBzhj5vxzfBTiMQE7RhTjNNTpKfsZzq5t+MFE+9SpgjiVgeglp4UsqTO/aDQwyesyahaZHHQpvzVePYJ@vger.kernel.org
X-Gm-Message-State: AFq9FYLPv/OOwDcOTK7iOUoacJIZPgKiOEKEcpecrySozDjWDnzY+5CV
	oHQcWkiu0NMQDHCZF/vbMPZ2/aq8G4nkwAriEsh/qPfsjx6WzQUeLnEp
X-Gm-Gg: AYBFou3+t7Kv3oONS2xXT+OtPhK5IZV+F7g6exZ/Mk914DwzCi4F8+0VJd+8v46xBVY
	1e8ocCidufYWrkSLpK+3jCOcZL23pMzsQhfLXC0RIs6JuSSzmR30SGhT/p8rzdbXijy4CyMsbNU
	kvNhDvVuzvEbNM12MlRXd4HYeN49mOQQO82IPgSUdZcvRqxhOq7gm89iYSvg+dDRCLlvVYWkRAg
	M77qxtAYC2wAetw6PyufwlZe+j3Xd+62B/vycMRvTse2yyKI+jkL2nv23bnY5R/RrMb4rqKhCmm
	Ac1CkUvrtZZ1rFgNnuu5cLgiihcSHTxQRUV/hHZTq9WIUJtDlh90DMbk4nlWGVLjmF/2531Wxw/
	iZqbdYiAQnRtdj7aAISiq9vzbR4492FErafpqXmUHnG8jSwrMMQ4ftUpQh7dx8MZ9Jx1g1oPszy
	PdsO+XHkTjn29uX5AwYbUYp1e5bKllNx8Zd/Mk9jIDEy+Mp69ZdhlDxXtlutNVmmxces+OyJSCo
	brdGg+X/vukmKstLQ==
X-Received: by 2002:a17:90a:a82:b0:3a6:e159:a233 with SMTP id 98e67ed59e1d1-3a6e159b3e8mr3430086a91.43.1791045933065;
        Sat, 03 Oct 2026 09:45:33 -0700 (PDT)
Received: from localhost (madb688426.ap.nuro.jp. [219.104.132.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d6878d2sm3528085a91.8.2026.10.03.09.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:45:32 -0700 (PDT)
Message-ID: <6ac1312c.ee551989.ce4ed.e56f@mx.google.com>
X-Google-Original-Message-ID: <20261003164530.ay47jwe3xjuyfmsn@DESKTOP-1P5QNTF.>
Date: Sun, 4 Oct 2026 01:45:30 +0900
From: Kohei Ito <koheiito.dev@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/3] rust: gpio: Add basic consumer abstractions
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
 <20260906-add-rust-gpio-consumer-v1-2-24d192f93760@gmail.com>
 <DLE2CBE8FJ9B.23HDU37C95ROK@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DLE2CBE8FJ9B.23HDU37C95ROK@nvidia.com>

Hi Alexandre,

thank you for your review.

> > Due to a bindgen issue that may generate the wrong type for enum types,
> > `gpio/consumer.h` is included at the top of `bindings_helper.h` as a
> > temporary workaround. Once the issue is resolved, it can be moved back
> > to its proper alphabetical position.
> 
> Can you describe what the issue is, and share any relevant link?

`bindgen` can generate the wrong type for the `enum`s when their
forward declarations appear before the actual definitions. The details
are described in [1].

I haven't confirmed that `gpiod_flags` is actually affected. I placed
the include at the top as a precaution, but if it isn't needed I'll drop
the workaround.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8cbc95f983bcec7e042266766ffe0d68980e4290

> > +/// The GPIO descriptor flags to configure its direction and output value.
> > +///
> > +/// Rust abstraction for the C [`enum gpiod_flags`].
> > +///
> > +/// They can be combined with the operators `|`, and `&`.
> 
> The C comment for `gpiod_flags` says "these values cannot be OR'd" so I
> guess this comment isn't true. Besides, there is no `BitOr` impl for
> `GpiodFlags` in the patch so it actually cannot be done.

Good catch! I'll correct it.

> > +    // Always inline to optimize out error path of `build_assert`.
> > +    #[inline(always)]
> > +    const fn new(value: bindings::gpiod_flags) -> Self {
> > +        build_assert!(value as u64 <= bindings::gpiod_flags::MAX as u64);
> 
> Better to not use `build_assert` here as it inserts build-time
> landmines.
> 
> Since you are only using this to build the constants above, you can just
> do `Self(bindings::gpiod_flags_*)` on them. Adding an extra assert for
> an bounded enum type doesn't add any extra protection.

Sure. I'll remove it.


> > +/// A reference-counted gpio descriptor.
> 
> Not really - the GPIO device is reference-counted, but descriptors are
> not. Calling `gpiod_get` a second time returns `EBUSY`.

Sure. I'll correct it.

> > +/// ```
> > +/// use crate::{
> 
> These doctests won't compile as they are supposed to use `kernel::`, not
> `crate::`.
> 
> Please make sure to include the doctests when building
> (`CONFIG_RUST_KERNEL_DOCTESTS` build option), and to also build the
> `rustdoc` target as per the checklist [1].
> 
> [1] https://rust-for-linux.com/contributing#submit-checklist-addendum

Sure. I'll fix it and make sure to run the doctests and build rustdoc.

> > +// SAFETY: It is safe to call `gpiod_put` on another thread than where `gpiod_get` was called.
> > +unsafe impl Send for GpioDesc {}
> 
> We should probably also implement `Sync` so GPIOs can be used in
> interrupt context.

I agree we want `Sync` so that GPIOs can be used from interrupt context.
However, the direction setters are not safe to call concurrently on the
same descriptor: gpiolib changes the hardware direction and then updates
`GPIOD_FLAG_IS_OUT`, so the two can become inconsistent.

I think we can add `Sync` if the direction setters take `&mut self` (or
use the typestate approach). I'll look into this together with the
typestate design.

> > +
> > +impl GpioDesc {
> > +    /// Gets [`GpioDesc`] corresponding to a [`Device`] and a connection id.
> > +    ///
> > +    /// Equivalent to the kernel's [`gpiod_get`] API.
> > +    ///
> > +    /// [`gpiod_get`]: https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_get
> > +    pub fn get(dev: &Device, name: Option<&CStr>, flags: GpiodFlags) -> Result<Self> {
> 
> `dev` here is only used as a lookup key, and the GPIO descriptor can
> outlive the device being unbound (the GPIO can actually even be obtained
> while the device is unbound!). This is because `dev` is not the provider
> of the GPIO, but as the API name implies its consumer - i.e. the device
> on which the GPIO is expected to have an effect.
> 
> This is what the GPIO API expects, but it looks a bit counterintuitive
> when compared to most other Rust subsystems, where an obtained resource
> is typically tied to the device given as parameter being bound. I think
> it's worth mentioning in the comment.

Sure. I'll add a note explaining how `dev` is used.

> > +    /// Get the direction.
> > +    ///
> > +    /// Equivalent to the kernel's [`gpiod_get_direction`] API.
> > +    ///
> > +    /// [`gpiod_get_direction`]:
> > +    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_get_direction
> > +    #[inline]
> > +    pub fn get_direction(&self) -> Result<LineDirection> {
> > +        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
> > +        // [`gpiod_get_direction`].
> > +        let ret = unsafe { bindings::gpiod_get_direction(self.as_raw()) };
> > +        if ret < 0 {
> > +            Err(Error::from_errno(ret))
> > +        } else {
> > +            LineDirection::try_from(ret)
> > +        }
> > +    }
> 
> IIUC the direction of a GPIO at a given point in the code is always
> statically known, and only a subset of the API really make sense for a
> given direction (e.g. `gpiod_set_raw_value_commit` returns `EPERM` if
> the direction is not output). So this is a prime candidate for using the
> typestate pattern to store the direction in the type.
> 
> I.e. you would have `GpioDesc<Input>`, `GpioDesc<Output>`, and changing
> the direction would consume the descriptor and return the new one with
> the requested direction.
> 
> The regulator Rust API makes use of this pattern, you can check it out
> for an example if needed.

I haven't fully grasped the idea yet. I'll check the regulator Rust API
implementation and explore a typestate implementation for GPIO consumer
APIs.

> > +    /// Test whether the GPIO is active-low or not.
> > +    ///
> > +    /// Equivalent to the kernel's [`gpiod_is_active_low`] API.
> > +    ///
> > +    /// [`gpiod_is_active_low`]:
> > +    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_is_active_low
> > +    #[inline]
> > +    pub fn is_active_low(&self) -> Result<bool> {
> > +        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
> > +        // [`gpiod_is_active_low`].
> > +        match unsafe { bindings::gpiod_is_active_low(self.as_raw()) } {
> > +            0 => Ok(false),
> > +            1 => Ok(true),
> > +            err => Err(Error::from_errno(err)),
> > +        }
> 
> In C this function cannot fail for a valid descriptor, so the Rust one
> shouldn't either. Anything != 0 can be considered `true`.

Sure. I'll correct it for `GpioDesc`. Should we return Result<bool> for
OptionalGpioDesc? As I understand, NULL GPIO descriptors can't return
the right state.

> > +    /// Report whether gpio value access may sleep or not.
> > +    ///
> > +    /// Equivalent to the kernel's [`gpiod_cansleep`] API.
> > +    ///
> > +    /// [`gpiod_cansleep`]:
> > +    /// https://docs.kernel.org/driver-api/gpio/index.html#c.gpiod_cansleep
> > +    #[inline]
> > +    pub fn cansleep(&self) -> Result<bool> {
> > +        // SAFETY: By the type invariants, self.as_raw() is a valid argument for
> > +        // [`gpiod_cansleep`].
> > +        match unsafe { bindings::gpiod_cansleep(self.as_raw()) } {
> > +            0 => Ok(false),
> > +            1 => Ok(true),
> > +            err => Err(Error::from_errno(err)),
> > +        }
> > +    }
> 
> Same here.

Sure. I'll fix it in the same way.

> Also, as a general guideline, it is good to have a concrete user for new
> Rust abstractions. Do you have a project that will make use of this?

No, I don't have a specific project that will use this. My motivation
is that Rust drivers currently have no way to use GPIO lines, so I
expect that providing a basic set of consumer APIs would make it easier
for such drivers to appear.

That said, I understand the concern about adding APIs without actual
users. If you think it should wait until there is a concrete user,
please let me know.

Best regards,
Kohei Ito
