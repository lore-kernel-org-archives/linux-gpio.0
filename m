Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355A339CD11
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786462952; cv=none; b=IKR76STZeJ669eQ8Q98Fi9Tu4kTwrI2ur9wegaFGD9tru1/kU7h2d37IGT8uTfO2fdZFhPVlt6Y2zh1qIUy4V7u+4Ms6+fhQ8usNrYb6F5IXNrWoEOfNoBlAvJkddXRR3rSzC5ym/Yyz7xf6WYGSM/mWlwNlZaOVkqhm1QE1LEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786462952; c=relaxed/simple;
	bh=6QICGC1RCueQ/MzNjrvLBwWSkEDtd3HW5RQnwbVIDaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJ2QTPQp42FReyV7wwRCG1KaiVgjHoy3CDKP/MuTCLHsLF0+YWfXCYIYAxMFuL/OOKsBqoErznzt0Op8SzDkidaFCqXRPjKdOKs3dE9Negu4Bew6bcWZvGxOviHLFktXxvNo5SJXaiQSGr8Z0y8QvOIVXdYtQUWJ2hChIP4nL64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4rzsLdB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4rzsLdB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80C21F00A3F
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 15:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786462950;
	bh=6QICGC1RCueQ/MzNjrvLBwWSkEDtd3HW5RQnwbVIDaY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=B4rzsLdB36NdRiZD++VQEpO568uMwGHDgniJOEP3YgaQxpAV4wcd/zqJC5dOppPDp
	 eAC6AS67LCC+kRhUd52Llzq6F5Fcip6Zfi8YfNWPl2QatfwIbSXqZXETIre39dw+du
	 cMJpxABO1aghXCbWGAqz8zBIEm7RukBJOw1Lob4nYsoxFZXWDYWyacBe30x//iN6OE
	 fCan25gjXw737iBbgqzbyrKo1cnlFUhLCwM1vZGNhMVs6VTn9c7chtsb340wFvD9dl
	 t31R2gjW1BNwrQiyc1svIevtLWPdD9Z1oXt7tX9/JRqW2KSsFHSr6nL/wtZgOXHbzP
	 /se8T82KoqOtA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c7ef2b1e2so500721fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 08:42:30 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxx3lx5VP7c2rljb3Drw+AJzmKXIUhFX09TBvOqLBx7NSD+yp/Z
	J/DqxzGDboUDCTxcm+5QqXRNEs6Uuhke13WVmQLANr2C128XoHb24nmxb2in8/u5AZHfyXFpS8s
	3LcHDTfQbDpa2LDj70I2A4K5mry6vhc4=
X-Received: by 2002:a05:651c:2224:b0:396:94d9:5c88 with SMTP id
 38308e7fff4ca-3a0f8d147bemr5314301fa.11.1786462949662; Tue, 11 Aug 2026
 08:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ans2wKanSm6W5lSc@black.igk.intel.com>
In-Reply-To: <ans2wKanSm6W5lSc@black.igk.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 11 Aug 2026 17:42:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLmMxt8fWOe0uwNvtQBiTKKFgoqSUQDZER3VEBc4Q2ZEKQ@mail.gmail.com>
X-Gm-Features: AUfX_mzw8qkXiQ1gj15pfNQvTtNG8oXvzrreAWybFuJSfBrEQJcH0or8At7JBNo
Message-ID: <CAD++jLmMxt8fWOe0uwNvtQBiTKKFgoqSUQDZER3VEBc4Q2ZEKQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 7.3-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 4:50=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> A small piece against Intel pin control drivers and associated. Was a lon=
g time
> in Linux Next without any reported problems, please pull for v7.3-rc1.

Pulled in!

Thanks Andy.

Yours,
Linus Walleij
