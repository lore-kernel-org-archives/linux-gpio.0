Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD4A3A3822
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781178815; cv=none; b=cSn6nnShxy8hQe4rQAzQB+g8djsjMjLlw3NRQKXLOszNjYmXsFd2ZVxFKmrvfchDDay04KFWgzjur2a+S/9phfwR12+UkS6r/WuPEwzIxOkWiugjgTzfZNlp6nqHlkw9AJSu6wcWoSLplF9nSA/S8FLjfJrEjv6jVXUzhRTGSaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781178815; c=relaxed/simple;
	bh=GqY2spfTOdxT6/z9DTv0mn5JpX+liaPtEnBVwLgBTnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U9mMhfpJGIo5VyxFWV8zafImPF4rrDCeyaiCFWhgNi218wCu0gMyVVZfjG6S6ptR9Pyu+NhMTA1LxtRyMZdRca2mQrPIxRn4AlO3Kf3Pc6smuqSQGVNOdD87Pf6ppDj9M2CZa5glFqZYK+bfUY3k6mUt/u11m2M68p84Yq3YgaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0Xh0cj+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0Xh0cj+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31C31F0089A
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 11:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781178814;
	bh=GqY2spfTOdxT6/z9DTv0mn5JpX+liaPtEnBVwLgBTnw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Z0Xh0cj+FPMHImvLlydsk6WEiI3l+mk2IO9zpn4hl6MI6hXrNabJxKzDCt91NKCh7
	 mVSVoz6zbnrsdic3eO9kkEGqqAEqLpi1aswrQBhn7pnn84rs92Vp9vM23ZK/ujeU2I
	 GP6tBSgo/UQ341vOfKTjchmsIfKBxjYecNyw/Aqku+TNFFufwwg244WCefmRgztQNK
	 qnsVKun7pPXyQ3qkRurGkivj1fGqvBVdkkCzenrDdHornVvFbFtFaSSCoqUVz+xocr
	 zBviDrAAKjTVWu9dC6lV2Wul6Grpnv4BQSu2z3ydoGIUS41F+2BAjIKyCx+vRunvi7
	 pQLclsg5mWI+g==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa68d7d757so8341092e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 04:53:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/fxBPZqJFreco1RsLnKB45Tx+NGxXm5xLOJPhOt85w8o43l8+udWRg3XQMMKTZ06LSVByHa0AROFXp@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn0GtycMFWo6HK21esj1HAPoZgFZM7SJWFQnOsiJ8lFcMNmIYL
	lKBjbYK6tivfJ+4SualF9HJG+31/2xx0lTgf34mI01cv15nV+YnxVqdoxdlMcQl/UyKDpCezxiq
	fyVn5CM7UsPPHEYWlD1h/pXVxYvlhNAw=
X-Received: by 2002:ac2:51d4:0:b0:5aa:62fe:ec9a with SMTP id
 2adb3069b0e04-5ad281b7a20mr780290e87.44.1781178813544; Thu, 11 Jun 2026
 04:53:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 13:53:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLnznOYt7giVz-xqLEm49oMdnr4HnaW8T5sAyz7Zqgi1og@mail.gmail.com>
X-Gm-Features: AVVi8CeW7u952qA2e8nha9s-_tLXnmRSu2SJMgx1bi89y4LGhDaKdjaaWzyi6I8
Message-ID: <CAD++jLnznOYt7giVz-xqLEm49oMdnr4HnaW8T5sAyz7Zqgi1og@mail.gmail.com>
Subject: Re: [PATCH 00/11] pinctrl: airoha: small fixes
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, Christian Marangi <ansuelsmth@gmail.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 4:04=E2=80=AFAM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> This is a set of small fixes for Airoha pinctrl driver.

Patches applied!

Yours,
Linus Walleij
