Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792502752;
	b=Rr1n9nVH4//v+L4PHegGsCbI00E0RpZS2rzQRybY1vL7U/14jn1QGL24/bv8KkadXGeQ
	 ZUQ1e2+jSd7dL+ak3p3AsBGULJqiOXyhTZ/blyoSBp9Enj5cSt2dGtk+iTHbVf+3VxAdY
	 L5se+phmSNKi1BKLXlEADYOwR5aylEtw6mQPMypAuz305GepSriwzTn3ATgqiolKwC+1Q
	 MsXuj9h1b3/STnVmIxFtSVl7YO5TNo3f1/6BJqbd+0R/LG0qzlZEe7DJIgeASz4nudIKQ
	 gweybJXCLZQc7yRZwpe1fdraK2NjbIXT/oZodzZV6yyyRWxSnv0zH+8XckdAkEDdhRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=RwTb5esbD12SQH/qZ580I3FDTK2uTjyQt3U2OZ6zUYw=;
	b=3uZJwGfvTFqipqBXfJ6lP6LLzRIfQynLAbs2m3jIDJcoVMJeU4VdDub84N+gyM5XqHG9
	 UPwzOXJKvTrRJf94plUKTLSkw5/vpITC9AzYrazSx8gQLwW9UfcpSjFx3E5swTWeYieN/
	 7wNFRCI3w2RXQwjE9xvbN/d45eBmBVj4ieuOf5F4RwpOFzuuz/wpcdsTfI6RGvPD1T1lu
	 8r2i5nqAM55l99IWtGmE+NTO7jeQBJSfFTostX7FCnmdevL3ze59XX0/0PUNh1eGzHa1R
	 ya4FXSP3rR0PgxUF28SF9C47nyECPWbOKw/MhK/BEbXqMCM8ClSMHNgSkVcy59350OQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KSawftKX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D21C606A31B
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D21C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KSawftKX
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67583c777abso789286d50.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792502751; cv=none;
        d=google.com; s=arc-20260327;
        b=b6sofniKMqXxOY2FlrNTbBnB5o1WgrdP0whoW+YuvjGtv+DjJ32sqt35OREVqWf4SJ
         Ed7fLyY3YItUt3wzDpHaICHCBD1wp9iqPGHJEOSvda1lbBdRC1hvQCHsMW0ZBuj1NNOJ
         45X7erzuiLaEigjS4AoQdrFNDOY7lEKpWmomMwr0ae3646EG5kOvlWiDMAtE0YSgcyas
         /FDoW9yER9M/pQUjwPSgLzVsSTbUvPco5IWZWxtPYX8AeAIwVVhSBUfiMAlYJmXvHzUm
         UDV/O2wHV4M9u/N17iubRwPx47CvWCRalGaQeOyBpQ8s7DmlErV9aBIa4krdfgqhOQZG
         RYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RwTb5esbD12SQH/qZ580I3FDTK2uTjyQt3U2OZ6zUYw=;
        fh=lVbY9JkkIKGU0bgEFTL/gADrkzuiP+/5Ir7IXoxPEiY=;
        b=IghrTBIvM5mcI6U4DZnaApoBdDoIp6yDh2mehFFzDcNf4xlsRXyQn9fbn8mKkUJ07w
         +hxVeAudIOtiqkpwggFdEh2yY5E/qWZ67v5npTvyfZ8GUplZBSICsaDLdQ3gV54PoXEv
         Zseu1rlMcG6gNDivkjBRXFa9qnOctJkgOF2iRXEbdMnhV3Mb7c/rquGRiut2sF03BCxK
         4eoZ8ar6IdfQEqOsVLFlgd4JgnKMe9GNS/T7tq9rMCE9rGpSVEOZb0+urtAMjUKMA8ks
         h2V/pPZgCAhbwn6WZuq5Tn2L+D1OpbA/wfxwB+S4+LT1wb0kGsmo3TQVc29jItZVLFkd
         AfGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792502751; x=1793107551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RwTb5esbD12SQH/qZ580I3FDTK2uTjyQt3U2OZ6zUYw=;
        b=KSawftKXYnhBxaI3B0Do4sQZLD75oPjDeCW4tlWq/etc7RBpHvp4EqzarcgFaPnIzd
         EytbH6FT0wnPbHAABNgvIkCa0qq9Soa1VZZfm4eORJlx9rVmZUwG4LSHRbQytEC1PK8E
         y7Nr/AiA39FVEyVuiMZokHSydg5HDJyjR9SWT/VdiQv5YvHwlzYW8qQd//ka1F406mve
         CCQrqXMAJEBi5+iMYAGfousK7vC48keKQfe0ck4BWwDw48UXiNaf458DMuWE/6r9Tk5S
         sG8TinuBFYj+lf0NesI9u1FvXAqUVDAaFBLig/d9k/IgzxRitfHKmw8Koek0LYTgVVSk
         MeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502751; x=1793107551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwTb5esbD12SQH/qZ580I3FDTK2uTjyQt3U2OZ6zUYw=;
        b=CjuZqYHiCCRocIWfFVDYuwjMho9FjHc235N9kuQZkmo6osc2mvQdiKDERV2lHHsD/J
         MBxvVPPDNOr0+qb3B7iGhsgwg5+kQaVB7trAPuRXddR2NpUg6dxziJAQ2XUNqmy+h5Ro
         bxdC13YoVXK2TL9u4g1DVXZaAXFsxkKHJKL1c3khGeshHFb8kBnnhnPzlzQYefNpjzss
         wmpg9qnRvnvPxvSggfvS5Bu1w5evm8fLR3f77H+IIGYUTBwxoiXoBikZacajkUOvPwQX
         uP3kurl2Zwx4bjCGRKZmoZSlgaL7IfLmCzmWgjFBiuorr2NSy4v02Zn5V7xhALqzLH+Q
         eEyg==
