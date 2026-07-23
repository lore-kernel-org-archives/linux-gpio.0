Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA413EFD1F
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 21:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784841122; cv=none; b=jDv/jjnNKsgX6FzuwgJHbEnkMtAx5B8DYEz0jiWQSd9yttIkIJ9dWD1iNBPfxGhUetv1zVU5kABAQyz/uZ6LLu5N3gWHV45gnQpQCoCBgCS8YSeEGEZKABcxqVGIOVC+PBelMrH/hC/uB9cFCXwx4izBEGctbWGxhSf9sdcdxbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784841122; c=relaxed/simple;
	bh=QkjxQqaqKFPCRgz3gYm9WQ7javlrCg8NwBlF5T2Nfow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KzOAMC+uEyaPTrVWJkB7H7jmkSogAtv76ngiO5qsY16fZhkZLjaWgzVWLitcL6+yzpA2njLAKfPUd0lI5XHL1MrhepOkGyph6g1EF5f/OOWV9hzCYQSJeixj+NxFQHZglZd05q7n2MsP+zC4S/0OLbMhtH/VY49yOIZab3Eg7UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GH0FIzpo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GH0FIzpo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC651F0155E
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 21:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784841117;
	bh=QkjxQqaqKFPCRgz3gYm9WQ7javlrCg8NwBlF5T2Nfow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GH0FIzpon0wyHFz1+ab2i3gSVs4VF9UWnaaSWuHz9AHR5M6H1zh87fgmIjB/4WDHO
	 aEjivS/g/OWqbB58gnQi4KADEUo8sF/UK4CJyz/cbfQWJ779FBxMVVTFehxrnBF+Ny
	 8F/8jiTrwMQVBl6m+Qvj7LCY8qWKi9F/Cdu8sLCKfkFvkV39ypkw6J91pe4vMGa4hK
	 mpTUDkajgIGxpy2hcqYp8JGfX+nkO+KP8EXEul0cbxj8La6TS/xhC+WBJEh7G3Lrbh
	 5tF6jp6ZmT7YpbMrEeTKuIEJ16hDGUrUoitaEpEtvsmacaAsA+W5h525WY0/S+LX6R
	 0xRmviqKNbHSA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso51501e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 14:11:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqErXNk17Lh1D9H8fswrUmXd/55nDfydqyVW5/KReQFIYv70sAbhmS9s0iKGQzVdPCzqRt9qJrbjUJP@vger.kernel.org
X-Gm-Message-State: AOJu0YykySaIRH7/NOtg4djJdNg5Qa494IbNGBAcNvvTMfPXHSS5Voxv
	wFicVn7ShHZ+CTRD+iq2agvXK+15WEHx+g+aYmjZOxLmiwdKaarDPfLYntKvSLTBd4pfoEOz99v
	R1vAYKGNxcodYRsCYmdjoV1HiYN+Z0W0=
X-Received: by 2002:a05:6512:3e23:b0:5ae:c201:c3d7 with SMTP id
 2adb3069b0e04-5b2b2e49942mr952489e87.8.1784841116593; Thu, 23 Jul 2026
 14:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723034237.2501507-1-eleanor.lin@realtek.com> <20260723034237.2501507-5-eleanor.lin@realtek.com>
In-Reply-To: <20260723034237.2501507-5-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 23 Jul 2026 23:11:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLmoFb81mhK3oavqGn4Voefbk3tzyafL8t646XfoTMvArg@mail.gmail.com>
X-Gm-Features: AUfX_mxay0kTe58qvEju40HZKzbygsY4bjFlPypSM3QbSK8RJ7IXv_SciOTFz9Y
Message-ID: <CAD++jLmoFb81mhK3oavqGn4Voefbk3tzyafL8t646XfoTMvArg@mail.gmail.com>
Subject: Re: [PATCH v7 4/9] gpio: regmap: Order kernel-doc descriptions with
 the actual appearance
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: andriy.shevchenko@intel.com, mwalle@kernel.org, brgl@kernel.org, 
	tychang@realtek.com, wbg@kernel.org, mathieu.dubois-briand@bootlin.com, 
	nuno.sa@analog.com, Michael.Hennerich@analog.com, jic23@kernel.org, 
	andy@kernel.org, u.kleine-koenig@baylibre.com, dakr@kernel.org, 
	bhelgaas@google.com, o-takashi@sakamocchi.jp, dlechner@baylibre.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux@analog.com, 
	linux-iio@vger.kernel.org, cy.huang@realtek.com, james.tai@realtek.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 5:43=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.co=
m> wrote:

> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Order kernel-doc descriptions with the actual appearance.
>
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
