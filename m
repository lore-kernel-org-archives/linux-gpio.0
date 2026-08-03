Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A43D2EA468
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743507; cv=none; b=Ahc8c3zR3Rojt+xbBM85wMzcvBF9Ud+p4u11nuTeGXFAUHGsM/ZTle343AOcjRjnxpq3ghUrEZrJjYKJjPV53OXL5nwsX9SNy4KHNIcG9HXVLkQPZL1GQ6NN+0QuLBp4IfNAWnmolnPCTaooEgWAwDNcn5hXw3YxSI20IMcjKnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743507; c=relaxed/simple;
	bh=vto1g2TALJl8GBwSM8GjG6M1LvUIFyEG8ooVAm/9OBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kBWw2iZBBggdP75jBvJXTEODGMRXkSLciswJUdYRq6PFwtGd5bkdiGN4aVj/zWjDdfuYSquZgtIdb9hUmCiA+O9hocEinoU0jjSnhmtpo4BJDlKci4KoEE2fxAX/UHTQ0bPvro8LAyngJgHDQK9LW5R4hOypN19DyKUISmFY/sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtO/lQ65; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtO/lQ65"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E831F00A3A
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 07:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785743503;
	bh=vto1g2TALJl8GBwSM8GjG6M1LvUIFyEG8ooVAm/9OBA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XtO/lQ65ImzXpVeKW1dW8uAdB3qN66o/1yC/1rT9McmXbdjmEtuoMAEHZMh4AF1SM
	 ngRfCZPagCifgjJccdANsbuLpUQ2+XSzFi9tFC46Hl8WHsaoAO+SXdgtcAJfFscxJU
	 ntYabIVtRjaCtI9H88FmuKQn7LKsiyKCiQWjzbKBr9LGtd6y14NlkGzwJukahH6EbN
	 81cWxz6bB6aBG0QrX0o2wgGapeGbjuX1ihGNhXAKcwyWszlNVBjQOniea42rP8/dTM
	 PETkGOCjW/hM+g0f85UTyVHPdIRQI3suuPJuKLoql+I8cvcj636UfY1tah6F5LwLSo
	 gJS1/wVilJTFw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c94fccf3eso24199461fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 00:51:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YxqjNau+87zD+ekVXRsZIvgkQCqQOzSKih/xDvRu2F/a0VmWy3y
	2syK8lnKc21w/qu37BjQjgh/UA4AH3A2tyvm8Dk0NdL9iS9eJYMOBW3sOn70LFq0G035oMPRrXN
	fj2NJtd9yfRZgX/uveYWuIag4zwYBZvM=
X-Received: by 2002:ac2:5548:0:b0:5b0:1108:c583 with SMTP id
 2adb3069b0e04-5b2e4f6e8ebmr1217443e87.30.1785743502519; Mon, 03 Aug 2026
 00:51:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729211001.719606-1-rosenp@gmail.com>
In-Reply-To: <20260729211001.719606-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 3 Aug 2026 09:51:30 +0200
X-Gmail-Original-Message-ID: <CAD++jL=DU0Oc3hZggSxOTUrd8jc4J53gPnFgfTys+TbXmBEk4g@mail.gmail.com>
X-Gm-Features: AUfX_myNsHa14CqDEp9BPZb739gJojgG1HWhEvUKdNgGLGMd8DdO8nU9VpUTcKI
Message-ID: <CAD++jL=DU0Oc3hZggSxOTUrd8jc4J53gPnFgfTys+TbXmBEk4g@mail.gmail.com>
Subject: Re: [PATCH] gpio: allow COMPILE_TEST for IOPORT drivers
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 11:10=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:

> These drivers are gated by X86 but they compile on non-x86 just fine.
> Add COMPILE_TEST to the menu so that these drivers can use it if they
> want.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Looks right to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
