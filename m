Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1E02D3A7C
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 07:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879020; cv=none; b=pyZWkYXFIaGegK2KfR99kjlnGbWbqtNw025bbFpOF4ZXn2vZfyikvzQn0GnPUrKClxFH6DsJ/OQFYfiJasHFCxe0IGNUm9sW7wXzCB7xTEeSAVWQEZd9gGn+IC6B8OEcQHbYjS3CGR4pCzOlZcd95MuWOIhDG7VNUrGElRU59Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879020; c=relaxed/simple;
	bh=mNgLECeF/UxWo+/wuw7UfQ1HRBUWsLGFSQRVpFtquHM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ea5S10yNbfW2rLq6SDoVgwRgnwcb7MDlTr3dRts0E93yz9zsltDZ3YIiCLVlVzW+59Br2u0GfwTfpyrJlneN113U34SenIFsfy6UWdvimL9bM4VGQfFbWR1T9ufbiVTdKF5Bq8zoEJFaHvXPkfzEA+CxskqTtaDL7e+ByiU3wKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Le3xcT8w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Le3xcT8w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0066F1F000E9
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 07:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784879019;
	bh=mNgLECeF/UxWo+/wuw7UfQ1HRBUWsLGFSQRVpFtquHM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Le3xcT8wQRVuWFQZfwYmdo+/0WonB64sNi6EupAIsy8InabARHqFSstKInmydW7NZ
	 iNciy1sGNpwL7jiQuuKczpqSFWige5HERNKR6+e2OqIHR/UzvCSeLr37ZprJOJNV5T
	 s2TNLlYyY3DUrn1l/jQUsDQc97OAff+9F1hVcA8LDltf7AXjdAK4NEWDZZGip+5PXR
	 eid1iwPLVStqsXxIxqKfR0qnv7THKYlDhpJkBw8vanpDeTnU0j+uIetpkd6WXTNSOs
	 ZZ0m5bnfFKikXVTWam2kEUGo2xG/9O9SaJNKxKRJXsITDKVQSBNGejmQnSqA4RPZNr
	 Lx0olPYHSlJKA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so144090e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 00:43:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YyfZiK8WFyJSaRFhJa+bA/r7B3y9AGdfziKs1Kab2K/Njj/IUqn
	yxCHZBD0iD7RLF+k9KLEvzl9pUqHzKns9i7AgR2nOLoeBx3iMiZ04AWiH9X0wSTM0nJqFb/rDaw
	pTTFXI3WEyF7gSI4O/MOdZOk9AqYnHNYlWGilNAzcxQ==
X-Received: by 2002:a05:6512:3408:b0:5b1:5a2d:55f9 with SMTP id
 2adb3069b0e04-5b2b2f66570mr1446353e87.21.1784879017769; Fri, 24 Jul 2026
 00:43:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 00:43:36 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 00:43:36 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260723-gpio-pinctrl-output-set-val-v1-1-ed4477dcd3e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723-gpio-pinctrl-output-set-val-v1-1-ed4477dcd3e1@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 00:43:36 -0700
X-Gmail-Original-Message-ID: <CAMRc=MczQePGDj4mzw2ZewPPb+T7kUqJMYu4gmrf=HboVEo2FQ@mail.gmail.com>
X-Gm-Features: AUfX_my4GzhpPfOtxrQegUeVS0-VtQ0_COW23oWZA1Vhbc6sN390vxBMqbPsgKo
Message-ID: <CAMRc=MczQePGDj4mzw2ZewPPb+T7kUqJMYu4gmrf=HboVEo2FQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-by-pinctrl: Apply initial value in direction
 output wrapper
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Jul 2026 22:20:25 +0200, Alex Tran <alex.tran@oss.qualcomm.com> said:
> After successfully configuring gpio pin as output, set the
> requested initial output value via the existing gpio set
> wrapper, so that the pin is not left at its previous level.
>
> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
> ---

Good catch, I'd like to backport it as a bug, can you add the Fixes tag?

Bart
