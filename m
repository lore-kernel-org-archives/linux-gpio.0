Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564569;
	b=gwgfBmKjI0uDtw0GKf/7cZILw1/5LMBe1q2GPRqncc7dV2p30Bq7Q4OKlnY/r7AANJxh
	 cPBl/60f8K+PyWRVnl3FkVfGP5PXy3a49srMcyS6XcXzneOCSggVa7g3Nd73LwKL/Doym
	 pL49f76AHXv4LwKVEC6WYuh3WutLEZmv1LTD8oQxYy5F+2Rr3qH6WCHx3tNTgItaP9lfv
	 Un1MtWiED0kUmccCrlZhkYnEVDsz2GiI3C437pOsHrhu6b+Qe5JeItjHIm539cuoWUpaQ
	 X6EpyWFIH39OgAnQ+hwaxybvAylkNTqFK+1OrVz3KX8/wPCGuANlsvB3e9J9WVagnoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564569;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lHtGW/alZjcgKTPZf6fIR74OQ4JRsfsRwol3QZcsyok=;
	b=mnOike/khpO+KkcFcO9KTCy4kT5zfABt6HtQ1QdJpus56DqqY6sd+T7/LmD1aG2cqJ9H
	 RyedgveCX26r8fKdYPLssb9ZKiJ+3SZQ0H7MWuHNO+tUSrP3egeJgUcpwUKzq65AsasEl
	 TY9dWY4YbGSZj14ukGwY+K5dTBrit4tqNWEhjIx2B/8LmnbmJoch/+kOpB133wztsbPlH
	 e9k4wYOneeTk3n+d7rx8z3zMGRiU413XkOsehj9vqNqq+TN9jIdHzTsdbE2azFBf6Kqlq
	 t1QL/1SRaUE65SnxA74+LChBGdtMloWRQdKhL+RMdaRjmI+pgogMjCXBM/ATfSeJkfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gW7UDdEw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E355D606A335
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gW7UDdEw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7557A1F000C9
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564568;
	bh=lHtGW/alZjcgKTPZf6fIR74OQ4JRsfsRwol3QZcsyok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gW7UDdEw6q+5j8PL5LPh1L1vrI7/MIoKJeAjSu2NDHrd1buG3qVpd1qYhNaa9PhEZ
	 0uUEqdklHY9Gbm+Ha9sUVGqC2s/1YeeDkfa483PuNbOwjkxP+CuS1Cq7pixdDBXc0R
	 v8QNxCJfMDXzIkIbjr1I/9MdJDOrw5/S0pgMg9lGdK7+71Aqu3QtTLGZtdE5rfj8sP
	 qBFGJ7jZOhrUemFPQdY3GuTbnZ9Tcy0O948NOaWNp92zja8/3HvsEPDwQXwO5lakfG
	 Lp8avRshrUm2G/L0CF6u+KsL4b/b4JItR3lH9LpYwzqjlbuhIzWXdmkjW/xWIb50Fo
	 jehn/M9xrMB9w==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6d68de53053so378365eaf.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 02:09:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGi1tWcodPEzFholDr6wtFXtZIHkW9Owv023e0OM6DS/3sx2GoeEKsaGWxkweJk81mMt0NFRgm/fEQx@vger.kernel.org
X-Gm-Message-State: APuU4Z9dtcCDPb+oH96BKeE6w7AdObSZ1tE9ZLJi5+GB/FWPJZQEpxZx
	Ew/t/FsP3DoX2aF6bsArpYKxQ5Sv3wCOVBk1c4KtUSSrMJoxzWmKIf9rsLNuN7QeDmsCsZ9jLMM
	gpeXikKDckpsFbtaIVNARI6h0ozId51s=
X-Received: by 2002:a05:6820:a294:20b0:6e0:8fc2:84a3 with SMTP id
 006d021491bc7-71ab510c545mr836854eaf.39.1794564567683; Fri, 13 Nov 2026
 02:09:27 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-3-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-3-52d92843ad97@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:09:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLkcbCEvBYY3cdfM89kj3r6Nz-KSd25yypqom7TpbM1HHA@mail.gmail.com>
X-Gm-Features: AclHuK8B628wWVXl0NuYQCslLhyar4b72cZPwoixzCfMqUSGPYc6JmsCw2evP6o
Message-ID: <CAD++jLkcbCEvBYY3cdfM89kj3r6Nz-KSd25yypqom7TpbM1HHA@mail.gmail.com>
Subject: Re: [PATCH 03/11] pinctrl: scmi: send the settings without argument
 as enabled
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:58=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> bias-bus-hold, bias-disable, bias-high-impedance, drive-open-drain,
> drive-open-source and drive-push-pull take no argument in Linux, so
> they were sent with the value 0, which the protocol reads as disabled.
> Send 1.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Patch applied for fixes.

Yours,
Linus Walleij
