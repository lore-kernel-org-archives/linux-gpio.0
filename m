Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88703F410B
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 12:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526790; cv=none; b=RQZreFT/b8WKXyIazLFmLjOLejcOq4k0ivU9wlbyltY3ux9SDUv0adx+d9qc8+NMmmiLZlwZLpK1yUItnmZimog3mOGvw+9Q9PYAdwBcIslpMQXjOQcm1KlQ6Og2DiCr4DTPY41kvu9uB2NjrUqG8P7iRTypZfa7NL6026gtZyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526790; c=relaxed/simple;
	bh=JkzLGFYF5wthZZS+ia3UdT2LVznklUVYah/o2Gc1PjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oj99XFsrajk0TCJv9k3PnXsDgJKyz9ulMZGWR54eDaV5dLcNEZTj0O/vhJBPu8mq4XGCix45Hz0fvISHApJ9hR8GLSz9tKOwA1DK5026b6iWfo59v+jJbO2nHuECeNgxsd+XQKOG7aN29zfQfUWPBzG2ls72SvyHJ31Xwn+yYM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqlkVlPB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqlkVlPB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A921F00A3F
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 12:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781526786;
	bh=CvRCEfFbYKVX9NjE8/CKLBfPcnBzf+v+nPciyYIQM9E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lqlkVlPBeLLvHC+XxEANSntqLg+pgOA0DIljDhF3BYxNms036yjm5FLhX5i50rb8/
	 1V9hIuM0mJuYtrj+KIGLo7oj8pPOV588O8ykFuo5Tba8FkW+IjVO0Brma7ln3OPz4W
	 nZC/7DYOaSDFkYVZgPtQZH1VTVDkKUJVhLJ+dbxjGMj/WDRuYA+oFl+I8MxFI50XFi
	 6kziCGIX5U/8ij4GJpgMZQ/+ZHMYy3k0FDKk3sdqJqMTk/+QuZ3XH9hDHumB6EWh10
	 KxJYpHG+ZK+31cspueEpBoZpYDHk6fsYH3FA2QiyyBxK3+GmS3KFnHO2L/6oW0ZL5i
	 aYJHOYTAixhPw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa6c66e6c5so2117076e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:33:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ94wKbHr/GB0Yem0B3lUIgvOa8qHZJ6Fziwu650agzRKv+tsKOQISPZSPawbwr9u6dagR0vPRov6rqm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46fXJd+S0BYX0P1O1wpGogBMlWn3PSrlyFaQmJvsLEysjbwG7
	Mwtbnu0GH3Mezt7mE4ZnwHIPrdl/lktl11dMFS/SPcmLjgHHNPGjJOcF7pZq7uZRtEbha6X5T9k
	a7eQW5v5YlrYqvGPPJ49oOO7MWTT0aDI=
X-Received: by 2002:ac2:4247:0:b0:5aa:7770:8fc2 with SMTP id
 2adb3069b0e04-5ad2db5c41emr2856886e87.32.1781526784894; Mon, 15 Jun 2026
 05:33:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
In-Reply-To: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 15 Jun 2026 14:32:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLmFKz19CRp-E=JcUnNkxNzKtSow6T8_9jDpR-wTrs9Ptw@mail.gmail.com>
X-Gm-Features: AVVi8CdfAW9s5sgRANpPXt8QrdknCspcSqJgRQz8kxnesuf5cZFXyiy1GzbrKNY
Message-ID: <CAD++jLmFKz19CRp-E=JcUnNkxNzKtSow6T8_9jDpR-wTrs9Ptw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] upboard pinctrl support for device id INTC1055
To: GaryWang <is0124@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Thomas Richard <thomas.richard@bootlin.com>, Daniele Cleri <danielecleri@aaeon.eu>, 
	JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 12:13=E2=80=AFPM GaryWang <is0124@gmail.com> wrote:

> Add missing groups and functions in Tigerlake's pinctrl driver for INTC10=
55.
> Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12", "UP=
 7000" boards.
>
> The pinctrl-upboard is provide additional driving power & pin mux functio=
n
>  through native SOC pins -> FPGA/CPLD -> hat  pins for flexable board lev=
el
>  applications. it's probe from ACPI device id AANT0F01 & AANT0F04.
>
> Signed-off-by: GaryWang <is0124@gmail.com>

LGTM
Acked-by: Linus Walleij <linusw@kernel.org>

Since these touch Tigerlake, I expect Andy to queue and send me
the patches from his tree.

Yours,
Linus Walleij
