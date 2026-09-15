Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D808488DAF
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 23:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514786; cv=none; b=br7x4czqRgfJ3MhhSTitSnXrAb1BXjF+JolA/HUFydK7S9XiN+dXwxL2PV1CEpTr8R/4J5qTfcxGoNf2Qdb0ZUVHXqLaOCyFIuBuGAt6tFBAzrjuGLZZYvKJZw44q1Iy2bbmUIYheWUvsmX9jZRrbBJqAmBAe9bWL1e7qZorlQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514786; c=relaxed/simple;
	bh=oQquHJoNoKqsWrvmPtbmf/I9iMh6gk8gnxctJT38N4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Szkpj8ourUxGXRPBw5laM2kSBi15M1bqQxAJapX0+19UiRd2Ya45WIUmAk+XDtukEBuI0HJ13Q0eEHvv19o7ktLmUTfOAbTIXE2Vy3hldNr2ddFGDgMwxd4hCpYnCMyTDqFUVSTBYfzrOcHrfU4LvSSceDYVox50oM1jeUg48Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWEp+HNk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWEp+HNk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D981F00899
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 23:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789514784;
	bh=oQquHJoNoKqsWrvmPtbmf/I9iMh6gk8gnxctJT38N4U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cWEp+HNkvZHNaXDmKaUbUFOvtAYOTSMg30pU7O7n2sWTngARdP3wIf9NOWmGxqvYw
	 tDySVcy5YZrKIIRH4hlWK4mR88zAWD/Fj5E4DJ1maSz/sudmRQsVATM3aNVODUVu5W
	 BSTzYbNb5/OmvPt2S+9ySheX5BaEt4pnwJU9XwaDNy5E0Lod6PvlUtnYyRlFex8xY+
	 x9Y7E27r7gCjYaLHuYfIUoe9kJRogNx9qtgmzliKG76vs18H9kDlj4XUSV0I6hHakx
	 Vyn8UqiNPLkSIEDfpkFgJoOnZyIP5+3TeWZcmwfY9FznGkY5DPk7FglaP/EfX9jnrB
	 vW9WhZRQxV4YQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so269229e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 16:26:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwSYt43MvMGFAzPgCkbZQlombU5C/JM4S4SmAMfCaiLWM7xqRemxRUQuN+L8RvVa/0wAeZ4BowXplx8@vger.kernel.org
X-Gm-Message-State: AFuF++lRajCN2sSDh6XOEhllyzeYEsr3uok8etv2/5N6micSxgIL+7R3
	o6ResmIJslfa/MQME9tN2J+AF04hn4Ioj0CVmPsxKu/BGLQy3sAlY0aSKTch8bli0mg9dNNIzw1
	fmFrbarVw7LoemeJrAqoo6P2/dZQP3GI=
X-Received: by 2002:a05:6512:3f02:b0:5ae:b7bc:27a7 with SMTP id
 2adb3069b0e04-5b8b6605ef0mr46369e87.6.1789514783426; Tue, 15 Sep 2026
 16:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-mux_fwnode-v1-1-ed5a6d8202d4@redaril.me>
In-Reply-To: <20260915-mux_fwnode-v1-1-ed5a6d8202d4@redaril.me>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 01:26:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLmRw=01aG9GdW5ZL2_4+yyNj8hDHc71DeL2My6XdchbWA@mail.gmail.com>
X-Gm-Features: AcwNN1VMNZ2d_1GWlvWiBBnv9HAPFGJR5x4MP3Eh2LJk-8kbBrARnewBTyzZ9bU
Message-ID: <CAD++jLmRw=01aG9GdW5ZL2_4+yyNj8hDHc71DeL2My6XdchbWA@mail.gmail.com>
Subject: Re: [PATCH] mux: convert to use fwnode interface
To: development@redaril.me
Cc: Peter Rosin <peda@lysator.liu.se>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, xu.yang_2@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 9:35=E2=80=AFPM Fabio Forni via B4 Relay
<devnull+development.redaril.me@kernel.org> wrote:

> From: Fabio Forni <development@redaril.me>
>
> As firmware node is a more common abstract, this will convert the whole
> thing to fwnode interface.
>
> Co-developed-by: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Fabio Forni <development@redaril.me>

Acked-by: Linus Walleij <linusw@kernel.org>

The mux maintainer can merge this once it looks fine to him.

Yours,
Linus Walleij
