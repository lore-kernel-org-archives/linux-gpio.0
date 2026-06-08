Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A953A874B
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 08:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906608; cv=none; b=IttmX9y62Dmfmor76BGkmcQ7rPzU2XAqMnJ+P+6C1nuBAeDkTkg7PEQC/U3coO/krQZ7lwVGr/g+t23G+CfcOj005Q1QHnsEH/XL+hev01dTBG2esr5laQI3EVeRKO5ojg8tYyn41XDYSr1FAAfKG5SGONDbmCrkasWduKi4uVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906608; c=relaxed/simple;
	bh=E05iHIbrevOWCYE7OJG8GXkZLu9ViZ4PELOG+JHp3Us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u6j4vzLGwuyrbM25VvUebx0AV8tySvvM986jEJ4TmfUeqAaLb6akcYaCr4dwdqNRX3TpTq+j0Wlj+yhuxlIcDuiwDttFwxxwyI9ph57yxAe2O/dwW3PWWgYIWNjK3XoLq8oXSFOvGMNT7S50CqmXn7/eSUavJ7ZCZuHqlzImS7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6MJHNNP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6MJHNNP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE541F00899
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780906606;
	bh=E05iHIbrevOWCYE7OJG8GXkZLu9ViZ4PELOG+JHp3Us=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n6MJHNNPw/rdEQ9+/wX3e7sYwrJeF4CxEinDh2sL+Z4GuijMSbsR5Dza3YJU0oBXh
	 g2v/CHsHAp5LylgxEo6lI8SvRIbgPrJwZwTBCc4y7XL3sldmyIVN2ztGxeJgLk+GAO
	 qf/IoQ27vT25AeCxtGYu7WdYJyS/rlRuBDSaWMcf3hAwFuoxL+NkdjyNOUN00/+LYZ
	 WDFqmhOauGndRB0BYQvHkl9SjqGT9dYC7dUcD9QkWThF6FRKiDGbqjG/IxCjWtRLPV
	 uhg7QHxXf26JNhq9GK5ka3afHwFMHqCw1EzWeTSZVKsKzNWSvtxYsmOq9oM1CTzO5S
	 KZt47uQfgbIng==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa68e66128so4057775e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 01:16:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+LPxsFLZeOYEWkWnHUi3ejded2S08qpz39ek4T/xWUQ/FNwb2bmbzH0zUCxyG6/whl+VpdeG2SkCFv@vger.kernel.org
X-Gm-Message-State: AOJu0YwUuH/B8J4wchLjMd5SIzgY8P5jMxuJew2OYfXHviPdvetFEPQt
	qtAs1sYCR13QDKbRvaPoP4hh+rroCCoROD2Emui6Qy4r6NQccSz1mzQEhjzM5w9O9NU+uWaJb2I
	7yWIM1tyWZof3Zd7uN0nH252gJNWovVI=
X-Received: by 2002:a05:6512:4158:20b0:5aa:6f89:9378 with SMTP id
 2adb3069b0e04-5aa87be9785mr2712017e87.33.1780906604512; Mon, 08 Jun 2026
 01:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605071233.28873-1-ansuelsmth@gmail.com>
In-Reply-To: <20260605071233.28873-1-ansuelsmth@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 10:16:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLnSLnbt=haP75uu5R8uQCk2nWM4vT7=tH2ZZf5MyG45nQ@mail.gmail.com>
X-Gm-Features: AVVi8CdivXSw4jUoM7pdXrQFsczZzpyDzmpPsLaovwgdJGugxO38xZTv12y0Owk
Message-ID: <CAD++jLnSLnbt=haP75uu5R8uQCk2nWM4vT7=tH2ZZf5MyG45nQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Move Airoha driver to dedicated directory
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 9:13=E2=80=AFAM Christian Marangi <ansuelsmth@gmail.=
com> wrote:

> In preparation for additional SoC support, move the Airoha pinctrl driver
> for AN7581 SoC to a dedicated directory.
>
> This is to tidy things up and keep code organized without polluting the
> Mediatek driver directory.
>
> The driver doesn't depend on any generic or common code from the Mediatek
> codebase so it can be safely moved without any modification.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Patch applied because it's a good idea.

Yours,
Linus Walleij
