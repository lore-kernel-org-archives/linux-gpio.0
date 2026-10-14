Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49D93CF699
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 08:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964987; cv=none; b=Z4R7XkGw/hCvvQEfAVBDFfGjmNM9ZWflLfBtgeR3V3ycdwcm5DMH3RhAlww08rSK/ileNYJexyl0fcNb5pog7frEcjM63GXFUgL+g8h+TiOZ5cXPlWRRD7juvUhLUtMIaf0U2UKg0nuw+9kk54y/mqab+P9WGE6W4/EPeTkqKlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964987; c=relaxed/simple;
	bh=zl1RG0M1SlnfIJSTsTYacE4+U8WTxLLcx7pNWlOCYBA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuGVQdDASS+ar2sFVwngfxkpSDNDkm0RCHoSIUbGR9pXprJENTQC0w18eZgc9MKlkZDO7x+L/vBB4borm6ZxhhNQeMxlxfpkiNv6+ijZzKOTKJA3jZwbf8UaeA6Mz99bBLj2I1ku1lPpUnJo1k6dNafh2vjBMnUu6wiqtQ8R6UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYN+zMSf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYN+zMSf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289B61F000FF
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 08:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791964986;
	bh=zl1RG0M1SlnfIJSTsTYacE4+U8WTxLLcx7pNWlOCYBA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=AYN+zMSfn1c6S7MzzFW2mOEd7MCHV9yIBE3tPP/+PTBq8FGcUjQaGtra8arisH2BS
	 /D4AaCkG0Jaf9uZS/iCD5wvzK4oSl9G534sw6lR8pjewwhWlddBKkUm0zQEC20YBp4
	 MaMQhUNO9Hc5I8x4XCsMJVqjkS3tJu4dcQITOHTYoJxr4cUkWKCBI2NedvTzzYrlpo
	 c8Mq7vtChV0WJvVj2mioZNXGA0/ACyNIsnIG6eY6vwyzwR/SbiZpGyRxVFckm2sXFp
	 RhBRfuvv/V9FVPM1r4AMtRwa2ubMAB+uxOkCr6oaWr8AO9sxWd4nHl2T26tuQ+bj0T
	 JUsVvQFi2444Q==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so3008096e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 01:03:06 -0700 (PDT)
X-Gm-Message-State: AFq9FYLzAcu2WPFzxSnIwpU2usAgeCjaZRvUR98P/CXaQ17v15PKQlpZ
	aZAW3X5OpcgFayY2kZptjnB4oPHoAa0HlsIhrHBuejBnId4t1swMoZoLk4yaT2VbcNovDyX/aD2
	HPwikS1SZONro3cAyozIXb/YpkyRRghL59B9RIVh3WA==
X-Received: by 2002:a05:6512:1590:b0:5bb:7b2a:5b2d with SMTP id
 2adb3069b0e04-5bcde6cfd5fmr5310061e87.35.1791964984731; Wed, 14 Oct 2026
 01:03:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 01:03:03 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 01:03:03 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261011100059.29832-1-tornilua@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011100059.29832-1-tornilua@gmail.com>
Date: Wed, 14 Oct 2026 01:03:03 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf6V3WXHyBKx-uhp7K05ZD38bfosckAM8NwhMoim9BnJw@mail.gmail.com>
X-Gm-Features: AclHuK__zLmCI8SMubyssaKIzm45FvNcg4N7vgRWXl3MHwrBgQbkKgKjwhrjo9o
Message-ID: <CAMRc=Mf6V3WXHyBKx-uhp7K05ZD38bfosckAM8NwhMoim9BnJw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] treewide: replace malloc() and memset() with calloc()
To: tornilua@gmail.com
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 11 Oct 2026 12:00:59 +0200, tornilua@gmail.com said:
> From: Ilya Kulaev <tornilua@gmail.com>
>
> Replace malloc() followed by memset() with a single calloc()
> call where zero-initialized memory is needed.
>
> This reduces boilerplate without changing the intended behavior.
>
> Link: https://github.com/brgl/libgpiod/issues/154
> Signed-off-by: Ilya Kulaev <tornilua@gmail.com>
> ---

Thank you for the patch. Like I said in the github thread, I think it's just
needless churn. It fixes no bug, it saves 21 lines of source code but doesn't
result in the generated code being smaller as - verified with GCC 14.2 on x86 -
the compiler merges malloc() + memset() into calloc() anyway in all but 5 out
of 13 call sites. I really don't see any technical reason to apply it.

My personal preference is malloc() + memset() as it's very clear about the
intention of having the code zeroed.

Bartosz
