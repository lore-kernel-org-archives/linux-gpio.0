Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450D4476CFF
	for <linux-gpio@vger.kernel.org>; Mon,  5 Oct 2026 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196017; cv=pass; b=lIRr0mlyL217MCQE52kP4MzncV7THC5Bd80q9nzOTot3RiFHKsjLX/thCZBN7DdT3ucunWCPaaQjQCcXGwqb6LQ+TPCxUvsw6r1BUvuf3xXzhFphJiFT65Q18PA3AU/wkR1Uz60W9cVsAfHuDWF8DWA67luTVQr0UwknxqNLOhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196017; c=relaxed/simple;
	bh=FoH71T1sttzcTK7jTd/MV4MMsSrOgn3/fa5zywp33Rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C87yhq/MnOBZGlszaKxX0/aFkjH2/j9icOixbF185tq961OdMZ9QdjMqimJvMDdv6hSCBKkCjDbC8X9jxky+an/Xq1RRpBwFOOCH/a1pOs2xTr0O8fBBTjViehvaNudFW0VHY/Z08pFu/ln8RZhgc4LKXJv+wmI8kjmBWU5BWGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rKIcyWF+; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rKIcyWF+"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7beb81b2834so370516137.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2026 03:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791196015; cv=none;
        d=google.com; s=arc-20260327;
        b=aN9tNuvW5th3DjB51lOy+k9ouzvFJWY4nUssUOl6PUidIFvV7xYkQfr6Z8z1g20Wy7
         7A140MSWIo6oOy/Hm1dBX4M6uGJrMmO6YRmnIRRvQYP4leJiP94Hv1UYBTXEf263mDUt
         JUOLMGB7QsKp+MaT8tOFL/kuqrmij2mNsOTPYLkdLtTzd4komHnRrCZooc1Py4IbKWDD
         6eD0i4ZsKQkWzLBOxkujfy6IhDc6ECSLoeArCljxtetB9qNYyLkFB25ikVqujynKx2RX
         g4WLMigA9V3VfyAeCw3u8zBgb7UV/L2kagBbdv1Zj2naRcwE6B8d1rX3E2Z77MKn3jvL
         +BTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S967s+iSBQZ44jx/2IytRD1jtlv2+1P1I8JkvdWsI7c=;
        fh=wNv4PvxusumhvymCW6Y3oxqElemAfFEGlFLJ9r1A24w=;
        b=GkWdkMajcINfeS31EZw1KV7K9fnZ5c4N2FCi+5oCWJ9I+fcdlccws1gfEDcs/cNDtf
         ECw4Q7HzsbZdGqfhryYd4SZsYv9iwXlSmMZDZAoVzYVTpp5g2pweKES7zZpE2zF4dLDT
         GM06byUDOL4CjqaGOfmH0XMsSe/2Tb/kX5a/K6amoHZ5m62nZQJZbjeljy/UqmdPYlLs
         xBdnnCRMSYTA1WApkuT9Yel7GJ7Y8/JLZgIll3oRvWKA3nqsH4D0YfpIyqZO35LcYz3U
         2tLfeBNkZzlMk3MvPj19uybJzQzWkj0VLFEJdz+VxeRHyoHShxR/rE/nDBAYZ8s1TFYW
         R96g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791196015; x=1791800815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S967s+iSBQZ44jx/2IytRD1jtlv2+1P1I8JkvdWsI7c=;
        b=rKIcyWF+0tKspgAGKUAW0rACoFDD7SAn9urDOW5mRABwj5etQgrIOcGQSY0tPgDvFb
         cutlpZoUfDpouR+rRMDTLwJXc0T+1jx2T18BSrfIoztqTQhlYB88ghIkxAalLblekSYH
         b8NqKdCt77d+/ineoHHQdVJT6IywQwHuacoo1XlxZgSPoKeDFzGBppJef5JdI1nljsKU
         2vDXGyOo7UIoecDZmgOqj0byb9usUx8PIbJCzA4i7a5+A3nxkdun2gSWDM11/UXGolAo
         eGDO9FcMIS0rh6ZfMU1VztBEC0D91aCbAQ6FnR/zKhVlehp4vDQBY6LSxLy/Fk2QQYq4
         w69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196015; x=1791800815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S967s+iSBQZ44jx/2IytRD1jtlv2+1P1I8JkvdWsI7c=;
        b=V7B5PpTAfl+DX0vQaw7p/WeZay2c/trU0amXvsQ4dZjXGcEHr2E6tB+O7Vc2SRs9jj
         BibDA2g3egEHELTfgcei1LIse5mXXujrkJkU71QwIYx8zKI7WQDi33px1CLnNr3ukOkY
         WeixGlHeZf+GNX47TV5FgyLnSV/SPk9Lhcux6S3YESJfOpSYiYo+Oy+KrTbvBzhfUy1A
         2A6FdmAgFG9Gagp3ZzqfKzksPzijQXMP606iohrsF5+jrUDAYaEMKAq6p+5JQR49qYLI
         rBGjXeQaM5mXrOf0HNB4pSPy3PzUNzYVrpq3waFqs/WtVlWjlxnUZ9XF57XXhIuNipPm
         EYJw==
