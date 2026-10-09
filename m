Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432243C37A5;
	Fri,  9 Oct 2026 06:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526039; cv=none; b=bCdvQ7VoAw1curN4iytsCjCJRmFQ7g3R8n9Rw6P4EY2iRXbSew8+ncjoxQpSyJLQNgnjEmuMTkAO7IXcotHZxJjFA44PDtOcsK+4tN853q0V+GALJudnVZDg/ZvknVHFrFZC6+elHeo3HDcxA4eBHcm1hm29GLBSmlxL+tGpAZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526039; c=relaxed/simple;
	bh=AfGdrVcInVn8OltiEeeb0wrAiP3D9f+zHtc/1flGMo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdyIg7v0dbk+9ETFTlsR+Di49HmkdOa7E/ndSM2kmkNIS1oMo860eE3s+G5Iw/dDtESHJ5Mr0g/uzEGSlqMwVl4AHBGZvdMzWlhpeAc86T6m1lCfrYKjAxUs0nFlJA2SPjCRx09Etg4piP7jrXmqrOAGENP2bpwdA56X2oZzVS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9SbowvT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9SbowvT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8301F000FF;
	Fri,  9 Oct 2026 06:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526038;
	bh=fVXd/ryyuCGlTuF396ZRb1pRlSClO/M0fMZ8Y7T938k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b9SbowvTMqHwiFhxy5Wv+LhzKa5F12EZmSUMwK9OHAcw30fiQtg6srC27Q82MZNuf
	 IkgSlPXftutJqOSsq8u5FaCrDRdmzoDWO2B28CjDlNfEYyc5Fq9aT7hOMIRwU7gF1C
	 EDBqFmXQLGuOjBIB1AusmS5MgVKqvHsAXuSFH5lXCNxOCFXop9v4JeN69Gt6TkIbnl
	 0ODdiFH78QXWLAYepLjLJVm6T1VdZMI6y8EdAKRLJtfqiivT2vtlyF7sHQ/1bYw8CP
	 3JMY0KEu2K/5UTWWYDdqNq+BKEnuF7DeXUEYm4CxehPqx2wzfSlZUlI6Im6odQPbwm
	 VngqIrET/phxg==
Date: Fri, 9 Oct 2026 08:07:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: pxa: propagate pxa_gpio_probe_dt() error code
Message-ID: <20261009-arboreal-hare-of-fury-a74e03@quoll>
References: <20261009050604.3128124-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009050604.3128124-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 13:06:04 +0800, Haotian Zhang wrote:
> pxa_gpio_probe_dt() returns the negative errno produced by
> devm_irq_alloc_descs(), which may be -ENOMEM, -EINVAL or -EEXIST. The
> caller in pxa_gpio_probe() overwrites that value with a fixed -EINVAL, so
> the actual reason for the failure is lost.
> 
> Return irq_base so that the original error code is propagated.
> 
> Fixes: 384ca3c6a28d ("gpio: pxa: change the interrupt management")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/gpio/gpio-pxa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof




