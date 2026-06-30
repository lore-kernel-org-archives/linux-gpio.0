Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6529F407569
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 11:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820385; cv=none; b=rKp9lLaTncY2Z9iWo9xktqCGnoREb1VsFsELXnahYm4k9SRJ8cCPFDilKmcGIoNXOXogucWBmTcDTcZSzQXCtu1Hlvm82Fbbtb7WM30I38B1KwvGT9Nf53jnDUrtBEMxrlf2F3zSqhXd37cva6CqGI+qx4SHaJYcCYvL+LlghTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820385; c=relaxed/simple;
	bh=493enOlPSgfL8Xi3QDIl1rddbYGRJGRVQ1cUt/F2sHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0/q27ecyHRiGPepbX8FEA9rVAxgIeh+icHs602YbeiEAi8sPzGCWMyV08MUTOmxh3aHlGx/dU2SUfukqbDY/jjE+SVfH797ndk9zXVQCdsSM21/9gflKGUXImy82B2yZxhSyVE18QGTxEA0znabhePFA3u0S3zQqFVMsueOW1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrlJJAyQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrlJJAyQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2113B1F01558
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 11:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782820384;
	bh=493enOlPSgfL8Xi3QDIl1rddbYGRJGRVQ1cUt/F2sHc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lrlJJAyQZ3DwijrvkQSaLW/aK3tq35nYYm/c5Fotxi0Uq/sxm/MTtkXjQNgg0Fgxp
	 KeYk1xrd8xyH45/0n3famjiuhyGtB6ePQFrOG+P4ANJc9Ou8bDFFyq+PNnitfddnlu
	 nn8vBTyx8KO13fiCz1xG/2id40eL/RmVJCjK3vGEmGii8y2HbrdEeYthuisNvkEIXh
	 CCCVjANnb6ziEZe65ted0H7vtlp+DAVwnUfFYjeCgc3a3U6n7+/78RExC2z3Wm3HG3
	 7kx01Gi09g0a+U5y8Tp+vSCr7ClStQFBUwDMXbdFuGNBF84FtfwlnzLaY2irwtKLJ8
	 R7rE517rnSYuw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39b28814916so1461751fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 04:53:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpIuZg7Z+kW1JlxiTysQV3fJ0SuyBfGu761pLNV3YtxG/4BelayorvDkAK+1nm6/fO4OyN+iNgE86H6@vger.kernel.org
X-Gm-Message-State: AOJu0YzBgYzWkHDB3LlBPW9XjhG+HtdmW1NIiQxTt06ihrNkU644BBVB
	nq57jBcz9oMK7nhZtFSkRLdMkxPF4U6v6K7I4EWVK/f7oR9Ny72pO7IU4SPyuFsMOV3ZSGbvx92
	GfTe6D6RHlgBGzp3CcuHMLpxJS7AI39g=
X-Received: by 2002:a05:6512:15a3:b0:5ae:afec:8afb with SMTP id
 2adb3069b0e04-5aebdbdd0bfmr741396e87.48.1782820382868; Tue, 30 Jun 2026
 04:53:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
In-Reply-To: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 12:52:49 +0100
X-Gmail-Original-Message-ID: <CAD++jLm3-5BP+1E_DLTZvEPd1ugMZrXiOjM+Gqnn9Ri+uNWuPw@mail.gmail.com>
X-Gm-Features: AVVi8Ccukh9jeKMJzDntWFmdET_gKKyPu4vZydSTvGPFTsmFqpaNo79r5YLA3x4
Message-ID: <CAD++jLm3-5BP+1E_DLTZvEPd1ugMZrXiOjM+Gqnn9Ri+uNWuPw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: aspeed: Make AST2700 SoC1 JTAG master TRST optional
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 4:30=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> The JTAGM1 pin group of the AST2700 SoC1 includes ball D12, which
> carries the TRST signal. TRST is an optional signal for a JTAG master:
> designs that do not wire it may need the D12 ball for other functions,
> but with TRST embedded in the group they cannot use the JTAG master at
> all.
>
> Split D12 into a new JTAGM1TRST group under the existing JTAGM1
> function, so TRST is only muxed when a board explicitly requests it.
> Patch 1 adds the new group to the device tree binding and patch 2
> splits the group in the driver.
>
> Note that this changes the meaning of the existing JTAGM1 group: boards
> that do use TRST now need to select both the JTAGM1 and JTAGM1TRST
> groups.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patches applied!

Yours,
Linus Walleij