X-Forwarded-Encrypted: i=1; AKwUvBxsexkuWwLetr7iGOpuwfrwkGtopLqbllLvptEBz+J8zF16KZSyivpyuQ0M/MOFrFJil3KCdMi3Hn4t@vger.kernel.org
X-Gm-Message-State: AFq9FYIUo8ZX1UpwNVXfKOEZNZfPf0wTM/yC/vxnoBjMWzYNZICh0LfY
	4r8mPOSVGhnd+EBm3iBIE3rxUEkUNM4+0n2lrRht3fJylQwJPXwtBQUxNya+4uUd53Hrvcjkdyb
	6tdd9iuMnmt21x69fhcJ+yaDpt2HO3XmDDPm+sRA=
X-Gm-Gg: AYBFou3uIRO54GqKMnuKMqg3XXOdboHGIw1X2rntRCbhPwUYQta3Eqfg6iQuQifgJ68
	v9EaA4YiLy3bQE3xhwUaFnTWeuNR/kmhhznZTJBcoupNzE9FYcFhz+Xo4Xjdxfvx3icS0BKZIBY
	kMOBGlZKRWZC2NcKH10lvg+OFu347gLt3zLOxnF+g+EQbM35ki12KhFFm6LcIN4oHclaj30xlC6
	ojjejWYkrS8oY7GyUBXfWDnn+Xru6T1gusa7D7PW1Wyq0KxYePS9SS+S+RGI/WoRDSeg9FCC4AT
	oGYMqAI70LWZKAbryl5z7dWvcgw+mmjqDPZyZO3qFLKgqFl0tz627HCQkZHyl8LR5s02Qlmn5Ty
	3jWExaqE0MJTi+rvRV9Ul9C6SUgOnJFQ=
X-Received: by 2002:a05:6102:291e:b0:7c0:c723:2053 with SMTP id
 ada2fe7eead31-7c0f4c96e41mr1732042137.17.1791196014389; Mon, 05 Oct 2026
 03:26:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com> <CAGG=3QWCmQ+LVvn2dtjEauj5WFwvx=pvg4Q6man_A2imdjRe7A@mail.gmail.com>
 <CAD++jLk2pFCpbpGVCQg2AdrwQecpb=wsehhwSuwTbKAXNeyfoQ@mail.gmail.com>
 <CAGG=3QV2k-nsZHNSuKEixZb+-LcxvhQsG379ghgyOpiDLTJWzw@mail.gmail.com> <asNuMzqz3G-gmIiD@google.com>
In-Reply-To: <asNuMzqz3G-gmIiD@google.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 5 Oct 2026 03:26:37 -0700
X-Gm-Features: AclHuK9GJaR-vXymBVjABDCTEzvCLBikCIuMwz9R2xSRvkQQKV3rpJQ1IPlyOco
Message-ID: <CAGG=3QV1eLy-eAfi3Q49qwMw_Yw-BJ1tmd3J=SLJB_qWrx4bNg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Justin Stitt <justinstitt@google.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 2:31=E2=80=AFAM Justin Stitt <justinstitt@google.com=
> wrote:
>
> Hi,
>
> On Thu, Oct 01, 2026 at 01:04:47PM -0700, Bill Wendling wrote:
> > On Thu, Oct 1, 2026 at 12:56=E2=80=AFPM Linus Walleij <linusw@kernel.or=
g> wrote:
>
> <snip>
>
> > It's being #included transitively:
> >
> > In file included from drivers/firmware/efi/libstub/efi-stub-helper.c:12=
:
> > In file included from ./include/linux/efi.h:20:
> > In file included from ./include/linux/rtc.h:18:
> > In file included from ./include/linux/nvmem-provider.h:16:
> > ./include/linux/gpio/consumer.h:670:55: error: use of undeclared
> > identifier 'size'; did you
> >       mean 'ksize'?
> >   670 |         const struct acpi_gpio_params *data __counted_by_ptr(si=
ze);
> >       |                                                              ^~=
~~
> >       |                                                              ks=
ize
> > ././include/linux/compiler_types.h:392:64: note: expanded from macro
> > '__counted_by_ptr'
> >   392 | #define __counted_by_ptr(member)
> > __attribute__((__counted_by__(member)))
> >       |
> >        ^~~~~~
> > ./include/linux/slab.h:602:8: note: 'ksize' declared here
> >   602 | size_t ksize(const void *objp);
> >       |        ^
> >
>
> I wonder if we could have a better warning here guiding you towards
> -fexperimental-late-parse-attributes?
>
I sent a patch to add `__NO_COUNTED_BY` AND `__NO_COUNTED_BY_PTR`
macros to prevent this. They're similar to `__NO_FORTIFY`.

https://lore.kernel.org/all/20261005102518.2400984-1-morbo@google.com/

-bw
