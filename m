Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EF04508F7
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930554; cv=none; b=qHdHktuBZMDQWLgo4mWqW2W8u1iUphUXVWv2+kOVJnuu0aWGE6hH+e/msVgEJKkVxu6MD5cgHNgEIQK9u9G97l0zBnAPGh3nJzmpquntNsLV7aAyqBIk2Fbk96LxVL5Q2ZdNlj18dCXudz/ahB2M8OR3YnMN+r2q7QkwT2CS4zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930554; c=relaxed/simple;
	bh=Hs0AopP641Nmrjln5qzy5oy7hjGy8ZfORbZ+12k1w10=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWt+ZALlBZSErqstG1qyp/zWaW4pH99ZAJrQv4rIJaMDWQNzosJdY5B7evNoLq73sM43lfy0rE88yLon/iBYLK14U+EzZqxby9wsCNinNbXgQG4S5jQVz0F+ywuH9ipgqQfIUSdxY9ORjINrviOoj0lytCYZOinESqYzU/a00+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPX6ZhS6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPX6ZhS6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38221F0089F
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930548;
	bh=Hs0AopP641Nmrjln5qzy5oy7hjGy8ZfORbZ+12k1w10=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cPX6ZhS6K1cJGEQsPncU5ZdWEiXX29SCBQQD9gqQUxnd2qSp1R6wxFmviNTA3u84w
	 6ejXLLwQyx/z6uw3pNRHkDY4ujt00dYpc6rZX9Cxum3y5yOcs/mFEElYaX3uChA2tp
	 rgWp33wurimBPZRarYf1vhtAHy8nTmxtK5JEA5Z87t2AEIEoJQ364mC6sRb7cSvcNs
	 K2rFs5dYWAXwQCR4B98uh/GQcUQKTceHk3fZd4rZbhasgBoU0KId/kDbLC8G/wVh9F
	 Ly3vXqX4u7AN0xP1y/kZ22T6UcWZ08Tqi+Pp+7hh4QPTcmouKsLb/WQsMtXbF9AdxM
	 Mh5xxJdYsmn+g==
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-13809ed8fbeso225943c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:55:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9kOs53yQk606G4QWXjQKC1VG6vwgVdeo2z+ue1cRG0TQ3DW0DAhmLHC1Mx5/a764kDFcv05YG9SpWy@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ9qVutwof7dcmFxsvYs29BvgTLeOfF0bm8hUqCORcVH2kpkjK
	yBqQeB98GuNSo85LczJAua6f3jUfrmc5AlrFMvCNEZ0aerXS61Kn6wcfX87hJ8cwyBjIxfwgv0l
	qxvFGhqbkCOMjlpSZ5TMKeBBCs528e72q3VVS+Ox1RA==
X-Received: by 2002:a05:7022:10c:b0:138:267:af4a with SMTP id
 a92af1059eb24-13806687266mr7893634c88.8.1780930547462; Mon, 08 Jun 2026
 07:55:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:55:44 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:55:43 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-13-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-13-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 07:55:43 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdy+-_M7HAHrAPw983HwMaVA=ZbMcNqHrroxnYEq5BFMw@mail.gmail.com>
X-Gm-Features: AVVi8CeIxTG42QPBj9M8bPaIsoqISAxcCByPptlPDWWa4A54J-OukW4uUVkVRFc
Message-ID: <CAMRc=Mdy+-_M7HAHrAPw983HwMaVA=ZbMcNqHrroxnYEq5BFMw@mail.gmail.com>
Subject: Re: [PATCH 12/18] pinctrl: airoha: move driver to separate directory
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

On Sun, 7 Jun 2026 02:16:48 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> Preparation step. Later the driver will be split on several SoC
> specific drivers and a common code. So it's better put them to
> a separate directory.
>
> No functional changes.
>
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
