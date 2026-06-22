Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559CE38F23F
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782115966; cv=none; b=YGcMFC7fibYY9eKg4c7AZZojN5BZVe7532vRqvF3TNPdkL5oJJNslQJkdvRpicx8YQCR03eOKMzJtsqBOqeyix6HQez3drAFL8oiZDndos7FwzjegVUEDJF4H/INZsrkX+Mn16GIRnpH6V1NOMDvI2eEfH+GdG/IvTYmwXHofBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782115966; c=relaxed/simple;
	bh=3A12GrI3Co4OU7M0m7wsQClWheHRWnftXvUZTQaS9xg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9Jog3SpgKgpYSD5DD7bYsibQ+xpE3EVRGMi3Cciq6g7PWWtFiVE3R43w+iie+Uyn2PGHVOfJNWAP4dFLkaznJIQSJxvmOq2DcBFMKAxN1+iDXTho0wpYQvC1d1LC3IM8VnZQ0pvLyM9FqvD7fEMbhwZ9+dYARwlyl7SycPrZAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9uY2sav; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9uY2sav"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB741F00A3A
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782115963;
	bh=3A12GrI3Co4OU7M0m7wsQClWheHRWnftXvUZTQaS9xg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=h9uY2savJDNAueWs/Ha5euqyBGXLkC9qUTzTG1aFaDUCq0HbrPPuIi8npMNR7AoXW
	 6cvZOuJv31C2CiGLWwu2bKocxEO7NMtFs2f2mDtqsYdO7yGuVArMDFjGrc/oqDlzDX
	 LsgH457EhcBWKWr5MF7htDw9BsldcVgaNA5t/q23cjtt+PTYFbl4X2imZvoFYqqBn5
	 un2GmTQFqGwh4rlCn1MuHl9yfDan5UAFD/7uRJdXIOzYfVm9ZGqlvqva72qcgUvSM7
	 ad8pAIa3jyL9iL4dprr4mzsrlmX9GGkqaK1eA19Z/ec0APvg1qJpairAIpffnVN/XO
	 09He+Avtc9Dmw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ad58584037so2457181e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 01:12:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+qKF6MRAd+5htyyp/gklWSHR5ZUqyKe/ODmiypYpuYQf8cwKdaeRJE68Cipkij96qRbZ1Cm9XTSC4s@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7X1sRb6c7bODH/jztF0rOUCLE/fO07IEmtVKqgriYRhVS2IIL
	tbz407/76ObWq8DSpWVJ8sXdRzdA/dZ71e/PLhIRD0eN1u9lTTa1W4g8l9pDzFKFCHDqcfQim5y
	kcrhGJ2/xDvZuzkOD56oz2SmydCNguSvUFAJgCHcPjA==
X-Received: by 2002:a05:6512:250c:b0:5ad:5620:ba65 with SMTP id
 2adb3069b0e04-5ad562d1b58mr4037442e87.50.1782115962540; Mon, 22 Jun 2026
 01:12:42 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jun 2026 04:12:40 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jun 2026 04:12:40 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260620120136.2482872-3-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260620120136.2482872-1-sergio.paracuellos@gmail.com> <20260620120136.2482872-3-sergio.paracuellos@gmail.com>
Date: Mon, 22 Jun 2026 04:12:40 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdW9qtq3h8kjEFkufaZPmCEidTzvOYAKEx4e59xggsfWA@mail.gmail.com>
X-Gm-Features: AVVi8Cchj8PyOKuXuEe7fLfNTezdRwn9B5jFNCWLJK1d5CldWdRuCwDDr33-iLs
Message-ID: <CAMRc=MdW9qtq3h8kjEFkufaZPmCEidTzvOYAKEx4e59xggsfWA@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpio: mt7621: more robust management of IRQ domain teardown
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linusw@kernel.org, brgl@kernel.org, vicencb@gmail.com, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 20 Jun 2026 14:01:34 +0200, Sergio Paracuellos
<sergio.paracuellos@gmail.com> said:
> The driver uses devm_gpiochip_add_data() to register the GPIO chips which
> means the devres subsystem will unregister them only after the function
> 'mt7621_gpio_remove()' returns. During the window between domain destruction
> and devres unregistering the GPIO chips, the chips are still fully active.
> If a consumer or userspace invokes gpiod_to_irq() during this window,
> 'mt7621_gpio_to_irq()' can dereference the already-freed irq domain pointer.
> Thus, manage the IRQ domain teardown using 'devm_add_action_or_reset()' to
> guarantee it is destroyed strictly after the GPIO chips are removed.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Same comment as patch 1/4. And the following patches if applicable.

Bart
