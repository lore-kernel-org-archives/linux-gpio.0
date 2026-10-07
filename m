Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C64D493D27
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 10:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369686; cv=none; b=NX03/o+Pr2Zu6HXXq+iB89jY1BwVPggpIHKgozgjNHt+8pdzQGX+2/h+XEmoSnlrLUDFG71r7wCD0CA9cZAA9vyoz/rTX0FCbC0btq9ddha6k3qt/48lg9dNfLKX7Kkbne/w4pSU+9lugcahI0Mcv+y2hPNbhEPNG4GVH5XUQoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369686; c=relaxed/simple;
	bh=3oMHpMKhoLQpfSFlB3aZJUBRXv00LSeXZK7ZOAuEHfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TvKXzS8Tp1ws8ZUXru59/zfBn2tPTrJlvEAVEgCAdvKv5yGrH6qNTbw0i5vG/eQFk+FDn1+cA9zlZhP1ffZAFXR+ftCY2Buo8SSENKwo1LcYd9iizPBK617fqKhVLSpmoAyeGQMnM9QggbAu3W1HVKjCL33lcMQlu3T0tES+0nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ieL86LGL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ieL86LGL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CE51F0089E
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 10:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369653;
	bh=3oMHpMKhoLQpfSFlB3aZJUBRXv00LSeXZK7ZOAuEHfo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ieL86LGLtBk0DR+yFpYgHqkMdE+QcwfgKPCCG93zVD7XE6FO342jKMBZvEZPw5F3g
	 UEYUglVtQTO+lKWfViWX2Gevgb5nw9k6mGHtBO2kslbtcLj+Zg4ncRSfUpcRwO9CR4
	 kMwMm3dMQtSMGVh/mlo4WeuCsJfuqMkrn5Krr34fIXjSW1U35FGc1SVhd+WZ3HHjG6
	 jfLXT7KlwlvB9+PtNrr6reoemsIeWXoixZPrpCycY8LECbyK2y8H8E0iRkxqd05UZw
	 rkpacFTkErwYf8pKqGk4pQ8SdLkLor9BJnF6YRSgckuEWJinrC2mnCNAk9IyZJZHZM
	 /jmRrKdSjVLPw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a87e23860cso18934241fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 03:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwGswe/fLvcTMOY2sQn6WS8dD+nwQ2Ynm1IQROcSVcAYfCx/e/uiQYiuMTnhp0u5tnrmFvDJDbj0KX0@vger.kernel.org
X-Gm-Message-State: AFq9FYI876ji3fX0lYxoVhTcJwvztB/4rJhu1dkX3moLT159zgRfQ+1T
	4wkzTtyg8iZRgsFJxDAkXQbSN+XQUTEKa+x9gfcU35oKCkWE3bBPx1gzXhqdV5hZ6H/E80OUGBc
	M0mDPUntrVIUVtPrYODEk0r8bpkguz2c=
X-Received: by 2002:a05:651c:345c:b0:3a8:7caa:cd4b with SMTP id
 38308e7fff4ca-3a9a2cdf5abmr3364011fa.7.1791369652676; Wed, 07 Oct 2026
 03:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004192921.2460405-1-praagarwal@nvidia.com>
In-Reply-To: <20261004192921.2460405-1-praagarwal@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 12:40:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLnqchXhjy_dyjiWRLPC_jtAUd1XLFWHWeyspnjS9yhv8w@mail.gmail.com>
X-Gm-Features: AclHuK8d2cs3SCmdYkC6N9ZbVMyzRLZiErqItqUs4RH_74jKkII334w_rIwe70U
Message-ID: <CAD++jLnqchXhjy_dyjiWRLPC_jtAUd1XLFWHWeyspnjS9yhv8w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add Tegra268 pinmux support
To: Prateek Agarwal <praagarwal@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prateek,

thanks for your patch!

On Sun, Oct 4, 2026 at 9:29=E2=80=AFPM Prateek Agarwal <praagarwal@nvidia.c=
om> wrote:

> This series adds pinctrl support for the three pin controllers (MAIN, UPH=
Y
> and AON) found on Tegra268. The pin, function and pin group data is
> self-contained in the new driver.

The Sashiko remarks on patch 3 seem pretty serious, can you look into
it and address it, or argue why they are not a problem.

Yours,
Linus Walleij
