Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96BE3B8930
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141193; cv=none; b=lZ+rx5AMeOjeHl1K9jRaRo0UxAMHyjcRCu9Si0jM23oT9KqrNOW7oyPyaiIx7M2C96ZNJQ3R/RCumYm7XDLXIHMeae5BqUfdtysWuXRzQGHm12is2xP7/S0MXsDXI/PqT7ZTpJShAMXQ74ISEsUYbFaX57I+Vaw6ohZqhbswiUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141193; c=relaxed/simple;
	bh=kOXYAK3P34oXRs56UKPcrMmNb5YVhQRzHiwMXJEYU1M=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUxCPzVcj1rFS3vwknBgySEEBbeSytFUVNjwaeWn9ZpHaj4JfeHVczLFRguBPljJlLKy6ulKqCmboQqfcDyklBB1ZIZNdBynO4xCXMou21KtC922OOA7FFYVOc9gRDMKqQ6joBUOPiZjsmMiukg2gHIMJZ9mk36/JIqWSXj5jnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iO2sM+jb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iO2sM+jb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A650A1F000CA
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792141192;
	bh=kOXYAK3P34oXRs56UKPcrMmNb5YVhQRzHiwMXJEYU1M=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=iO2sM+jbvui+551BfDOVupfnxeFlGkU3/BVv0ukDDrWHPOoEN0d/1aLdOJfG9wb2g
	 joFwTrRUplfWAXkuTUxhNN3+vjaUnyTySRrbsznWFdoqIHgocEPxn3pVT3Xz+fsjje
	 lge9ZUe+2fEHQ2o7W2l9GRr7C+bmWwgh/MJ9xy5/TAFK1vKzDsg39dRZxzbYAkAhqd
	 +0YlhFNZsIv9pSjbcfkMq7vUVJXCRMKaEodx33ci7q0KK0iXgv6q2nU1e3x15mNkAc
	 IWpvmba/JvT1kZtTyGbZsE8rNkmiUJ3fzCzBYTRLiEUMJHOGmc359Z/+K/6J7+idXZ
	 Z9PaBLzlZZ4pA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a75f960be3so33605191fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 01:59:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByZrl+acLsPWVDC1CUnnvxUnR1Ry+Zwziy1JQk7IjpHkvd8E5oLaw08VhcmDWRA58e9cLxv8iiGtxIE@vger.kernel.org
X-Gm-Message-State: AFq9FYJM5a9ZKB0IK44NYhflYJ8w/Iy/h8zJJ6myN5yflM41I04xkOWB
	Sbr2C64j4NqSMeDmVlmAqq0Bdi6yWUMIxhG3dj+wulccN/B9h5/3BoMsdQLYemdyQvyqTSTbpS2
	Cl/6e8LySOBp7ZA2+64Nqav4iq3a0PFEoBIgrQ2s1VQ==
X-Received: by 2002:a05:651c:19a4:b0:3a9:c1de:852a with SMTP id
 38308e7fff4ca-3a9c4ebaaa7mr54566611fa.3.1792141191356; Fri, 16 Oct 2026
 01:59:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Oct 2026 03:59:49 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Oct 2026 03:59:49 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261015171557.21243-1-jayarajdmit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014204331.15383-1-jayarajdmit@gmail.com> <20261015171557.21243-1-jayarajdmit@gmail.com>
Date: Fri, 16 Oct 2026 03:59:49 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdzQCzqtY3OOnMjYsKh2LXJw9aQ_EsvkFwvkeZODa7Q3w@mail.gmail.com>
X-Gm-Features: AclHuK-Epf01-bEUjh-NNjcbEZntePVtFa9eua4Tkj9glPl3OYTYWhiQnbnZdm4
Message-ID: <CAMRc=MdzQCzqtY3OOnMjYsKh2LXJw9aQ_EsvkFwvkeZODa7Q3w@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: lpc32xx: check devm_gpiochip_add_data() return value
To: Jayaraj Devaraj <jayarajdmit@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Oct 2026 19:15:57 +0200, Jayaraj Devaraj
<jayarajdmit@gmail.com> said:
> lpc32xx_gpio_probe() registers each gpio chip with
> devm_gpiochip_add_data() but ignores the return value. If registering
> a chip fails, probe still returns 0, so the driver binds with a chip
> missing and no error is reported.
>
> Check the return value, print an error naming the failing chip and
> return the error code. Chips registered earlier in the loop are devm
> managed and are removed automatically on failure.
>
> Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> ---

Please don't send new versions of patches in response to existing threads. They
must be new threads. Please consider using b4 for managing patches[1].

Please resend it as a new thread.

Bartosz

[1] https://b4.docs.kernel.org/en/latest/
