Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870782;
	b=DeCDnrjh5FWO/MWFOYIGL2R2QmPZGYnWtXEzoo2/cspRJ0IOJsopQg4g1hl8BX38fJqs
	 mmFwxWNPAZ0zROxxjcHULpAhHquJzuO5VT7PS9tfhjtnfY99mbq1df0WEzA8AXdquPTl1
	 xSwKDiv+VPcZkjIs5io2r3gXWb4gGhkj44tuWf5l5XKci4rVRohb46LbrWaCBEud1oBIb
	 lJ8epMEeSX7ZAX98ZdKQ+PmUBMoAdnUEMRPqveJo8lv67OgJGG/LnuzbOzCmhQkouMlzW
	 Vo7Ig/2kQ+Bm8oiXgInsGkl10qXCVq2WygX3hr7ljnbrXnPiP321arHFi/LplojuUHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870782;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5weTVNfU4RUIXGu4AdbAlzA0cfDEQJq11kojXW+pkrY=;
	b=t0PCpmloYppwT3AOPdP9q2K1sqwEDmgWWRRCtE7jBf2bykXkHUp9or+YjKKGD2nVyWk5
	 KQqksPAe/GqWvujnykumjAh3PULvFgK6/me13yAyhLy/QxUMEWq2zorEeJ6IyEuhMddyF
	 DpAO4s2BOb2CnADHbyxCPJjYfZP5KozwvKnmD65TytWOKwqVbSxn0G3j32MhyZT4R4VSn
	 D1viCGyR0LXlR9BaEXJFYgU7Rbagz2O6xqhePPb91C9Newqau4X7n/mjhr4xgu0MYSwrT
	 DBMTAZuUNyJ+VDJrJ6NmmignAGEc2qmOO1dFrPhexN8UQsy2CPDfRYDfhGKy4D1naeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbG3gRvn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8FD606A32E
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbG3gRvn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318B01F00A1F
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870777;
	bh=5weTVNfU4RUIXGu4AdbAlzA0cfDEQJq11kojXW+pkrY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZbG3gRvnER6mcmNZ78al8p9Yy2sUU9nAr67z7Iu0pOZ0CbD6QzrYO0YAVZOxtEz6U
	 OBYxMo4sEj9zh33od6kOmsZvuLCSVgR7j2oIdAXZNw0JkJ1Y66Dxlnuho5lLA0wGns
	 ilLArm0Npn8kEe2gSbElNRJ6zx6U/KEW0orbBvOkXKjU5ru6yfZ36aYFrNCInS1uOw
	 sOgA4lAfSpDqGbD2F+YIS32RslRYwvYzaQjaYyqEK37TkcIwUh1jZRw6zKyln2zhvC
	 4QsYlRIiukxWDgmNxXpTfYbOnnqR+r7uK1pDgFAF9pAZjPLd/7ho2jD3SrFRqrYJav
	 CvKGREnllCpkA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so1346683e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 01:26:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzYZrR1tzQTnmzAhjrw8q7eCxo/dj/ys6whF+flrKh+LNL0IJRj/XDL/eEIB3bQtCoX1OsqDwgz1g9Q@vger.kernel.org
X-Gm-Message-State: APuU4Z8YnS5kQyltU5zKCl5Qmwhm2MRNZG3cd5hxJVzQfzRZFC9QYs0K
	0lsP74ak6+8ffsPOobEFf0LocAebBA2DI2aU2WyeKtedbt6wmX+ccCQcT6HZDSnhc0JFq0sWBap
	QxIsvKBBhrl1doMtf/POxztSkHlh1rSE=
X-Received: by 2002:a05:6512:3da6:b0:5bc:f29b:1a5c with SMTP id
 2adb3069b0e04-5bfd956517bmr6620245e87.23.1793870775961; Thu, 05 Nov 2026
 01:26:15 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKNLDZOndyGxLSWgBDrq0Vfbt88Pa5S2MDHVcnkHzAH3TQDpaQ@mail.gmail.com>
In-Reply-To: <CAKNLDZOndyGxLSWgBDrq0Vfbt88Pa5S2MDHVcnkHzAH3TQDpaQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:26:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLkgFOGT54_W6gOnz+aWG4_q3XHc7Cr5_=8mcdv8-aTcXA@mail.gmail.com>
X-Gm-Features: AclHuK8CorVO8MUeqTFvv7Et7OujtWjRgY906_d19hm5pp_OhIMEqRRrkZlLLfw
Message-ID: <CAD++jLkgFOGT54_W6gOnz+aWG4_q3XHc7Cr5_=8mcdv8-aTcXA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] reset: add support the GPIO provider with #gpio-cells=3
To: Marc Taylor <marctaylor700@gmail.com>
Cc: bigunclemax@gmail.com, p.zabel@pengutronix.de, brgl@kernel.org, 
	krzk@kernel.org, andre.przywara@arm.com, martin.botka@somainline.org, 
	dlan@kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 4:57=E2=80=AFAM Marc Taylor <marctaylor700@gmail.com=
> wrote:

> Sorry, my mail client mangled the inline diff in my previous reply
> (indentation stripped, and it turned "https://www.google.com/url?q=3Dhttp=
://spec.np&source=3Dgmail&ust=3D1793850929317000&sa=3DE" into a link). The
> attached reset-gpio-3cell-v7.2.15.patch is the correct version; it is
> re-attached here so this message stands on its own.

Don't send attachments, inline patches only.

Check:
https://docs.kernel.org/process/email-clients.html

Yours,
Linus Walleij
