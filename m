Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF20495AD7
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789579060; cv=none; b=A2Y6auNIfHTJNvzbq5hfY50eEMeVX3r5AL2wH+4N7Gm+OWd9JttlDnFLkuTdT/GaccjlqVnlEeXVPPt/g7HRgB7E4X0eTrPbH2vFlk7mqx7THT+drWj18WxERMW/TbHuFJYNzqMTqm04kp/KOHZFfC9Dn3eHGjOhqzKISSJAMkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789579060; c=relaxed/simple;
	bh=f+Lf6ZoxPvjRg281Rf6Ji6QGaQvezrbwHJsXrETsPp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qP0LzaYYEKOADae8BciLOEdv/2HJLTi26eP+zpkgD0ty6jWnDcN/6WamsidYN3IL0cSAc+FaliGE5g7Zw5jXcb6KLwyEiC5u2OHRGfjpe+k3EcNj42PB12u+OA4Aordu4tRn9XqXJ+yuyCJ3z8FISZ7zX2CqFzSW2GMUQmswTU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCu3gRzK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCu3gRzK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B131F00899
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 17:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789579059;
	bh=/xHXJhnXAE5g7vU5PogSY0vNjsvxNtdc1LTOWODzVNs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PCu3gRzKlPDcTasRgWOZU9mKi2dhCGrd3CsZ8wt8B9R/NTtWPonLReVBPYL2Fnadr
	 aZy9jPuFwG2rE42xiIuF7E0dHVi1tsw/cN7ede6PyYhagnKaDso6JOIQgiuosbRrzx
	 uLhMLZCo4Lf23+JQx22/Q4xEVr/keqwbZDf+o3kdSpJcVKeII36v2bqhKt11xAZId0
	 KyGCNcTCFHHmbUeKJAU2Ad6ObVDnx1+SpSNwXWOhj+inqhlo70uCvTluOwoUmmVGsl
	 RKgnMTJ6bsmjkMVZ94HItdMM8inxrMQ6KnzUYHhp47bP+lQB23V86ng59pzp+SVSfX
	 5SSw4j/hM99yw==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff148dfdso9545751fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 10:17:38 -0700 (PDT)
X-Gm-Message-State: AFuF++mGQQnpChENWyZOkxtSFbLLSbJ89XAMuHZkIQ0p1kyKGBqEtAjI
	YdcZRGOHQDrj2ouHLAD17qUzAbIJOcZjKh+mDKq4sKIddpsFIO1kQL7HXW4LQbFuEi2VrRD04cH
	6Hb2puElmzo0ZDfcew9RYx9blvAGMZi4=
X-Received: by 2002:a05:6512:33c6:b0:5b4:ac1b:89bc with SMTP id
 2adb3069b0e04-5b8b6619f44mr1034081e87.24.1789579057719; Wed, 16 Sep 2026
 10:17:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912221937.71403-1-rosenp@gmail.com>
In-Reply-To: <20260912221937.71403-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:17:24 +0200
X-Gmail-Original-Message-ID: <CAD++jL=n6jV-n+x1x_GUm3RohdbfmdfhTrWj9rz5HL41-vjz-g@mail.gmail.com>
X-Gm-Features: AcwNN1WBxldUn8CW9skNsvXHFR1xVkVV9jESkCKvczcNPvemm0T94MYp4QiaaGo
Message-ID: <CAD++jL=n6jV-n+x1x_GUm3RohdbfmdfhTrWj9rz5HL41-vjz-g@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: keep resume masks within the irqchip cache
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 12:19=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:

> mvebu_gpio_resume() writes the edge/level mask registers saved at
> suspend time straight back to hardware, bypassing the irqchip's
> mask_cache_priv.  genirq skips mask_irq() for a line it already
> considers masked, so restoring a bit in hardware that genirq thinks
> is still masked leaves that line unmasked behind genirq's back.  An
> asserted level line then has nobody to ack it, and the moment
> interrupts are re-enabled the chained handler storms, hanging resume.
>
> AND the restored mask values with the matching irqchip mask cache so
> only lines genirq currently considers unmasked are unmasked again.
> Read the caches under gc->lock to keep them consistent with the
> mask/unmask handlers.
>
> Tested on Helios4 5 suspend cycles woken by magic packet, no hang;
> mvebu_gpio_resume() returns in 6 usecs.
>
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
