Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E89E34F474
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 18:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785349913; cv=pass; b=SwzcoUwrvwqCdF1hGj5JgfdiURYo5H0HiUT5mXQS0hC3VSoMjm6OXeXsViZO09GF59YwsGpgR1B968kK/i4QGwyXvtDl1b9weolSj8ANOPABPTVC0nmGIkA47dVyUsS6zVZREpNE0JzV8VF/CR5Xmlt0q4cMAxljTsxlI68v4fM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785349913; c=relaxed/simple;
	bh=2Qc5mjkD1dvLD2GeXRakFQKtNFuk6A0eLPxvD7CfVgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOEw1qBGcuxys2txOey1Dc0YRZQLAY873+B8STpFOvvjPMY6VATWrhj+FqgLqFQgPcyWanA3rt+xmVolLskS2d6m/ljemk/NP8cMHOxOdmQ6+tGHXSIELi0j41RIl44RQyzd6M8oG6TY3IRYNjXw3VnM2JbiUs+gGmuY36MvQkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9aSGRWw; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9aSGRWw"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69ffb48d599so2072963a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 11:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785349910; cv=none;
        d=google.com; s=arc-20260327;
        b=iCa5Tmk+GALA8NjkRYgCs7yQZSPJ0hr+pa297ViyGO3+hEhOZTFAOvlfX+5fMtZIb1
         FNfAVcoshxWEg9tz2KD1xR9ChUptxeYaaKqeOnF93anCHfsoVTU+sqIQ1GnofofJR/x7
         t1k7yHdKN807Yi0DaL2tqD6qXEZF/FjilS7R4h6xMqNSm5VZkg1s6cjHF2mj6FOmEuXA
         gAIFyqFh2US4be350vVoQ7mBPBavNIwv6bCHEHCeXxA0/aOZcbMGaVFUZoZKtKpJpHMO
         3eAvVxh/Y3mbS9QNYXOd3N87LrHU9+d6msQvok1kOtIkqrBnYhDoQCaR+vwA+FsHdsVt
         nX3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v4QmJ/SaaPJq1jDPqnjiO/k18kGbmkP2+g1krIrs3vI=;
        fh=f9xDxKclA35fmdJP7jJRGk1xdbQxZAiBsPQ5yJuNrTw=;
        b=sm9f+bDOaSxOjyS8yKe9ruIuX3uKMDqzQ/YvK/m+fSkqYJKvbLRPxL0KF+BHk4lobE
         fnv13CU62P8tF1X7fPQUkokNZaYTAW8uJdoDdVLh4CATN0AR/fIuJFCD0h1QyUjgnxj/
         YMYbDKS6n487/8ZNefBLYWVujO0knkDJ61GSBKbtEsgNWbrXLVtkBsePXYN4VhdjsEFJ
         HO9iO1FFePywYdH5ylDufcbzSpVDjoJs1LAMlE3yQ2s63xfCasPAqvSvjEzCegOHmOPT
         cx7Au5tX4IT7wWjr0jQmvNdnYu5D21MRafNtRaJcq2/WluyB+DqdKNRal8PJBUHnMK1H
         AhKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785349910; x=1785954710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v4QmJ/SaaPJq1jDPqnjiO/k18kGbmkP2+g1krIrs3vI=;
        b=V9aSGRWw+vDKUDIyASmn6nKVDBKq51PfJdayDN6F2TgpeQZ1rPjHZh27sG8GQdH/ik
         a+T8EpvYSIIrhhNeY1GVAXE1lOKS87BZ3yP0XfrK2wpEpcs/OeSPdzT7l94uGDjs7v11
         GtS6TKqojCnVg+13P/QeKZ49K0jo2cceKbTVmuVm2P3m5Lfb0SM4/7ORJphl4xg21ciD
         JS0H6qvxELj+bKRpjX5xIrXzyVrZQfL/2XhIrFfxitEeyDhMDF67zn6ijJbLvv/aKEzT
         0SGlKHs8K6aLx8KiONgwtPkbDlKCuecHDYOAVNN0kFNuKqa83Ixx4lSIbKHR4dvS3yVz
         /Brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785349910; x=1785954710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4QmJ/SaaPJq1jDPqnjiO/k18kGbmkP2+g1krIrs3vI=;
        b=eNBmc/WULj2+BN7wi6zjOX5p0Eh+ndz2XxdDeoyd0CsQaYfkvlHScP4u7AFDMs9Vui
         nV/GGxCoxDaieILQNduWPNOzSVD6MI8V4m4uxcpMNCPNTDnrDtYyfdpsLGU8MYgUnC2U
         +BFkp6yEWQYx4SsuNuK7w3FpCJTOm6v1IDlZjenRd9BGq9qN/rR7Kbqvr86sQ4avLE5l
         9cj6xqRKy9ULFTlni2+89NKeQvF8XXA9HaER0mC6XCjsuQ5KxPWWn91XU7ZSnaqjemtG
         CR1y+ubPdnmH0pXXo6OpMjF8WKSxiqQnrTJc4PMtbjmF4aiYB/a++7q9XOvNCV893TPB
         yUnw==
X-Forwarded-Encrypted: i=1; AHgh+Rqk9J3zNkI7LDw2VUNYv6VAIrbi/IUbjwA475d6Gq37DzulmuMJfwFfRcVwPiDsE82BLDqt+Oq/deCT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/PT+ezzHGpYbuvYfGS42p8h6ETzQ3hO6EgHA3D+fIFVpD5b5+
	kaFNaXAlkRkRh/nXNSLAdkUNvusMt9pRnKMcGgqh8G8KUVbrf0bIjF05ZYuzSjA87W1qtHsRBnY
	mWUYMXwt0AuPwmJsqxb0MIlhJ83kI2ec=
