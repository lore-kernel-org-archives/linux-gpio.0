Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301331;
	b=m5YIe9UgC9sFF7pWgqRtTCphDFvZarDxCGuuXdUwHffB9c/GZdFO3fgeQObLjbFwgvrz
	 tIoz/TEHe4Ku/R+b9gH0qx7yXJdHDGDkcmvwmUiBtCtW69r0nqb+m4mIlxtVgJMadt0Jr
	 +1YAniV2miaZGVhCniMtbuXgRUiJyklzu12XRG1ahT2aK0ofdgMeb5vN3O0QfxPm8z7wM
	 uost4gRnjvKOCY+JPyUCFkwqVYXvGWGvpgnLjQbMU24qMfpMQW0QcQQTZkQrRy0QcK3Vm
	 PL1vXqqU/2So4nYYtO6j8zPQV/gWiOGGn5VGnNPOq2NtgdQOlWHwVXG5mmqxisWBExQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301331;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=0feKYn4IuT9oXHR0qsOKQoIAbzn0aav/6kCm0eFy9b8=;
	b=lzZjLww+Wqi4sWMSetvm/GBgPXz1tQ8T4QSp0LFO7LdxDGuLSy+xbZ60/6xIuKTPPps4
	 3r9KjzmaL+9wS3TVUvgKOavkmup9zSGNKskjtQM1ypuDiDhJUEfzdiDJKlIEg1wXc/ErU
	 YLOyOgpXEevdOt2LZvjL1rzHnCVwy61gD0pdsyeAbD1HOHOJukLJOWPCz5TFOWNMGQvSQ
	 qA8XlKJ0yT706VULTPCcpvlqKL7hr0rP7bbwMTOTiqz7hqR2CrNz7bqtA4UcRVjgmBE8v
	 g7w7O3wb/IJpLTberVzjYO1ubg9enYChA+x0Sd1FHj7f23IZzLOEZc0Hi1S9XTgo2Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+jCzACp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id EA3CD60A2600;
	Tue, 10 Nov 2026 09:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+jCzACp
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A29BC1F0089F;
	Tue, 10 Nov 2026 09:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794301330;
	bh=0feKYn4IuT9oXHR0qsOKQoIAbzn0aav/6kCm0eFy9b8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U+jCzACptpl3HuHW1BlG8AwUAusLrz/EdaxxbDq+kEJJ0+5w0nbSsRKjzUGfL+lLU
	 rmLdX7BOk3UU5zqPBRhUD5vokJYkYq7+A04K+iJcAppzzICx8tDHXRjpGT5RNZMSay
	 d23Ro8EsfuJKw7nUPLwE58cCbUMWT3/FRjaQR8YmOsXJ0cB3csEEtxqbc3Ha61aGg8
	 WC8ZEriJrpuIxLxjwquui5c5wFl42N6wpYrqR/JWyRJiTlnCdIrGxc3P37Qs8AeFsh
	 afPUWbeqT8lRFhCaAA+0lmo/iNzFhh+D4suEwclyEX5QofhN/T7scckPJuTC7XbL0f
	 LWKWEm932uMdw==
Date: Tue, 10 Nov 2026 10:02:06 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] gpio: ppc44x: tidy up includes and probe
Message-ID: <hqfp4lf22l7esbdai6blwes4yen3zdmwpxivceoodl4vavezrp@fmpo6s6kbher>
References: <20261104215959.24035-1-rosenp@gmail.com>
 <20261104215959.24035-6-rosenp@gmail.com>
 <cw32kfja4uifaotvodb7cfxrpzawt4zqcuzf4k3hvjgxwutxqu@gyaayjuyq3j4>
 <2d9d1da9-0d2e-461b-9c9a-eaf3dc512035@kernel.org>
 <CAKxU2N-oA_EQ-nC4y6E+Y1XCaai_QNmicobvJZ03mRRDikZ5RA@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N-oA_EQ-nC4y6E+Y1XCaai_QNmicobvJZ03mRRDikZ5RA@mail.gmail.com>

On Mon, Nov 09, 2026 at 12:46:13PM -0800, Rosen Penev wrote:
> On Mon, Nov 9, 2026 at 3:30 AM Uwe Kleine-König <ukleinek@kernel.org> wrote:
> >
> > Hello Bart,
> >
> > On 2026-11-09 10:01, Bartosz Golaszewski wrote:
> > >>  static const struct of_device_id ppc44x_gpio_match[] = {
> > >> -    {
> > >> -            .compatible = "ibm,ppc4xx-gpio",
> > >> -    },
> > >> +    { .compatible = "ibm,ppc4xx-gpio" },
> > >>      {},
> > >
> > > Uwe: is this in line with your recent cleanups?
> > The change is fine, I'd appreciate to also do
> >
> > -       {},
> > +       { }
> >
> > at the same time.
> {} was done by clang-format IIRC.

Uwe: you may want to update .clang-format if you care about this bit.

Bart
