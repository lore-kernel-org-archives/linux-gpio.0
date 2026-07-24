Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844A63CF201
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 21:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784930340; cv=none; b=nBUg7sIIZqRz3SQPAtY6l3NG8vvj211BFCkLv9YSs8vRX0SlmpHFVD1MBXBcVWpOoZpD9g7NNPD4gaP99xG/lT7Ll/cv0LM7oIm0qnlhEUFNz/j2VNPBMnyxQYg4qG81SUpmM4sPWhh5sPoxXOrz458ZtUQh6Hg02+Avs9hb59I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784930340; c=relaxed/simple;
	bh=jbduD0uqiKJjVviHpSJJPcgJv6I182OMv/2oKylqz4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFvZzLHJKdNsbvLYV8HKPuctKynOQBwbQFpoyKoDc4VegiRHANOPxR5hqUa5g+Rur7lXdemzkwcLKSaPozps6nIPNFcha6IdR1GHDsrKdDetdBUXpPFWvrTuyRC9u99gPiZiQUHNeGeib6uBLH4FQRXMLJVBuV8EJAuFi52IXIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2UZ3jR3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2UZ3jR3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD7A1F000E9
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 21:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784930337;
	bh=1SXGDGlq+o5WbMBzt39h8l+fqR+D5O7ucdIdNMzs8Mw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=b2UZ3jR30oeLq6HiZiLSeirV1WGzxJHkpXqUvEDTVI61ZoWYNiocnvBHn4qryF5rh
	 vFjwITLvWcVX1I8IiFic2jCeCnsNxOyeFeM2Hk9+WcnB4CXuj6TngIryyax8xqW94z
	 hN8+qGnRhMBc1SDSVX55lvV9rpDUFzRULpaE9gOmX6YJfpCV1Ki6fb6GDsuSm4huD4
	 RPGEkpkUvO5PQCvMHeF1WCaYlxaQw2odqhz5FggEVUoxITKgi05CyDzcUcegXcKuST
	 jnFmxWDF+eXU0mYiuA2nMmqPRcZEw4LzWPP7zcZ4qCNtWg6c5KPWImdK5z9FDQOcko
	 isEO+oEx4SJSg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c7ac9b8c3so8188651fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 14:58:57 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz2wsGJzWVsVWXaz6Gd01HtLv+YKUEv/LWJc8nPJdauMZqzPY1t
	2yeTSf5KfDLJm2Pt3BntKXXGx2tB6FQcy8x331xYkFwnwl8kAmmN9hhrbniVaWQ0jUUiMnNCsp+
	lp8Qiggq4UywCPjvQNIdvcLbTBILOcCg=
X-Received: by 2002:a19:5201:0:b0:5ae:a9ec:bb31 with SMTP id
 2adb3069b0e04-5b2b2f761c3mr1347641e87.57.1784930336046; Fri, 24 Jul 2026
 14:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1784195346.git.geert+renesas@glider.be>
In-Reply-To: <cover.1784195346.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 23:58:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLndokmpURBR7tnQNnfUk47jNxAALtPw+7xwPE02x8i2sg@mail.gmail.com>
X-Gm-Features: AUfX_mzT0qoQKMWkUg0R280sa8lLo01CVEccx8noSN5rxau2wEI656wHzd0SaWY
Message-ID: <CAD++jLndokmpURBR7tnQNnfUk47jNxAALtPw+7xwPE02x8i2sg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v7.3
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 12:04=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v7.3-tag1
>
> for you to fetch changes up to 5a653cedec948423fc8a0180c90b8d05c2239d9d:
>
>   pinctrl: renesas: rza2: Embed pins in the priv struct (2026-06-30 12:03=
:56 +0200)

Pulled in!

Yours,
Linus Walleij
