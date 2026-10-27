Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110828;
	b=VRWCqOcPFOl9dLPqMI4MVJXGfZUTvpUmtX5+tuJw7V4XvS8isMwYlxibtJAeP7j5J2jO
	 JKhEcLYB1vJjaMQSR2STIC56MxKo01UMwKl+xYuzi6635pyNozD2R7spXr1IreHGw08G8
	 YVBB0bF9P+9V23CzX0YpojLcaAV1OpTkMNjFLfn5C4oEtWl0m8mV3Z8TvI3GJyQ0VHqQZ
	 peIBxrM26BhP9bQT7z4rybs7tZLVsMc6ybvR1yEVRbb0+LANXaLp3kvstd/tPAk4oGr65
	 tN8b4fQd2e2jArkN+9ExcikdQU1mRcNk1L6/23p0dQucpqqKteOgRhs6mn9kZcXTinQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110828;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GGNr41yBdTpZYx2SDxAZUmAJloAwnOll1e229XCkLow=;
	b=BvV8SPHmZQMlDkWtqZYBixRPe363/kNYjWIKh6MOJ8a5RljdCKtU6Nmww2R8DjNkTYk1
	 KMyItNgMSprKNDKTev26BDDMRN0OItMRu9E8MDN2SZFQaT1hORKNFR7wD2CEQx3ap2YJp
	 6Py/lBgjvJWYCiC+SK5ChfiIUxoCspdohvB1wd3c3hHShh8OivXNg3XASrbzkPU05g3Nk
	 3cM1jAwcDBXuDMdfcLN+kqwiPGsh9xj/bQuVCbCxEHDR+35y4pIwdu8ijvgUJ7zhMHTLG
	 XKrS++8qFvx7mBU0E0jVuozlTSHGE7e049FsOhVLcJ3+lGnZadfJGmO8uIhXl9swwig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I/3197F/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E02606A31A
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I/3197F/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9CAB1F031EA
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 14:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793110827;
	bh=GGNr41yBdTpZYx2SDxAZUmAJloAwnOll1e229XCkLow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I/3197F//5bf406jcAf97sCVxQOGKU6UQ+ppRF4YfsIIKbMuoTYo9LTj5Sjy3AD8w
	 KzUFb/HWCvyqo6L0w0RA7Mux0i2L9tlWeNARzqQCoTEuRvWNWYhZUgP4kshPwZnbqR
	 qLTdSi5pTD64Oq88TgupSzSmf5UvVYDrrasz4m671Snyp+Qd5JLlhhCzeJ6yacD0A1
	 ot3I4+kOrMBuvLutRTGJ/d8Tc0Og1ksLmp6oy4CedyYgX6NINvi1kEE5e0iYTsAhic
	 BWtWbqRrF12zvUIqmwHD09OsGL0TYIP5ow6FProRbLMo8vvbOqpDP+oG7cmSY0LqTR
	 dCULZxEgiBaxQ==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-49e1251674cso1490931fac.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 07:20:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz46Sa4JW7fkW+fRw0DzC96wGR9vrvzIMXqo+EfCDdsO+Q2BKTzuWEYhsEjG2kc1FxKVu8xy2TVKN6p@vger.kernel.org
X-Gm-Message-State: AFq9FYIz2YkwOQv4nfBXdZNHadsnbvCLlf1f6fMUmxCZgOOsyBXWaaZo
	i3K2XLRwADZ77sfWATxJFl9HfubUBr/6+Vl4alvqrLZQ9mZ/WIzqWWUsgmDeMxvyVXY9Uc7P0jW
	g8x18MDavsyEEzaQRM8eAbU9OvSUTJXQ=
X-Received: by 2002:a05:6870:c2b5:b0:47d:b8a7:40f5 with SMTP id
 586e51a60fabf-4a83f533260mr6584722fac.22.1793110827181; Tue, 27 Oct 2026
 07:20:27 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <cae27d2d9dd17c081dcea27e3b223a8fb8653796.1792776697.git.geert+renesas@glider.be>
In-Reply-To: <cae27d2d9dd17c081dcea27e3b223a8fb8653796.1792776697.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 15:20:12 +0100
X-Gmail-Original-Message-ID: <CAD++jL=7GkFOS9i46WDuKHcJa0S-VemJ1OW33H8EKK-SZ67ufQ@mail.gmail.com>
X-Gm-Features: AclHuK9MY21FRxc3OT2vCWHfUpZZ9cxWX59B-lOuZ_icl7P9J24tGPdGErZiGJg
Message-ID: <CAD++jL=7GkFOS9i46WDuKHcJa0S-VemJ1OW33H8EKK-SZ67ufQ@mail.gmail.com>
Subject: Re: [PATCH/DNI 7/7] arm64: dts: renesas: r8a78000: Add gpio-ranges
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 7:55=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Link all GPIO controllers to the Pin Function Controller using
> "gpio-ranges" properties.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