X-Gm-Message-State: AFq9FYL0sNufxTvIYIedIdOgSnNjsq2GxoOzLurgbakMp7vMb9u9gPq4
	hq4R8/ZQcFaT/0XSkXE6O0kyxydfxq8K+wZTYwd3kbifeeL1JXebKN6C04v7MuNcGEgZpQduber
	MSYNCunSo5Vex335bvgFq1SaDOOJlbO0=
X-Gm-Gg: AYBFou1Mm8Empe0GV9YxXAs+4Blns3vjHS/oBcGL86UOIqd1U2QNEaA4MTFm5n8b4Rp
	TGp9eytGJoEGnHNraSrDcDbrC+NEFGsykVbKxXLN7XsKw4SUc9bPLLN4qJM4VOqwFVd80kF/B5T
	gxJ0x6pkgcDOWViTb90/rNcqvHipbT65f0gWXUYZXqN7sMG/HvPjSWLGPDAy1Ikjv9kjpwNaxSs
	7MJOlG8L76g11XzN4m483qg+MNhfZuFFmokMWNrrALOmfSaSXTzejiDT99Vc0PMHHscXg8xUJUG
	E8kzAiF3LbJd49cem28rrNpIlV8OcRrjg5xglCLtNpeh0BjEG4serdet/KeJ/YPluk1PLM3fzgb
	We4eUsbqO7/E=
X-Received: by 2002:a05:690e:1247:b0:673:e272:f3ec with SMTP id
 956f58d0204a3-679fbf342a8mr801634d50.16.1792502751203; Tue, 20 Oct 2026
 06:25:51 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020003728.13669-1-vfazio@gmail.com> <CAMRc=McxpU=hAivRV=e_QEVsChsg6SCOqwCsD__qUBogSfv6EQ@mail.gmail.com>
In-Reply-To: <CAMRc=McxpU=hAivRV=e_QEVsChsg6SCOqwCsD__qUBogSfv6EQ@mail.gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Tue, 20 Oct 2026 08:25:39 -0500
X-Gm-Features: AclHuK-l6IcxXkOECl9hoWQjaJEQhSPX_h5y_0EQ2yIHJLHUD7iJw6BUIaxxtRY
Message-ID: <CAOrEah57VOsF9aSV3zRF787EbfnkBhFkyxuGgkWjgbojMyhp9Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 00/14] bindings: python: cleanup and support
 Python 3.15
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 8:10=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> Hi!
>
> Thanks for the series. All looks good to me but I had some comments on tw=
o of
> the patches. I queued patche 1-8 so no need to resend those and I backpor=
ted
> commit 5524758ab4c3 ("bindings: python: _internal: collapse isinstance ch=
ecks")
> as it was marked as a fix.

I'll reply/fixup those couple of patches.

Also, part of my inexperience here, but I probably used the Fixes
trailer incorrectly.

The previous behavior worked but was not in the format i had
originally tested in my early patches but which i apparently didn't
commit [0]

If Fixes should only be used for actual errant behavior and not for
fixing mistakes from earlier commits, I can change my usage

[0]: https://github.com/brgl/libgpiod/issues/148#issuecomment-3197361208

-Vincent
