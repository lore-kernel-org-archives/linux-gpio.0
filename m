Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157BB26158C
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884286; cv=none; b=tJ/9b5tNFcLg8DcicGr5huvibnds+687MYl56OpmGdUkC1NEv4jOCPl1wNKfx9bD6/zBI/GMHYAa7fa1Bl5bfP1YrzrY8S9luCzUmwZ0eO4swq4P2erykrAxbz0+24h6rub/FGNOk6HQSdjohA+0Jp/mhZm6zv/5cOCsLzZlrWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884286; c=relaxed/simple;
	bh=v0UV+UoiQ0o1JqhjRmQwXCX/FhB7NdaVFJa0JmT2ZO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwagAKEya7GQeNbrfMaYJYQIMB4XaDPHZXzvEnZWXzOgX1BAptZsDECHww4MMcMLuGIX05/RfTSp2ZYv7GE5kZJ+v871VR4VyRle+TvN8xN9Lo5lwPdK2WcWgJOYpiJ0iuymdsGYsH8/BQZBC832DfVIfm/K/4kYQYp1FcW3EkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwwCvXS4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwwCvXS4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62B21F00A3D
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 12:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779884284;
	bh=v0UV+UoiQ0o1JqhjRmQwXCX/FhB7NdaVFJa0JmT2ZO8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SwwCvXS4QScB+BDLZZdsUxD+eygE8kIj1OX7jbwPUwjvSDxFvspG2Mh9CmAu/WdPb
	 2tEoWhRI+nYz73tZJoXhQV8fuH+iMyD2q9vhwhykdCScxX8K2GUC+vdorEn/afKe44
	 1JzBoBxmRSeinU48k6+nxudKGsHN7ClR+iH9snR7SVXs4q/eRUrMcZnUZI5TlcbLm4
	 voatQV4xfGvi1Ny4dGvfYMJ//PY7kBFQYXGToBVV1kzMKubDDvjVRtCfIfagEbiy0C
	 pTzd0zhGqf1qM27QMarVVcdfwgKYdU92L3Tn79LdyBWYdUhO9vcVN3NXGoI8ZhRTm6
	 S1LtHi+/v55OQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a877510541so12660468e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 05:18:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9qINSV2n18rFCyhJZlVX0PstfPBMQHmoizbiY1oTabSlqpM5yjiT7K/wPpNLh03aXsVp33ELVULmKJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzqKTNP4sReo+fopK343SwCeMxTxfVP5ByojXjGwz6y4ClXRkm3
	2nP+qn950WirfisiH5ue5/wl5vTXDNkw5tYZKPx3Nfo5jsXqdcY/WcvAuMvQPg80TuX53UWk2T7
	0rHofUGLlQXlDqCA/c5LxPHtibD9+2ec=
X-Received: by 2002:a05:6512:1286:b0:5a8:e5b2:c81f with SMTP id
 2adb3069b0e04-5aa323bc3a2mr7731477e87.27.1779884283417; Wed, 27 May 2026
 05:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511031749.32643-1-a0987203069@gmail.com> <20260511031749.32643-2-a0987203069@gmail.com>
In-Reply-To: <20260511031749.32643-2-a0987203069@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 14:17:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLkob7uLjSvZ+sMJo-Ry7hqE+4oivNErUtccrHZ279ORnw@mail.gmail.com>
X-Gm-Features: AVHnY4L2ohXmrKtTGIZ9dDWTgI6k7yLz_jdtjFDJEj-XWm489h4BZKcPHEY-P9g
Message-ID: <CAD++jLkob7uLjSvZ+sMJo-Ry7hqE+4oivNErUtccrHZ279ORnw@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: nuvoton: ma35d1: fix MFP register offset and
 pin table
To: Joey Lu <a0987203069@gmail.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 5:18=E2=80=AFAM Joey Lu <a0987203069@gmail.com> wro=
te:

> Each GPIO bank has two 32-bit MFP registers: MFPL covering pins 0-7
> at the bank base offset, and MFPH covering pins 8-15 at base offset+4.
> ma35_pinctrl_parse_groups() computed the register address without
> accounting for this split, so any pin with an index >=3D 8 within its
> bank was written to the wrong register.
>
> Also fix the pin descriptor table in pinctrl-ma35d1.c: switch from
> sequential to 16-per-bank pin numbering, add missing PC8-PC11 pins
> and their mux options, and remove the duplicate PN10-PN15 entries.
>
> Fixes: f805e356313b ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO drive=
r")
> Signed-off-by: Joey Lu <a0987203069@gmail.com>

No reaction from reviewers so patch applied!

Yours,
Linus Walleij
