Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6B93E9282
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 15:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935245; cv=none; b=k9hSdfhXl/Qa0nd2QruIVEQDT3XCbYvUZupw8ofxNlIJZs0uMz3LyX+fIJl1ctNTGa8nfUl/zJMBapSkeCkDMXj9NZsbTXK2MVBAK4A+sUt2RaIrVUJ1Iqd6wLR5xdE1M4ITej9RPC+vkUUyeEMww8aQWIimibjE6ABqwC/KGl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935245; c=relaxed/simple;
	bh=sn6G42C6ms/Cda1VII3wEKGhH41j/ZPchSciY2v4JFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLhZQKcdZ9MY6+giPmjJeOwCoThNzT5tWwH3ucFnfoEWiT6Hi5jyAHxxStx1mF6IvdTzDN+nluRBw/MCIhJhMWaNRlEZzv9iJxQGxE2VGo8yeSHLlXqUKRaEALS++Kl9MWYcjMJkK/JcfV1YIOrowcrUviZE6v3qtHHmgznLwkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tS/NlSKv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tS/NlSKv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB29C2BCAF
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773935245;
	bh=sn6G42C6ms/Cda1VII3wEKGhH41j/ZPchSciY2v4JFk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tS/NlSKvAa7qYSbyogmwp7UKQP+DhxdUI2KmdFzwlwG/50YDtxyd4qUHAySbGfb1a
	 cissTZ98fHnVSdmJb2zXqt3iOR8TVBx2DOjhuJLjIzsfdDEr2yEjs0FStxkuYg9ijM
	 ATjqKiPLwrW/uenVCRVeZfx+vSLX4gvJKCEEb7saWn5ywwmi6KRbW65EluzfjGgJTQ
	 iENopa1kYS2KQ7WAdGM+rcf9wgbGS4szwgTt1P/mu0jKJsBfaS/jnrWgmNUsuWve7d
	 YyacUmGsRUFcgd4PyqJGwvKxCQBB6KV2FC3DkuZPuQC9ll2ucn3b6fsIeOLh3BEnL+
	 wB3ny/8yrq45w==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79a2ee65171so11844277b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 08:47:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGgafPb3/41Pi5hmgYNE3FIFbfMNKD+d+T40YRT3mgKbXtRH9XJaK0En/53TSX7dyzp761VNWFpVg8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5tzX08hshp8/YFgHXE5xASW/rEOSVOC62gLbreY4gQKsgYZgF
	kZHOQOUGL/42kEOlq1beQ5Vid0X09S77wfIx08PmCgsjFliUIrCveLJeZf2Qx5Uu93rwrPXCTEE
	AktsY6EQDuiaoXYDEXiQBLEyWbvdJxk4=
X-Received: by 2002:a05:690c:698a:b0:79a:2ea7:36b7 with SMTP id
 00721157ae682-79a71c5eac1mr75575047b3.51.1773935244913; Thu, 19 Mar 2026
 08:47:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-pinctrl_stm32_hdp_fix_dep-v1-1-3a6f6f02eb3e@foss.st.com>
In-Reply-To: <20260317-pinctrl_stm32_hdp_fix_dep-v1-1-3a6f6f02eb3e@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 16:47:13 +0100
X-Gmail-Original-Message-ID: <CAD++jL=pnQZ0JGCGcQ+onSNSoyDRGZNbF+Xb6fc4SRVCb0EMyw@mail.gmail.com>
X-Gm-Features: AaiRm53Xw7sQVazNFteoei5Van2VALJ94JUtdNLzjJjiUVYFFb7707DGpRAOz0A
Message-ID: <CAD++jL=pnQZ0JGCGcQ+onSNSoyDRGZNbF+Xb6fc4SRVCb0EMyw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: fix HDP driver dependency on GPIO_GENERIC
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Antonio Borneo <antonio.borneo@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 11:07=E2=80=AFAM Amelie Delaunay
<amelie.delaunay@foss.st.com> wrote:

> The HDP driver uses the generic GPIO chip API, but this configuration
> may not be enabled.
> Ensure it is enabled by selecting the appropriate option.
>
> Fixes: 4bcff9c05b9d ("pinctrl: stm32: use new generic GPIO chip API")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Patch applied for fixes. This should have been there all the time
and not specifically related to the HDP as far as I can tell.

Yours,
Linus Walleij
