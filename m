Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B703EFFDB
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 12:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821375; cv=none; b=RjTi1o5o7y9E4EbMYYPu1YqgO6Xz4JcK4segXTAYA19bOhw/maGL3n9Z8QSyW3jTAodzEaOlAy3mIhFcwgbfhgSvch6IByZHOKVCylk4KrmL/5hhzL7Yx+kMBakUFvjVXr9sPz8UAxx9VKP3DNvyU5iZ2PXfYN65hL87reI967I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821375; c=relaxed/simple;
	bh=fPzNnAUjaXPzKEMaUAcXnvgXNPOc9WW46i0l8nwtZhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=END3FFFGshT3nPiAWURz224ZujFz6dd4k/3OqeKYTUx1ia/Oev5tozS9xNbKpBR2vdI59RWC8jVG8NZZTo462Wp6hQ7qt0/0+Rja0jz9Aolg3l5rEVwW2kPgyfZhN8W/+HH/gzlsHEM1He2KcRgK3QjcfCpzjurHX7wCcmpnoN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxWnekzV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxWnekzV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C771F00ADE
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 12:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782821374;
	bh=N7yjC32RZFO2zeCVufXjAZbsnHlmLLdCxMY1qn9+twI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HxWnekzVNrYHDVq5CRoGXxbLwYY4KtZLZOLecdyaq/k1YKa4y6Fg5/QG5m5QeVuku
	 9+RKOPqLQq1aHvAu2oMNtaTiHZZD0IwnuIAmumlHR+YsKqTF84m5970Q9QBGIcbg7O
	 6xDFmWi321X0qArYS/gMEFR0bd+rhtt2veTxQfJwIHRsef/j9teZztjsoBCjE4RvtG
	 odITAam2ud5YAntDzR5vQx95Jn4hQAQ7YTTpmBCfoXZ1SLtnT3qFMq0wxPkL6YBK8W
	 7+pIzHTZ2t64EIN4Bq9MhJzAvPjvw0UoLSQ1EFkUGg9s0vKArAaMode02EugIxGoL4
	 eGKXx49+ILBxw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39b26e2ad5eso2585521fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 05:09:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqx1nkeqko5dJU/XNriInUE0TCGTVBBLElMQc/e9sSAQuWHmQ3hn4zTe3P5W+I9+33g1OkWVU32TFM9@vger.kernel.org
X-Gm-Message-State: AOJu0YxeBp6LPLYRqJ1oIoi+QTnIEdgGKJpBorD1kYzHPVFUIQz13NEb
	5szMwEdSngAWxCyLMvu7LThifcYiKkHWbzANs88h/VO264PeFkJ1GhXF72RqUXIXU9mXHGlF6Xw
	mYFK6V6wSe4SexainMyLMATKF7T246gg=
X-Received: by 2002:a05:6512:a354:b0:5ae:b7c4:d2d2 with SMTP id
 2adb3069b0e04-5aebdb8dd04mr655348e87.12.1782821372740; Tue, 30 Jun 2026
 05:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 13:09:19 +0100
X-Gmail-Original-Message-ID: <CAD++jLmY6Ase3hPC00z_kAJe+vJBUyrEHZEAOcWqkiuFnRGCcA@mail.gmail.com>
X-Gm-Features: AVVi8CeqvdqmX1k7t5vMa_RRoP0ZutCzLez8z7gtB59RFtVfKunQWvBDYQA20dM
Message-ID: <CAD++jLmY6Ase3hPC00z_kAJe+vJBUyrEHZEAOcWqkiuFnRGCcA@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] pinctrl: airoha: split driver on shared code and
 SoC specific drivers, add supporf of en7523
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 5:37=E2=80=AFAM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> This patchset
>  * fixes more airoha pinctrl issues
>  * split combined driver on common code and several SoC specific drivers
>  * improves an7583 pinctrl support
>  * adds support of en7523 SoC

No comments for two weeks so patches applied.

Yours,
Linus Walleij
