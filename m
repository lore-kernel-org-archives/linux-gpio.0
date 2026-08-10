Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C4D7081A
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 06:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345047; cv=pass; b=SCOfsj2D707UkjA4vEQO0beFzypTBG/D+/ifQew2bn7l9w1f4DFnMM0tyyLJ49ye2GRhsK5L6FB1sKrGGpcPTNo7DirNBKST26R8yEYpQEa/hy1ptEwjXN9VwyHG/1XVvCINOSNWD41BhMVGv+MJB4tHTxGcSJdyaSMF6T+IwuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345047; c=relaxed/simple;
	bh=5t+Qqh0K4cEtDBqlpS0V52GxkhQMVT7/B+AKwKDVIG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJRtwVfuy9tYLj9H/XIG/add1X+gsgKm+rG1xsqPdt2UrJvqsyuh693rqAeKxtNkrOcCLgwKPKI+sBf0CES16xGhARlakLIBBXrW1vLZrHRnQ4q2NX8CQgrG0fuvakTHcHRZ+VlyQkScz+Ry6ysoxtCcT3VFH6z8Z2x5vxXTcWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igsPqC0L; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igsPqC0L"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c8ee87f7eso10698011fa.3
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 23:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786345044; cv=none;
        d=google.com; s=arc-20260327;
        b=Ga8v1akWkzvuaCDrJFiCkzPmSeyaciLUAU9g9LkPSR2xYdcbx4goCy34MH10qbCx3O
         bXfYxB18MIPlh7Rue97y6EW8Xq7UzQjW/fs0rykaXbu2bykZ7mAFV/TLyJhI74MpYdKl
         CCwKDbggIG6jfyCl5/Ycxuy01CQsAyhIRuCg2o5h05zqdQ0Mm2+44dFZ+PGKolUVZn6S
         hotIvrLTrfA4N7Lg/MkiI1KuCUUTHdpkhwlicl1V/j0z+4BkV5nYbjRMeqjTHaefBEDs
         sNtXQpCABOMx9p7WRRBRMVdIf98qd9zddksSHtsPkV03JPQ1KTWIpFG2u/RsHo+pHlN8
         kcyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5t+Qqh0K4cEtDBqlpS0V52GxkhQMVT7/B+AKwKDVIG8=;
        fh=6OE4+7vRXTza/AE3iz+gC0EcHcNqn1LkS+MZvBlz/wk=;
        b=W2wcot7mBI7P0Aw7Z4q97AWCQEx3NsD//ZP2ft3Aa2JRypiWIaiKDECKTXjEmdb2sl
         7uwC83Qty9spXRnMZ3JGn7L26+U/uYwSs80+t4vIqg8SiB7OWvK4KPS9O03r9UxRa+GN
         FaaOsRC9hEe4pmZohGPoxIEJgvsDtOSLe5DQC0ZuPqq77Ce2nb/ufWX9U3UUHC5wAKFa
         xV6wxrX8U7gTOQs0zVdIyQ68fgbe79sIFjDyljrI8JjCAet5tb5f33y5+ltKd9RDV8Z1
         Uxplqq+RkPYtHIycEP8B1gbCP119+CmcBW2Gj5OBvGAwMQxN0TCZT77L6/zWVuIJkVB8
         Tj1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786345044; x=1786949844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5t+Qqh0K4cEtDBqlpS0V52GxkhQMVT7/B+AKwKDVIG8=;
        b=igsPqC0LIkERnN/Atqo09vu8kdZ4lc0l4d1+UaZGU0IKK+FDstWtVEEoQeadFWplU1
         r+j8NtdBXzB1Y0k11lRM+EhGJM/NioQqm4xoqmDTjDZLzFl+wlzYDt6gaT9d5R0PTeDO
         kNVGQTYdy3i+PbBpmcBGdaHFL+AlhjAva410Qxr8aaJdBpvHnMSUXc+9FdKcCP0+6XmX
         2dM1o1Te+kz7CakX9KphyXVcjoPrQyLeLEMaZaMwwT9ZTxFM0Ih/CtQsfs+7EkJm6aJk
         LXRaAaIw6l1jeL4lQL2l+5WitJJR8sI8bOAiSVFPY8IhSB9Dtp5cwHyBC9OpEtq/u77y
         dAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345044; x=1786949844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5t+Qqh0K4cEtDBqlpS0V52GxkhQMVT7/B+AKwKDVIG8=;
        b=egh6K+4AyiOlpZPaHKG2hx3b8gedAgzrRd9gJNwPXvUD1WsDzV4lQAD64d4OrlQfC8
         fWRvvuDFP1pPvYIxlI+ipy/LJiLm5+XFHbpxFdjzuEMBwuIoGLEw1jsC5TIPWxm/E4hM
         km2EFjp/u0m36XRAB0qP7R4iqo4eVHkmfS3XxuVF1GaOOetdFSdK6tE8cnNCuGwamV1c
         m0BahCpPtlnP/ULxeG6aJUXKndU/y4gzA7z3I/TN6wgmVkvPz+YX0j219FvrjawA4xyW
         YyOr8v7krN/URaEoQVBS7SQ64+9F/c+Vx6uk+JBqtRwp0g7mG8pkmvyV6g9OF9xCN4g8
         psbg==
