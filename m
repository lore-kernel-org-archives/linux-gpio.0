Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842F43B3893
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 10:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369280; cv=none; b=URd14VdhYYC/gxrw0wMF7ZOy1+psA6GpouK2Hof+V3BUQ8Gyfx2yOZCwsDexvME2+HyzAhiSBY9H7lwRbDndSJtvc2pES8VHSpA9yXrPcALiH8yOEwAF604IzmKyv+06EUIzoU8tkxh2OjK0NeMl2bRu0bVq+L0I2p//qHcw38I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369280; c=relaxed/simple;
	bh=U9IrEoBQVBwO19e1F+Rb7P6y3+fNsIUQk5OiPRca568=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFSLzj7ENELJYd2jlyLbiWRZR+i2gZajkmqDJ/tWiKXfuBkEmFsYMmKEZmuDc1vjusRIm/eHSfeqFxCjKYd24IyjOV3KqPoHC3preZEFKjsB/5TP9noVQOu+YNEp2GukeBYECBKjep87Ml/qmpYneYED3v8VhxL+8jvTmfqxsHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxfelJ0C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxfelJ0C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77331F0089E
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 10:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369246;
	bh=Aa0rQrbop3hax8Vjke2ivUTPfY3ro4fUWMamHs2fjyc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nxfelJ0CBKFkenxkqd1gZ6/hrqt6nMW6UFjAZG+Fz+y0rVlgEiRptouFoVhbrXZzs
	 n3Z3Q1h5pFs/9g8zWk7NodEGsORoP3VPRLO0y0f0jQGTB+9sPhpALLH6bCA4EfE58/
	 CQb4p1t99nOUoluTnEOcxuDyLUaQlhyE2n+wSDsQiawOrlLvfwMCath99bwYOVtwYF
	 9jc89iDt3pX2gKq6MZlIwFFyz+i5VkCH0ToD2pZ6f438MhcCCzg947nIawI6xdjqsM
	 tthfvagPWMv6rfbW2E5gm4EavHZcwNyLsNmzcpdxtZUREFssJA6HLoqsbN0EhP5rbm
	 DK8+bzNFzbkVA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a9761758adso13300591fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 03:34:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxpZMkN4xhYnApOhDXXwoeg4b3SJ686e71T49m75uyqBlA9n4PoJe4h5PEoJsypx8qb8BWEqQrKZ532@vger.kernel.org
X-Gm-Message-State: AFq9FYLM/YVmUfSFjE4oHJgld/j/AM8SjB+ZrTYh9KFFaVuPkqzMo9Qi
	qiLCSMPqWz+Sy8fhBSFwGYQeQswWgkKQsQARgUUvbeohoVKu3UAdi4U+yzyqU39WAFSOV5GLZo9
	iGyflfSp8pGkvfn0yoESsdhEy5Quu5mo=
X-Received: by 2002:a05:651c:a20f:20b0:3a6:6d9a:4188 with SMTP id
 38308e7fff4ca-3a9a2cf45e1mr3189651fa.15.1791369245722; Wed, 07 Oct 2026
 03:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003083200.459705-1-yaojiale02@163.com> <20261003083200.459705-3-yaojiale02@163.com>
In-Reply-To: <20261003083200.459705-3-yaojiale02@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 12:33:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLm6QnhOwZzCsJJkvYDkxhE-bRUvytjkEDzZJnKaJ5go6w@mail.gmail.com>
X-Gm-Features: AclHuK9VzSEG96mQtUPQl6mYgcJWO0uGPLmiDvdU6LQqSE9k0_R11BxY9w5t8qY
Message-ID: <CAD++jLm6QnhOwZzCsJJkvYDkxhE-bRUvytjkEDzZJnKaJ5go6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pinctrl: renesas: rzn1: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 10:32=E2=80=AFAM Jiale Yao <yaojiale02@163.com> wrot=
e:

> rzn1_dt_node_to_map_one() appends mappings for each DT node.  If a
> node fails after map storage has been reserved, the top-level callback
> returns without releasing mappings built for the current and previous
> nodes.
>
> Free the accumulated map on every error path.  The caller ignores the
> output parameters when the mapping callback returns an error, so they do
> not need to be reset after freeing the map.
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Geert will look into this patch and handle it.

Yours,
Linus Walleij
