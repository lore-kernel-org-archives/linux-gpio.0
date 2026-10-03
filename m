Received: from mail-vs2-f35.google.com (mail-vs2-f35.google.com [74.125.227.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB6A39CD0E
	for <linux-gpio@vger.kernel.org>; Sat,  3 Oct 2026 08:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791017663; cv=pass; b=EdFz/0BgF4jEr3LtJCZF/XZEP7Gx/1rNGff6OvffnJaLzuqrk6MZP/mp0f/KUmHLr3v1UqUBMNLkCGAomWN1eVIvqR5N4ki4CSfye/esrVhbwawPd3FaPMBKVfaDJOjT7Iih+o+ggek4MiRcFsKw9D8kuS0qX8Daqvoae5GTl0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791017663; c=relaxed/simple;
	bh=fJ8bD1DRJmOsBKwWEV0uZduUW3WlOEis5ExJ6BMTBb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGe7d8c7wdhP8pNNMqb+IEUNCZ10+CE9bf3vtHcwmvDN5Ty1Iy/WjDecZGXDTmiCO34JGPLIWIQUX3WOb4NUl+YHY9GYvxT9rP9m9XVUEH5Shha7VzyNp22hwTQ9ewtvZ42jiIsWomtNd9ejU1R0YPuFndFk6l8aeOal7DQxq08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u7wEYDWX; arc=pass smtp.client-ip=74.125.227.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u7wEYDWX"
Received: by mail-vs2-f35.google.com with SMTP id ada2fe7eead31-7bf947fae49so110392137.2
        for <linux-gpio@vger.kernel.org>; Sat, 03 Oct 2026 01:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791017660; cv=none;
        d=google.com; s=arc-20260327;
        b=eFFG9d5H6DdG0oJ/exvYGk+QlkNTAFrY4H/TtIrJXSslbulVcVTQhD9DdOL0QV8snq
         9N0i+wDGU4hl3cxphC+84Pv0XtYPx8rRdnna6Rgb4AqPbHFneA48udhtylxxKyb08wzF
         dX8g9UyNMwBNNief4CTrRevcorYp6aELn8LBW3TxBt34cj57udfN7ei2qfUGbLlbbyCY
         hQESziEsizNWUYqyPitWSLmEbale9ZEunmAx0tHCFbCRq6vD/bWyxjjB/3h7CsTcVB8M
         L1QV3qqUU4JDNc+2xPjKoTX0lrV88tQDl3gWkYDDUyvoB0golkK/iEz89IZk7tvnq3fu
         d5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ExLWttZvX4Yk9yXf0gBzHuFSaa2lOH1tEd4p8wmaQww=;
        fh=dJgknA1OimPNTiomCG/u6PqAJi+Gy9Ivt1GusT6PhEQ=;
        b=F+Np3XUmTNY5B6vp4l6tWbcYb05JcbsFtjj7dfqlsWBaV1l/y13HElYxydngeN/LRx
         9YyEJTl2qShdgg5Ph93ET1klAFQ/6y97ToW9n17sf1p0NSYPnZRTayLe1ruBb0R/+udx
         GFQRTPza9Cs5iwTBZTo7H+6mFgoPwRfbxUUEGct5+PkVrQuOYQmhXE5cuZim0r1pGc/n
         SvtwCTBHtZ+398XMoptOhEWUPhZ+Swh+mh8r6MBFgokqpY7ALIcMCMR/Z4tcX6My/nTx
         7iRM88NNJPh1B4fT10BM7GCOnbZCT927voyixZYW1C+9preoh8RRclogVC7PcwmMMqAQ
         8crA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791017660; x=1791622460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ExLWttZvX4Yk9yXf0gBzHuFSaa2lOH1tEd4p8wmaQww=;
        b=u7wEYDWXR2mk5XvXD3w8fsmI2ubRN9XSna8ttRs80zKTu+sHm/KKEzGR2LNQz/gVNg
         AUHbuQ18xrzyi75PhFVq31Q2lxguHRZLhxilenO22kKD3Ac73cv9J4DzGkNNJxBXhYKZ
         WWJxWCFfDJ9UgtrSOgykHrvqEtBobLtdb5cgEylbkO27YMfv73/EHBvxon1YASF+2Ctr
         vansZcwmQerP6Xt4mHKxUZpSzK1KIL1VgCoTsU/0iS9sQiDDwduFdswwbBIwrPbbAWHm
         MHLHK98t7mgglxeleKaFjVBE/Fiv5gQxT0ngCrEefIN5ZBeZD0Cg3GbulJymb9vKrWJd
         uz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791017660; x=1791622460;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExLWttZvX4Yk9yXf0gBzHuFSaa2lOH1tEd4p8wmaQww=;
        b=IkIEq0Sj3fvG/WaBBptjjoXAC/exo7GjVX3aSOpNWM1PP67l/3Aeopn24YgSthQpPH
         +70n4zy2T/Fs/Dnu7e8P/0bZrcjMYw6HRc65ZA+0YxyNzbGGqtERSpFr9xNadA85bf6X
         hc98kr5oIaRir0mTZnnrCNN7oKpgjVa3g4GyRvgMQZmck8+ua944npayRmf/0F1bv/gK
         fdbNvwAvhDrKDxp2rVY3GbOlTWlcAFA0Cxi0EGWoFJUtGwf1Q8Y3csVDQAAQffpRqJBK
         bUddAPoNhkv+8HKAc8ZrQrZ75rfjW5C5a6hjK4Xe50CcmYBu1akAM39YdkxK2ZDmqFNq
         5b6w==
X-Forwarded-Encrypted: i=1; AKwUvBzAPTXNE+w482vy8+/sfIcap0IPyJMI3xr6F0AIAgYKtmuXYb8rUkcwVWuHlFNv9n02Ih21Wgj1PYfI@vger.kernel.org
X-Gm-Message-State: AFq9FYJWEmC5VJfvkxp2dfughdo5GHzHGNmQPu040D0m1S+lcMywEz46
	fpuOyPsRgXUBDE/lM7UboccH7VQGZ/XTtIkJapyvoBRwSAWBDsVgGUoLBvXpnhvmSfryUlQIRhX
	Rms6DA2SoHSt9pQsR8BSl5IBPPUJNlIgDjpevJ7Q=
X-Gm-Gg: AYBFou27umzxcBvT2swkpmDyA6s1jnPFnjymQAOIRf+qr5d9FdYyStm61pkMu5rUfjN
	HCrSSocLwrumsFGF4EbpFc5oqe0p2Kt3L6gEG79AXM3r/6y++C7PiCLO/f9MfPBK2BrJT3vuHtI
	HWRV7BgqfGkzewzfvCX8QrjUHAgKDdOnjqS4ns4iC2g1OOH6gONELuFFUSBFMSvrRd5Uy+M8msb
	tVZ7wyvjl3Z4+tFJjMg7QwLGluqYTgChFWE3O5SUfJG/2G4XQgu79mgBXLh8Z1fao506ubYK/xa
	50GG3vneGauB+DlFBy7jfeJsICV4Ut/WheaC3129NIe9eSoSlmQ0KOKeFowFfdbOn/zrsUmCqz1
	rtSteGfhtsZEg7bljE8sE
X-Received: by 2002:a05:6102:f13:b0:7c3:2168:d603 with SMTP id
 ada2fe7eead31-7c32168d76fmr21040137.0.1791017659776; Sat, 03 Oct 2026
 01:54:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com> <CAGG=3QWCmQ+LVvn2dtjEauj5WFwvx=pvg4Q6man_A2imdjRe7A@mail.gmail.com>
 <CAD++jLk2pFCpbpGVCQg2AdrwQecpb=wsehhwSuwTbKAXNeyfoQ@mail.gmail.com>
 <CAGG=3QV2k-nsZHNSuKEixZb+-LcxvhQsG379ghgyOpiDLTJWzw@mail.gmail.com>
 <CAD++jLnOm3ua7hom_L4YQwN5z81M17WmL_VGqx+-ugrAJ-6_Dg@mail.gmail.com>
 <7e847715-6bd5-4f69-a9a6-339788810fec@app.fastmail.com> <CAGG=3QWKEgeggp+OcVsS4QLOX1zxN23HHZp1SfHX0rQVA_7nDQ@mail.gmail.com>
 <4c92ca0e-c502-4a63-a2a2-bbf53db5e40f@app.fastmail.com>
In-Reply-To: <4c92ca0e-c502-4a63-a2a2-bbf53db5e40f@app.fastmail.com>
From: Bill Wendling <morbo@google.com>
Date: Sat, 3 Oct 2026 01:54:03 -0700
X-Gm-Features: AclHuK8oU2zlAvciQOyAfjuVxZhfxwAdBPPLNgg_nd50DywxRhOhME8xg_IwvQM
Message-ID: <CAGG=3QXtYajLg-W21R=52FB151wbnAYr7a7rJMJL9krq0-fTyw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 6:52=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
> On Fri, 2 Oct 2026, at 14:44, Bill Wendling wrote:
> > On Fri, Oct 2, 2026 at 12:38=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org=
> wrote:
> >> On Thu, 1 Oct 2026, at 23:24, Linus Walleij wrote:
> >> > On Thu, Oct 1, 2026 at 10:05=E2=80=AFPM Bill Wendling <morbo@google.=
com> wrote:
> >> >> On Thu, Oct 1, 2026 at 12:56=E2=80=AFPM Linus Walleij <linusw@kerne=
l.org> wrote:
> >> >> > On Mon, Sep 28, 2026 at 9:22=E2=80=AFAM Bill Wendling <morbo@goog=
le.com> wrote:
> >> >> > > On Sun, Sep 27, 2026 at 11:38=E2=80=AFPM Bill Wendling <morbo@g=
oogle.com> wrote:
> >> >> > > >
> >> >> > > > The 'data' pointer field in 'struct acpi_gpio_mapping' is ass=
ociated
> >> >> > > > with the 'size' field, which represents the number of element=
s of
> >> >> > > > type 'struct acpi_gpio_params' allocated for 'data'.
> >> >> > > >
> >> >> > > > To improve bounds checking via CONFIG_UBSAN_BOUNDS and
> >> >> > > > CONFIG_FORTIFY_SOURCE, annotate 'data' with the __counted_by_=
ptr
> >> >> > > > attribute.
> >> >> > > >
> >> >> > > > Analysis of allocation, assignment, and access points shows t=
hat the
> >> >> > > > pointer is never accessed before the count is set, which guar=
antees that
> >> >> > > > this annotation is safe and will not cause runtime panics or
> >> >> > > > false-positive bounds checks.
> >> >> > > >
> >> >> > > > Cc: codemender-patching+linux@google.com
> >> >> > > > Assisted-by: LLM
> >> >> > > > Signed-off-by: Bill Wendling <morbo@google.com>
> >> >> > > > ---
> >> >> > > >  include/linux/gpio/consumer.h | 2 +-
> >> >> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >> > > >
> >> >> > > > diff --git a/include/linux/gpio/consumer.h b/include/linux/gp=
io/consumer.h
> >> >> > > > index fceeefd5f893..2b80cf7aa7e7 100644
> >> >> > > > --- a/include/linux/gpio/consumer.h
> >> >> > > > +++ b/include/linux/gpio/consumer.h
> >> >> > > > @@ -667,7 +667,7 @@ struct acpi_gpio_params {
> >> >> > > >
> >> >> > > >  struct acpi_gpio_mapping {
> >> >> > > >         const char *name;
> >> >> > > > -       const struct acpi_gpio_params *data;
> >> >> > > > +       const struct acpi_gpio_params *data __counted_by_ptr(=
size);
> >> >> > > >         unsigned int size;
> >> >> > > >
> >> >> > > >  /* Ignore IoRestriction field */
> >> >> > >
> >> >> > > There's a problem with 'drivers/firmware/efi/libstub/Makefile'.=
 Clang
> >> >> > > needs a compiler flag to support the "__counted_by_ptr" attribu=
te
> >> >> > > referencing a field *after* the pointer, like in this patch. Ho=
wever,
> >> >> > > the Makefile blasts the flag away for x86 platforms. Below is a=
 hack
> >> >> > > that copies the part of the top-level Makefile that adds the fl=
ag. I
> >> >> > > don't think that's a good solution. The comment in the driver's
> >> >> > > Makefile says that the stub code executes before the kernel doe=
s,
> >> >> > > which I assume is why a lot of the flags are blown away... In a=
ny
> >> >> > > event, I'm not sure how best to address this.
> >> >> >
> >> >> > But is this a problem with the current patch?
> >> >> >
> >> >> > Does libefistub use <linux/gpio/consumer.h> in any way, shape
> >> >> > or form?
> >> >> >
> >> >> It's being #included transitively:
> >> >>
> >> >> In file included from drivers/firmware/efi/libstub/efi-stub-helper.=
c:12:
> >> >> In file included from ./include/linux/efi.h:20:
> >> >> In file included from ./include/linux/rtc.h:18:
> >> >> In file included from ./include/linux/nvmem-provider.h:16:
> >> >> ./include/linux/gpio/consumer.h:670:55: error: use of undeclared
> >> >> identifier 'size'; did you
> >> >>       mean 'ksize'?
> >> >>   670 |         const struct acpi_gpio_params *data __counted_by_pt=
r(size);
> >> >>       |                                                            =
  ^~~~
> >> >>       |                                                            =
  ksize
> >> >> ././include/linux/compiler_types.h:392:64: note: expanded from macr=
o
> >> >> '__counted_by_ptr'
> >> >>   392 | #define __counted_by_ptr(member)
> >> >> __attribute__((__counted_by__(member)))
> >> >>       |
> >> >>        ^~~~~~
> >> >> ./include/linux/slab.h:602:8: note: 'ksize' declared here
> >> >>   602 | size_t ksize(const void *objp);
> >> >>       |        ^
> >> >
> >> > Hm I see.
> >> >
> >> > Certainly Jeremy or Ard will have an idea about how to solve this,
> >> > so paging them in.
> >> >
> >>
> >> libstub code never executes in the context of the kernel, but only in
> >> the context of the boot firmware. Generally, we disable instrumentatio=
n
> >> there that has a significant runtime component, basically because we
> >> cannot crash or panic the kernel before we have even booted it.
> >>
> >> Can we just #define __counted_by_ptr(...) to nothing when building
> >> from that Makefile?
> >>
> > Doing it in the Makefile is tricky, because of how the "c_flags"
> > variable is defined and used. I couldn't find a good way to do it.
> > Instead, I inserted "#undef __counted_by{_ptr}" at the top of the
> > affected files. It's gross. If there's a way I'm missing, please let
> > me know.
> >
>
> Does that even build?

It did for me...

Let me look into Sashiko's comments.

-bw
