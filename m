Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32D53FF884
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 08:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251114; cv=none; b=gDFDc+4Jb9sstROc5yeVyMvWUWx2ERPnAhjIFq45xstCNjknp+rNYhxnsFZ77n6Ny+zHMY2BXB+gnQeyLiKp8vTSAbWMAksNaBufLvWaOCFBDJXpfLBylCsoU1wGwl2iRQgJ0hcWgjfRpz/HjQlC4HbAy0h4Di4lDjTDS7yW0dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251114; c=relaxed/simple;
	bh=i/iM4/p+swZSDXAyE3q1hyvPmHOykqSfcjwmXtMIt2w=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CjielaRFp9QNYouH9GG3D2DKFBVsbBFfZ24EcjSH+CM9uSPXBh1NKW1qR94VEAWRJGN5HBngn2M4Z1dkrDYHAjF04RvIza7u4LXB+CBkRV3oI+X/I3C5GTBUjyp/5x/BAXP3IHX+ZTauBrjrAqoGWrTsey1u8HiOStfTgBPPHcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dULhbiMd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dULhbiMd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5765C1F00ACA
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 08:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788251113;
	bh=i/iM4/p+swZSDXAyE3q1hyvPmHOykqSfcjwmXtMIt2w=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=dULhbiMdhwA/semByH6OuMrSfMdj1f/+J0IiMxC96LXoU2n4MYdu1tN8z/u2qbMlu
	 FKPys2LYUhZDDkGIErEaCkTV+ZLlsWP4036NJV7UmU0JxyGXG1xm1IyKYjHuq98+Om
	 WJ1jxtOg3DIlFUL+ras8H3wcvk+Fv3MVqDfCP7zJLldFVHSVvcD7RSmoqud90hZld4
	 jIG7R3n9G+Lgtcpo4As3g/TWiGvw4AFt86KX0BBJ+uU+1AyF5yuHF/c/Dd4zg/oGmM
	 kFFFuc9hIKmqnulxAfeC1O2yIyUdLxc+E3z7tz+XHfAJVAwyX9FLkim2hkeWVxFAfR
	 QNJDer3YujEjQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a309f92daaso33583081fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 01:25:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3FwEDX35F49UKSXtSJ53j78pM6ewwxCRdSktPpzYVBRqald/lAZZV42Zd1n9yVSf6jvLQgJ8GIKOS@vger.kernel.org
X-Gm-Message-State: AFuF++m6vNOL6nNVYFMsAQvaZLwPOOBcnV9FBQAx6r8juC/+m9nrEeO3
	Ou4WkKQcFIdYBWWoBNAVDWtD1fMVfceImT8pXlrH2bzWgjhOIYMo+/vp57i5oQZzelQXjR4fl6V
	XFrrx4QJB2emtaa/N7CnEURdj25A3saP6gmq1XmhE6A==
X-Received: by 2002:a05:6512:1194:b0:5ae:bd4d:852 with SMTP id
 2adb3069b0e04-5b5e68b2095mr8818726e87.5.1788251112031; Tue, 01 Sep 2026
 01:25:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 01:25:11 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 01:25:11 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260831143125.151360-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831143125.151360-1-ivanrwcm25@gmail.com>
Date: Tue, 1 Sep 2026 01:25:11 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfCNuiOC61Qhmw-HYZ0wkYOMpqbbaPhjCrkhE-TyMG5ig@mail.gmail.com>
X-Gm-Features: AcwNN1Wn5N4h64iDIMsKV0sAJA18IFGsQVi5MnScE8py1Uj_DvOSo3BSYlTaDyY
Message-ID: <CAMRc=MfCNuiOC61Qhmw-HYZ0wkYOMpqbbaPhjCrkhE-TyMG5ig@mail.gmail.com>
Subject: Re: [PATCH 0/7] docs/abi: align userspace documentation with implementation
To: =?UTF-8?Q?Iv=C3=A1n_Ezequiel_Rodriguez?= <ivanrwcm25@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Jason Wang <jasowangio@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 31 Aug 2026 16:31:18 +0200, "Iv=C3=A1n Ezequiel Rodriguez"
<ivanrwcm25@gmail.com> said:
> Documentation and ABI alignment fixes found on v7.3-rc1 by comparing
> userspace-api docs, kernel-doc blocks, and uapi headers against the
> current implementation.
>
> Patches 1-6 are documentation only. Patch 7 makes GPIO v2 return
> -EOPNOTSUPP when EVENT_CLOCK_HTE is requested but no HTE provider is
> available, matching the documented behaviour.
>

I suppose the separate series you sent after is the one I should be looking=
 at?

Bartosz
