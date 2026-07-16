Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342A430AD05
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211223; cv=none; b=Ib/BN39gSyOBVEO4dcnKKAYY69TIJCPZHoHWA6YgEIER4wDrQ6hXmvi9D69EHUaJv2ZzgmKGXWTBMTZut3uYfZfLFgqD+ZHcmq0dI7kBR1XQ9p8K1hq8l0h4KuDUWUnAAUzJbOZYLk6ysS94twHWbVl5P1cGXgpAgFYWz8Ynkbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211223; c=relaxed/simple;
	bh=m2Cq19WVjHCDW6YX9OP4TxTkVPdVAAwlHVhiyx6vock=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdDBqVK5HlGZFnRolNEHapRo2OnYQ2luhKVXXbXUOze6PHb2mLUpJ+ZjpAdAM+R/DNFfqMzuLNf+fV73M7ZXfIW/aiNsh5VVGSwFbUzO3hskNDqC+8dhU6zl9q6p93hzWq79Z18V8/rkNvliR6COqd8ifYakJQhBlqenXxNYcsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKT+trO9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKT+trO9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085701F00AC4
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 14:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784211222;
	bh=m2Cq19WVjHCDW6YX9OP4TxTkVPdVAAwlHVhiyx6vock=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=mKT+trO9z+AnyL3+iB4qJb/9a2RcfdvmCBmpqP4r4zZVxaYLoJZKPl7dCpLMbFMnH
	 dsIB6flRks0gfkymZiMjEbr13FB7Wz0HfTbig89zWWrb9BQj6rrukUUBehEFe+9ZI0
	 W5MzA8wYmOnCLrRbHo5R8JLL0asG3sHzzbIbjLUMLHa/EEkjStlBLQk/By/WqMmh/2
	 P5zSNjpby1s0Xzd+WLHNjp0u4Er3mexAGmCRlZDbFQAuqmeTyyoJNavbuUnfIksjY4
	 huN3muLhooSFbp5/16g9esgEzh90gS6/wGn0Qjdn18KdoL+oihhXyaqfJmh7qTOrxb
	 iPItU800/AqGQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c83acb86eso28859011fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 07:13:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp/8ldeUk60RRZ6GPK+8ijtzFb80c2ZnIEAtn+xLnRr4o3Iz5nf9tLV/6/Uso95kWEGcgDfBQEw+A5q@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi8YyzbVew16otgwR6bY7OAo5OaXoSLLCF997FukuUdppkQY4D
	wW1+sZ3oMUVsPr60k9FzRgusKEpvaI82j+79ZsZnExNdV0hVbERPCYaDFiTN91+AY9Pkj6tg1x4
	xIxRgjDePgqOxz70LwcpA7On3VxQ1U0MNmGOzBHYqmQ==
X-Received: by 2002:a05:651c:19a2:b0:39d:ba1e:ab3c with SMTP id
 38308e7fff4ca-39dba2e9446mr14519781fa.22.1784211220678; Thu, 16 Jul 2026
 07:13:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 07:13:39 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 07:13:39 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260715163944.1300616-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715163944.1300616-1-andriy.shevchenko@linux.intel.com>
Date: Thu, 16 Jul 2026 07:13:39 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdzOrvg5bF0oy8s3nk+zarW44je=9RYtzwWknqgD8RrkA@mail.gmail.com>
X-Gm-Features: AUfX_myjAvrU6hefHpbA8NKh_77Gcb6A7i3Vghgc74nLrAOJrGhqeLPxS516eqA
Message-ID: <CAMRc=MdzOrvg5bF0oy8s3nk+zarW44je=9RYtzwWknqgD8RrkA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: pcf857x: Use le16_to_cpu() and cpu_to_le16()
 in IO accessors
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 18:39:44 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> 16-bit expander data is an __le16, use le16_to_cpu() to read it.
> In the similar way use cpu_to_le16() to write __le16 value.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Fixes: and Cc: stable?

Bart
