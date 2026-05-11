Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A19837EFFF
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530094; cv=none; b=gOah6KU4c3O+F16ILGtgxz7yWeJohcRq2vs2lemr4MNSHOvHSYxA76oH4W1PFc+zRU9PYqtt3z1Nbj6qx6n14jrdsD0QxrK3A0r0/rtUIkFAvquoovwi8QoyTCoMSDN/6Q1OGOA2bKIi65uDJGze9yFdBJPXJSfxvlReND/8lK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530094; c=relaxed/simple;
	bh=z3StXrf/Y8Fjgai3Xz4q4aY0xI4soTMVazgB2FR/ohE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLRkcP4Iei/VV8WtgjpjeZPtmudGIn8BdA8gUVvO4kpJkvA1JCGHD9kpKZHMuoX3jL8Q72PVPkH39LHIa7pHZ8kE2VCz98nH+ybVBQaQMOT+UQCxreEPJvwa9hCvQHfuBNcqmbB0hN7fpmaxo++vhxf8K1fNdD264MFymvFaW0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gv+grIwc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gv+grIwc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D654C2BCB0
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778530094;
	bh=z3StXrf/Y8Fjgai3Xz4q4aY0xI4soTMVazgB2FR/ohE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gv+grIwcYAWb7IA5etvv+BG29OTc7JhMIeRjKF5I7xSfLd28AzyzfamxZhboBvOhY
	 /rCDLabgw/3K7q5b/6tR/tNbNsEp16szdoq/LxM1WLXDRSdmROj0xMLpWGn23Z4IcH
	 9BMYJlcMygCKJE3Drj3nr8ozceSV9ptLd9mlAAqFJ0DvHJ39U0OeaS4Y7EvCo1W+sy
	 mLgnBs74DtyZrPwx5oRJzc9y3cNhsCHGy6+Ip16teQtZqKt0yAZQPRKIO5z+jhLUMn
	 4/79tm41+J/21nPvmoDIpTcGxWTrNDEI4MU9Q6Ea7ocOgZPdI27fys51SvmyVEybWX
	 ivTXd3aeNfS3w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a8c94cefcdso1291087e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:08:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8FCuuQOeNAuKQnJxXc+GZxqMFR0nSdc38L/97z8uOuuRXQW60Az0mb+oheCmpj4fvGlcJCbrZib/Ut@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7x0OXbBFMZxgh8c2lCPDN1/u5Vr19nv4Pg0Q6h4vDmM5rlzkl
	GrZJoOk4VWs4kR1X9gkkzB0h/dFuLs6KE3YkdzfBZujCVjiCyUA3CoEsglkgNWRwNmUUj0dX7U/
	IdQZVr4hliyx0AHVygg8zx2BEPucjAw0=
X-Received: by 2002:a05:6512:2315:b0:5a8:6cab:4871 with SMTP id
 2adb3069b0e04-5a8b719719fmr3007685e87.36.1778530093083; Mon, 11 May 2026
 13:08:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505122444.59265-1-thomas.weber@corscience.com>
In-Reply-To: <20260505122444.59265-1-thomas.weber@corscience.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:08:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLnDS7wKUCe5E4_CboV9Cx_2YVvNjTdv_DWcUZwtyXzb-Q@mail.gmail.com>
X-Gm-Features: AVHnY4K9DQGhTH8-K9veA7Z5ekq3mv0eaQO4ZsuzNNghc1Fad_kcNHQcti5gOhQ
Message-ID: <CAD++jLnDS7wKUCe5E4_CboV9Cx_2YVvNjTdv_DWcUZwtyXzb-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: realtek: Fix typo
To: Thomas Weber <thomas.x.weber@gmail.com>
Cc: Thomas Weber <thomas.weber@corscience.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 2:24=E2=80=AFPM Thomas Weber <thomas.x.weber@gmail.c=
om> wrote:

> STRENGH -> STRENGTH
>
> Signed-off-by: Thomas Weber <thomas.weber@corscience.com>

Patch applied.

Yours,
Linus Walleij
