Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0142DCC1C
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 08:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103072; cv=none; b=q6fu2iUVBllPoW/lk1zoAmztzqoRWXrvr8S04RSD6jWN248LdekQ3ioytrt7ZoVndmORZZCHCjRiL0CmhHTBvKkvGQOkRyDyF3dgfWWWCd9R10EJFk3c0gFwm9oYAQ+gxZfgxfzsRQOucOrbQ29ZrUJsWeToMN8YdA7kx3Hvk7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103072; c=relaxed/simple;
	bh=dcEC/GTX1kDmqVMIR0uNJ1uSBIP/qBmL7/6lXx+ZZRg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPLCHAmGinOmUARwXim3WdNKvPP5tr3z/PTfwKV6wnv+SJq/yMbvsYNnwaULcYVh4R5u/GvWIuVHp2Hi8YIaAl9ydjCNFkCs4ahVYLJn9O82FVOopSDgEk4LqkiXxeLMn/7J5cPfjKSXNjqwIQDdBQu/izFTVjORgwRmX8Tvm44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3NNuCqt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3NNuCqt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5381F00A3A
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784103070;
	bh=dcEC/GTX1kDmqVMIR0uNJ1uSBIP/qBmL7/6lXx+ZZRg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=b3NNuCqtZ//OpWtB2dQOKPc6AaHIM3DJ58uDWNDzWeHjwakAUAe8r73g6RCF3au5A
	 EMcFU4OM5feN3cwU3INwnn8UYJEn52RyysWw0tfcekBQ+eXauJtApu/g3Zk68aTIpu
	 gOuiGmKPU2/nnU8+NFLZr4GTPCo5ggsKzmYWKu+kk5uWHmCU+umb949JCayhtRulF6
	 acXo4CmQ6U2lc6krHru/xBDnzs6pYs95EKrgP21bTLIgtnR2tBXM2zW/QpPQhwqqdD
	 KlSA+oN5jhLGLo97NQ4FnqRijLlhiBlGnStx3KhvW23XY020wSn89DykKtVtQk3aGL
	 5M/rzBEirNlBg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c7ac9b8c3so16855791fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 01:11:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpvk7lDBSN8YcPZITJ5hrHSNSH4ju6gkqG5Q/LYQlrhxTWaMPndc4I+54rFSu6mUNe6thcggZz3KQvw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt65Kgsao3wjwUwXez1CMXCFymMu9vMnRJmaNK6CuN0ElmNVpV
	Yavb3wqAGlQa6U80loP37qtJ0kygoB+fJ7KYsAkxBPtb1hSqhpXalnPuQiqtLAGs+9I+nu4EUIT
	2sOezAwuJcahU+yxG4mwXbWyWexAsnMByqUk9KCObKQ==
X-Received: by 2002:a2e:bcc3:0:b0:39d:560a:f87 with SMTP id
 38308e7fff4ca-39d560a1e42mr34665371fa.36.1784103069394; Wed, 15 Jul 2026
 01:11:09 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 08:11:06 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 08:11:06 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <alX2Q3OcJHVmamWM@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alV0wIgZAY_InGYV@google.com> <alX2Q3OcJHVmamWM@ashevche-desk.local>
Date: Wed, 15 Jul 2026 08:11:06 +0000
X-Gmail-Original-Message-ID: <CAMRc=MckJVi5bPtBh9p9D3SHaJcyvf19B2J-u7fbDiTA=CLdJA@mail.gmail.com>
X-Gm-Features: AUfX_mzoq-s2qBaoeMdBslqUGfhRro10EO237r3xD58-J6HGUhge7vKwEP4zKm0
Message-ID: <CAMRc=MckJVi5bPtBh9p9D3SHaJcyvf19B2J-u7fbDiTA=CLdJA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: remove trailing comma from sentinel in GPIO_LOOKUP_SINGLE
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 10:41:39 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Mon, Jul 13, 2026 at 04:29:16PM -0700, Dmitry Torokhov wrote:
>> The GPIO_LOOKUP_SINGLE macro defines a lookup table with a single entry
>
> GPIO_LOOKUP_SINGLE()
>

I fixed it when applying.

>> followed by an empty sentinel entry. The sentinel entry has a trailing
>> comma which is unnecessary. Remove it.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>

I queued it but I do consider it a bit of a needless churn TBH.

Bart
