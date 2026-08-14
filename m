Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E11B3E4508
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786691514; cv=none; b=qk4txdkvE0epIq3tD1TCtgzSgN3eO0y+u2veV3bNHkze4pw4JJP8V8zPyqtC3cC1KUBxYQCJW8rz5xl0it24W2P1fncvgGcL7iMeGGK51XL8ITbOeFDQ04pU9i99Y+NNljWJ0WxtB3h38OAzgPopl89rAeDY37lgp3rhQy9pSgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786691514; c=relaxed/simple;
	bh=oe6TFemgW7Xqh8zpkwUeJGiu2zlIIPM4zRz+Y9hHJB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INcwSRVY+AuBBnuhPCjPKk0J4sh3nISy0fQCNrQ8JoBku7gVg2CoH8d8e4j+PoITECio+dowZv163N37eYk1aVDh0DYv8KLSRC1byJw/7L5C/6bYId2AXoryp/rPvn4gdQ+B2a8LBzoHEhURAq0aNA0vngQpwyoY/NpNVnG8O54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBu404+y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBu404+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4FD1F00ACA
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786691513;
	bh=oe6TFemgW7Xqh8zpkwUeJGiu2zlIIPM4zRz+Y9hHJB8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EBu404+yCZUzCuJU4eeoo+D5zVlkjqIFu9yu1+pvrl6K5uIdftKL9q5X8MTgZHgVK
	 gLrlcGSGQrp+1Jr0hLoE7/MpMc6+MsqcdffbA5i2md+XpZzpXYyZjf/dbk4o3XYRe5
	 wOKpSA1dbG027qpW1qmCFANadTNdsOtf2hsC7FyyodLr7pob7OvjvoOLE3gvGDx0St
	 kG1KaqOTz+GyGAvwVEMAndEoLSJtelFcB529tYbfbP1ekvDKS9SBdZdHeD7OxTTD15
	 sNqwVHgihI+3mGKjp4croXOAgaosLPcWHPDvCrv2/9wA34opOwgZId9d48b+HLPyVd
	 9w6kxYSSY7gNQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so755384e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 00:11:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoKbZlQ8ECB5Q4XEvh9cnAdLazKe9x2SBWYmoOP41duMF6j5t68poPLWlL4BRQ4m9L+N3XhPEpC//3y@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo5T6cagNPy5TtuTs1T1sbU/jnv6ttB3COhRBLN7fYNl94LtMj
	dx+Y8TvJTVdSIyCEge9lOjT41+lMS6q3czi16SQeA6mXwCVn4HH5pfzTdgl2ccwLfsujNLrVtHM
	95kizkaK5/FTyDf8b1eDSeYERrbnz2QE=
X-Received: by 2002:a05:6512:150e:20b0:5ad:68aa:8a78 with SMTP id
 2adb3069b0e04-5b453b9adeemr1676478e87.5.1786691511886; Fri, 14 Aug 2026
 00:11:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731174551.86367-1-challauday369@gmail.com>
In-Reply-To: <20260731174551.86367-1-challauday369@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 09:11:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLm8bCWsQPcOrE5vEnLU1hghirv-RgnDpYNb4kwaRcKhNg@mail.gmail.com>
X-Gm-Features: AcwNN1VR9dA2uycWXeOfWxjBU-gqnztqsD7n_MUZQrz9Si5mIM2KHBCLSvLnt0o
Message-ID: <CAD++jLm8bCWsQPcOrE5vEnLU1hghirv-RgnDpYNb4kwaRcKhNg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl:
 Convert to DT schema
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	skhan@linuxfoundation.org, me@brighamcampbell.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 7:46=E2=80=AFPM Udaya Kiran Challa
<challauday369@gmail.com> wrote:

> Convert Microchip PIC32 Pin Controller devicetree binding
> from legacy text format to DT schema.
>
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>

This patch (1/2) applied to the pin control tree.

I don't know where 2/2 went, it's not even on lore.

Resend as a separate patch if it's still to be considered
or even exist.

Yours,
Linus Walleij
