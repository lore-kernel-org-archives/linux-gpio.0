Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07DD381EB0;
	Fri,  7 Aug 2026 07:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088651; cv=none; b=VviFf5oP5ACDmqmu6yAoayq1W+eaSXm6kE74XnKGx/hmQbYeE4O4fKNhZQSi3oIO5Vr0s3wxdf3PACnZn1jUKvI5Bs7UK48aIGTBnpEtx/lzxoQHwupwTiDqsUsWBhgcydpZ2NuXF/UuESP1lk+tIz37/OoswWp6OuX8Ji4Fv+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088651; c=relaxed/simple;
	bh=zJDGvHNzyPJzBg2Gr80EJpq1olmLSKAd+7nnwt0Qai4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a9pjDoCaByZ4ohXl5Bw3D30LGEexvQ4tUBy48h+qTstQ9ZU++M7JXbgMCcjBQxSHLokXFr4QVZniVKa0evm9P7W157trUwM59RQGSmxKJBjnSjDnhmKw+xaY25bZ0eLk3Z9ApH30DFW+omotzMAvO68CAFcu8zDnGmNwGnUtjw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=i5nO0QXp; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="i5nO0QXp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zJDGvHNzyPJzBg2Gr80EJpq1olmLSKAd+7nnwt0Qai4=; b=i5nO0QXpBMJAJCP1h0853SVIfv
	njaw20WcD8pQ8I3+sEAYsbIBJ4KCRTvU2ppajxQtOv7g3+H4QclYwQBUtuwxCldVkVAQauJgBd1hP
	9E5e4+g1dbTvZpGuSS9QVGx57ttCKIJB34z1YHVnxV4Yx/I7b8PQm1fMzrpLlFHa+b2n/AbgLK9cu
	mf1bCYRANeeZCUKAHxjG9cfsPouHIRV6RGRemCA7cnbNQeu1A2FxbfDK8w25WgIZ2omH33+NLhbSW
	mZO9NANTrXx7qJVqUcHMFDsW8aekUJjxSqt8r4thJuCL3d7SSF9fVWVj3eyWBAgK+ciLCYImozMip
	dJYmY0kQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-gpio@vger.kernel.org, Vladislav Leonov <vlad@zlab.su>,
 Jonas Karlman <jonas@kwiboo.se>, Fabio Estevam <festevam@nabladev.com>,
 Jeffy Chen <jeffy.chen@rock-chips.com>, huang lin <hl@rock-chips.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: rockchip: Two fixes for latent driver bugs
Date: Fri, 07 Aug 2026 09:43:30 +0200
Message-ID: <5262877.taCxCBeP46@diego>
In-Reply-To:
 <CAD++jLn8nZT9a0Qe+wtk+2zJ5tPvHjAq4PDPt18ANWiyJPdXpw@mail.gmail.com>
References:
 <20260803141028.710706-1-sjg@chromium.org>
 <CAD++jLn8nZT9a0Qe+wtk+2zJ5tPvHjAq4PDPt18ANWiyJPdXpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 7. August 2026, 00:12:51 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Linus Walleij:
> Hi Simon,
>=20
> On Mon, Aug 3, 2026 at 4:10=E2=80=AFPM Simon Glass <sjg@chromium.org> wro=
te:
>=20
> > This series contains two small fixes for pre-existing issues in the
> > Rockchip pinctrl driver, found by the sashiko AI review of my RV1106
> > series.
> >
> > The first makes the SoC-data calculation safe when the probe runs
> > more than once due to a probe deferral: the pin count currently
> > accumulates across runs, shifting every bank's pin base. The second
> > aligns the RV1103B drive-type override in the get path with the set
> > path, which restricts it to bank 2.
> >
> > The first fix is tested on a Luckfox Pico Mini B by forcing the
> > probe to defer once: without the fix the second probe doubles the
> > pin count and no GPIO bank comes up, while with it the values are
> > recalculated identically and all banks work. The second is a
> > behavioural no-op until drive-strength decoding is added to the get
> > path, so it is verified by inspection against the set path.
>=20
> Patches looks good and the Rockchip maintainers haven't
> commented on the other week-old patches yet so I applied
> these two patches.
>=20
> If the maintainers have issues with them I can pull them out.

no issues ...they look correct.

And I'll try to look at the pending new soc pinctrl today.


Heiko


