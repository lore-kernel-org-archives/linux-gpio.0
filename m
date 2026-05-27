Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE2C2F531F
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887681; cv=none; b=WaEyE66V47vi8IkF54q12ds4M3ZUFV/mQ61ia6upnYcm2h9CQpyIySVTZogWQ6QusF+HmTYQ6shBmFDFXFR9OY27FfyS7xXpNaJHkJGDt2ECL7apquJTxU+l4zwQk3GV7byniYJnufHopIk9gnOl98nXpcn7HPuqjxXA+uAmZzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887681; c=relaxed/simple;
	bh=1vrgp85owHu1dL6Z8Ia4FmtzmMQ9yTg7BB6WjyWhTFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/k9r0tcDNAMeOyXylnnxBzdkR2Psx7cYMq+1gUWeoEyq9whcgn3oPXFmAC5JFKj8blL7qmtrn4Ym/hSdDnpb6atU4fIkZCrQD9OoHRFPodhsVGH/lqQ8QGNnZ09Myxe2tbqHrYDmWY7rrEDEKLFj9sqmVve2/nt68qytUBLAEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhSV9zBr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhSV9zBr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491EA1F00A3C
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887680;
	bh=1vrgp85owHu1dL6Z8Ia4FmtzmMQ9yTg7BB6WjyWhTFY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PhSV9zBrI2i/TQiLcXQuLrA1lzubGFxrBd1pSvj5AgcPTf9QuAubVOnrJrdV+JpI9
	 gNhykdWzTuXzpLv37i24Sc1uDDaCwTsy1qlCcE1eCV+PVBAwqqcZkeUqiMHtI6DQjy
	 UD4/2kHGO0l9legA5jVR72MkKxcBdBONm034WjbR5WITom4NGyiBQjd7DGTWB2wkc+
	 CM+E5koABCp/j81NC+VBux+/7964o13Fvd793abybgxQK7QMCgq45hjO4d5c+CZaKl
	 qFul8iUg7eZpoQi/3qETUxqn0haULLkzD79NcYgr9HGm5Xnsly3IKu8fTO8XGh9ieA
	 wqaRVmqzPbl7A==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a8f9841616so9616031e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 06:14:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+eGnBH/toJBHaYErJ4tnPyaaOY+x0JW7i1kqaIOpXs6nC358hruNkU8emaJAj3PYaVd+JaveQgqFC5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr9O/nDneNfI9xU/8y8uBcDwECQRCZBB24ujNVw2fQR/lcnb2z
	oyNFECMO8c6W5mobyuYLx05IbXliIaeeoK3jnawI4yseSCx8Zh6Y+mCGw1OiZ4P8hv1MtH4U41G
	oRffbiZL08f7OybIZE5/Sdh80qxUUqmg=
X-Received: by 2002:a05:6512:3ba9:b0:5aa:fd2:ae35 with SMTP id
 2adb3069b0e04-5aa323c48e5mr6937859e87.44.1779887679035; Wed, 27 May 2026
 06:14:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511182943.228154-1-kmayur809@gmail.com>
In-Reply-To: <20260511182943.228154-1-kmayur809@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 15:14:25 +0200
X-Gmail-Original-Message-ID: <CAD++jL=fDH4i8citFqq5oJ+8XmjwTQuJwcx9jb=Xk87Lbz1=sw@mail.gmail.com>
X-Gm-Features: AVHnY4JbTRgP44-fCqdEeS1UxF1yE82Ud4fqlzZdp7QmX3gb7_seMluRj3XBoU4
Message-ID: <CAD++jL=fDH4i8citFqq5oJ+8XmjwTQuJwcx9jb=Xk87Lbz1=sw@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: bcm: fix SPDX comment style in header
To: Mayur Kumar <kmayur809@gmail.com>
Cc: kuba@kernel.org, alexander.deucher@amd.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 8:29=E2=80=AFPM Mayur Kumar <kmayur809@gmail.com> w=
rote:

> Header files should use the C-style '/*' block comment for SPDX
> license identifiers. Correct the style in pinctrl-bcm63xx.h
> to satisfy checkpatch requirements.
>
> Signed-off-by: Mayur Kumar <kmayur809@gmail.com>

Patch applied!

Yours,
Linus Walleij
