Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD6D221540
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652563; cv=none; b=b9OE16fSawHSGLEhnQAENRG8ecYABxLtHTemzJJ2j29/1R2waGdbAlfYfIe/vj8UH1v9WwurFdmqXKhYNo28O0T8pnz5yEWYHhyKODR1at8GbhGzvh0/RPxKojGYiCexr7Hse8mKiEl1ahKh4CucltIiBNwXD5S2JDY4mws4q/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652563; c=relaxed/simple;
	bh=r6rrnoSg+X0DjvMRedhQCa5Zuvwfqfp0O67rZcG8X/U=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBVd53jkR+aQwOE41Xsw7R73AJUVnNyQUWHJEC6Zb9f0xRW/2LgosZ4FCytysUvHCB1YO3djrAf5Q2mQNn1Yw/EK79uBjf+/VIz+BKpmC8JnGNSBduISLoDHpJyVL45VLKNJa7hgAySdD/6P6Vq0ismK+9y4/S5UWTy9P+Lox0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4ynIXqH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4ynIXqH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18A4C19424
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773652563;
	bh=r6rrnoSg+X0DjvMRedhQCa5Zuvwfqfp0O67rZcG8X/U=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=N4ynIXqHIDT5Rf3bXViwWCn/+MVy0+QVyH8q1iRnJmqY/9k4BImn++Kg8ST323AY8
	 iKaLMu39MRXFDMSgCZSIZFE073GzaQ+0igb7RVKS+TIy+dXcCLCfWBHzIqGJ4tRVE7
	 t1gyGqQmJh3Hg6WeHqPqa+oYHZTjtqvKyBZTQDRhIZyLH+rnV67bHQvkkH/nrZIhCf
	 AdrEEX2Qflm2RDW4rLqaMC72GBhzoZIEBpqbTzc084WbmRgqVnBbWrYgDIVg2tnCeF
	 WmWqG3Awg66Rv+VU1uy6C+IhueCj2+eqHsfCv2FMR1Y05evXs9QrnB9FobM5i+JGHV
	 Eo3vXcqTXojIw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a126b79512so3677867e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:16:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2fO7SOkppgBFKvKxGNSxFTwd4jDlD/1tUSFNEkV2qpPW82v9HBYvfW1kjmkqaFHqpnYYbTjlpp71X@vger.kernel.org
X-Gm-Message-State: AOJu0YwEeWLUQTjSh41nnVdxXCgvzC4dszmKVRzEWR4usPvRSSPbH/mq
	vCY+WUK5Ma9me0WtxcEdJgNM8r7V3u52VdONwWTSZotxHo7kR5n2xvaJWIvBmWcU5LD94/otEBn
	C63IzYFxWe4qLqlIi9BvcWVCeZ5NjMBo8j9G4e/Zgvg==
X-Received: by 2002:ac2:5587:0:b0:5a1:5762:4d08 with SMTP id
 2adb3069b0e04-5a162aea267mr3012536e87.9.1773652562440; Mon, 16 Mar 2026
 02:16:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Mar 2026 05:16:00 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Mar 2026 05:16:00 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <93920f541564bc4e6aaf0f2b6df2f5aca721d452.1773150895.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773150895.git.dan.carpenter@linaro.org> <93920f541564bc4e6aaf0f2b6df2f5aca721d452.1773150895.git.dan.carpenter@linaro.org>
Date: Mon, 16 Mar 2026 05:16:00 -0400
X-Gmail-Original-Message-ID: <CAMRc=MeZRB93-UGQxSHZ24kLdPgLqn1jyMwghgQ+jXOwPoP_tA@mail.gmail.com>
X-Gm-Features: AaiRm52WUgmPf91qcwN0l0Z-vV-yB3bECXEj-YGT0HnPnFzazmm-1FoVUAgvg9E
Message-ID: <CAMRc=MeZRB93-UGQxSHZ24kLdPgLqn1jyMwghgQ+jXOwPoP_tA@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] gpio: add pinctrl based generic gpio driver
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, arm-scmi@vger.kernel.org, 
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Mar 2026 20:39:24 +0100, Dan Carpenter
<dan.carpenter@linaro.org> said:
> From: AKASHI Takahiro <takahiro.akashi@linaro.org>
>
> The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
> a new SCMI gpio driver, this driver is a generic GPIO driver that uses
> standard pinctrl interfaces.
>
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

That is actually pretty neat.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
