Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575825;
	b=R9ZBgXfmHMUVY4QMTh+1dhcXrK1CDFj1wd3IiGH70qhIGKkfAzO2NxiYSdRoSIesEowe
	 IeB2kDLvx856nRQqEv/uEZn6W+VDCsidYpchTkVV2zYePSxS15Q6pQVGG4WB/nv32pFe9
	 LhbRuRnoyQ4rv+PzG/MaJO3EJZSo5JOkdddqUL4nNaWL1p4NUugiOUK6NNZ2vz6aDJCy8
	 NEW36T0bVerLJ3EFfbjDjSnYcun+OEy6M+DTR1GT/jjfIdQwf2pVEUGZVldxoxOfcffP3
	 70lMNEsrCHYWurHEDp1UF8WASXoIZtwdvBidJFDxxAgQdq2rVRqLiAq+M2ZPzQjGASw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575825;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=M9+hNfxaZh36tJO0QqNHySgIwpUhDy0fJXD1yCpECh0=;
	b=oDTum40FY+F0niutmuHmrbM6llrmGzkwMvZjTMB5JxvJ93MKCvu6GOl6gnMImJzaqJFP
	 9++19/XewaZ9hF9honIrt6DsMyTAlto3W898zOAdwPIPGsk9EUnfTHqTam1ioOfjvwf3a
	 Eyq22s/MtZNCU1bD5bYsuIHOoOscyIv/gK+q61v5FxpxJ7pftShvxUWxdmik3mHj3CJ+c
	 tozilJVnyOJAfir4Nm8d2SAXDKzw73FLHcFy51EhVomcyvcH4DeM6F+w0I2h1oMbtLuCS
	 HgUpRDExvgMkrHQb8uBsCgiCahAnGT6xQc+4DP5Te36CiWn5DoXNFDo0LcE/RvIRwzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kxemHx/f";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C610F606A31B
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kxemHx/f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876531F000D1
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 09:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792575824;
	bh=M9+hNfxaZh36tJO0QqNHySgIwpUhDy0fJXD1yCpECh0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=kxemHx/fBXE/4Bu6ahv1yiGZMNdJ4QTNLuruLfYazHdFhqzPAV1tKxybYZJuqKlX+
	 tSADx5Q17J4bkFZKLS9Xr0zuOGlalBf4FjWsZ+ZQaz3ehezbq9CC7CS5l9VMikH8/G
	 h0df5snZwjDd9xwLG/XwU9mrx21EtkugaLR0l0vXDw7KEKsieuVSrSBPfeMlQOKFHf
	 ozSCRfuXw2+KBDXjWUa8aA6ZxEhJaRtMHH5W6c0bQXxhcf0x4n27cvK4Sc42O1c+aK
	 QLhdlvLdN6ECvL8i3Fam3W8+fEWmCKl275KLGzfWRt32opDbXFmPWLdmYFuTPjfN4e
	 bbv5neVc7YZ8A==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a5a26c8412so5181521fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 02:43:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByfJAG+llOnHuR6GKSPkt++CsFQErrDB95iWIeUsiOlNfTe4h8BjlH7zUUqCK0PC8ExwwJK75epynSZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLYSqY9fEM4TOrjCncKLBmEYS7/OF0DBhmq2hK1+qpRKUM3OkOw
	G+Ws/j7Er0YUnBcKKB0jLRZOhnKSYud7rXxjH2xL8poD5BTaUUVx6vJxo+5E5+w66/gqCkJlLxy
	NjbNuZnD7dKiNtJEXmfxavsp9TKu4hRKrkSA1E7D4mQ==
X-Received: by 2002:a05:6512:2c8d:b0:5ba:3e11:5d3f with SMTP id
 2adb3069b0e04-5bfa1c3d7a2mr545704e87.41.1792575823202; Wed, 21 Oct 2026
 02:43:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:43:41 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:43:41 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <45484c37512a3102495d8b75b6e9f72a141ba42e.1792574560.git.geert+renesas@glider.be>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <45484c37512a3102495d8b75b6e9f72a141ba42e.1792574560.git.geert+renesas@glider.be>
Date: Wed, 21 Oct 2026 05:43:41 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mc26=r5+pw1D03E1UWkmrdgtm_ZkesV7yzH2jdGB2U_Lw@mail.gmail.com>
X-Gm-Features: AclHuK93rwltI4nv5VA4V6ewSRua1UsdsQx5de-m7P_I1uO9BLJjDfU-0FxsoZE
Message-ID: <CAMRc=Mc26=r5+pw1D03E1UWkmrdgtm_ZkesV7yzH2jdGB2U_Lw@mail.gmail.com>
Subject: Re: [PATCH v2] PCI/pwrctrl/gpio: Correct GPIO_TC9563 /
 PCI_PWRCTRL_TC9563 dependency
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Alex Elder <elder@riscstar.com>, 
	Daniel Thompson <daniel@riscstar.com>, Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 11:23:52 +0200, Geert Uytterhoeven
<geert+renesas@glider.be> said:
> The Toshiba TC9563 GPIO controller is embedded in the Toshiba TC9563
> PCIe switch, and its auxiliary device is instantiated by the TC9563 PCI
> Power Control driver.  Hence make GPIO_TC9563 depend on
> PCI_PWRCTRL_TC9563, to prevent asking the user about the GPIO driver
> when configuring a kernel without TC9563 PCI Power Control support.
>
> Drop the dependency of PCI_PWRCTRL_TC9563 on GPIO_TC9563, which
> represents the inverse and wrong relationship.
> Let PCI_PWRCTRL_TC9563 select AUXILIARY_BUS, as this is no longer
> guaranteed through GPIO_TC9563.
>
> Fixes: eea9a072221d97ab ("PCI/pwrctrl: tc9563: Add GPIO auxiliary device support")
> Fixes: 81ec9c22d06aea92 ("gpio: tc9563: Add support for the embedded GPIO controller")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
