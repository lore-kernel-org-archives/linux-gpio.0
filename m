Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2A8379C26
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 08:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091490; cv=none; b=hNYGl6HeBzhBxKMKZ/nf69Sdj50dtAdNu699lKkqBzZ3QljudMvgqF7Y9dOuR3DycUj0ZfewUN3h1OGgaZ7Q2ntUyCPmxx1cH2Agsw1iD0Zw6s/XQbr2XiWpegUYNtD1RYzEc+4elwlfNbXMVc6o4Ei7cKB0Ey4CdwUJsR/c1hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091490; c=relaxed/simple;
	bh=IgWeAA0q81uEMtscWHxL7SWJO/Ks4JEhZ0vz8uGK9wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SUQo3iQWA1dU7uQotRW2r/AcnE87UQos2O4HTqr/s7lBksdUOWVFMNKakXKFUbw06ZW7g+xYOfWaTohbm6Np+vLhsRHeFc7SMZwjJUtNXv1p5mBADqdWVW/zCLOQAuWvK6yEcvTt9GigZr1fjSxCpDJ1eZZRIlF+7P7kl8W8MfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elft96o4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elft96o4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC8E1F00ADB
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 08:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786091480;
	bh=IgWeAA0q81uEMtscWHxL7SWJO/Ks4JEhZ0vz8uGK9wE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=elft96o4yMBNuH6EQW/0e26ANRdMZECDIJIDE9Kcu3p59H8qejFoKHi7gfuajHM3y
	 xhwAsbJVDwio7qWGj0vCjN/3bKEjIBgQJTCn61N+F/A0XcJEk7rnNFcuvKlrLIq+LG
	 tFBTzslRXF21JESdHkMn1VnVGlLT8oK0jb86aBWq2fWjNcdmDRjPj0qJKpx9s4yvXF
	 87paoM+VDA8ICRB5sNmNOGOdsxVa3ZZf9Ad6u3fqJ0YYGZjklodWrxgtXD27lUg4Mn
	 ZrACNYgOafY9E9wZs9aP9kwhRxbCntWAHkVe75+n+qzPNGSPsZDT9C3G4gtxfG0okd
	 IMP6yJ5qB+TCw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b0148201fbso2786186e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 07 Aug 2026 01:31:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RptOFbAyrJ8rc7ZToI2IZfV/8AKxCqOKnDCOgM0xM+TvhTXWnI2qlQbr5EvBj61AHcHa6kIizXV5/iG@vger.kernel.org
X-Gm-Message-State: AOJu0YzHeFBCNmAT8HpPPhnymmAKT6oFGsnDDbAB+OW2+rCaXCHT+Ue0
	xGfH7Ba3EfViqXD2HJkytlhzngv2ZSwk3pueElgYB8L/oFTQfq+/TXh3dG9cHXDgmV746GvkukF
	JLAUb6ePHJ0+FYhs/gs2bTU//60Cyxus=
X-Received: by 2002:a05:6512:1156:b0:5b0:eda:de2d with SMTP id
 2adb3069b0e04-5b2f4c9ba12mr3805874e87.19.1786091478882; Fri, 07 Aug 2026
 01:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-ti-iodelay-v2-1-995f55f605bf@gmail.com>
In-Reply-To: <20260722-ti-iodelay-v2-1-995f55f605bf@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 10:31:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLmUtZxMyYn252FydiauZo=z3FwLyfFN=hGrG6ZyUtDhxA@mail.gmail.com>
X-Gm-Features: AUfX_mwbOoXWHLBy9X1_71vxqsW2a-FpUarVS2yR_8BHzr0tmLL4s763qUnh5R0
Message-ID: <CAD++jLmUtZxMyYn252FydiauZo=z3FwLyfFN=hGrG6ZyUtDhxA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: ti,dra7-iodelay: Convert to DT schema
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 6:46=E2=80=AFPM Bhargav Joshi <j.bhargav.u@gmail.co=
m> wrote:

> Convert TI IODELAY controller from text to DT schema. Document child
> properties missing from text bindings for proper validation.
>
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>

Patch applied!

Yours,
Linus Walleij
