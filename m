Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062713914E5
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 16:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786118857; cv=none; b=NZk0hDR4DXmA9N5wvOqqVeWBr3BS9nwNUYLjKLFN3z72oJEaNjd8Ojkf5PSFllyR0Nj6M3YKR4G46cTJagmehQ+LLCnI7CLsQ2GBpRjF/WQTt0HHG5oiFEFOC2K69oUHynNbWPe6OGjpfHoLtqdqxMvXH3X96H+l9D/WFMbjsPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786118857; c=relaxed/simple;
	bh=Z3mmsKthhNL//l93bgt1IJp5Fhrb13ID4ocpg3JoUTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FP+68wipFiumcANlazU3cv1Cag1ze+Kfhpshs0OqVvkNqy0O/CG5u7NLSY04FYBaDq8AE11xIoW/eN5r0AMGgoa2aePH1/fzIW4CVlwTQfV0APu1AlgjpmdEhBM23NtSvrjJoo0unsWwjL+EsNHLMrG4Uf7z5w5LJwcXHcA3W4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzWoCNiS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzWoCNiS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6261F00AC4
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 16:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786118855;
	bh=E/7u7I2Djvix0P2NwMSrq7QV2o+ie3mFI36omFn2Qe4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dzWoCNiS+1H5cMWyLNwH7NxQLHuWOodEoiiK64vQFPQFdXULN1EalhUa9VrrUrSVH
	 CIDW9ITSPA38BknGjgYfRWGPthYKfnpXrE37Aq+TsO8j5r0Ca/JeNi5yp3la6ckXkg
	 frcAh8cq8JR/NUnrK8cd3ukB2OivPqektPH9e+CV3qpX+4+OIy+tGI3aq9r5DN8Jk2
	 7FcRHw4tVkp1+TJhmeFAiPx9OaR4q7mCyFIXCkJwfAV5IGC5JYtqV5VHcbGslK8vgh
	 OixShL8lcsPBF3PVQmMClfckhhukVKpwegFUn3TMnxsi9cqbRtRQTiWI/Falwx9o/A
	 N7tbdKX0ojl5g==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b29599b81cso4545917e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Aug 2026 09:07:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrDncz7UQymqSYSdoKe08iiIJ8yUZali5jOF+hJb6O3eN9HHSK71jko1RkLi44w+BlKiklU2Dwz3Jfd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3s7LNyuR4loEdI8sLC13qyZL/C4m+b9bykguz192XPBcyElpS
	AZsBvj7ZIQgnINqf2dBgSmscbYatj0J7k1S+Iy+A0pO0VNKE11ErKp23ffq17vrt6+VoNyrArPF
	bsKD4TRJBTp1ExtoMMG20JesSDp7DHZw=
X-Received: by 2002:a05:6512:131d:b0:5b3:419:7c86 with SMTP id
 2adb3069b0e04-5b304197d35mr1526582e87.19.1786118854497; Fri, 07 Aug 2026
 09:07:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 18:07:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLn8uL7NePnPK6SNcuKRjxm6c_98Piu4Y+urKko5eT-mhA@mail.gmail.com>
X-Gm-Features: AUfX_myE9lBIlT3ccrCM0uiAQGhdWYGeb1eZf7EHX8xjjW8G2nlmXblTO5FBaEs
Message-ID: <CAD++jLn8uL7NePnPK6SNcuKRjxm6c_98Piu4Y+urKko5eT-mhA@mail.gmail.com>
Subject: Re: [PATCH v11 00/37] pinctrl: airoha: split on shared and SoC
 drivers, add more SoCs
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mikhail,

On Fri, Aug 7, 2026 at 12:06=E2=80=AFAM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> This patchset
>  * fixes more airoha pinctrl issues
>  * split combined driver on common code and several SoC specific drivers
>  * improves an7583 pinctrl support
>  * adds support of en7523 SoC
>  * adds support of an7563 SoC
>
> The driver split changes are based on Matheus Sampaio Queiroga work.

This patch set began with 11 patches and is now 37 patches.

Is this becayse Sashiko is touting you to just fix more and more issues?

I think at some point we have to draw a line and say "let's fix the rest
later".

On the other hand I appreciate your efforts...

Yours,
Linus Walleij
