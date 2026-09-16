Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7075374A0E
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 13:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565394; cv=none; b=eL+B9P1d910IGu/c75Gktzn5f8NRdIlVTbMhrEJgpvt5Tk5se0jm0Tuy/85CoSartZvAQTu1RUZs83fMZQEyUFCjDJ6djanRPStb4kdUcdiFI/dW1Sppe9C1cLtwKADwCSN0mTPK4hw1Fp5djUZCYeSjy5I9CNEyLKr8UIucvYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565394; c=relaxed/simple;
	bh=IORbvXx/c6Gpc8K78W23rNHJdpN4+xG3DMovp/3gbmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6wCS6EsPyFCZfwOmbpEfjGkeLKVG+M43Ir51gT5mNNJ0GvB9cZV4R0hRZw+XslOZ5MdPs8acn6eo2bTb5AwyCpVhXAAY2fCWQM2zBHC5fAfREezhvK8PbB2Y5hAsQnawkv98Y14vtlBMtSX/F6Dyz25JFTRdXQm48M9CfXd9dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWrnUMQ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWrnUMQ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FD31F00898
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 13:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789565392;
	bh=z/P7t1wuWNLiDcXonxKrexE65u9JMyjIm7e9Rdjj4pg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BWrnUMQ88bd4s/Nz5kkkM+Eri8bZ84hiEsAP9Cf7sY+gzwua6EcpXYyDSqJ4VajPl
	 hwbjkh+NPz24CSDzFfduQpLJ1wbfbGO55wpcZhFG+ePEfTFRx3l7wJErGQYzdKHK36
	 zEY+An5zIC1QzLgAKlr2eSIleHn4w4YljrTkWQFcO1R+T7+k6IFdQ13fziqZ+isvsh
	 qzTIwNOPJUSvePyAzoGzH24Fmhu4Vlyi/5FhL5LseDI2/PjTiqPX43LLv6aKbjnxo5
	 WrsfUlQTQJNSRJ+Gnz6DXkCCfwXR/hI77Za+sSpke6sNUDX/0zCAKIM3C4TQPwhn2W
	 Dj40z9ICYDxKA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so831167e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 06:29:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByp3Bmw9gRlwgxSYbLyXDMRTqTn9/SBZxlFmMc//whCfTol6Yg2dDZRafhcVQH1JmQyzaEmbSzqn8WT@vger.kernel.org
X-Gm-Message-State: AFuF++nI+nh0A4oscmfmbj36GmCquESGdJWT7kvjHQrJNZJ5J9Zy3wuD
	EG1uLgabnaksg4sYgxQ11gTNhSIXx2EMvHLKHne8x6ORdfs7zmA+AtXNT1PAJSxZ9kdwxeIXbGi
	rlFWVdYg40JtZ5ZFK2CH73aiWjJFq26I=
X-Received: by 2002:a05:6512:1384:b0:5b7:58c6:d808 with SMTP id
 2adb3069b0e04-5b8b6643968mr754988e87.35.1789565391450; Wed, 16 Sep 2026
 06:29:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com> <20260906-add-rust-gpio-consumer-v1-1-24d192f93760@gmail.com>
In-Reply-To: <20260906-add-rust-gpio-consumer-v1-1-24d192f93760@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 15:29:39 +0200
X-Gmail-Original-Message-ID: <CAD++jL=pZG1ddc+v3ebeTKe-ZTKOTh-L0uXshaZWqOqyuqAYxQ@mail.gmail.com>
X-Gm-Features: AcwNN1XEpBQxV9-NVG6C5eZyZpBeebdnhpFCnie_jIo-7R_YWcKi8M1ApASGFcs
Message-ID: <CAD++jL=pZG1ddc+v3ebeTKe-ZTKOTh-L0uXshaZWqOqyuqAYxQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: gpio: add GPIO module with common definitions
To: Kohei Ito <koheiito.dev@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kohei,

thanks for your patch!

On Sun, Sep 6, 2026 at 10:46=E2=80=AFAM Kohei Ito <koheiito.dev@gmail.com> =
wrote:

> Add the top-level GPIO module with minimal common definitions. This
> module is the basis for future Rust GPIO extensions.

Describe what you want to enable by this patch.

- Enabling in-kernel Rust code to use things from the
  GPIO subsystem? (It looks like so.)

- Writing GPIO drivers in rust? (It seems like not.)

> Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
(...)

> +/// Describes the logical GPIO level, i.e. taking the ACTIVE_LOW status =
into account.
> +#[derive(Clone, Copy, PartialEq, Eq)]
> +pub enum LogicalLineLevel {

Neat!

> +/// Describes the raw GPIO level, i.e. the value of its physical line wi=
thout regard for its
> +/// ACTIVE_LOW status.
> +#[derive(Clone, Copy, PartialEq, Eq)]
> +pub enum PhysicalLineLevel {

No thanks.

We want to hide the actual physical line level inside the
gpiolib (encapsulation).

We should not expose the physical line level at all
unless there is a consumer in the kernel that absolutely
needs this, and there is none.

Yours,
Linus Walleij
