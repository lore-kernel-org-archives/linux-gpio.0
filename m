Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAFB330D4C
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 16:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935435; cv=none; b=k8wN30eQlTfwlg84INPDIYbvvJvhyMHYbDBKt9fjMJTF/b+3gq1NrMKcOaq4095mB193St+6P372IRrNSwkuhYtELJSi+2333vF5yLY7h+d3yznP/vmJxM1BUAFZouRlHgqrGGJUP5DmPXx+SxmhmJYHOSTX1h+JOhSoDN+m+KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935435; c=relaxed/simple;
	bh=WTtvSs/e4atXwoKhD09E3lWjpJ5mSO88VMWBPo2Qa+Q=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mAZzPNVzhEWepdr92uJv3fIGNhSwXX5deYY+SQCq5rfGow7p4bGqetN63L1nFKTRofTvf0ky6xd9lnB3ArQnldjUxhY3TNQSB1bRQlxjYfjcFBQ4dpYPrDogTDWX77lo3tNarratYTTxf/JTVSfYW8CufUCecY8IRsln4MgjQ2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyueLEj7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyueLEj7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267331F0089C
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 16:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780935434;
	bh=WTtvSs/e4atXwoKhD09E3lWjpJ5mSO88VMWBPo2Qa+Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=LyueLEj7jp8yMu1AEQixDI8q4B3w+XWSiIw6WEYpDkY3cuAaHkVs+Gkv4r3oFQ+nE
	 j2kEitMrOypDilGIkywdHYwTiG54nerTMKRg+wFacTquoygRP9xid7cpz+jTJSKgyW
	 +abDJZazjpsyZjStWHiiW/goTyCBX6IkYG8xY8+2fwLgB6kacNDSnOUhIlgELABJ8H
	 xljLDTpbnIBYx/FiATjwXyRPT3p9YhztzfUvwTF4kqjYUueHxZKf/ysMkp7zxVHY++
	 dIwlZTpl2ALCGozXK+SRCdBONQkltTbaUrMFKqfaNg83xgGZ4OGeu5bHwlG5KZMyCF
	 GonMhW5EFkO4g==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa5e9a64b4so4734444e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 09:17:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/9Fxi+11TeEU2WinEm+MVQh2RK6aZdmlAl5IjqC+pGlHXe6c0zDKJxZSEyVKVSSLhs83eGHfWArRpf@vger.kernel.org
X-Gm-Message-State: AOJu0YyueLAViqrXSBI+ZkOFPYM/wJ7Yi4+cbvABy64lsOeO2a2R0Gvd
	phMkmJxSlRDDT/0gR0RxCdB9A8wFyr6QJQ8dfN48mcYVbIj/Cqit0T6G+h61GvU/BgWRTAjt434
	hRoq5Y8Xeh9b5BHilacK+l0/PQwgx8fciL4MYQtyiPQ==
X-Received: by 2002:a05:6512:135a:b0:5aa:74f8:72f4 with SMTP id
 2adb3069b0e04-5aa87beffabmr3825436e87.32.1780935432883; Mon, 08 Jun 2026
 09:17:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:17:09 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:17:09 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-17-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-17-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 09:17:09 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdWhfR0gQz+cJsks_-L0+fKKXGPg1FKDqt8dSSGr1EA9Q@mail.gmail.com>
X-Gm-Features: AVVi8CdSgzI-OCu4SAMZh4v6VzPB8Cgbp2XhrMRq6YuwW3nSlK1BMg5J-5Z-maM
Message-ID: <CAMRc=MdWhfR0gQz+cJsks_-L0+fKKXGPg1FKDqt8dSSGr1EA9Q@mail.gmail.com>
Subject: Re: [PATCH 16/18] pinctrl: airoha: an7583: remove an7583 prefix from
 variable names
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

On Sun, 7 Jun 2026 02:16:52 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> We have only an7583 specific code in the pinctrl-an7583 kernel module,
> so 'an75831_' prefix is not necessary anymore. Remove it.
>
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
