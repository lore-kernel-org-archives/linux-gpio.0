Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3EC3E170E
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930338; cv=none; b=FGMwaKySJIVr9vzq8bc9MunkMelY4C/dBdU0fJLfbhleOeQeryMXlXuztfs6oW8gb4xVSvG3H6kDoVaQuPB3lS62Iu6DNcxg23HIgxrV/22LIXNhONtkI7uswsvpoqoobO39stG5Xeqg+IJfVPELL6Y4l2VetcrL0m+LyNObB2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930338; c=relaxed/simple;
	bh=TqXCaEo59uIn5ijX1yUW5xl1dOQgp5ea3+Zv51OCmTw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VI9Gc/V7bxbe24W1AWU21iXK5s2/9Jb3fZFT/10U/uTFbkwJHjjTH+qnNx/YEroaV6cqCqCIIDzN/0oYwALtZFctfbT75+rkMr2Bk6NimA3SYZeG/4340cDP1UHnZzDwoa98jlwFWb3KlBbQPGwfm/7LkmIYlhVJi/rlZaJyyZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+RfxYOr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+RfxYOr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0492D1F0089A
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930337;
	bh=TqXCaEo59uIn5ijX1yUW5xl1dOQgp5ea3+Zv51OCmTw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=U+RfxYOrfdQ/iC1lD+u6TrXrF1KIJKVDDCgufYmSpchg/Xbm/2KI5sIgjQKtkX3/7
	 godY6g3aNzQwvEPMtLdeoGfjPyxjQV8IWHShbMfI6OlHuMf4itY7mUYvY0OMCTn8qr
	 czHSvhCh5Lv1LSZEXPTVxJncyv5GLSUx4fOA4hZWMPpkuEyYSy6/SohZ1ep26DI9EI
	 sKoVCALsseAR3URTquTyRgbOQwG1PutrLLjkkHtOuQwTY9rbzGYJRRvEvO4GU3A0Hp
	 WqEgXXBrjS+eCb3wmdWZ/lNTRKhzXqpSQajFqESdrvb4AwU7BTEtgYZSenauieOfvT
	 B9J2bIBxVzjDw==
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-13807d2f898so3163461c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:52:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+bJr9ZkUzrER9u+Ohu+rQKs+T9D/dPArxEIDXghj5HLHpKEiWM52wHd5B5CHD5dbGPZvz6YN9ubUxG@vger.kernel.org
X-Gm-Message-State: AOJu0YwF/A63Igg1Jy4KoWU7D9wu7RdcHtOIxDWTwhG3KyNYg0eykOnw
	04LPGsiS/FuqGcN/RB5QKGbUPfdp5tVLgXJo8/C8d2ARlVZoOrbG1gbBrTMa7ucxlxIXvXTN7hW
	RMaXKs7exHsq0BdUkMEi684Z6TYz5KZK1ejFGVq87vA==
X-Received: by 2002:a05:7022:11d:b0:132:ac76:9772 with SMTP id
 a92af1059eb24-1380674e7fbmr7203025c88.34.1780930336508; Mon, 08 Jun 2026
 07:52:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:52:13 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:52:13 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-6-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-6-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 09:52:13 -0500
X-Gmail-Original-Message-ID: <CAMRc=MehnHnZjZiLteDxasPerTDbGcgvOgU=oSWxa8fSg94Vjg@mail.gmail.com>
X-Gm-Features: AVVi8Cd2PFRHTvwyoKh81QHB3RlN0SPjV5DzgwH177wdtNIlGj2ZE-mZGT2B4kY
Message-ID: <CAMRc=MehnHnZjZiLteDxasPerTDbGcgvOgU=oSWxa8fSg94Vjg@mail.gmail.com>
Subject: Re: [PATCH 05/18] pinctrl: airoha: an7581: fix incorrect led mapping
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

On Sun, 7 Jun 2026 02:16:41 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> phy4_led1 pin function maps led incorrectly. It uses the same map as
> phy3_led1. PHY{X} should map to LAN{N}_PHY_LED_MAP(X-1).
>
> Fixes: 579839c9548c ("pinctrl: airoha: convert PHY LED GPIO to macro")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
