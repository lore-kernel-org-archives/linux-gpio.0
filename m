Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB80147B43E
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465424; cv=none; b=QZmLppy+FNdGSrLyaA62NxsH9TSzNgD3MPk3NYTCgEZu6OIv0NMBirwgOa1NCqL0YnqU4vGbbv1Dhgz0R1TzePcEV9oD/skefVPleSyoy0vyFWmv9RWE66NsW1XYl3+NHqcQxpIEB26nXo9jQcGtR4fmu9PUEmN8jcnTzIvBtMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465424; c=relaxed/simple;
	bh=J0ypidkHtTf6TBTslKZeVtOfTbu++r6qBExLqSBpJAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I0SSKuuMkCCJJbD5VKn8AvzJvyYEv4GTXqXiE2o5+DIqBu76YyootbhS/Ibh2sdnDWTvavhpjlWltlL/SvJtJIewBixPW6bgq+CG4y2bbOFraUqyMXGhEuIme6RBHOHDR2VWkmUGawiqcNhBUpf2v9nu8M52zJ4BUDA1UdEDSz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gL+cRPO9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gL+cRPO9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A461F00899
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 09:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789465420;
	bh=d/M/n1rpHgsVSx+i4GGkKwbJFs5dUB3kBThJit3oct8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gL+cRPO9FXODDmSmuSyonSLWNuO8OoESe3kK8AcL83IEEytVe18xAFXboQbZ66Dc1
	 wTKYL68u2w7R970pntHPRBXoHhRZVnB14rCRNDI+uTr596yfVhZXLGSoJ/fNO4SHHv
	 np+uxfqZZ9DeTfU+EDyxezMs0uuKma1k601Z37sI+kBLXMbQ7Je27L9WzLs3sr+FEt
	 OpH+vUZA8h8gT+l6GdPRjb5m5aCL4Ncqa3x2k4qFaFsHNJrHuJ9Mkg/2Y1oOhFeMCH
	 zIZEhogoZlf6TlE5IpWLUh7rKvt7X+TTwoBZUBy5f4exUP4H3iq8LQSHi1lCLnuYTa
	 CxpHRtY6/NJGQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso4452466e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 02:43:40 -0700 (PDT)
X-Gm-Message-State: AFuF++mzopLo5T5QvSac2N/TAVXiJS6GnwvXXjVGBCGUVl3pHH94oxZE
	mwHYHMO7y0sKfnZcS01rXywb/myrDm9/UuaFmRvPG7PTX7B2Sl6flPYXPZTYzoQg7QCWN0QrjCm
	igfb55un9U87jgksPwPsw1J6Okozp1aE=
X-Received: by 2002:a05:6512:1296:b0:5b6:5db:b07c with SMTP id
 2adb3069b0e04-5b8ae664354mr1755642e87.17.1789465418860; Tue, 15 Sep 2026
 02:43:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915092046.931449-1-alban.bedel@lht.dlh.de> <20260915092046.931449-2-alban.bedel@lht.dlh.de>
In-Reply-To: <20260915092046.931449-2-alban.bedel@lht.dlh.de>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 15 Sep 2026 11:43:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLm0osL3KQVyk5-pVCv5eFbOY1V2BVRXdNf6rgwQJcLdgg@mail.gmail.com>
X-Gm-Features: AcwNN1VPDO14l6tD97xi3sMWPtwEuNp06pmV7gpRisIqX22Xf5CLWNGmeHFlLx8
Message-ID: <CAD++jLm0osL3KQVyk5-pVCv5eFbOY1V2BVRXdNf6rgwQJcLdgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add CAT9532 GPIO
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alban,

thanks for your patch!

On Tue, Sep 15, 2026 at 11:21=E2=80=AFAM Alban Bedel <alban.bedel@lht.dlh.d=
e> wrote:

> Add devicetree binding document for CAT9532 LED dimmer as GPIO
> controller.
>
> Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
(...)
> +  ngpios:
> +    minimum: 1
> +    maximum: 16

ngpios is only used to lower the number of externally (on the package)
exposed GPIOs in SoC drivers, to avoid enumerating GPIOs not existing
on the physical package.

It has no place in a discrete circuit like this, don't even define this and
hardcode the GPIOs to 16 in the driver.

Yours,
Linus Walleij
