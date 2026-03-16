Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926CF387347
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653092; cv=none; b=UJPpLDJ5wah5ZRV1IqyIx+qMDiQwt75sBkkd4FTtA1RGk49Rdwy6AYLfI07vgxgB8UgbrheJpipiXMW9W5mhk8hNkft7FypmeBzTdaU7pckNnMekMnDVB2kBLNZVr+9lot0Owbq/MC2X8gn11tgs4AvYMOT4vSPmdbOWdD6G54o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653092; c=relaxed/simple;
	bh=BIWygk2t/YSDljMoUZZVTZOf2mAecHQoiMZzTqE4Q3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNT3ZdM2J24JX+di+uqrg+nyL7NIJHZdsQlE07SU3PKHdhnnPAye3wqdbQYcGllP0w0mRZzOqgB0GhC0DU1sw6q4z3AW5EruqQyknkTlEbZ+S+dtR43rkvX5QHMJFAw9dd1PbehFXU0wKtWLhCwtBTISRwmCZTedn9HT8Q2XCz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9pS/bmP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9pS/bmP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48046C19424
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773653092;
	bh=BIWygk2t/YSDljMoUZZVTZOf2mAecHQoiMZzTqE4Q3U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H9pS/bmPk94avmOf1UFTuiLOUW2m5oUndYfGaYsQZxpuY45RiS9r5Xs7gV3sGU97S
	 XlMcRQDNe/+flO5poKXz6jIPewfYypOGS6q19ViK/LQ57HtSvwAQ8CVIdnM/GZUo7d
	 iCZfU1TWLAiyT1TjPwit4MBH3if+bqm5r6YiYmxvWKV1QoQ8eCoPDtxMp9Evz9yC+7
	 OHQnOldgim8Au/pr0ounUhgVLnjUDIpnc3yWGVnMIntSuO7E6UkrCq7j2ina8GayyV
	 nqvLEJtrDg66U0/3MTrm9p/B0aaQaI1Ccp7EmIi+UQJsAjsVyb4PtId0RW5vlquvPE
	 S9eId1a8qx/7A==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64ca09f2056so3198721d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:24:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1A9ylW3o6H/P63jGbutPnVVXrLTG3w9T5biHZne8eBrnfSWo++aUWhUOwT1KumPUR2QBjkWH3O+47@vger.kernel.org
X-Gm-Message-State: AOJu0YyYfST8xQ0dMSabjXmr3XcnOZHe1OnRjWuiExsWm90xiNVJ7Us1
	bGJpHqvtGXnvO9j2Odxi8mAdl9fF1hGiVac9yiks1PbCPwTwNd9wCpECbS6wu+0lZQBadc0T+K4
	pcUEvSmiFYzXG8wo4I75SGxNgPuCyJco=
X-Received: by 2002:a05:690c:7283:b0:79a:1fc2:be05 with SMTP id
 00721157ae682-79a1fc2c602mr107019937b3.1.1773653091619; Mon, 16 Mar 2026
 02:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312081805.3020612-1-arnd@kernel.org>
In-Reply-To: <20260312081805.3020612-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:24:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLngojT_gGgGn4PHRiBtSweA780BsfoXngLUHVM8HuPMOw@mail.gmail.com>
X-Gm-Features: AaiRm51HfNEbdv3QjrL-RIfuGLdjSponbSK63MbCGrMV2QM-93a_NszGzAJcll0
Message-ID: <CAD++jLngojT_gGgGn4PHRiBtSweA780BsfoXngLUHVM8HuPMOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: stmfx: fix mfd dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 9:18=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The PINCTRL_STMFX driver attempts to force-enable its MFD parent
> driver, which is really the wrong way around compared to general
> conventions. After the OF_GPIO dependency got dropped, this leads
> to a harmless but annoying build warning:
>
> WARNING: unmet direct dependencies detected for MFD_STMFX
>   Depends on [n]: HAS_IOMEM [=3Dy] && I2C [=3Dy] && OF [=3Dn]
>   Selected by [m]:
>   - PINCTRL_STMFX [=3Dm] && PINCTRL [=3Dy] && I2C [=3Dy] && HAS_IOMEM [=
=3Dy]
>
> Change the 'select' into a dependency instead. As this changes the
> defconfig behavior, also change the generic arm defconfig file to enable
> the other symbol instead.
>
> Fixes: e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies on OF_=
GPIO")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
