Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDFA2E06EF
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 20:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790885699; cv=none; b=SqiVLGElxBvfGZinYGX8gZPcZI3/Kyy9rn+EtTr8J3lH4NbJRQFsB1GiEq80OJwaWy/uLe+4NhU6QJw9OCK9TES6qq7nzWE/ZLkCXV6X9FMV3icE3G5Vvps0cCAaLbxGKoZX+K3bf70tzfji2s/sWlewrPKsA9FWE5zG/Gl9ioc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790885699; c=relaxed/simple;
	bh=DnZISwCpr+LQVTkvk2yva6QizXkNr7Iyq/yM8SVg5fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0L6+Tb6TypqjyEQIIqVq9moCLNKgoWs4E3fHZNlEZ3523ll0u+6Io7v/QFBzykIsL4IbwZik21e2PUkOXDKUuBDVqV2V8QgWA6zZBz8lFT0EkZTZlqz67djjg9hjmBT5YK3ZHaPQxn9pOsIRQ5iCwZzS5gMK6un+zPMFP/wwHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fd1HI3Bu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fd1HI3Bu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492741F0089C
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 20:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790885698;
	bh=DnZISwCpr+LQVTkvk2yva6QizXkNr7Iyq/yM8SVg5fk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Fd1HI3Bu7yprMs6oDACgFPB3GLjdn+fERXMeE78XxgfAtWuvpEiYyaSRJhiWf38n6
	 xzAJc0UZPYJXTrK+zOEXPzVn61aB5xXy+egtumHCuGyiST2TKz9t10y7cemSWBpzPE
	 FiNTh3selJtN1qQOZM9Jgv7mdqhN7tg/cqR/49uaauAiC1tfrviy2YyaE9AoioR567
	 g734b+8VWXzGnAE9H54IW+1NsrTCyFAmNOCRChOrWVYlpoY3nkgaG+ruVdNo9YSZDI
	 oYLJIaJRBOAF/SiFoN4PdzK0An1RmgnvM9HoIVYUnyU2hi2mNwyJYXqKT2nVTUztbf
	 axg+eiZ9VDYCA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba4415869aso1101787e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 13:14:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBynrjxyFsnMOO5/cbdOIxFuSuf7s9P7lXoEMsoalGq9n0NXyEb2v61kkVYc4Y65VGCpjQKOuoUp8rXU@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ7R6qd5+CNZLw2ravAH7JlCGRbNrvYQqaOG+q8h7oGGKC5BR8
	03BUlhZotgpVpXupzVD5vTlM7FOxwf2mMdCmeVJMhMLVbWyN43SONX4QEebjM+67Xf5+4fX6eJ3
	M0g2AzQ0Pr+NYiRUP9C4hMxRq484ah28=
X-Received: by 2002:a05:6512:6281:b0:5ba:3a9d:2cbf with SMTP id
 2adb3069b0e04-5bb93811921mr129887e87.1.1790885697067; Thu, 01 Oct 2026
 13:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815094451.31792-1-adilov@disroot.org> <aro4qbhcd3X6wTvP@black.igk.intel.com>
In-Reply-To: <aro4qbhcd3X6wTvP@black.igk.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 22:14:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLk8gCAy+SbGffttCQ7dM9x6gzVRBwRppCByzwYdm_5kGw@mail.gmail.com>
X-Gm-Features: AclHuK8qQQj1mnz8DJlVh5QAxTl-dYaN8Xr0iMkE4L7QV1OtRUXp3ZaQAtSCIQE
Message-ID: <CAD++jLk8gCAy+SbGffttCQ7dM9x6gzVRBwRppCByzwYdm_5kGw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: realtek-otto: make the driver work with SWAP_IO_SPACE
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Rustam Adilov <adilov@disroot.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Sander Vanheule <sander@svanheule.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 11:51=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Sat, Aug 15, 2026 at 02:44:49PM +0500, Rustam Adilov wrote:
> > This patch series changes gpio-realtek-otto to be functional around
> > SWAP_IO_SPACE config.
(...)
> Convert the driver to use regmap MMIO and most of the code in this series=
 won't
> be needed. Also it will give some benefits (like register caching and deb=
ugfs
> monitoring).

Andy is right.

Make an attempt on top of the merged patches to convert this to regmap MMIO
and see what happens, and if that works consider regmap GPIO as
well.

Everyone will be happier, because less code.

Yours,
Linus Walleij
