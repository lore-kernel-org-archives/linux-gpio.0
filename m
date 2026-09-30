Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882B44F85D0
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 13:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774535; cv=none; b=cIlubTmcXCS9XPKs5FJWvW4LYGRlopz81S1xveH9a/ApzdQj68spLjETLhU4QaIjmbs09Fz22kWFKB8Xij+5uQwpGx6iYDKxCH/UIuzNT14XL66/dUBJld9V4oNAm5Q2R+NkNCMtEDScrPzUYzWDvTDJj5ENbO0Dqd//wh4KCMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774535; c=relaxed/simple;
	bh=wZJmLfEfCXYjoCzTqdd4D4IU51K1LeQ0vlEIkGanjNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YpsHkHp4nb6aSTWhdfQDrrS7CWyWjgXahdRxdmfgrkMG439wsTSBTFJtPUxBiGStUDb6u21jLTnkRVxhAIbjZz2LH+XjodD2dSjvD7ApXfdQ0WCzO+cAsJvly97MY1iaMh4oxpNE2vmnskR8BEZRFBrqTnxk6L3zT33BSUXPxKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ID78kKzR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ID78kKzR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5119C1F00893
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 13:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774510;
	bh=wZJmLfEfCXYjoCzTqdd4D4IU51K1LeQ0vlEIkGanjNg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ID78kKzRdVuD0vOY0tb9F6hE5AypyIV35VXl/0TB81aW0KHwIN5+n6sU+GTCqQo22
	 zevVzKiTAGXxkdcZw20zUWzWjtqLRox6z2840aLqZUoaSzH8+vJJ2ysDYvvmCn6JBy
	 3+wpaJAa+8FTC6nuJsYtylLcqW2drm8hpoq4e/V3zbdfyQnfw4A6woBxpcUz9btCfZ
	 MbSn9Ny9SeR6GSEh4orWEwKXooBbUCTwbGuUr7O3nlu7y9Is1tfmeiKtkBfY/ldlNR
	 TqoyyV4EVgBe6EQPT8zP8LvUX2ArIjyPlchgk90p6WBk17c5Gs4NEb7L4rJcv9SVox
	 pxYV7GOmr67og==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5da7416f9so45374571fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 06:21:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzdS63U6C7GEsNEdwkXEJXgwrjnV2oToeUE1JLovCyEKKOVZgtxtl9ougLOF9BMi3wYwwUmVJBXu7Yn@vger.kernel.org
X-Gm-Message-State: AFq9FYILeFJcS1sOs/irpbUBvN1xHywfIfS8PEkXbel9Tbn8U6qp0ktL
	U5MEUE/iso6iPfHdiXwF543UMph68vDpIEv6hjvDUPrcYPHYcQItQknCew+NeiZ6sH/agj4L3Y+
	qvtSFs7Ti94XekVfz2JFq7S1N8JKNLoI=
X-Received: by 2002:a2e:a550:0:b0:3a5:b6af:2973 with SMTP id
 38308e7fff4ca-3a779170e26mr4566541fa.5.1790774509117; Wed, 30 Sep 2026
 06:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917211446.i.153-kees@kernel.org>
In-Reply-To: <20260917211446.i.153-kees@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:21:37 +0200
X-Gmail-Original-Message-ID: <CAD++jL=TbxyEiZUhPYtqiXBJTekvE7g8uSqwLbuALj7Y1iso4A@mail.gmail.com>
X-Gm-Features: AclHuK9we1Pkw_SnEX45VNI9ZkjWr3vMHJERGZiaBSgi6q9Y8UmCTh3tVaYbMI8
Message-ID: <CAD++jL=TbxyEiZUhPYtqiXBJTekvE7g8uSqwLbuALj7Y1iso4A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Remove const from group_names allocation type
To: Kees Cook <kees@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Kees Cook <kees+treewide@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 11:14=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:

> From: Kees Cook <kees+treewide@kernel.org>
>
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
>
> The assigned type is "const char **", but the converted allocation type
> would be "const char * const *", as the size was taken from
> "*func->groups", whose type "const char * const" is const qualified. As
> there is no general way to remove const qualifiers, take the size from
> the assignment target instead. No change in allocation size results.
>
> Build tested ARCH=3Dx86_64 allmodconfig with GCC 16.2.0:
> drivers/pinctrl/freescale/pinctrl-imx.o
>
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Patch applied!

Yours,
Linus Walleij
