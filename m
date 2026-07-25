Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16E318C332
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784970909; cv=none; b=eSoX28q2zHUzRhTn+hmGXsULbuHZ0dfOJ51HfigUiWa7eF+Q1bMgBBHNIcF38RJd8MrG5B298tDU7N6dtiyHf6fhxrDarfqIg1dfk6ope37BigTrEjUM7w/w9xgiJZHQLGLlBn0nCNXQTzUYcKyzjyLTnhnZXCbhdXFIuWwmS0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784970909; c=relaxed/simple;
	bh=S/LGY+YjTi/vIQcDWsZHIX6uavYolKHnWI1WPhIXs2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPMgAK3Ex9jIijqATPC+m74Wg5xNWK5WzWwa8imvvN9z6UKmH5H6aQD0AJSCP5qmf/6Qf+cJZQCLc021JLDdxYHiE+W2sweioLH+iU06PrQOArn5PF38gjuRGyY9g3IPIiZn+A1oNYlxskr1ZD01OBmGeBa/mcCjlnDK30wX9QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a10aFBj4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a10aFBj4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63C21F0155A
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784970907;
	bh=B8029mWw6fjtVVvwRbx9nUYW/Vr2qA8XHwwBIbWh63c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a10aFBj4NUY0UoNVLMkunTyB8DT51IWLM7ThAR+tK+e85ob8my52Jt9ARVSozVWQ0
	 /xiq+r9/G0/FbIhMo4x+jMmmZeZB+WkOKwUolQmdKuDvN+L3YEKI6z8oCAbRdzSt/n
	 eSmDZFRyA92WAiCjg9KB6EO4MdDjRT+fXu6r4uAG7Qs0a1MNABPsnJX54l+pwwe9jI
	 /f7aUVobLQA2CtAREuHAaZGUrkxcgZnjDQpXzHbgTNPUiroIp+qh04ukHQ7gw1wehk
	 O1HfdH0uih+U0zd65qe6CXymWDBbb3D2vGMwdvFfbvp2knmTQgqyVamUZikUbHQYvz
	 OEJqrngvMJYuw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so1436438e87.0
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 02:15:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpQpA4h/iPPQSVscnbOE4f1UIXaj36AKpiUia1rIL6YHL0ig8ngqLH2eSB9sAgTtaukf0yqyNNFz9Iq@vger.kernel.org
X-Gm-Message-State: AOJu0YzOIOkrGiUDfSWJHEnGJlL8ZH56iTTzKezbsMb4ZFNy7JFvdS6n
	dog85ckTk5NIv/vx2ZRgDqLd0pMBKQGfIWm7r2i0nD7MZppn3gx3pJnj6xmGCvhW0MzhQRch1ZZ
	Fu2rpwFENMvQyyXPscfjb1VswYaVRfl0=
X-Received: by 2002:a05:6512:6d4:b0:5b1:5d07:13bc with SMTP id
 2adb3069b0e04-5b2c1b59b35mr260489e87.61.1784970906334; Sat, 25 Jul 2026
 02:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717105847.131359-1-panchuang@vivo.com>
In-Reply-To: <20260717105847.131359-1-panchuang@vivo.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:14:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLn=aRZsP84bcygGYON1Vgm3TOqxrkDFi=OD7v0-+_2gkA@mail.gmail.com>
X-Gm-Features: AUfX_my8JwvTIIgKU3n3CvruIp2CFzDYYelhaPZUZpJEgrhPtXpEkhfkCApkmrs
Message-ID: <CAD++jLn=aRZsP84bcygGYON1Vgm3TOqxrkDFi=OD7v0-+_2gkA@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: Remove redundant error messages on IRQ
 request failure
To: Pan Chuang <panchuang@vivo.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	"moderated list:PIN CONTROLLER - AIROHA" <linux-mediatek@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 12:59=E2=80=AFPM Pan Chuang <panchuang@vivo.com> wr=
ote:

> Pan Chuang (4):
>   pinctrl: airoha: Remove redundant dev_err()
>   pinctrl: bcm: Remove redundant dev_err()
>   pinctrl: intel: Remove redundant dev_err_probe()
>   pinctrl: Remove redundant dev_err()/dev_err_probe()

Patches 1, 2 and 4 applied to the pinctrl tree. Andy already picked
up patch 3!

Yours,
Linus Walleij
