Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3241382399
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775721891; cv=none; b=p+z/ZfTNQYXQuAr5KnLOsIb6+WqHZfCpXFqqqa0qkeT2WJDZgWAvSAu/Ap/Un40ebXQ8Qc6V59yjmtWi1sgArJE11j1i98PjbvVTR2akTvRv5Wl+vZeen03DwDx9e/ukfuk9n0vzqPEVStRYt1W967HLVhPc5oV2P4OaT9x8l2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775721891; c=relaxed/simple;
	bh=C6vY1/liCWOmwvhpqVq+RRM/Ex9Dg3s3PkITm9pUSq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wafg3xLgUepH+bkyX36gLwonomg5xiGiL+CQJkjkGcLcc9uckjfPtoI+OgdaY9+izbKjksQj+YoABBAkzbWKT+tJhI/MxIAV0/iNyuzvTKcBYZ6as+Hw/TZTUmN9/OArgdV89f0NK4NOrBA4FXo4nM39Q7zuH/WyPpoAzXLLwxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjEI11ip; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjEI11ip"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A950C2BC9E
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775721891;
	bh=C6vY1/liCWOmwvhpqVq+RRM/Ex9Dg3s3PkITm9pUSq4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XjEI11ipi4OhM81fREBgwto9yE06rP8v7hundcR/3y6mGNEJneDWUe448KCz/eOjm
	 l0/LRJbBsTLKvZpsJ0YV6CVMqaA/+B8A06fgSSzKDPu+DelOwVNLgR4vJLsYTvdB2h
	 XJGn0Qj4Zq8vuJ0JDj9xLwc+KyJ+uFnSwSGqtmvQoG/1oAzCu6frh8E7qdKwmr1lfO
	 WCfBZE0pmGoL5eiCDEXAGApxRALQBGf3IhjLBpM45U3kQbU6828NX7g3JnWAY/9sdV
	 0RdDTYqexXgDEKn/i1nYZlw4ANFSvhjW+ylfTyEG0EorP31HHp7sScHpaF4g6OsL7C
	 ll0GxYbs6jMOA==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7a2b6adbfa6so6095877b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 01:04:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXhNpLVonBBeb2pQSaBOYt+gKuYEjZMw1sBRGLUW0W/paxFi8dIM6NBDGBTNHwWDsZWxmwl/D4H5M1U@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv7zrltLuRSMwyxkcECrURRuEaAB4mU8VVGTomP0mBSoAGyOj/
	PlR+o3eGh5/0gaUQyhOuugumoCmt2SE8ijA4InBaku8//1yBvySvoIdVR1mmLJif8lsCprjEjcj
	Y6rV01UHg1Z4YQ+vNRnUNJYhFzTulwqU=
X-Received: by 2002:a05:690c:6084:b0:79a:57a2:ed75 with SMTP id
 00721157ae682-7a4d86c20bbmr243395487b3.34.1775721890908; Thu, 09 Apr 2026
 01:04:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com> <20260407184805.807328-4-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20260407184805.807328-4-dev-josejavier.rodriguez@duagon.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 10:04:39 +0200
X-Gmail-Original-Message-ID: <CAD++jL=bxeWbf=Pm4W6WLgwzkPTHpUeOH9vwpniAdaO-AwNrzA@mail.gmail.com>
X-Gm-Features: AQROBzChSuDIcHvtmzPqcW7WwtA4rYbqIaIb_ppLVNCEpUTgvN4vag9L0FHHCEU
Message-ID: <CAD++jL=bxeWbf=Pm4W6WLgwzkPTHpUeOH9vwpniAdaO-AwNrzA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] gpio: generic: add io_port to struct gpio_generic_chip
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 8:49=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:

> Add an io_port field to struct gpio_generic_chip. Initialize it
> depending on whether the GPIO_GENERIC_PORT_MAPPED flag is set.
>
> Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@d=
uagon.com>

This looks reasonable!

Yours,
Linus Walleij
