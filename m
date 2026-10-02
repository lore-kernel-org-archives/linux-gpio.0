Received: from mail-vs2-f35.google.com (mail-vs2-f35.google.com [74.125.227.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9121A424679
	for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2026 12:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945094; cv=pass; b=euyaWMrIYO3E9guKcpKV4f/j/HwfBEzeYbnH/ix46RI0en8cQeV44r/FHMXZNTbrgNH5wSeyQTM+RoTvjAxxdLfVf0qeRpdjZhJ+j7TLR/jiMuf6TFhMqMjf7q6Ogdf64VYsERzi1xJ/9H+9ohMAplKA4mTAkvsnxT/JZ8epi/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945094; c=relaxed/simple;
	bh=g9QfHi8EzjRCWHnUBkrwS8yo0cu4ylZ5SZytJAxSQ9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lUJsSkfS1yBpSd34AHeQ+nuvdSqT8lpIka/QlszvYI1hGj7sg3rDu3EGhXi56FZI4y7AhTyiGnzr7yaGg8yHXNXCKrb6EGC63+j1+17kjTqXn2jvYSQZ8Vv3ZvoS6xRxgeKfdZkM87cC0LaNNC8nea3+NHUFSmiMt1iWcQi+FP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t1/SzPtT; arc=pass smtp.client-ip=74.125.227.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t1/SzPtT"
Received: by mail-vs2-f35.google.com with SMTP id ada2fe7eead31-7bf9002ce96so699857137.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2026 05:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790945086; cv=none;
        d=google.com; s=arc-20260327;
        b=GVeLakqoY0iSFbrWqGD8yvDHO8UDwpqWjE8NRqY5nJvXdKel7c1uEVwqH5TS8J/EPW
         ypt8yPqJCzFtW3CgSw+LEnQNpW79XJ0psYb0k7pv72M051nrLqBU1/QncUFWEy4qFVfR
         rwD9r51StoiLof5SmTka66Cx2KQJ9/CrOoodDnXAw+mOncM08uWXo9rM3Uj8Ho6DoI1v
         gIlzbEDPwCASSAZ9LOoXp62vSDUaMJO+nrekTYwlsqKWmlWabyYGwpX+FJ/JLtKFFIz0
         uigoN1+g5s/ldDogV+KGUOfhqjB271gFvGfZt7cO8XSC+OMcZX6nMeVW+JswQB6j2hjD
         Nmiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ErdmA/wWdWdz3Q1T8+D4rKzpmGRrXQnnjgGThiMrKlY=;
        fh=UUkFDNGRcDVHgDvvny9jFQoM0GFindAbs2nl1Ek4OSM=;
        b=G0hgkvIZSS89ZFtp0bEv640KVUi8ZzeqNxVz8BXd0hjLIS5fgEyTET7vBHuQt4KNi9
         RmmEklYnDDf7RY1HX3ey3UkSt7mhf1ogbwV4e57eD4Y7WURW+sBvFsnK+fkz7Jo8skW2
         ZHBZGYi72BfxDSGi743VREMOX8zP/eiKbywG5QlqLLn0UFhqVgUj25PyYcQT59GjW6fl
         Y0zXO1Nz/bjk0ZMR6BEpYRy9gi1YKCqD1VQivA151xn8/KxyxendQ7Hm8KLzWXm6Nre7
         Rww2GkJSXJhl5E+mEEjZ3WXdmobi5wdy0CTR338wVPgoF4XSFjKfwnvDZI5bjUw5uMJX
         XeHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790945086; x=1791549886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ErdmA/wWdWdz3Q1T8+D4rKzpmGRrXQnnjgGThiMrKlY=;
        b=t1/SzPtTPzxep1BpfG4ZxuzMwcZhlOV8lonbOZJjpLt8BIkNabFrrClCPnLuwm9wgX
         7b/Q54+InRgujDMldIQbuRpNEDEVdVrEaIKduFeWASu+EqbCP303a5W9V/Q0FqcwVtQW
         MjpoT6nfFsYXna6FGQRm7AZgduLyS1RLFtondxXTYTiZJBIQ2efi/ngcgfyKq5gIzH0V
         f49/V/UMDn5+6u/BtcDgXrqEtYNuJZI1ANmnKd8usg8guJ9VsGjhzfGqUmnMojWYT+2i
         3r9ln59xaOjxoedKcXKTtjnRlnp5BdRkeLRKzbwaBqt+1zItyOIoTGq7JtRVel5L7fPn
         XM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945086; x=1791549886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ErdmA/wWdWdz3Q1T8+D4rKzpmGRrXQnnjgGThiMrKlY=;
        b=jmIFOIy1rtKnc9gjM2T8vUwhSna8I4/sJYhCvkMR5vhLVEnS95S9Dxg/SkChTsy2xr
         kwdB2IY3bYMFNMrO+EvkSu2hu143VZtu6VCAV8QpE8SDVDrF56uYwBenqaJ4YsVlRHxd
         6GsLYE51wxh1H9NshM23+a8WPBoUEcVEskQrugMUGmELbT79X8H85+pbD4j2qYQ8xol1
         mjPyiagSzUb1RBdmj9+/CUuMYXVFH8BAIZl3nB1laZCgkQCHfEoaWJcrKYiRpUzoD5Dr
         WCsVxEaOnFZ9Yp3u09nKWy4PDG4PyethMjQ1i56/a01DRF3jJbg8H72teLXusdV0siis
         CmLw==
X-Forwarded-Encrypted: i=1; AKwUvBwQh+/uhakd93PS+q7uzJ7BJr0/G1wU0ZkESVLXou4Ba1K8TD9yyFUzxex0B5Z4CkqJ8DFD6+9p2xNI@vger.kernel.org
X-Gm-Message-State: AFq9FYL1gaFjE0kmogM+jl8CzCeDPXk+uEKJirafh3X8hLPGW9JUbKEh
	Y6lsIqx2lu/tRvpv2JMSlXtFZl8jQk0rxYx+ncTw/a8D84sYIOlgOtLa6FDroKyqKVLGyYjCB0+
	sC885nzjQ7+ALLI+rzZrjA59D58ZSp+aRnjvHAMw=
X-Gm-Gg: AYBFou2bU6yqIv/kvOKosYQF1i/mMMENrjZ+3OzHRUfi4Ta5jSjSiAI0pmvZOV67k7P
	i1xNfsENekxWTI2YjWLBka68f882+KM6nSByYy/F5w5bELsY2BRG6yu9WqB9wKRma4KHukhF8N1
	EvSlqxjsSXX0RSgc7tPsOFVQ17PV4PltK/cIYwsXBQlUT53V3+JQpsly2krUJXBSTlB4QGpmAO3
	2RlbEppc0sL8aPiBvSOiLYIt9gh2ZwzjKJETQaqjijE/du1SQDp92opCzKxIvMKnIdBFWz2oeH2
	RfFqK2gvbgq2BqscD8pp2sTypZ4fuoC53UONutHxM73v8oU+fYGgWWSj14CJCckDZ1xBasoOeCP
	D3fC9UhjQkQuL+Ppbc4jW
X-Received: by 2002:a05:6102:1627:b0:779:5049:87b2 with SMTP id
 ada2fe7eead31-7c0ef026e4fmr542712137.0.1790945085222; Fri, 02 Oct 2026
 05:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com> <CAGG=3QWCmQ+LVvn2dtjEauj5WFwvx=pvg4Q6man_A2imdjRe7A@mail.gmail.com>
 <CAD++jLk2pFCpbpGVCQg2AdrwQecpb=wsehhwSuwTbKAXNeyfoQ@mail.gmail.com>
 <CAGG=3QV2k-nsZHNSuKEixZb+-LcxvhQsG379ghgyOpiDLTJWzw@mail.gmail.com>
 <CAD++jLnOm3ua7hom_L4YQwN5z81M17WmL_VGqx+-ugrAJ-6_Dg@mail.gmail.com> <7e847715-6bd5-4f69-a9a6-339788810fec@app.fastmail.com>
In-Reply-To: <7e847715-6bd5-4f69-a9a6-339788810fec@app.fastmail.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 2 Oct 2026 05:44:28 -0700
X-Gm-Features: AclHuK_2BHsoBwbSP1Le028scX0dX0GO_oD4fcefHQV9KFQAl-gpbu7HNCV6U34
Message-ID: <CAGG=3QWKEgeggp+OcVsS4QLOX1zxN23HHZp1SfHX0rQVA_7nDQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 12:38=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
> On Thu, 1 Oct 2026, at 23:24, Linus Walleij wrote:
> > On Thu, Oct 1, 2026 at 10:05=E2=80=AFPM Bill Wendling <morbo@google.com=
> wrote:
> >> On Thu, Oct 1, 2026 at 12:56=E2=80=AFPM Linus Walleij <linusw@kernel.o=
rg> wrote:
> >> > On Mon, Sep 28, 2026 at 9:22=E2=80=AFAM Bill Wendling <morbo@google.=
com> wrote:
> >> > > On Sun, Sep 27, 2026 at 11:38=E2=80=AFPM Bill Wendling <morbo@goog=
le.com> wrote:
> >> > > >
> >> > > > The 'data' pointer field in 'struct acpi_gpio_mapping' is associ=
ated
> >> > > > with the 'size' field, which represents the number of elements o=
f
> >> > > > type 'struct acpi_gpio_params' allocated for 'data'.
> >> > > >
> >> > > > To improve bounds checking via CONFIG_UBSAN_BOUNDS and
> >> > > > CONFIG_FORTIFY_SOURCE, annotate 'data' with the __counted_by_ptr
> >> > > > attribute.
> >> > > >
> >> > > > Analysis of allocation, assignment, and access points shows that=
 the
> >> > > > pointer is never accessed before the count is set, which guarant=
ees that
> >> > > > this annotation is safe and will not cause runtime panics or
> >> > > > false-positive bounds checks.
> >> > > >
> >> > > > Cc: codemender-patching+linux@google.com
> >> > > > Assisted-by: LLM
> >> > > > Signed-off-by: Bill Wendling <morbo@google.com>
> >> > > > ---
> >> > > >  include/linux/gpio/consumer.h | 2 +-
> >> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> > > >
> >> > > > diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/=
consumer.h
> >> > > > index fceeefd5f893..2b80cf7aa7e7 100644
> >> > > > --- a/include/linux/gpio/consumer.h
> >> > > > +++ b/include/linux/gpio/consumer.h
> >> > > > @@ -667,7 +667,7 @@ struct acpi_gpio_params {
> >> > > >
> >> > > >  struct acpi_gpio_mapping {
> >> > > >         const char *name;
> >> > > > -       const struct acpi_gpio_params *data;
> >> > > > +       const struct acpi_gpio_params *data __counted_by_ptr(siz=
e);
> >> > > >         unsigned int size;
> >> > > >
> >> > > >  /* Ignore IoRestriction field */
> >> > >
> >> > > There's a problem with 'drivers/firmware/efi/libstub/Makefile'. Cl=
ang
> >> > > needs a compiler flag to support the "__counted_by_ptr" attribute
> >> > > referencing a field *after* the pointer, like in this patch. Howev=
er,
> >> > > the Makefile blasts the flag away for x86 platforms. Below is a ha=
ck
> >> > > that copies the part of the top-level Makefile that adds the flag.=
 I
> >> > > don't think that's a good solution. The comment in the driver's
> >> > > Makefile says that the stub code executes before the kernel does,
> >> > > which I assume is why a lot of the flags are blown away... In any
> >> > > event, I'm not sure how best to address this.
> >> >
> >> > But is this a problem with the current patch?
> >> >
> >> > Does libefistub use <linux/gpio/consumer.h> in any way, shape
> >> > or form?
> >> >
> >> It's being #included transitively:
> >>
> >> In file included from drivers/firmware/efi/libstub/efi-stub-helper.c:1=
2:
> >> In file included from ./include/linux/efi.h:20:
> >> In file included from ./include/linux/rtc.h:18:
> >> In file included from ./include/linux/nvmem-provider.h:16:
> >> ./include/linux/gpio/consumer.h:670:55: error: use of undeclared
> >> identifier 'size'; did you
> >>       mean 'ksize'?
> >>   670 |         const struct acpi_gpio_params *data __counted_by_ptr(s=
ize);
> >>       |                                                              ^=
~~~
> >>       |                                                              k=
size
> >> ././include/linux/compiler_types.h:392:64: note: expanded from macro
> >> '__counted_by_ptr'
> >>   392 | #define __counted_by_ptr(member)
> >> __attribute__((__counted_by__(member)))
> >>       |
> >>        ^~~~~~
> >> ./include/linux/slab.h:602:8: note: 'ksize' declared here
> >>   602 | size_t ksize(const void *objp);
> >>       |        ^
> >
> > Hm I see.
> >
> > Certainly Jeremy or Ard will have an idea about how to solve this,
> > so paging them in.
> >
>
> libstub code never executes in the context of the kernel, but only in
> the context of the boot firmware. Generally, we disable instrumentation
> there that has a significant runtime component, basically because we
> cannot crash or panic the kernel before we have even booted it.
>
> Can we just #define __counted_by_ptr(...) to nothing when building
> from that Makefile?
>
Doing it in the Makefile is tricky, because of how the "c_flags"
variable is defined and used. I couldn't find a good way to do it.
Instead, I inserted "#undef __counted_by{_ptr}" at the top of the
affected files. It's gross. If there's a way I'm missing, please let
me know.

-bw
