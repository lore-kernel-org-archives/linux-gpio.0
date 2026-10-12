Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8291046D571
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797958; cv=pass; b=nIWbg+YoHbBbZ85Yy0NZr/cdXnGqSoMJ4FJp0XfO4VO4RARMk9Qxe3nvhJKgarxAlj6NrWTyCGQkH2hK2169h3vOHv6F3QhDRr+HVHPG8com+6bH8QsY6LdFcQvINaGY9bhGAtnPqFxfCa5n1BSFYn/C+Y5kSrxwFruquYsN8Mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797958; c=relaxed/simple;
	bh=xctuaA4PulzCyQhRxtqWpMmwfC55/Ln+sQuojgXBfss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMl/C33kKyFCK8qhXu7f+3/K0obn+BtBjbWDrpSWN6C/LC1sTa6wlyq3uhrv13zQF4Ophyf5nabGC41maNPbxyxdWo7O6HraPwMLAol0g1RZNUGsUv3H1SeH/rX25uJrg2m0VBSsLVw3SrLj7bTYoosRxoc3VGguc6P9mG692Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pz18freL; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pz18freL"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a9787a14ecso12108391fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 02:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797955; cv=none;
        d=google.com; s=arc-20260327;
        b=c+LANnmSSTt5xEDByTR4aXsmNPogKr72EFACgkb7qVfV7L0rDhlPWiUY+pYPMyYYHj
         UtIptaQEfZsMc28NnykyC7nUc3y94pnmr4RW8zPQTHmqssD1mcVPbCLO00MtMMbEpuGF
         B2my6fzj56uJSsyymrmypgh8qlBEAbmcGyYlmMnP9PmkUFZq8fZPgxlKe3qrClfyXCvE
         YHnEJ/uCRecwPt+sY/UB1oRvvOAVbeyEspzKFM+M1inb2BlnWejHvfobBIYNWO8aYIj4
         wDvCAa6jZrPdLNSVD1RipZ1YCVckrDnZNMye1MLTQUR8e8X0i0PY2t0p6v3c2crtEZM3
         mczg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xctuaA4PulzCyQhRxtqWpMmwfC55/Ln+sQuojgXBfss=;
        fh=vWwYGRoTG9XmBkfDXNfaxj1UbDzM8T4kAU/SRIPEt7A=;
        b=UvvtIt/4rf4MI5CZD0W0XGr+gL3+8yGLGkXYVxm2WCHHnYHq4wqz1EZ2s4HjqcnTcn
         mb3zVJKGOlB3yJsndtkx4crR7h1Ps2eYSMhyLDkLE5n/Ni0iJPeXQ0CuwUSvpbE7mYRb
         SetB6mcWpF3uNzS/jl/3EVk2dx9paI7YCL+S7lyVHOl85GdOCpn13YJ5ZQSeCkfn1yNq
         LTgJUTkFj9dW4Sw/9NC8enxZaLVhw9X9fgX07MFlWMyh3uIv9JgdgcSXYgDdoAGxDfcM
         ZcPzM6ch5M0E2PvGAOkM909Ruth62xd+PrM0E++A+WS+49W0O35rJZ0V2+MUOMWxRFZg
         N2tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797955; x=1792402755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xctuaA4PulzCyQhRxtqWpMmwfC55/Ln+sQuojgXBfss=;
        b=pz18freL+kSPEzmf4DQj1W3Y2DUqnU2mXJF+ojEA+1HCSk8vFtxTgLn02thzBCiQxF
         e5I6RHea6UEr04K8HhGMQkIGvMpE7OH12vB00uAJomRSNkQN2EJbFNq5R4rF6dDf/TrF
         HMqDCVQabtzqtJgFpEVczwWXW9HRQTq0cgwTilBcWLP0zKeteI/2WOelojZM0DCeD1ml
         zkWeaGYuqsZW+3e7alAY2v+HrJ9rR1TL/e9ZE9SfZ3IlnL71Q5D6sgh1+sMIzUgLFrtY
         insx+OCYATs9SekXgqgi2Dle2HAE2Cy8HNGtJgQUmRAPOLTC8iIuBw5cArUTofHNyuh0
         RDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797955; x=1792402755;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xctuaA4PulzCyQhRxtqWpMmwfC55/Ln+sQuojgXBfss=;
        b=1wjGjyB56/FpzFjuNhdJl2ujk0MN8sdAZaeJxSgtZvKKk5Zx3d+6TXG/g5sBNIjHP3
         c69dFQK5ymNUjVuAe3LOP5tVi5D1XDQjAmn1NnnHZ01At57hxXyz2gTHTKyTeB3kRbl0
         dYqthBtbyF82uk6CZCAVI5SFZSML4OmneqhW8PdXEcGRS2eegU8NFVb3YdU+dS+mPvfD
         K8l0A6ZpQ/mgG6VD9detJyFlWg3e3sC+2ZhIxd0FKXarMetxt8K4sCoD6z39wUB/mqWL
         EipoimTCsbJK9qFl4m2HCTwyPAGID7fGPMkCDpEVwZ33oVb0eEjvuQwkE2hn0GD7kCw3
         ITnA==
