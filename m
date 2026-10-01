Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F082B3BFAEB
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 20:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790885108; cv=pass; b=UkHaffXedyr7PiIJ3FBO4BRzWadSp6+juUIz/YgkBaGzwU4Gn6gafm629vsjUAb2Ow5J0O1Ma7X1GW6sEmXqoKz8VlfJ0V/jAnUgmY2WXEGKA6iWQYoRvgytRkxMhykaAtpblPYf60nOq9+rm5LJCBonrucIfZQL2ITsYi/FnbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790885108; c=relaxed/simple;
	bh=D5b2njgM22Yn9YX8W7fqgN5Wxt0Lao05fQOXJfkjPyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBRoPRvLb9QTOMbxGulKVvl39ZKZk8GkeoMQCri6jfXN874pQAzNektIxTBjvOIU1aVIFnQbib4ybttGgVkFCJQ0XjK/LsMyp2bghrg5j1C9GJoABPDLVmjofDeGHpv50eXaDcNUMx6Tc9Fpe1PijjBkTdJf4k4oCtEm9u5uadM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o7S0rT/4; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o7S0rT/4"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b79so1921394241.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 13:05:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790885106; cv=none;
        d=google.com; s=arc-20260327;
        b=Ya9H3sA8L6JhMsVFVk8BKjcyzAWe1H1VPGF3PtxAGtKoMFqMnjcIVPwoc/KvVii5Jz
         QpLv7dZBVw5xQFKtr23pWON5Bt1L0RC0Oi+RHc5vQ4x0eyOXB0/CfN6r0gHAbmW/ErVR
         zbpEycsV3TppcR5r3ueBb2nXucRuO+9AKhuIPpAUhbsqfNHevRjAO2d7dSz91x+kbS4K
         k1WEgwETYYQX408nZTkLeqj33Vi+N0z0L+a5/IGRaonx5Aef6w2H8gWbBCwwF3RarE83
         DotWMv7PkEjEiOL3Mw8YT3UewZszsCP8P2EeRdD0TuQ6cHV/88yLbGK+X6Eyu8Xw+fT7
         WA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pp6TH4DCeYfMYH0YGkv0J3I5da3ZUSWKwlkhgwd0Jrw=;
        fh=CQEyioSJ4xjttD6TFFxFv0m7pZ1x2mYofSyQd6i1ZeQ=;
        b=W06kIe54booTbtuzLDRkidxAyJ+tTDG9tUU7+yVluUgUTWMoYqxFd5pf7obdL4UFAE
         gGJQQRkfA17y3Rkm46a6HpucGVSbm8zPvLeKSV8+A4k87KM6HgqJsDqCAxIOKTl39oxH
         7r8hgo+aMbuUOaMLvxtYZbQYmvWd7CdN17//HgysvYFRgTQDGhjEJAaUejrcXD/KsI/9
         yJDvt6bGqGMGNqXNjkArPg+0qIQPc+7OjhuVDuDErWWD2QRsRL/5byEXqgrKo6JPUq0Y
         YeKFB6GANNN9fGdvin7eTFhUd3hFWg/jVzx8um4038b/1afZP6+PpifQwy8HI0iGl/Qk
         OY/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790885106; x=1791489906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pp6TH4DCeYfMYH0YGkv0J3I5da3ZUSWKwlkhgwd0Jrw=;
        b=o7S0rT/4dnEMH/8OGhYSyi2BKAi26YomRtp8jMtE8rNeWIP82oLZugcLL/mf+FVcKP
         B83QvB39qrM3f2vJYX4vmhW4JsTWV16eYihyxB2q4IC93EIW0PTUxHQA7H82ZQTQrNy8
         hQQljV/m9UpMFstnoqePlJcjbxSCXNum6K1nlGGy485PT+EsAisyXL7VFh1DAg2dkM6R
         oPZaihKttRJzpSKi4hoHV8VARzbnRqU2AMyK7FxJA0ess/xaa0CjcOvdoy/yipGAyley
         Tpyi4X8rkEsMdUrR5zk5uVvCGp1dBVXgM1VeovbF1SAfX9CULXal8NWYRdwKdgeibhhc
         dCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790885106; x=1791489906;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pp6TH4DCeYfMYH0YGkv0J3I5da3ZUSWKwlkhgwd0Jrw=;
        b=TfHFKGJRMVc5aBHIcfgB1VGatPfRdQxy8vJRjpPBCrRC77D31km7nNzQOQiKe4ePgw
         7SlFL+UzWfuL9fQJG7TfiC8zDBHOgygXX9fXp+z0D+0AnD4dzIK6bPODvF2ZW0RaUEv7
         WERul3sDvp8lUTCE3RFgvBq1psIgk4bm9N7MwS5/EjsFcE3lpyeBGuCSNHU/wUYwKSm6
         YIWt4pO9isGumvRIW4lkjPiFBSsJKPuIJ4AJab7GhcBPTr5JJSfKxYs5guxcByBllImN
         xEkuUx64cgw0nx7697VQKLt+MwkIz2ubant+tp4RewRx4wPYJZDa4/+/hIJSt0icw2Xq
         FjxA==
X-Forwarded-Encrypted: i=1; AKwUvBzC6KrGSp3IUSh8mmmIJLpbnzKyQBh1XjfxpVDI2A0JzT2pCM+ok8F43yrGLnN5CapKabiTP2O50ITo@vger.kernel.org
X-Gm-Message-State: AFq9FYKkPBK3MNyUGT/mhZA075xWBYlSKqkR/3ck+wnrh3WbfKFKbgNt
	qH7BFxSHRt00W0JC/lFb0yLIf3DEnuesOVlLEGS/SLhV9JMRkxtcfEm+iklyoCwai2kwbK8Nn0h
	hk5HspC7Qbx8JVW001zdINuS3pL57m+/HELWV5ek=
