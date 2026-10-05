Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447754334B9
	for <linux-gpio@vger.kernel.org>; Mon,  5 Oct 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791192672; cv=none; b=eYGs1xvng1iYc/PPPMxHn1eMY25mjTuO0TQg9Uz15NgqTJ2VB5mv74tX6QNpAGZULQRp4DgJZPNOc5RwrVkKoEdTNizx7ZBLu77DXCrI91/gzBdTGgAkHVtD/nvNODpxT0DxhKH8thJgdFFcQlIfJHjszGiE3YhhuCvOmGQpg0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791192672; c=relaxed/simple;
	bh=I1FOVBU197Mzny6/azVFseqcvToUfn4RjS+DXV/3QO4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K2ZG4j68ACLaj7K/XpXWVfL1BjVXhoKBvWy1e6HI/3yZpRL47uJ0W5fOkjceLsgYAF60ENgEDB0/I/j96XAAJb1pq/sF6SSn2tUHFK1O7/Af1U7a639B6zewM/ooNmbeRWFz5bxBpgRZoqLu595Uqv0WwOsAHjaNEjVfaFUa8RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pxu6bwom; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pxu6bwom"
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4566537e644so2424716fac.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2026 02:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791192670; x=1791797470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=biDZcx3VDN+hEHh4NXBE6TAaQj8s5MFRl03+ZPkW57Q=;
        b=pxu6bwomkRoqZh/wO98IkJefS4Pheb7psQu/JchMD4ikRdGVaOIT5pyAuhSEYb8xoX
         86rlCi1KpJJf3xc+4iAZfZy7NHjdnRUh94p+qRxXSxvvlkcyu+1bpilXkBRiHlGd0sew
         U1dUm8GWIuBp398vrqzbLN8A+6S4ml6/PGJU+zf7ivY2TkXqKsUbbQPO5pFbbHFrQjWF
         H9dublZU7hz6uS41K+fZyQfNaCeKh6a+gm2C/pflb5Yqsr8Rj4DSXiY47fM+JHzOYnbX
         IozBzlpI05WT6G0dPBcOMS3yU9Ih29E8MKUOLauIoxYd+fxmEJ2rtEahHuZwnWwnkknv
         lNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192670; x=1791797470;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=biDZcx3VDN+hEHh4NXBE6TAaQj8s5MFRl03+ZPkW57Q=;
        b=tW4aRBAppGtJ1bCX8VEFpx1Vcix0SMj7aGBHf2AdYzaLsrssBIEiWq9qnJGWCUTVdb
         eCJUKtTG2rP/pfPdKGlZicwlsqmEgTbXY38urP6S+AoGixbdSxUn0a724TkCHcdfhsBa
         xtIEZjjwFKMVazw9k2KWGJWH2y0V0h38gx0hx05VC2ZYTLWq8IhOJwPGfzcKMXwZRtiX
         JE1V5xHtUe2vxoow9LTCVmpXiWG22x+ftnv1vE95nzjkFXeEmXWB1/jRMbqcCuUEuBIv
         6y8EwzyMH4sja+WKLQyac7mCTuj3A8L1OBX3CC/r6TXDT/YIRWh546oj0fQgCqprXEBo
         Kecw==
X-Forwarded-Encrypted: i=1; AKwUvBxELsZl81IXLTyiJ+zfpKJnkw0oI2SMBKgiKWzF6+yqbCzloJx+bBwl3PDX+X22DIoc/Wwa+bnlrVd2@vger.kernel.org
X-Gm-Message-State: AFuF++kDzLe29lxH0vU7dwcx086cvkpbhUYEI1qV957R06ujWcdDO/rx
	ovWDD3LDT7UxGIfgUuaii+HtBFlw/rA33ozkIHtgafObLJFpakf8e7UA4t+6xa1OSI3SeBqrQyu
	ckVxYqVHcOULVbvZh2wiW7NuPfw==
X-Received: from jabfq15.prod.google.com ([2002:a05:6638:650f:b0:5fa:8360:37f0])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4443:b0:4f4:8bec:ace3 with SMTP id 5614622812f47-4f52ac8ceb7mr8199054b6e.57.1791192669709;
 Mon, 05 Oct 2026 02:31:09 -0700 (PDT)
Date: Mon, 5 Oct 2026 02:31:09 -0700
In-Reply-To: <CAGG=3QV2k-nsZHNSuKEixZb+-LcxvhQsG379ghgyOpiDLTJWzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com> <CAGG=3QWCmQ+LVvn2dtjEauj5WFwvx=pvg4Q6man_A2imdjRe7A@mail.gmail.com>
 <CAD++jLk2pFCpbpGVCQg2AdrwQecpb=wsehhwSuwTbKAXNeyfoQ@mail.gmail.com> <CAGG=3QV2k-nsZHNSuKEixZb+-LcxvhQsG379ghgyOpiDLTJWzw@mail.gmail.com>
Message-ID: <asNuMzqz3G-gmIiD@google.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
From: Justin Stitt <justinstitt@google.com>
To: Bill Wendling <morbo@google.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 01, 2026 at 01:04:47PM -0700, Bill Wendling wrote:
> On Thu, Oct 1, 2026 at 12:56=E2=80=AFPM Linus Walleij <linusw@kernel.org>=
 wrote:

<snip>

> It's being #included transitively:
>=20
> In file included from drivers/firmware/efi/libstub/efi-stub-helper.c:12:
> In file included from ./include/linux/efi.h:20:
> In file included from ./include/linux/rtc.h:18:
> In file included from ./include/linux/nvmem-provider.h:16:
> ./include/linux/gpio/consumer.h:670:55: error: use of undeclared
> identifier 'size'; did you
>       mean 'ksize'?
>   670 |         const struct acpi_gpio_params *data __counted_by_ptr(size=
);
>       |                                                              ^~~~
>       |                                                              ksiz=
e
> ././include/linux/compiler_types.h:392:64: note: expanded from macro
> '__counted_by_ptr'
>   392 | #define __counted_by_ptr(member)
> __attribute__((__counted_by__(member)))
>       |
>        ^~~~~~
> ./include/linux/slab.h:602:8: note: 'ksize' declared here
>   602 | size_t ksize(const void *objp);
>       |        ^
>=20

I wonder if we could have a better warning here guiding you towards
-fexperimental-late-parse-attributes?

Thanks
Justin