X-Forwarded-Encrypted: i=1; AKwUvBw8PxWH+vX3NbiaV2cZ3mSXDp8F0KUs19fOrbOcNRQPqBMOLtTlEdlWUrgoyRnUBf0TdQvuY7rkMlFm@vger.kernel.org
X-Gm-Message-State: AFq9FYIRjFZZyD8xESCGLzOs1yAIGklBs9h906hpjVYWFEMxh/YY/sFM
	I33ONlUQDdC5bBkUrBOiNP2SUr9cvIrMF1D5hACHWSe2OD6FUZaKm/NRNofisIcwIFDdUuoywLz
	qPD5tEFKEvjaqXDtyKvAe2sFYuzgxl4Q=
X-Gm-Gg: AYBFou2mnZLZkpcv/JDPaEdQsMKnxp68S4F2RzvKmLjuKpQcZMM849gSDjPgDdaf1Q6
	pnHxPSMybivJwppxfd/AJiYZF3wZNJyuhU3ujRatz81diEilWtMVyLHFnM76oTnJ9F0lLmiuXjB
	v9TS+fq+q439Pj0hukaiIpWSw+tR8tjyW5iLDXWHpV0+YhjHvqd0FXAqAnEW/RaMxVWhVBgUuKi
	WkQuPvRXn6iPUJYNtorqA8t2Nq8afiswL3fj6SfaZcqdEjT0XdJpVKCe5xIFXnrp7v6opnaY0Lf
	pmHyA0Agpo8Hvby28AyzRLtbG5UUpUvZD1H/oOxfKmr7yDamuDLaxCpGeBHZapTlKjPLEP8z5aI
	QvZ/o8jEzBZXUakGtsPidP6QvRlVPZ14kx+QYzK6wQTERGqAC8EjdMRFLIB1haod/6p91nvupnx
	Ym6FxMCusK3V+PSdrlrcbPvQZ03SPshsGxHPV6HChr
X-Received: by 2002:a2e:a58b:0:b0:3a3:7681:6d5b with SMTP id
 38308e7fff4ca-3a9c53852a5mr24148381fa.19.1791797955285; Mon, 12 Oct 2026
 02:39:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-9-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-9-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:38:37 +0300
X-Gm-Features: AclHuK-Z5wvwMJRFMQw1kYvrinOCHaZjgXVZjShRyJvcSKeeEwPjXo7VOTJgmQg
Message-ID: <CAHp75VcktnQVpqLADs5AccUj6U7KLjAatPaSzMX8SXDrbbs6Ng@mail.gmail.com>
Subject: Re: [PATCH v6 09/13] gpio: mxc: use cleanup guard for
 pm_runtime_get_noresume() balance
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> pm_runtime_get_noresume() in probe must be balanced by
> pm_runtime_put_noidle() on error paths, or pm_runtime_put_autosuspend()
> on success. devm_pm_runtime_get_noresume() cannot be used here because
> its devres action (pm_runtime_put_noidle()) would fire on unbind in
> addition to the success-path pm_runtime_put_autosuspend(), causing a
> usage counter underflow.
>
> Use a __free guard to automatically call pm_runtime_put_noidle() on
> error paths, and disarm it with no_free_ptr() before the success-path
> pm_runtime_put_autosuspend().

...

> +DEFINE_FREE(pm_runtime_put_noidle, struct device *, if (_T) pm_runtime_p=
ut_noidle(_T))

Please, split this to a separate patch and move it directly to pm_runtime.h=
.

--=20
With Best Regards,
Andy Shevchenko
