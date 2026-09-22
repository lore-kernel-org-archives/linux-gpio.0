Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5485F47ECEE
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 07:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061817; cv=none; b=CHa3mmu6t9x1rT/7wGuO+BKzHsre+WzUoQih9N4gwZtsUGqLGkiQ6AMB7MKm63fKSrDOoN9Xz2ddUPBMTyDI/weG2wvHFp0Fsrnns/p8fk0mwYSz8iDjbMcmf30o2t6egg3EyeYNLRmPytBAlgSHj8jamQirCtGBvKrwkzMLrns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061817; c=relaxed/simple;
	bh=JNI2RG1atsZurFMJdOXWnbYTlb5ko4psBeGMfQ+vVKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RxKz7GyXmkQBkpkb+UR2/RG0U/WfwwyAiuz/d4jsl6QLfBIWqYrHVRtnQfzTCtGO/0U+IIa2yM+iRMYmKJYm/GT+M3UzCiNMpU1B69B4DVaRvPGsFN4Q9CSbvWoQ1H1IRfDEMgS425vRYUyKwuBlGt9eqOG7EsnQlAaVIzlq0IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgsZ+1AE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgsZ+1AE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DEC1F00893
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 07:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061815;
	bh=JNI2RG1atsZurFMJdOXWnbYTlb5ko4psBeGMfQ+vVKE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GgsZ+1AEMjRJwSfkiR0nxogFHIfZxkwVrO6h+drKPrhm52Inw7a/2BUu9hGz72soF
	 6Yjmf68SPWjSLpK3g2CYAxzVnBYu2TbgAHfCFgS8T7uAw8HF5CQKPqDcVrOO+9MqBE
	 3kWbF0nnx9/hU7ZHYxl6x42Q7+83ZLjgv16sA5YRKERb82rAptvmVE0mmJMM+t/on5
	 5dwmwRMgdgjBxrKnFxDy4UQQS4qOFaIqRn7b7OXDRfAkgZEjJqtsbM6r5pBWfBQDeq
	 5EROBxXv/jCPsX8BkBspfjATYttY43Bzk/hQTGfVsTFNkZZcR2lBDlFSBawKTqurzm
	 pQcHkMLsbxhHw==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a59fa3112cso33699941fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 00:23:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw4So3nvwYa/q+5Nf8MQuTx3c7nanAevHXrOZ7lF1CZy2nMNXZUKTVjDeqL8IGcxajXT36VUmPapY5D@vger.kernel.org
X-Gm-Message-State: AFuF++mMu+xlbOZVPWD/zGDS/Su0SRkVVPM5MKikN32ySo4wcrm9/tL9
	wmT0wDdtmV/qlyLzNNrS4KWV4SJt2vJ4Jv/rTyiE7OqHgb1zTu7fGawJUVuQwVlSrb2hSzIdc/U
	OeVkbpLC1NQe6r2Pz3TKIGSyzk0oOsMs=
X-Received: by 2002:a05:6512:1301:b0:5b6:1a7c:59e3 with SMTP id
 2adb3069b0e04-5b8c19503fbmr4179618e87.61.1790061814621; Tue, 22 Sep 2026
 00:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-10-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-10-282ff5d98dda@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 09:23:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLm8fWyAFY=Uv-O3-9joU+HiKjMAzmd0s6Hc=QEu51wCGA@mail.gmail.com>
X-Gm-Features: AclHuK-GGgIaNnG4Ini06bdUeHp1yMKnL8W3pPhlAeCPufbAr8VMtoLalY_Q0rU
Message-ID: <CAD++jLm8fWyAFY=Uv-O3-9joU+HiKjMAzmd0s6Hc=QEu51wCGA@mail.gmail.com>
Subject: Re: [PATCH v8 10/18] gpio: pl061: convert register access to regmap
To: longzhao@ambarella.com, Wei Xu <xuwei5@hisilicon.com>, 
	Chanho Min <chanho.min@lge.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Long Zhao <zl020895@163.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 6:23=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Replace readb()/writeb() with a MMIO regmap while keeping the existing
> gpio_chip and girq irqchip. Use a raw spinlock so irq_ack() can run
> under the irq descriptor lock.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

It would be good if some critical users of the PL061 could
test this patch.

Wei, can you test this on HiSilicon?

Chanho, can you test on LGE hardware?

but it looks good!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
