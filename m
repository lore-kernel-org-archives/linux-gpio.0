Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9170B41DDE1
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 12:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463682; cv=none; b=O/68rdGEtwjnrwOuV82kh/6DM5KcW2odn8c2Xqc1SXtvLh1cgX6mlO3qGJXNP/eEVN/H5uE+lRkuse0e61nEXh0aJJ5aWrFoZIjaz+EhC+Mao9q0rSxvZ86oWQNoJYdfglCBgGMfmweLazPQXFSjoakAqMbjCJXswDQIyzH0/cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463682; c=relaxed/simple;
	bh=LV6/shKBT5pKWVf3EgNrs1KtHkV4PagZx7OmupPK8os=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssP69QAEsUVPGLCyasZgzYECrUOzv4B4z/nMegUrETd1Dxz5ycniLICllSVKePCWktiCibBKolxB6nzsL8Ri4YdoVEyUcnBoVZPekcu20+220FiDsCxIjbGe0j9sji0JdP1mUTU71xiKez2+U/S173PuzcVK8SdjeheUhzz18bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5ZC6XZC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5ZC6XZC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3491F000FF
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 12:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791463681;
	bh=LV6/shKBT5pKWVf3EgNrs1KtHkV4PagZx7OmupPK8os=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=N5ZC6XZCTkHjShr1cBVfTimo4MwQ7jBisVXf4sxN0jnwoqTpNJegdnNnSpWj8lurh
	 zx5NFRxd1kS9INoJ1WvTByWNScpEPFlQ9QPpitfMmlIe/utcQbH7Bv3drrau6BOrlc
	 avYUr9M4y3dRk7VjFG8lc+76ysRjXjlT6fcJVXdw6Y+90Ep394CGTN2PXWAZN61uA/
	 p9yPW+20qRGzS9wlWJvUXzES2skDA0wj3WsKFwZy/LnZe4YjoM318TVRORYd/mUbQq
	 33v5nlapaza/fdy412vGV6ax311xfDO25q59uAj8JrWFcv2CCJUfx0zmGpZkp0GXoZ
	 SISx5gq0LmGcw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a9a1ed66b9so13370711fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 05:48:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxF9Oe8vA/eAhZjTy2Kaw+W5ywL2dWG62dCmKmGWwO17jD9mfIZuPX6aUcXTr34tOY/QCIbJHyyUWM2@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4JQBLiN/LmpigjdjTuGbhFHot/MknaTuTkXcaSP65EFXwloQ+
	3udOMH/s8fBPWFZ/MDir/dayJgGBQlROdtXXR8RqlNYlhOTxe11nqzrG/k+OepKvlpRA9FeifKS
	T62+Ht5mgeRgMaQhrB2XOOBgRpckFWjsas/9nnCX0kA==
X-Received: by 2002:a2e:b8c5:0:b0:3a6:5fd7:c98a with SMTP id
 38308e7fff4ca-3a9a2c6357dmr13064601fa.13.1791463680000; Thu, 08 Oct 2026
 05:48:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 12:47:58 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 12:47:58 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jL=fkJNgCHb7M4mm5nc0nwb1GZmozngCEv-A5VCBULXD3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008090724.5423-1-bartosz.golaszewski@oss.qualcomm.com> <CAD++jL=fkJNgCHb7M4mm5nc0nwb1GZmozngCEv-A5VCBULXD3A@mail.gmail.com>
Date: Thu, 8 Oct 2026 12:47:58 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mfx3a-vD9HoQuirjDL_4TF-tOw=mAC=PMcR6DRt_Kat5w@mail.gmail.com>
X-Gm-Features: AclHuK_R7g7m4hPEKjqHgTKLRbJgKqk-mkMpcqjQPito5GqgoJTskotDp8Lpis8
Message-ID: <CAMRc=Mfx3a-vD9HoQuirjDL_4TF-tOw=mAC=PMcR6DRt_Kat5w@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm pin control fixes for v7.3-rc7
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 8 Oct 2026 13:39:59 +0200, Linus Walleij <linusw@kernel.org> said:
> On Thu, Oct 8, 2026 at 11:07=E2=80=AFAM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>
>> Please pull the following set of Qualcomm pin control driver fixes for t=
he
>> next RC. This is based on v7.3-rc5 where the previous set of pinctrl fix=
es
>> landed.
>
> OK pulled in!
>
> It's a bit weird to me that you merge in -rc5 instead of just rebasing on
> -rc5 but I guess it makes sense if the fixes were queued before -rc5
> was out and it checks out, so whatevs.
>

I really prefer to avoid rebases if I can. I typically queue patches all th=
e
time and just merge in upstream tags if needed. With merges you don't risk =
any
accidents with rebasing like dropping existing merge commits, etc.

Bart