X-Forwarded-Encrypted: i=1; AHgh+RoyYo9csPkxnFwCF9L3o3tC5MOL8RBmnSE9VDQz8O8J0U7dVOvnT6i0xBgasbQnoimI5cSMVSKVC/9r@vger.kernel.org
X-Gm-Message-State: AOJu0YxNOElFGGuaj7Ywqatlg/Yj6LcA8eiJieF1Z7y0ufcbfHPJB2gb
	tT6Wqm8ity2kmIMltqahF/u9UAVxsffi5yj7dPKGuhqM9NPw+/h3pHUUlIa3tzU6ytZ8tmvdrRX
	UZajirwAJfSps78vvo9m90EsqhF8CoxQ=
X-Gm-Gg: AR+sD13GAnIUpBnEImEW77mkyMbMGhUid2HdwV+5Mksx6M5x7JtUWcOUIoYn+HyAlXz
	gOAMbhdrQuLozt9v5qEWe4+lkNBtqp7UBbkVHE7lliHtVleuIKM1bXfk3p8pgPH039tC8ZGh3x4
	/HXvW6cW1q5QgwCcibzsVg1BaslcbmLOrv6ZpsCXACNMJFQ9xW9q4kkMVAkPDHgeslG7NMCr5uF
	/6x6wS4Q8urlc8KJ+RdfR0+zTtTSO42//j8Lb4t4Ta/AYT2vZj1NnYRDpWYSHFs4ZiAoN5kkJmM
	Ostbm8uQMQlUCHfqqgF6aSQWnigzNi0q1s8+ATmLM8WDwJlsBREmstiyIskAsiLwEYXrL8sMgac
	QtoJtbM7kl2qIGkksoht24bEr6YXs/7xY/QekmE6bNWy8xn5Q8TtEemZDc11tU6TNgb9PjCPsQh
	/5Z+NfkiuCc2wZXWlnWKiBuroJRsByWOrgicYKdk0aKw==
X-Received: by 2002:a05:651c:19a4:b0:38e:84d3:f2c9 with SMTP id
 38308e7fff4ca-39fe5679ff2mr22729031fa.7.1786345044371; Sun, 09 Aug 2026
 23:57:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810053142.27938-1-phucduc.bui@gmail.com> <20260810053142.27938-3-phucduc.bui@gmail.com>
In-Reply-To: <20260810053142.27938-3-phucduc.bui@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Aug 2026 09:56:47 +0300
X-Gm-Features: AUfX_mxqpk2lPsLbi0ivPrR1zdGwBROKmy9jREUOUWrBbWovbOKjxDhH6APGZ-Y
Message-ID: <CAHp75VdmzguH3e7BOu++mE0_-uOhQXTG9poPE5KeopTsoOEV5Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] pinctrl: lynxpoint: Propagate errors from optional
 IRQ lookup
To: phucduc.bui@gmail.com
Cc: Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, robh@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 8:32=E2=80=AFAM <phucduc.bui@gmail.com> wrote:

> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available, while other errors should be propagate=
d.
>
> Propagate all error codes returned by platform_get_irq_optional() other
> than -ENXIO.

Same comment as per Bay Trail version.

--=20
With Best Regards,
Andy Shevchenko
