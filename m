Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23218357D11
	for <linux-gpio@vger.kernel.org>; Sun,  6 Sep 2026 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788688630; cv=pass; b=kqoYGviGhsjwYpAcSobI88k6J28tArkcLTZ7z4L/GhpajK/UYqpp+x70chNiiLoPhm2EGcpq7XJouxRTybEDgbIgzk2DohwVKtcIo3C16m9KqnqsNm8932NP4q7VWvM5ALDlmkNG4KkuSYlYyjq+kdueCCSDv/lTbRFBb7qkLgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788688630; c=relaxed/simple;
	bh=U13cH0KPgJnKYO004jjmqA/IoRiQ83LwE2ozRFiKgzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbhMNaCFLdJIB+9cCN+xc5htQdP4AyEJnPQRYrlep+JsMjsUV/7eNT7NHNIVc64qyCaAxphSIft/lwTI8mHLeqgyu9ASrTx7ZgCWRwtkDOptidUIsmnVgCHcItMrsf80zTk/aK/nldQfnRs/9LeXqULZoVcAhQOzl7IO9tR76KM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hu1kb8+D; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hu1kb8+D"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b1a806664so244304a91.3
        for <linux-gpio@vger.kernel.org>; Sun, 06 Sep 2026 02:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788688628; cv=none;
        d=google.com; s=arc-20260327;
        b=EsriST3Si8xf8YY3OPKZU//4iNp1x84d7DqjxcBfJoAaLqnF+WKPJ5uZSeyBetq5pb
         eCQvnYQgU5xQXeNrVtgR6HdbJr+sEav7zBrCR+1xFQ3yjghCW49ANFT9AJ35FiXqy0ug
         UkkcIYQwyeWYjpIBHcsGLuLLg8TBbdJNeIybyxlhlGjZuexo45+gsd1mVJrXBjx1LRBp
         Ov+NDbvXr2YcoHZYP0VUjLvPy9e2eygnyW9R4onG+hUlrom4kRPsQ/bscAG3NZv4dELS
         0lPlANWvrHs/4KYlRTVYeP/fCGXgOn3Q7bUror1UsVsNvjoGInyEKVF5vNtIJjqLZJ2u
         ZSIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNR0TadONT4lGDipXgfdwdOLaKBVMf8XKySJRN23CUo=;
        fh=j5Vq6obBucT9xazJecJV3gADc08XoT8EvGTvqtIlDXM=;
        b=mCT1zI8IOWNuZBiSs+tSTelahjfz+ZImzliEKlUWA6LB21nI51CowhZm46T+9BsDi9
         dvRwt6/ld9Fte2YU76uhYHbowI+dezoMZbuTaBIA8W1y2Ppoim9DiMPBPWX+TeMFAr8N
         mW1TJRaOpYiRiEGln3kTL6u+UpNIrVpSMzyYB+v1tT0dX5LALe453BrQghMOhkP/jJJA
         up159KLGZkTQwaE7edfbrd+zGyHtcLxrK6+4j790ANdH2O4uQ1ymfMBq05iFeO9e2q7f
         4vumVCE6cULXhEgu6g77NuzG+hNyjEQUPiGS60kcSVyb6IqpQluOSWi4DtFoUwYImgMR
         c1Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788688628; x=1789293428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNR0TadONT4lGDipXgfdwdOLaKBVMf8XKySJRN23CUo=;
        b=Hu1kb8+DUmdvY0GX1WOsprHnENusDc4jSlgGCj3mcghmMb+WlfnDPwlMYM0IyKGMOy
         1tzw703XU0Mpx5z+/H7gI2UBM7JxK5s+TKYSzGVy7uPnS5kNn2mZ0fOFx1a9xwIQE0xP
         IcuQ4nHYGeYPDAnrIxNgwQkbGKbeWeA2x2DsyPZ5isKx7iB12bqx1o+IYgftxwzujq94
         cuxeKdaA8m3gHTSHcF+6LAPL/weAIS1XjCCyoA2/nu/lkaeJ4LwPC0V647usK4vkL5bL
         t1FCDcObN5qvRdfpZkTwcvqLRWw8jBBkM13EkmiTiI12RpvK/t9e4KP2km57A/cKYe/s
         NudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788688628; x=1789293428;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNR0TadONT4lGDipXgfdwdOLaKBVMf8XKySJRN23CUo=;
        b=kdVaw4MFJAwmOcelpM1B/mxDVbqU1bq7SpuuzSBSTrPIK88V36aFyrCDFdzzsQYhTk
         zxf+7WVn/Pj1/cUvVhyr0+Y2Co3D2Nf2yNlZieoXzgfCk8I+81H0S9uCs4qZFqj4e/sK
         Jt2EIfdo2cKkCg3jS4wfiDDWBlo7YmnAYFwUoX5j0blEGgqoY1xMpqEVlVAAJnEUuV37
         q7jB+cJ7zAUkU7TxaaHEbn2XPw5nloArl3OYgPV/hETFSr+l0osTsK2+kxDu4pF4YuPg
         bPwAlLtg2jahho2WSnG1VYhiE/YOJ30rqdI9NhHu4KQzrzSevfgcXAZv8DMNjf9jvzjI
         VALQ==
