Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0CB346784
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936001; cv=none; b=llQ9hZa+lwne7ymzETwzXFqsn4tvgiwUCCeiM/sBk7IdXphwLdYLXUh0m2QOjloItLzxmm480KQfMiMjPZ94IqXS1mIk3hK7KAWbJjhLjngx/1FgZuZxzkYZXpOxKRgnZsWRkgk1KUpFeHfdfDfPMhnAI/Bt7aO5d8t1mPaUKeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936001; c=relaxed/simple;
	bh=S1Jswu4gF0raqkyqNHhNG97xtcffgBXN4C7u+pxab5w=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRdTmPSaCi14QMAjvy6yRBFB9mDn14r1NktABJiz4suaUE/VX54huBCAvAoA23OtIzX1HjYFVps/DgSgwi6dQ9GRQItMQgyCLZbsVehJ+0GJtyQ5QsNfZzhUDI/YHAfRVgWTEWtBLfY98ib36dns9UmpKZFMPTCDsyC/dlfQmQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhaQSBeb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhaQSBeb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7861F00A3E
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 09:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783935998;
	bh=S1Jswu4gF0raqkyqNHhNG97xtcffgBXN4C7u+pxab5w=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JhaQSBebJHsv88m59on73a78tG5oq7wc+mnZOZz5DbBtAJyhEsF4DmYkbBD199iJp
	 EjX1S9Q6LEIkwO34VXtSO4s14YKJGCToUoQebcDlVkYcU0CGCjtuNJeEXLlFRdTeVJ
	 eUQgAmd0YjDyJVkbz7Etthpep3cPo+cnadVRUfqfZ8kQRafS2M8uKMt7FNqQTy2u34
	 JxTaFxXLPuy3ogX6ctrE7j12bcfHNpV5HkCm+Sdk4IwdxRfsKtQ9WgDF6ifd4U1MX+
	 qk5V2a+oi2NNe8FbKZJZQmeDJmULhLVFjXIJ5Z+QXGB+aqLwX5t7nQ2illmfWrrOe8
	 lZCAoW0ZcVdig==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39ca0a30148so19351161fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 02:46:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrp6FUkyzEXHJJrkBCgllobjjvh/XwtgmHtn6O9kJSH4pU/A9PMrnCkIFLFeE2hYcuQtBadjVUYiSXD@vger.kernel.org
X-Gm-Message-State: AOJu0YxbCJqA9u/TCbgKa8XVEz/jA+aoiY3dH4SgtSWC188NV/tEfBb2
	rqW/sW+putrOgku9B+vSH7i+wEn1p3co6WIItkZUSOpYwWffftqwFw12bzoaKaEzF5tSJJDqPDh
	ml+QrA+ZmhJsWxwO4Id0oUAUsjQqH90lpKyiANfr70g==
X-Received: by 2002:a05:651c:19ac:b0:39c:f58e:5c8a with SMTP id
 38308e7fff4ca-39cf58e6a1bmr15845141fa.21.1783935996856; Mon, 13 Jul 2026
 02:46:36 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 02:46:35 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 02:46:35 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMuHMdV415V23a9E2QM77iQdGePOoZYNk=+v0Hms6uxugKBu5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260712093148.21446-2-wsa+renesas@sang-engineering.com> <CAMuHMdV415V23a9E2QM77iQdGePOoZYNk=+v0Hms6uxugKBu5g@mail.gmail.com>
Date: Mon, 13 Jul 2026 02:46:35 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mce7WXrme_z_ZoUCHqYUAdP+Ee6rHB8TmRdeZ18kBH1Tw@mail.gmail.com>
X-Gm-Features: AVVi8Cc0kqodj6tQl0eUIgkxrp0sz9RxCfHf8zbwTLuRtnTtrzGWp2JAJGQrxYo
Message-ID: <CAMRc=Mce7WXrme_z_ZoUCHqYUAdP+Ee6rHB8TmRdeZ18kBH1Tw@mail.gmail.com>
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: add a comment explaining the
 buffer init
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Abdun Nihaal <nihaal@cse.iitm.ac.in>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jul 2026 11:20:02 +0200, Geert Uytterhoeven
<geert@linux-m68k.org> said:
> Hi Wolfram,
>
> Thanks for your patch!
>
> On Sun, 12 Jul 2026 at 11:32, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
>> To avoid more false positive reports of "leaking memory" when
>> fops_buf_size_set() returns an error.
>
> But who is freeing priv->blob.data when fops_buf_size_set() succeeds?
>

In case I was too eager picking it up, let me drop it from my tree before I
pushed it out and wait for Wolfram's response.

Bart
