Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ED8286881
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013752; cv=none; b=ijgDCrXVoQbUfS3fr5bFgMpBsZHRks7kvrPzcDjV85XkRXiXAuqtCpg1r5CTjDW52URTooE5PWNuKNrv5BVSEtynJNb+Cm7F17aJSqPud9IqJbRZt+zX/vIV3r11TKRXghp1Gk4yqtd6Cl07YZuW6uGdkM6koYAwHpn5hYQCySg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013752; c=relaxed/simple;
	bh=x+Q+mpwKpWdfkCJjdjeyoSi32p/Cj9EkuzDU7dEgYwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sf7LJJdKmFtZ4MdY7EvLqvPCkY0zkX+Ea03KvSTz/eZPt/LARVtOvD4hGqGiiqIIksleBMuGkpsWx2J4mgCuGIIK2+x7LxW1hr6WgYKE1bKeNtnaLb9vj9GmShJrWIBxzsX+HNawAAfgMLjoy+VsoIJrsJgkrrZ4kAwcIT6ZB4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2DM6v6L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2DM6v6L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6E1C2BCC4
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774013752;
	bh=x+Q+mpwKpWdfkCJjdjeyoSi32p/Cj9EkuzDU7dEgYwY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N2DM6v6LQAGOwaxB/tWrgoPPj4Vt5j9wHVhto2/PrIBxYnksi6O5jeSWw5Q5cOlpu
	 1/nEOk7uY4TZ0NoIVRa5Wp1gAyGfP7go6uhVPrHo4rjBgGdVinqw808/0blFBZ2CRk
	 8XzrEVuoSS0sVXhOsQNJxlqaM7y+SHjdvgrq962c/a9AGw4fiCTyXbl4Eb2qS1sGSt
	 AV8mMvwjJUGgwT0P6QDI9gY4B5dikgqWb+lqLy1AnLSFfY+5KKb2fwn9eDAAuW4ChI
	 B3wMv8L+5g+ksGxHGuvW9me2EQlmOIeLWNNlNTxeg/6nRuk4HxGs4dynEoCYr4ImYi
	 PHMKquc88ztzg==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7986e0553bdso20459937b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 06:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQJttpLn7eDD0EDtFbHOVzryeq+9Fp+HobqegxG1bAr+UcEv1MrcA5bKr23ZnleZOKTpgy944svXRG@vger.kernel.org
X-Gm-Message-State: AOJu0YzQOfWm/Jlgp7iTl3EvRfvVtjLJo8Yd2MPfSjkA/wFWj6OKJcmu
	4YjTg7L4ibqDOK7WlWGvvJR5Wru12zug9OHMdirdLNA7/S+a097cSCsqEzS74Fr59KtwxsVy2la
	LbP6qdafe+Hew1hCQTx5jGQcYyqW3jhw=
X-Received: by 2002:a05:690c:6d81:b0:794:6fa2:a037 with SMTP id
 00721157ae682-79a90a92a96mr28577437b3.8.1774013751143; Fri, 20 Mar 2026
 06:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260319141515.2053556-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260319141515.2053556-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 14:35:40 +0100
X-Gmail-Original-Message-ID: <CAD++jL=5HyZ-Z18iJPzrQY70dYq==z-nofx+O=wfTxYrfynZWQ@mail.gmail.com>
X-Gm-Features: AaiRm51wCIQ4YFUApl9fDukQ-YQ0efzADwWtEvQ8dtpStZjJJL077i4VFyJ5keU
Message-ID: <CAD++jL=5HyZ-Z18iJPzrQY70dYq==z-nofx+O=wfTxYrfynZWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: renesas: rzt2h: Add pin configuration support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 3:15=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add pin configuration support for the Renesas RZ/T2H SoC. The RZ/T2H SoC
> allows configuring several electrical characteristics through the DRCTLm
> (I/O Buffer Function Switching) registers. These registers control bias
> configuration, Schmitt trigger input, output slew rate, and drive
> strength.
>
> Implement pinconf_ops to allow reading and updating these properties
> through the generic pin configuration framework. The implementation
> supports bias-disable, bias-pull-up, bias-pull-down,
> input-schmitt-enable, slew-rate, and drive-strength-microamp.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