X-Gm-Gg: AYBFou114bCLKUoPX3PW0TjuQVhphN9VlpgGpnO7qfsF3VuNOpgYguD2eUTzNN0Ka7w
	G3xgwwXrlVcKKx4ekF7PfD9Px7Mo8VD6yCmyR/u5IuK6/yMKknlb0zoPP5PlpPMLVfKI5F5T88v
	r1cafNVtdNoeUbnBJug2WY8tKPXNlmvH2JYhCiUqn+VL2b5Ii0AwniqEbuVKQeaSHL+3WaTuJGJ
	hNxDJ0XEtvtVdkT3GVJhSpzXSJkuBFdsmbnOwIoTNX06ONuAz+6lTs/KwVWDgH//K5pK4JNYOMz
	FPC27x/L4s+ZRLVhnuOJb3bqhxiecoM6L1HkTHCPiZQ1YOTDEKESKVckIdWET74IxR5C1qEJszE
	+WibGQaQZR1pzgcVvh5ko
X-Received: by 2002:a05:6102:162c:b0:7a8:6ffc:1c25 with SMTP id
 ada2fe7eead31-7c0f48951dcmr137774137.18.1790885104867; Thu, 01 Oct 2026
 13:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com> <CAGG=3QWCmQ+LVvn2dtjEauj5WFwvx=pvg4Q6man_A2imdjRe7A@mail.gmail.com>
 <CAD++jLk2pFCpbpGVCQg2AdrwQecpb=wsehhwSuwTbKAXNeyfoQ@mail.gmail.com>
In-Reply-To: <CAD++jLk2pFCpbpGVCQg2AdrwQecpb=wsehhwSuwTbKAXNeyfoQ@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Thu, 1 Oct 2026 13:04:47 -0700
X-Gm-Features: AclHuK_OsmZsgIWlUXnGIOeGgxR5RkcvYLN5aGCG1e6Tds9_TT0UwWgbTocjZcw
Message-ID: <CAGG=3QV2k-nsZHNSuKEixZb+-LcxvhQsG379ghgyOpiDLTJWzw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 12:56=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
> On Mon, Sep 28, 2026 at 9:22=E2=80=AFAM Bill Wendling <morbo@google.com> =
wrote:
> > On Sun, Sep 27, 2026 at 11:38=E2=80=AFPM Bill Wendling <morbo@google.co=
m> wrote:
> > >
> > > The 'data' pointer field in 'struct acpi_gpio_mapping' is associated
> > > with the 'size' field, which represents the number of elements of
> > > type 'struct acpi_gpio_params' allocated for 'data'.
> > >
> > > To improve bounds checking via CONFIG_UBSAN_BOUNDS and
> > > CONFIG_FORTIFY_SOURCE, annotate 'data' with the __counted_by_ptr
> > > attribute.
> > >
> > > Analysis of allocation, assignment, and access points shows that the
> > > pointer is never accessed before the count is set, which guarantees t=
hat
> > > this annotation is safe and will not cause runtime panics or
> > > false-positive bounds checks.
> > >
> > > Cc: codemender-patching+linux@google.com
> > > Assisted-by: LLM
> > > Signed-off-by: Bill Wendling <morbo@google.com>
> > > ---
> > >  include/linux/gpio/consumer.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consu=
mer.h
> > > index fceeefd5f893..2b80cf7aa7e7 100644
> > > --- a/include/linux/gpio/consumer.h
> > > +++ b/include/linux/gpio/consumer.h
> > > @@ -667,7 +667,7 @@ struct acpi_gpio_params {
> > >
> > >  struct acpi_gpio_mapping {
> > >         const char *name;
> > > -       const struct acpi_gpio_params *data;
> > > +       const struct acpi_gpio_params *data __counted_by_ptr(size);
> > >         unsigned int size;
> > >
> > >  /* Ignore IoRestriction field */
> >
> > There's a problem with 'drivers/firmware/efi/libstub/Makefile'. Clang
> > needs a compiler flag to support the "__counted_by_ptr" attribute
> > referencing a field *after* the pointer, like in this patch. However,
> > the Makefile blasts the flag away for x86 platforms. Below is a hack
> > that copies the part of the top-level Makefile that adds the flag. I
> > don't think that's a good solution. The comment in the driver's
> > Makefile says that the stub code executes before the kernel does,
> > which I assume is why a lot of the flags are blown away... In any
> > event, I'm not sure how best to address this.
>
> But is this a problem with the current patch?
>
> Does libefistub use <linux/gpio/consumer.h> in any way, shape
> or form?
>
It's being #included transitively:

In file included from drivers/firmware/efi/libstub/efi-stub-helper.c:12:
In file included from ./include/linux/efi.h:20:
In file included from ./include/linux/rtc.h:18:
In file included from ./include/linux/nvmem-provider.h:16:
./include/linux/gpio/consumer.h:670:55: error: use of undeclared
identifier 'size'; did you
      mean 'ksize'?
  670 |         const struct acpi_gpio_params *data __counted_by_ptr(size);
      |                                                              ^~~~
      |                                                              ksize
././include/linux/compiler_types.h:392:64: note: expanded from macro
'__counted_by_ptr'
  392 | #define __counted_by_ptr(member)
__attribute__((__counted_by__(member)))
      |
       ^~~~~~
./include/linux/slab.h:602:8: note: 'ksize' declared here
  602 | size_t ksize(const void *objp);
      |        ^

> Yours,
> Linus Walleij
