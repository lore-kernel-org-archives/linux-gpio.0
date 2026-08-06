Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4573942CB08
	for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2026 22:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054562; cv=none; b=hASuEqNWDulG85jFItei6c1Y3HW/Rcxg6HPBNmBSyJjdJnxPlnl+jT9nDV4CL47NBnDtV6yi+Fu+sU81u/gahORECisk77Me2hvwJZf1/O/q/fq15+kyyfQNPn1gmCTKnV6BFqi17MK7Ju+CQya8qXmWVwG/fs91cgRrgPnKGjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054562; c=relaxed/simple;
	bh=FAMvGx/Nhy6G1Njdh4xzs4u1ahqLsDIzrreIJAT0dro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=psKxbQr4OiHyPaICBrjKZglul5uVWYfU2zCBqMog6iFMPi0A39PTN3GyEDxwvKPzCg/jTowuPrGPGu1pwuquTIfkzhW/9Tu5RCP7haZVqTVqc5IQ/kVH3Gy+R8/rBQoqOsu0iiOwT8nLdCXipHtkjuGny+C02gtM9/jceKSKmPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeHWSf1v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeHWSf1v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706F21F00A3E
	for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2026 22:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786054558;
	bh=FAMvGx/Nhy6G1Njdh4xzs4u1ahqLsDIzrreIJAT0dro=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GeHWSf1vK0xP5n0S8ZIBeWf0LS+oc757SLXAXWVcXXpKzrbfZQZvai7CL/uWGaZ2b
	 mBV0xfYBGcgP6lFuEXMHu1N1bc6xO+br26UKrRea8Rzax6Dmenpo1ZTXl6pdxnuVAI
	 DGO5ZXI3kmXkffn4ruOxj8gK+bFu/JsRruC+cZhxV6OwXUDq6dqiFzbJog7/Tp6zvh
	 CgJipaVj+IdAx57az33LrIH8wm4O652zy5RQzdjTuW4g0qzI55FQQse/PWReGt/Jg/
	 4i6p5vG0bSgIYQPbCkmXduXCBVY8mj7F8DdiwE+Y2RJEQWjmqN4oN530GhD5zWgyJD
	 V950dhD5tvvcA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39f9d4bed90so12697681fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Aug 2026 15:15:58 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywg9FLqsqnm/n6mbMlymAU8jSojZjUl+/sagsjvtYsnxz11mXnS
	M6rLgwT5CyvDgCtghICNxSSV4ZxwRbT4e2l01NqDLYZJEJV+ER97NvhIR8IXtBx3wfgzox8l8eG
	nbpmbZJ17lRHPoZ2Jxbtnj+TVw+MTHAY=
X-Received: by 2002:a2e:b8c9:0:b0:39f:a24b:bb25 with SMTP id
 38308e7fff4ca-39fd141cecamr10149251fa.4.1786054557256; Thu, 06 Aug 2026
 15:15:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803223539.86303-1-rosenp@gmail.com>
In-Reply-To: <20260803223539.86303-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 00:15:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLmKBR=nHQ5O5URC9qmgA25X9=xYWQAx-dyRyUGMG+hKmg@mail.gmail.com>
X-Gm-Features: AUfX_mx3a3U071bMWwj3yWtcfq77UPIZnA-RY7yvDANb6g6jyCQUBXMBouxKQLg
Message-ID: <CAD++jLmKBR=nHQ5O5URC9qmgA25X9=xYWQAx-dyRyUGMG+hKmg@mail.gmail.com>
Subject: Re: [PATCHv2 0/8] gpio: move ppc4xx driver to drivers/gpio and modernize
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 12:35=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> This series moves the ppc4xx GPIO driver from arch/powerpc to
> drivers/gpio, converts it to be a proper platform driver using
> generic MMIO helpers, drops architecture-specific accessors, and
> prepares it for module build and COMPILE_TEST.

Excellent patches!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