X-Gm-Gg: AR+sD13bXorAqdUT4Wtv05S5WgkSb8F3wer13EnNxdwBrGvQtoLHcQ7YDXRsSR2ajQw
	0LRx4FCGJwNvzGWPkve6/Zmh7C9ePrRZi4FDU/iXNNYxDS9DoT/1TBRLZDoXCQCK4QSRCl2FyNm
	2OkVp/iskDrjFpz5pxYEMKQNBDIeGBOLjF2LnJRJoLB62c4SChXwpm+9k/61A3aO1iCyqddoPwn
	VZY2jYg06ElV8WJVVCKSYIIEL0XjIhECEtbNNfNi3tmXh0SUy4lDdKav3Ey5jin40RJJrS5b2Uc
	KQo4mAMgZ1xTb46RJnr9cfeHBnEVRQQvQYejfrXaM5jqKrD4HkwTsWmHNvUGGssHM0yHHCo02QJ
	b4n//93Qyp887KQ+G+5ifbuz17Y/5waJKsgK3Joez9Hx8GHTP3vNbqXhkjps+2V1MKDhFNQ8sg+
	vrJNRcT8Qq7TBBusdX1qwh4Akl+SjcilOXbeqrMzgZtZKgRTXuDJha2zg=
X-Received: by 2002:a05:6402:21cd:b0:698:351c:979c with SMTP id
 4fb4d7f45d1cf-6a0349e9d99mr3749083a12.2.1785349910290; Wed, 29 Jul 2026
 11:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602050131.856789-1-rosenp@gmail.com> <CAD++jLmk3jMFS0DD0GGTV9AWu-oHJAoxymcyOKQycVFqKCRnzA@mail.gmail.com>
 <CAKxU2N_LhgDj-+-gd0_N9gQOzCddq7dypYhayFQ_09zggpor6Q@mail.gmail.com> <230cf7f0-600e-40e7-8056-6332c678e14c@linux.ibm.com>
In-Reply-To: <230cf7f0-600e-40e7-8056-6332c678e14c@linux.ibm.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 29 Jul 2026 11:31:37 -0700
X-Gm-Features: AUfX_mxsf54gYiW4yX38vwZBjC6BKUBp5AuSPAo67d0COlzbbPx1pWEwYjmbywo
Message-ID: <CAKxU2N_qNZj3dJaHQ46LXA3Q=_sv6r-6WGG3iUDnOT5F=VtNwA@mail.gmail.com>
Subject: Re: [PATCH 0/7] gpio: move ppc4xx driver to drivers/gpio and modernize
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, chleroy@kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 3:20=E2=80=AFAM Madhavan Srinivasan <maddy@linux.ib=
m.com> wrote:
>
>
> On 6/9/26 3:50 AM, Rosen Penev wrote:
> > On Mon, Jun 8, 2026 at 3:10=E2=80=AFPM Linus Walleij <linusw@kernel.org=
> wrote:
> >> Hi Rosen,
> >>
> >> On Tue, Jun 2, 2026 at 7:01=E2=80=AFAM Rosen Penev <rosenp@gmail.com> =
wrote:
> >>
> >>> This series moves the ppc4xx GPIO driver from arch/powerpc to
> >>> drivers/gpio, converts it to be a proper platform driver using
> >>> generic MMIO helpers, drops architecture-specific accessors, and
> >>> prepares it for module build and COMPILE_TEST.
> >>>
> >>> Patches 1-4 move the driver and convert it to standard platform
> >>> driver infrastructure. Patch 5 switches to generic MMIO helpers.
> >>> Patch 6 drops PPC-specific IO accessors and enables COMPILE_TEST.
> >>> Patch 7 adds the missing MODULE metadata so the driver can actually
> >>> be built as a module.
> >>>
> >>> Rosen Penev (7):
> >>>    gpio: move ppc4xx gpio driver from arch/powerpc to drivers/gpio
> >>>    gpio: ppc44x: Use module platform driver helper for GPIO
> >>>    gpio: ppc44x: Set GPIO chip firmware node
> >>>    gpio: ppc44x: Use platform resource helper for GPIO MMIO
> >>>    gpio: ppc44x: Convert GPIO to generic MMIO
> >>>    gpio: ppc44x: drop PPC-specific IO helpers and rename to ppc44x
> >>>    gpio: ppc44x: add MODULE info
> >> Overall a very nice patch series and happy to see that AI can
> >> assist with this kind of refactoring!
> >>
> >> I guess we should provide some slack so someone from the PPC
> >> camp can test it, and if they don't test it, then it is abandoned and
> >> we should then just apply it anyway.
> > Hmm? I have the hardware. It works fine.
> Honestly I dont have the hardware to test this,
> but thanks for the confirming, i will pull this for the next merge.
Can't tell if you mean next merge window or not.

Anyway, https://lore.kernel.org/linuxppc-dev/20260517063754.21819-1-rosenp@=
gmail.com/
needs handling first IMO.

It's needed for kernel 6.18. Otherwise my buttons and LEDs don't work prope=
rly.
>
> Maddy
> >> The series:
> >> Reviewed-by: Linus Walleij <linusw@kernel.org>
> >>
> >> Yours,
> >> Linus Walleij
