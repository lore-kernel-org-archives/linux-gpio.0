Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EC53321DC
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504808; cv=none; b=OX8iJrpBDVYIXuN/WRasZD/sgMRAbdItWAubx/fGQE6Kyq9hfG7y7GOoWnnG7rJ5hdEZMWb7KwLvtmyVxkenFS5WtDQC4mAGXZvLLHPsO1rf9hp858q5hygLZmclApP35aiJqePnTrCyuTO3a6VIu7LcDSGm74MyOC2Jp9VJ2yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504808; c=relaxed/simple;
	bh=7yo7xOOpqehBseors1LqgTyv5Fdnwz+Jvyg81HCJMgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TdRsyMcMTlNv06ZFQqUaO8gnUwo5dAEzO3QIVCNO4OaaxeppXg9mA80OQtjAgJzyL8uE3MkniU3XmFTGAMMGn9QxNga8TaooxfaSaNeyLLnU6KEUOHIyuUJSC7+pQalyLGmsHe5WhlUjoQuC7T2xuupQ8dtXMglKhrGN8PGSUVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+RXCr0A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+RXCr0A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E48BC19425
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769504808;
	bh=7yo7xOOpqehBseors1LqgTyv5Fdnwz+Jvyg81HCJMgY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m+RXCr0Aag8BySJUrf8mYGE/jWVYTbIJDNb7wC9pyTwPq/jXkC2VqIFgzft2W+Nlh
	 fQ9t6YizgzivTlf+P93UITCHU6taYMun4GYJN+liqcnLUpAk//HSx2XfI4UIfzyq8M
	 bzHUf7wCc1GNnbFyEw9/njP5ErQQg1wvCMn26My3cgy8dMqicwLjVtlTKGOgLw0cMN
	 D+4JO/q476QKpLPxBg2oxQs909hqeMeNDIcFoOs3wts0b5eso7Yr4e2QVMwf1Mpu6t
	 07lAv2xmqGf8WdyPI+Ghs/4Tp2bLznbQ4OpU4S4Kl3Ohs83Beg75YW9BysKF4R4a1a
	 SRk+s74H+jSMA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59dd54b1073so5487444e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:06:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUb34MI8mhir64dReMhcP3w78MRoIdb7OoxiT0hjCpCpqqDeWFGEsBd1jLO5erd5I00UgYw7ZyGmb1m@vger.kernel.org
X-Gm-Message-State: AOJu0YyqEVidwv0byD/EJLXp7Jt2ixcOB3ZvMzWP8I0z3xLkCvaS3Q70
	55dHcJniixNfI8iI97eIvhHELGZxyxiTMF6QToQ1HGRUA7JxjSHKxEELDVtEGumvRIJFaJFLc4v
	bk0CzrbREAU9nfr1e+SUO5dypyTQUBWp4iwN3/9RrJA==
X-Received: by 2002:a05:6512:b9d:b0:59d:fb43:5474 with SMTP id
 2adb3069b0e04-59e04012f0emr440731e87.7.1769504806756; Tue, 27 Jan 2026
 01:06:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126035914.16586-1-denserg.edu@gmail.com> <20260127080759.GY2275908@black.igk.intel.com>
In-Reply-To: <20260127080759.GY2275908@black.igk.intel.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 27 Jan 2026 10:06:33 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdRQzgSNorb9rHtAGWYPOK7t2o6q2gP9FLB3ECsvgVrAQ@mail.gmail.com>
X-Gm-Features: AZwV_Qi7uqULlduHi3gXdu2rdMxzjReApBfK4jfP4VOaVK6I3RuFERAM8qKv6pY
Message-ID: <CAMRc=MdRQzgSNorb9rHtAGWYPOK7t2o6q2gP9FLB3ECsvgVrAQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: use BIT_ULL() for u64 mask in address
 space handler
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Denis Sergeev <denserg.edu@gmail.com>, westeri@kernel.org, 
	andriy.shevchenko@linux.intel.com, linusw@kernel.org, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 9:08=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Mon, Jan 26, 2026 at 06:59:14AM +0300, Denis Sergeev wrote:
> > The BIT() macro uses unsigned long, which is 32 bits on 32-bit
> > architectures. When iterating over GPIO pins with index >=3D 32,
> > the expression (*value & BIT(i)) causes undefined behavior due
> > to shifting by a value >=3D type width.
> >
> > Since 'value' is a pointer to u64, use BIT_ULL() to ensure correct
> > 64-bit mask on all architectures.
> >
> > Found by Linux Verification Center (linuxtesting.org) with Svace.
> >
> > Fixes: 2c4d00cb8fc5 ("gpiolib: acpi: Use BIT() macro to increase readab=
ility")
> > Signed-off-by: Denis Sergeev <denserg.edu@gmail.com>
>
> Reviewed-by: Mika Westerberg <westeri@kernel.org>

I'll queue this for v6.19-rc8.

Bart
