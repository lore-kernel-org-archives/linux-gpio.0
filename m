Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698988;
	b=StLJ8DYKo5TwKat9aOs38KT2r09+AAB6iISja64u9I1hs1yTsrwsdimD1PD9BySZXL1w
	 we4AKjB6kvFApCSQO1rpcO2mvHcBwfcWf0m9UXPpGV0FV1uUPM+a8ZIhQYlUvGQ/LzXWx
	 zlBERBdjsU4WGSscylnlI9g0f8RC3vuU5nwbP3mpQgZ2ngajONnWgqAARE9wwh3keqthY
	 qAAuBDsr0TSgEjb357uFBovF39DACPn046Pvw02F8ciZcgPtVSteucDKK17gl4zBNkzUC
	 Rc0VVCqbNB7am1E2S77dp7jZO9pFNiOwQOS1plk6XfqgQ7pjDb0Io7x0u7EZTv4OubQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698988;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eAIs0oUI+YPmPLZo54ZycZGgVU2dXBDMzLaTztAAp7o=;
	b=fmL1WcHgUnrQPBJQf8aEA6Svbg57InARzLPlzptD9k9mqOukjD8wf/LeHnKyc5oOPZc5
	 6bOOxMr847E24Mpxa6sixFmdr6yFMGSNuXG5moTGiacUi44UMN/LJMNoQZFYzqgDdPhJw
	 2UABONZdLXcBhr4sQx3234QO4HXwRVXzXe+PXWwzKzOq4bgYCzUa7i11e5oMY5NLZNAU8
	 48Ecdk+XxouXFbgDxxDL8uPOuIhq99hrNgKclO4aXIRbEc01qLXIhpp8lpPk38yMH8v/R
	 ACFtBZOzS2L25n/qNUhmAwGB3vP1x+oyQULLAe8griP/cb+xyHqWOaEiQGNvEUz029A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AKKE9f5t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFE3606A338
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AKKE9f5t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89B91F000D1
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 13:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698987;
	bh=eAIs0oUI+YPmPLZo54ZycZGgVU2dXBDMzLaTztAAp7o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AKKE9f5tar8k8WvuoypakZvL26D8s0k6EGpd3UqOtdzqxSDYv29gJS4bAfsh9R4W5
	 ErxpPkY7zEBlSd/GLqsPtCqn/dxtk25UEKb+9Af/B7NHye9g/MHeL4M0YHdCjIpiaw
	 eUmOkmo2W8n/1VZCKlbxUR/mjEz0zkvNGSEPcZq3l01ZDA7oMq8s4+bpv9+1cgcald
	 dsSivPuqoQlCXTt9a9VyuCPSyg7Snl6AQhNEpb2HVzOHjCbYScfm7yeUXRRSlZWEsB
	 g8wRDS+RYxz0XsB4nWLuw0LtKeOpLjfTZx6nEviLq+T8SVk2YNJgRTiSuz5MPqzinU
	 mmoJj8s3UJ8kQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso7099333e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 05:16:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErED4K9THvY19ydrq3vrFpHRGEHoNDDTKpEKbwjuhWIWeVNdsiX3nA9XpnZpIEPT3naSQvdoVVIjbu9n@vger.kernel.org
X-Gm-Message-State: APuU4Z84wu6nHJ/AGeGa7+rf/6K6F4tPc63nGXnTZ50jCmKlHMCmUco9
	VzME1IPwz0+i79Qlb4Z3+t/LRk0dJjZ91gnLH80+mpWpcMRsnBR7CCbGWvgxQhW0dN1K5uDghtJ
	8t/xX0VQ/gm+GVU+ADAk0ZeZf7HyWdkE=
X-Received: by 2002:a05:6512:3d1b:b0:5c1:ac75:6604 with SMTP id
 2adb3069b0e04-5c1bc847d12mr5899749e87.19.1795698986523; Thu, 26 Nov 2026
 05:16:26 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 14:16:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLkzm0qTMJsusBd9m+gidwaBPgBbqMEeJFE1t_0ZDMf6NA@mail.gmail.com>
X-Gm-Features: Aa3M54oPi_3zOy_RBrvdi6FjyccKcrCZDV_Tb3Dpo-BA-Pbh5aQfsxCi44RP1zY
Message-ID: <CAD++jLkzm0qTMJsusBd9m+gidwaBPgBbqMEeJFE1t_0ZDMf6NA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: meson8: fix I2S pin group names
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 11:41=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> The I2S pin groups are registered without the _pins suffix, but the
> i2s_groups array still references them with the _pins suffix.
> Update the group names so that the I2S pin groups can be referenced.
>
> Fixes: 64f6d07ba74c ("pinctrl: meson: meson8: add support for the I2S and=
 SPDIF pins")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied for fixes!

Yours,
Linus Walleij
