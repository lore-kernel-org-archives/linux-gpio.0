Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564973;
	b=RJ0Zkw05XYtquBOK0LaHZNXQfzdwaRc5+E6i1YesNyS3zpFYQjELYG79XZ6XMKcEdfWL
	 I0+QutM9G5TrVu4jsUuIIRaGEK4kr01M7JYbBOhyoYNw1q+J2n3BpxmL5Mro9RXHW/yqQ
	 LIftY6iWpuxxAZEE7jl3O8QROSHPwnLOO76XlWe5g2Wh8TqeO2QnktAmPEBr127L2c511
	 eOZBJU/YQSOwZW2qw2qfnJ+04a5yN/1ziu1988JGd+YhcU9mf0tCOwvg9a3dSwKqbFuHh
	 7k0Yb9ZWf47THgXuazquQGudZYeq4wOeCwoybD9mVNHkdemCVEsEDM/EgP3u6iCiTug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564973;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=KZ74UW0TYHmPuEppZWYj1rqUKpEM+BQypI3pzsCGhK4=;
	b=SOY19B0LWN2zP7xKAiDVvUZuig+eFIOqoyYzb10/WuujMAq8Jb5nYGbKvQID0kzQT/W9
	 3n3mEBLUSINa4x9K1sZRNQ0aYyqSrQU7/gwaPCuH5A3JhKXqTEJMmr1xv4FEnVGIN3jUb
	 9y0XNR6HidVKYY1nZDgg2CI0TH3/f9T8CHJB8Y/9BECUKFnS4efAdmGQiezHWJpHZjmEt
	 IO9Q7qCOFCHC2z2foCpvalwTijLvUBT5rrLAtHTMa2ZYvxT76jcPOY2A3vBpoQ5GRzaSL
	 XmueFXpwqq1bMMO85yKPy+bJxlOYGRq8Fq17qSzK8ndsAJhmrwgwKvDlzbXILsdY8ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BEGSWt5P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376F7606A339
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BEGSWt5P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4281F000C9
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564972;
	bh=KZ74UW0TYHmPuEppZWYj1rqUKpEM+BQypI3pzsCGhK4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BEGSWt5PyoYcoZmBiIeq0CohHcsrFxELU+qdTbmL74Ij9U6IK5oGbyQQ422CpXCqM
	 VIHgV8e0jJqEbibLIypOeJiNatRsdrd551N13qRMc8pJAft4U30ARBSYVdhFsaFYdk
	 S7Dsd2GfRO5tHPvcEkLnGRM+saM6utpot+xeBxXg010G2IOrVqPziCd51gdUBWf0jH
	 SbZAW8bJvsDj8SOKpn8h5YRCaXerVjMZStXQ7UBhVaKPw1yvJdkXzSlxj1SAJ2h9zw
	 fq5c4jzYVz0PTdMD+tpsvR6QFNQWk1wJnzCNB86VKNJaLqwoJTv0MUCcnSApJXRlRv
	 IAYUDTQaP6Twg==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-49429181ce9so985385fac.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 02:16:12 -0800 (PST)
X-Gm-Message-State: APuU4Z8V8+j69MpTRp9ptHok4+yKXGj+oglYclC1urT9wginilKQXQcP
	tJMc21o5bdWv8QpPTSzNr12VyOLEpbouJEiyiiFRZSh9mN1jb5c0GFXWKp4PCRifT8bVt+gMTP9
	JWxzUGsmia423Rr3/cUNFGYwdqxH9oj0=
X-Received: by 2002:a05:6871:824:b0:48f:e157:eb25 with SMTP id
 586e51a60fabf-4afdf7391e8mr2102560fac.44.1794564971946; Fri, 13 Nov 2026
 02:16:11 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104140820.65243-1-asv@kernel.org>
In-Reply-To: <20261104140820.65243-1-asv@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:15:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLn=T5YPDG--pPsdbV4tGxjNFH16ZaceN-Lw7B=TSJqhMw@mail.gmail.com>
X-Gm-Features: AclHuK_xp4juiDSf6WxJ1r0I6C2KBl-UfweFaPL-sasy9mlFdKqm6R0MIJqytLM
Message-ID: <CAD++jLn=T5YPDG--pPsdbV4tGxjNFH16ZaceN-Lw7B=TSJqhMw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: pinctrl-single: Add Alexander Sverdlin
To: Alexander Sverdlin <asv@kernel.org>
Cc: linux-gpio@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>, 
	Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:08=E2=80=AFPM Alexander Sverdlin <asv@kernel.org> =
wrote:

> Add myself as a co-maintainer of pinctrl-single driver.
>
> Link: https://lore.kernel.org/all/CAD++jLn8yxh3LmUzbb2vZfJFJB=3D_mCZ+VeQh=
nZktfmuMiv5uEg@mail.gmail.com/
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Alexander Sverdlin <asv@kernel.org>

Patch applied!

Yours,
Linus Walleij
