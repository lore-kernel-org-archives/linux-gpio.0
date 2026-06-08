Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F12A33F597
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 16:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935221; cv=none; b=QnxA83q4r1bzPBCcy0lAsBfbwjxpISxyIT3eOJ6J4TBUg6XDqB/GfRVY3s7CeAd0Gm3AuNaT/saoIjSBSjAu59Ws8IMWzm91NbByTuLKKv8S+KI+GW1l4AspWwTFgPdivQPj62eMfeQMQMmAuR3cJjBmvmEYRyP7FjCinZG8wqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935221; c=relaxed/simple;
	bh=PNOgVXs7S8GJ9Sg1bq8BaYnTVZCTG+kvEqG5BQlDdGU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P14gKBOWDX+b8sikOmRkm9dpkU2I1FmWw4DyXxzAFa0bcm65/SlvKRJZLazmG1+7aZ/HtyxsXBioOFWdIFzc69TB6amI21/cIr+3J/Rexquot8tDkzOveLIDt3OgtCkxZeWwEVEaHjxcvD+MAldK9F8OBC3mxA8wq3EOl9H8P/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XaE54YLL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XaE54YLL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01CE11F008A0
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 16:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780935220;
	bh=PNOgVXs7S8GJ9Sg1bq8BaYnTVZCTG+kvEqG5BQlDdGU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=XaE54YLLzd7R03D6vdNV93jF1Ra0VKj8Dg0BKxZllW+ZAy1zYkrzotCFTFRVck86c
	 yUvzU24/H3nR53EGBQbX+Gs7rY7YjySOXlfx5zOseeCnWIzYjvCdinCmIDD3LDzLoS
	 lsNzgfWLeXgYDoKKO9S9cVjfPeoOISMcRqbmM3cZ37WzGr5Bhz6RQi7/ezT71kOmHG
	 nlEHZseBqQkw+hZhtDZl86NaAQRJgpuhh3RQM4QicLZpteO/cdPGWwy2eln1q7EDeA
	 KnsL4hwkMdIdHTSJDr82JwiAO5uAngS0+jLtYsS+nyBbRvH9BwSPGNnwpYjH3Lupil
	 OcJWPv3FBqcTg==
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-13809ed8fbeso427309c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 09:13:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9FyLYDM6bStcT85lGyA1i52hKpolMAT5T88KG3m2X4XCgKUdCCIjgoqYbfy274ai+x3+eOf0fKMuNq@vger.kernel.org
X-Gm-Message-State: AOJu0YxkBqBDbDeqJFk0828Bh8NfY4x7xnKrt+v8pJ+nREK2+ORD2dYk
	STmwI07I/m/WWil42Ne5wUiS5TmV7OLJQI/s5fT0ctFM+2sGx7Vrg6T1hFyBuJmTir1ZN08cZKI
	DJYlsf6jAIhhZMpMjDX6txLgD3cib5aOwNqpkT44+XQ==
X-Received: by 2002:a05:7022:6988:b0:137:feeb:3fc9 with SMTP id
 a92af1059eb24-138066db0e4mr7852243c88.18.1780935219351; Mon, 08 Jun 2026
 09:13:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 11:13:35 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 11:13:35 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-7-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-7-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 11:13:35 -0500
X-Gmail-Original-Message-ID: <CAMRc=McXE5uVFchzK1eLEY=a47W9MExbXqEPW_8L-tL0v+t_xg@mail.gmail.com>
X-Gm-Features: AVVi8Cfr03TF-ZZw5uesCgNwFbbmqiX4FozcVhH_SMCH6F9qaiCx29XYm-wRAiE
Message-ID: <CAMRc=McXE5uVFchzK1eLEY=a47W9MExbXqEPW_8L-tL0v+t_xg@mail.gmail.com>
Subject: Re: [PATCH 06/18] pinctrl: airoha: an7583: fix incorrect led mapping
 in phy4_led1 pin function
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
Content-Type: text/plain; charset="UTF-8"

On Sun, 7 Jun 2026 02:16:42 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> phy4_led1 pin function maps led incorrectly. It uses the same map as
> phy3_led1. PHY{X} should map to LAN{N}_PHY_LED_MAP(X-1).
>
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
