Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBA842B75A
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 08:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842071; cv=none; b=gdwNo0THsZv7+pXJI6va6osdkcm9rm96aAN1URH4KFL+G/wynlyBJnBx8SxejAXy7zZv1oSZyLfkeSnEEKRhEBA8uqsXMO29GnN+QPWGSbUknlKy5poJR/w09RRUV0bUscyghZXu1VHJt23smpq4lKvajou8taVkXNuHQxttxNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842071; c=relaxed/simple;
	bh=Whsf0EdL6Ez55mFSbFEjlueW7+J+D+gO7NqGXLZD2kA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XA/4o+onrxVaSgAXSqBe5vg14aiM7o3t80oIG/nUQOMZsoEujGft7S96AQokGnIL/BAIotP8j0uQWUKnxkzLCvDMyS99MGDuPJ1UYrrskHHCys+vswE4L1pH6goTexAdAnUwZWJq8ZrqZ/TcIHzNcNcAEyBmPqFnGeEAYhWkvAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJRpI2gE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJRpI2gE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB001F0089D
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 08:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790842069;
	bh=Whsf0EdL6Ez55mFSbFEjlueW7+J+D+gO7NqGXLZD2kA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BJRpI2gEiSwWeWCCAgrIim0T4Sv0VjnqMJmVp57DD4uyXq3aTE3eWSPlD554Y2KbN
	 rmuC8E1VzFqzHtwiko4YJyIhMYClIwcnQe6mGEJCU3LB10bF9gJ3AV0LQKfJKVfjdp
	 fDIJStHTp2DAX9FBjOmkItm+y2Y6PHTpvBh7ZWEY1zLx/DAwsPfxibNqZxYREs8qug
	 XeDR0jaZRTvGBJ6deMOXHdcv78VFVjj+/R9sWTGBc24io0Oxmz3wqwfZB8VaGL2QTC
	 11htZX/YS0OeAwa8m2gSPwyZl8IuljwnDTNJU3Fd5vC5wjGkz5UWBgo5K+Ms23opHP
	 bOzK7REYtPvyQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3ce4795aso2062976e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 01:07:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxrLaI1OMZNasAL/h+Y1hoDAPVqOgk+Q4neBY1kKAQVv6/hF6sDfJtVW69bcxbxqCzDL27oT0/2gzEG@vger.kernel.org
X-Gm-Message-State: AFq9FYKNDW3EtKgi5QQpMeur86ZQb7h97BjHK+q3ws2sXJ+/nUFPWrEW
	AuVepDkOlrDx71XwniOMLoVc/+FEqtkTXZzz+zM1QlMnx2JwDMbMsBskj05MtNwAJnXjfUzaWrK
	4+QCezf49u3XH6GjMtp1NGagxLQOZuqY=
X-Received: by 2002:a05:6512:2527:b0:5b8:c763:67f7 with SMTP id
 2adb3069b0e04-5ba405d9cd5mr1752355e87.24.1790842068511; Thu, 01 Oct 2026
 01:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 10:07:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLnJZBqQVkh51QGWuv0SQVNoxdy4fw3xOSOdCVSpSkkXww@mail.gmail.com>
X-Gm-Features: AclHuK-0NQ14ujL6Tmqh9QRuhM6uLtSq2NayK5UcJdRP46UImYU4EzJh14NaMY0
Message-ID: <CAD++jLnJZBqQVkh51QGWuv0SQVNoxdy4fw3xOSOdCVSpSkkXww@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] MediaTek pinctrl DT binding cleanup and MT6735
 pinctrl support
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 5:46=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> These patches are part of a larger effort to support the MT6735 SoC famil=
y in
> mainline Linux. More patches (unsent or sent and pending review or revisi=
on) can
> be found here[1].

Waiting for a DT maintainer ACK on patch 3 otherwise this looks good.

Yours,
Linus Walleij