X-Forwarded-Encrypted: i=1; AKwUvBwicp5B27WvyDNPNEaYsv/R6DhDDLFhykEm1SJrBQ/IpuNVYVqSY6Ygic+p1baOkkCVgqWSmZPPU4oj@vger.kernel.org
X-Gm-Message-State: AFuF++nJxADG1G1vvDYO/E90GOo02halRAEpSGMmmVPCNNGUedrR1/CF
	1NBzZCqbl89C487feIhB3tGYzjZx4c4JdQmtmfAIQZn2cGgjai2Utf2He7acFW4wAfCcX9f9jIT
	VZlcRJbtu2nXeCKyDCnb0/0alVT7kGhA=
X-Gm-Gg: AYBFou3EEI+HSsr/tpgn9lICGtuTiPg2/TEJXHwe7/ip5EP9Gx6/s5UFX479+BdNFUn
	1AkeDUc/hKHdmCYL/3cdbTJAnrr3dWrQRUCesw2XP53zMPX9HtlKEsYxkIqXkfr7JjbaeA8K/4t
	+hHQKRYJ+i1Z5UIljw56CRJ6rg7AQVvacJhuh54wIWLVDKXL1RZqbuKx+DQL7OyjkeWl01Ohemt
	14CrGI2yFf/mogkR9VwbXD2h+fFKGOiVG9PNYhO7g6PjYJWdKhOfGQCTz2Adcf/5bpFve5FWxll
	7tNJZ68AeOFxX3cDgAUGpPd+qvizbxVgYJ/+ete16L/LP5hzeBVCP7qYwKSK1W4jQqkbEeEH1Ek
	larsLa1DxkkCXFm1cmmZTjeVIGc+JozreiJXGQU7HTxZTRLs7NpZCXWzlnHTUhWrZ72vRD/I=
X-Received: by 2002:a17:90b:1d83:b0:398:bad2:c10 with SMTP id
 98e67ed59e1d1-39b3d85c011mr8915334a91.6.1788688628452; Sun, 06 Sep 2026
 02:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com> <20260906-add-rust-gpio-consumer-v1-1-24d192f93760@gmail.com>
In-Reply-To: <20260906-add-rust-gpio-consumer-v1-1-24d192f93760@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Sep 2026 11:56:54 +0200
X-Gm-Features: AcwNN1WxK9zUI7wnq5z3F0MENjsFCu4a4OjUAQj32Gwuj-9LPj41p02F_uyi-BY
Message-ID: <CANiq72m6YZhqzE7GWEakmsZ35QN5UF_HTcVBavKxbq8cV7yk6A@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: gpio: add GPIO module with common definitions
To: Kohei Ito <koheiito.dev@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 10:46=E2=80=AFAM Kohei Ito <koheiito.dev@gmail.com> =
wrote:
>
> Add the top-level GPIO module with minimal common definitions. This
> module is the basis for future Rust GPIO extensions.

Thanks & welcome!

I see you Cc'd linux-gpio, which is good, but the GPIO maintainers
should be Cc'd too, since they are the ones that will be deciding on
this -- doing it for you in this one so that they are in the loop.

By the way, it is nice to see GPIO again :) Now that some years have
passed, how does it compare to

  https://lwn.net/Articles/863459/

?

Cheers,
Miguel
