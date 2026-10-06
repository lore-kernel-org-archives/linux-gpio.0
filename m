Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746DE4A5EA6;
	Tue,  6 Oct 2026 19:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791315007; cv=none; b=lRKJJLS3fyXPC+Ua05UekNfs+W82NtpeYQ98uW74crnQ+ifNs6nf7QbptkixKbUof6QiDY/8qQw4eXscNJ3WXShNDnwhErAo4pKJNfxhaTT9aaUAbhZv4xkRD1Wvp31ofdJm3br8iLBisHBhYdL5kQbBU/6RJntS1Uq17A1xstE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791315007; c=relaxed/simple;
	bh=1qBitEhmQ0nRXsqFbRoBV52/x56ftA0tXFJqTD+1+Bg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P03q7LaldSR051rjEukRcl+yonm/GnAmgsEbkQFxetmrVkA2A5LTq0qh/J5+cjtMK9hpCPKVyO9FKV26RkfLWBuWyN0GoPI6yzkPuyn4SZh04+huAxoHMXTKLk781gUFHhkKflfnx113CkXZ3a8y4yYFnHAsYOf+Z6gFfIA0tRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=ODfamKOl; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ODfamKOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1791314996; x=1791574196;
	bh=1qBitEhmQ0nRXsqFbRoBV52/x56ftA0tXFJqTD+1+Bg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ODfamKOlMrd/svk2N3xAryTpWMoBSxgYAPPwkYwb/0eKSjCXnjVUZqpWhxScYZNWB
	 58XC6whD0CzUO7YKaqbV3ZM+x6o5EEkMpEAcModPXCC30POBiq3n18F9XopFL6PAFI
	 PXji54w/i0RCzudx1GTj8elNBmBNvyX7ZjO+XxEuaGx46wwsWpqZG3Sqdw6KWKdZJ2
	 Zbslz5qkM0RU8zmsKGoxkqjBF0h70rJPxjdN0Qfo1iSsBMtvlMePjN3GBsoKKLw/6i
	 fZ+1h0XWOKzJEstjlXja/pXtOO5uP6nKY36aDtfOFylDT9Ixhmg6oBN4r/GLo2D9DW
	 uLh0UyllLGKdw==
Date: Tue, 06 Oct 2026 19:29:50 +0000
To: Linus Walleij <linusw@kernel.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 0/6] MediaTek pinctrl DT binding cleanup and MT6735 pinctrl support
Message-ID: <oiGrAevSu8pKA28tZnLYomTYf7Ox9GgRiITPUpJnRqzFsusm9sE3GXOED7sBHn-oTLk0rfD5bqwABV7rQdkHBuTTGaqiuzgY1m7QxFIKxCk=@protonmail.com>
In-Reply-To: <CAD++jLnJZBqQVkh51QGWuv0SQVNoxdy4fw3xOSOdCVSpSkkXww@mail.gmail.com>
References: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com> <CAD++jLnJZBqQVkh51QGWuv0SQVNoxdy4fw3xOSOdCVSpSkkXww@mail.gmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 496c99386a9184e561265d3356b401c0b7c518a6
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, October 1st, 2026 at 9:07 AM, Linus Walleij <linusw@kernel.org=
> wrote:

> On Fri, Sep 25, 2026 at 5:46=E2=80=AFPM Yassine Oudjana
> <y.oudjana@protonmail.com> wrote:
>=20
> > These patches are part of a larger effort to support the MT6735 SoC fam=
ily in
> > mainline Linux. More patches (unsent or sent and pending review or revi=
sion) can
> > be found here[1].
>=20
> Waiting for a DT maintainer ACK on patch 3 otherwise this looks good.

I sent a v10 [1] addressing some additional comments by Sashiko and the DT =
patch there got a Reviewed-By already. Please make sure you pick that rathe=
r than the v9.

Thanks!
Yassine

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D1173=
988
