Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF33336606A
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771924117; cv=none; b=AfjK8Rf4yfCY85nnuMuJuX+N9fFVFDuZr8lM3eOqyKzWupWG8+crbL08x59krJO0JLdS4Ubv/KpBxFOzAXb13y/KQz7ypdEn5dBfRtv9oynRCmoqETj9DaqlgVow65Ot1jECHxsCRlCiPMCzQ2xuYCRyrH6vU7LhicDKUTYli48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771924117; c=relaxed/simple;
	bh=Q9i5oBBNkQGmveB8LXq2i2SLSNV9fZ3TzjUBnqX7p78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jjo+r36ckhY1IY9BJmsJN+ovyoxtyVB/gA2prZs/k6KNafSo/s0NiOT+OCJFoFO8wcLBMsj8QF+zksWt+TMjo2hLGFFH9fyd+hEoOTn1QE7vx90vjM3k5Jp3wiAo3fr8wVoM33Dn88Adoi3YH8nY2l4zAS0ZkIYCY/WBxFp/MNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJTwKXw3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJTwKXw3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE27C4AF0B
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771924117;
	bh=Q9i5oBBNkQGmveB8LXq2i2SLSNV9fZ3TzjUBnqX7p78=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YJTwKXw34O+Wqua0RWL/aMV9BsRMcwBA5KpyFOn8jxYjbpA6GqjXw3K9vfxsK/C8X
	 SKg9lXB/uyIjFLDkGJw5iaQY014rXs0eP4uvIS1b93/bswppjr6z7b8G4TpH2Zz9En
	 oPpyqtKSzfz7Z9IHZy4JoSgbUSUi6Kq/P7t4wPjC9sC5otRlVpdKvd4c1ZRBfofLbM
	 +yL4RlGm1zxQITbfxgltEMUxxoVKi3drZy9+MzgZf3Un7Z1E/pXw+CwcOLvlq/qmaz
	 pwITrW2E/Q/FLvHVuYdO19Y0Qy5eC0TrgdQJon23qt8al/M5uhm2fgrLAVM85kXntr
	 E2l2n0sEA+vLw==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78fc4425b6bso46712727b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 01:08:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXj7SUQScoxG+va26+0ZqyU2mjanWO/7qMtp4GjGmIsrzyOzeBVKpM9CWNWCkuBsVkh+QINV82/HAsv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg/radCkK6raW6Gvtkn65qH2UO/+EXf0rdtHhJPOGyZEpYdqoJ
	tSegI8kqmMA5+YJEQugAvSTynnjqvoEfKf1zMMg2sEa8hrWy6fg9llhmkyshadRSY5dCabbYeJf
	XTx1hjDIIf4R7b1Y6mdBULjO2R1E1iDM=
X-Received: by 2002:a05:690c:3390:b0:798:6042:12f8 with SMTP id
 00721157ae682-798604216bdmr799927b3.55.1771924116974; Tue, 24 Feb 2026
 01:08:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:08:26 +0100
X-Gmail-Original-Message-ID: <CAD++jL=7WAdsXu0FEqMtH5_BhCEHdkFT=9jw9AFd9LD=qvX8Gg@mail.gmail.com>
X-Gm-Features: AaiRm508KnJDrZsc8mpEevIY_lXIv05mpcGdwG_GATsrRW7vePmDNcyZVoA28pI
Message-ID: <CAD++jL=7WAdsXu0FEqMtH5_BhCEHdkFT=9jw9AFd9LD=qvX8Gg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add GPIO set_config
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, brgl@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 4:19=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:

> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add GPIO set_config to allow setting GPIO specific functionalities.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Excellent use of the generic pinctrl backend facility.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
