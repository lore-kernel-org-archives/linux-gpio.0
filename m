Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5755848F82C
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369320; cv=none; b=TD9vraZE2/yZYs0SBIngxxXJ/7+Y+6FvZl21dp5xl6/7c5PI2XmaA9FE6nzNQv8LyC5x6HKH1CobVETW9PaZPZbwGkKwd066GCJV1OIuprN6KnYuOyCYqnarCSzYdQQ22DvBrPYOun3+3NqWtWkJvV/qwwhCOQz7Q9KiSH6g6Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369320; c=relaxed/simple;
	bh=SY5hGdUMKL+vkSXVUWU2fDNC7CaN6u1zVKrHh6L2mnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWIugHiXpD1TwksW8WXY9rmrbxLKe58/EMlb8tjYEA6ciDu1hIRNunyBndIYWEwgu29HJbEH+1R4NxphO4BpuiC4tN5TsZl8LmdQMmwb9+fGg0io7r8PohSudD3D7Zr/eb6Z4azTNtBED2ToLbP0A0mS2s54oRG2fYUiBWzyKwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+h3/kHO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+h3/kHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C711F1F0089D
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 10:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369283;
	bh=CKJYdpepEC9t31kyI39+84ULuvVRvlRzZRyf9xALOgY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Q+h3/kHOpmfQKBgqA5TX+/Ok5rxmI+QEIR4P4pJ4bCEIJicElOcQwUwQJGlO1i1Ws
	 toe8W0Q7A3JHfcGH8fqtnzXFqUB/1i4McSlq3MuZLGivslaqO+ieiGnBlAY31yQXVv
	 5ScPA56qIub5t3VlJNbvKolntByfWJ0DjDFj9zQ1B6qPEdXBqm6ZCInkRyt4030pSK
	 G2eljQB1I9TvJflB9PGeSMPnPpS0kvpJx8qql3+Xlsnv6xzf65OSGa6SKNlAf910P6
	 4YVQr1SVc9UbCsIWZAwY1aPikyRqzz7FLtsgRxwTd2GWkdLMMQDldaXD8JmOZHXf/G
	 IDyopUwYTQfhA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a808f09021so28464011fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 03:34:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwdSlfXs3jb9OR5aTdSTNTSjRnMM2VuzNc41F8m1F3BJ+0fz6WehCYCkH5D2MrF45sbSf531Qz+HWqQ@vger.kernel.org
X-Gm-Message-State: AFq9FYL/pSWrPbymzuH4EzIsm6Tx8UmKbTRBngkmz9xTc9tMbanBl6qQ
	SSbLBQkvTZLWjXiJe78k5TW58kvr56GgEzENcsr/XcrgVpjCupINAWVNu+6emgcuYVqBt3wBPzB
	IeHI6C/L9m3xB/GRdWQHkd/C4Y3309Hg=
X-Received: by 2002:a05:6512:b25:b0:5b6:1a7c:59cb with SMTP id
 2adb3069b0e04-5bcd0716b5cmr656877e87.37.1791369282589; Wed, 07 Oct 2026
 03:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003083200.459705-1-yaojiale02@163.com> <20261003083200.459705-4-yaojiale02@163.com>
In-Reply-To: <20261003083200.459705-4-yaojiale02@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 12:34:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLkHvS9Bxwsi5fwgKewVOFTDxe-dEN2oB0uc9bWvLCw=4Q@mail.gmail.com>
X-Gm-Features: AclHuK97HZbcKllT-8LBoNn74qfc91fEI-mtBXOUmMCOtocPhnWFRZmTtX-YKnk
Message-ID: <CAD++jLkHvS9Bxwsi5fwgKewVOFTDxe-dEN2oB0uc9bWvLCw=4Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] pinctrl: tegra: xusb: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 10:32=E2=80=AFAM Jiale Yao <yaojiale02@163.com> wrot=
e:

> tegra_xusb_padctl_parse_subnode() can append mappings before a later
> child or configuration operation fails.  The top-level callback currently
> returns the error while retaining all mappings allocated for earlier
> children.
>
> Free the accumulated map on failure.  The caller ignores the output
> parameters when the mapping callback returns an error, so they do not nee=
d
> to be reset after freeing the map.
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Patch applied.

Yours,
Linus Walleij
