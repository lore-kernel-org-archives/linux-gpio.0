Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4B43C871D
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 20:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786738637; cv=none; b=RFVR42gNxeMKNWihoZ1YKI4KL/N3TEpdeBCAb//8Zfl1upXy15bYTIho69uyvJxkUt7qlrYE7eUbagJIv2XhrUH7XxXj/SLnNrstt3viuzqPC527F8PRNP+2saMm1TPewbZ4eioLU+odbiV6ylE2PgrKLClm7/+xuIxxJYCbtdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786738637; c=relaxed/simple;
	bh=0tpE5kbVn5FysdUkDs5gDFuGs7MOAHBI2JyAI3zHkv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gU0BA0x9SKMaTGY2B7YNKooIcqSYFZl7U1xGYQrR8czTHXM4iMBKcaBhYzSB8TeUag7UGYLctNi6dRRsEHFJuj7DGk6HHHG4EJ+Xzuo4vG/LWULxSnZupKk78lJmrMswDU9/hwTxqbu2v8u8pgaQ71xAAlppcpr93/BLKYrD8d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbH+03J9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbH+03J9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C12E1F00A3A
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 20:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786738636;
	bh=0tpE5kbVn5FysdUkDs5gDFuGs7MOAHBI2JyAI3zHkv4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EbH+03J985tUN6EBv2Oy/zi4uGP+1pGYxRSoFK1TaGSA5Q2QerW2t5Y4it01pLsXq
	 HdHswp/xITkHItdB7xC9tsJZAXA3lHOwtuxKqGp4FUIkk6ltlSk09lDu+aojcX/plx
	 J3YbDTqkt9CUoN1SsQXT4p3fvmAaQ4OKvfWgOLis8bFZBQoOcR2tyjQEOA0A8tekLr
	 NTjLI4dkYMvepG2rMIp9lIYj65WD0cRbWVHjANxJTuPmnpDh91DUejZ4ycN3rexczM
	 iVIi0EVJE5+ilTvviBgP3Z1YXfrpL/FhYiikUPzee70DxyPUgWjq8gLViHwV5mXT9s
	 QY3Qh5RdbXwFw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b159850b16so1366958e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 13:17:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqEfBfjYxF/GGeGScf2aY1GcypyzWHIXp48UngVgXqs5izYG69DR0nmmwg3cYJsP0CO51nKykr4AHiR@vger.kernel.org
X-Gm-Message-State: AOJu0YzIwagRSKOeXaU5CPHZF8niHlJg9DBRxgDKH6xbPTU89KRE0sqx
	y5Ub/kOV+r/qoNr+v1qfcYqQsRmYEuefWmUXup07EmtO+Mjvb9Nc3zDCaOTi6o806f8xAPUIZkS
	gTnILdUOc2al2UdC5KVgxtuvafGxADVQ=
X-Received: by 2002:a05:6512:3e1c:b0:5b0:129c:ed76 with SMTP id
 2adb3069b0e04-5b45913b9dbmr1575455e87.29.1786738635414; Fri, 14 Aug 2026
 13:17:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812103621.1096140-1-egbostina@gmail.com>
In-Reply-To: <20260812103621.1096140-1-egbostina@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 22:17:02 +0200
X-Gmail-Original-Message-ID: <CAD++jL=v12Sa7Rwwp6YjPV6V1jg86m=mzWxMqRCB8L3qe4H9pw@mail.gmail.com>
X-Gm-Features: AcwNN1Va7cLQlkMZSoKgAsX0-hFhQOzOsoVfQcjo6LOAswc2jmNPAVaRoDpizDo
Message-ID: <CAD++jL=v12Sa7Rwwp6YjPV6V1jg86m=mzWxMqRCB8L3qe4H9pw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: Convert TI DA850 pupd to DT schema
To: Eduard Bostina <egbostina@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, daniel.baluta@nxp.com, 
	simona.toaca@nxp.com, goledhruva@gmail.com, m-chawdhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 12:36=E2=80=AFPM Eduard Bostina <egbostina@gmail.co=
m> wrote:

> Convert the Texas Instruments DA850/OMAP-L138/AM18x pullup/down
> controller bindings to DT schema.
>
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>

Patch applied.

Yours,
Linus Walleij
