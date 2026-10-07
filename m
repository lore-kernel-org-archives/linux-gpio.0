Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8242149EC4A
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371997; cv=none; b=IsXz1Zi1xW/y4nZ58wrkGC7CmIl1A3yKRgZiGO7gYI82RfiVRAnrRELq0Cd+E7EAsioOfP1kkPT1+828mJgQ+ZB+KsT7w/AgRHzAJZ+tKdv1gzD6Hw5LFlKL2fwFoyz6c5FnZiXPd9ausgPn/QDKyVMn7aJjUTYBX6kHBrlZetc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371997; c=relaxed/simple;
	bh=Q1iSp05Y/GM79eVG3nz7d1/FrmFsX5eWbL5dWFDrKic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sh/9VoXpUD1Y9nyfUNCphNvI8gpXc/dQX6MszCI5JZX4w5O3Z+8DHvBQnTX07gpfQXT8+ci7voLlbrrG60p0mIViPo7I92FlzQDhSShq74cqnO5hQaYWkni/y4RAbf+VwrgfH+zeIS6LAn+ynkRzEHHwt6PsmJKFMSj0XOfwCzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UieuE4DJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UieuE4DJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C591F0089B
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791371960;
	bh=Q1iSp05Y/GM79eVG3nz7d1/FrmFsX5eWbL5dWFDrKic=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UieuE4DJ7bV+9VxNNwryNKeg0MN0hPzMzTtM1jOXJGyNNcRt8C1p1DkSgzOFrv/dh
	 GceBH+aSm7o3g/eC98MAH8YloE5EXjZObB6L33Wccl9UO3XKPSSNeob2U2RJPH90Qs
	 b1Gd/zp7OmUWlwzPUIVGdQY+9zn3fSmikXul4VpH3326uexxWvG6nfgxU0NSxm+1rL
	 nRT7xP0niE443krUgcsAKafIVcsdr4CaMK4k6Za5LlQGQs67uWkLP8yAW6nCrQaNhU
	 Q5q62VDigSakInLXu5yrleuJjVgCuzjMgERdzjRhYcGDIOnWDfgKsCfGhz2sUAo1S/
	 k+uhr5QeLHj3g==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6aa9606ddadso2701880eaf.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 04:19:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw+W/3G6x5ZKol8Wm58hMEEb4k6IZ+b9danJTW5wNOjehgbeAEho0L4Ps0b5NYQGrA8fefF6lMlk5Mt@vger.kernel.org
X-Gm-Message-State: AFuF++mFHiaVSnbz5iZcGL1GCt345Bga6xyrh/ZryGW4x9K/d2GFLAFb
	a1NV9OKxtthkQzVPc9gboenwf8HThpKv5O9Gwt3xBRoYqaJp62l3LfI4h+gAfcAcLXvTZ5u5Koz
	ALgS/hEjMfcKB3+tBffslIGhY5jFjFbA=
X-Received: by 2002:a05:6820:2d07:b0:6d3:402e:1fc4 with SMTP id
 006d021491bc7-6e7a6e60903mr2071504eaf.48.1791371960255; Wed, 07 Oct 2026
 04:19:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com> <CAGG=3QWCmQ+LVvn2dtjEauj5WFwvx=pvg4Q6man_A2imdjRe7A@mail.gmail.com>
 <CAD++jLk2pFCpbpGVCQg2AdrwQecpb=wsehhwSuwTbKAXNeyfoQ@mail.gmail.com>
 <CAGG=3QV2k-nsZHNSuKEixZb+-LcxvhQsG379ghgyOpiDLTJWzw@mail.gmail.com>
 <asNuMzqz3G-gmIiD@google.com> <CAGG=3QV1eLy-eAfi3Q49qwMw_Yw-BJ1tmd3J=SLJB_qWrx4bNg@mail.gmail.com>
In-Reply-To: <CAGG=3QV1eLy-eAfi3Q49qwMw_Yw-BJ1tmd3J=SLJB_qWrx4bNg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:19:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLmR3hmEYN+-YCAcNq_0Zk0=PijS9jhGaMppkNhvbs90JQ@mail.gmail.com>
X-Gm-Features: AclHuK8-ODudQDmu_mYfAfdHUSYSOXtS3Zd0jQ7M0p6lH8u25CuCRiFtUDTCe7k
Message-ID: <CAD++jLmR3hmEYN+-YCAcNq_0Zk0=PijS9jhGaMppkNhvbs90JQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>, Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 12:26=E2=80=AFPM Bill Wendling <morbo@google.com> wr=
ote:

> I sent a patch to add `__NO_COUNTED_BY` AND `__NO_COUNTED_BY_PTR`
> macros to prevent this. They're similar to `__NO_FORTIFY`.
>
> https://lore.kernel.org/all/20261005102518.2400984-1-morbo@google.com/

I see you are hashing this out with the right people, thanks for
going the extra mile and fixing this properly!

Yours,
Linus Walleij
