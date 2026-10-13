Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694574E1C75
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 23:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791934953; cv=none; b=tPpWNGKqXGRmB8bLHUVhE55McKlz2GYq+fyc7udsFTVfDjerhf/LAC/G/BS6igInUsey79ZN+VmGb/y2P2x+Xpe2u6/XN9Gwv+XZlK2aYB6nWdfVOuvKWnSfP/Q6URk19pdrYxAVK937W3xRo207OgvjrQbRT5qp4IozijP40lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791934953; c=relaxed/simple;
	bh=eDbvwpgVTlaaMeKSv9P2rUafKillMkGTYGzhWBpvbv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXuyLg8gxzVqMB7PTj3JSuTuEPGio5rhnQqpRhmj07V4dhZjNcdk7JYr6Dqq6Bvm/1lCrqVKp+wQjFowKQDuxvbPIuYbw2QgAZvqkpK8aBhwSEnPpwS7KPgodldPFMHA31qol09BnGqV3JSgu5HdLLjtvnZTcO4w8/xNeD4TBQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPG0Gp7J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPG0Gp7J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80741F00898
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 23:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791934951;
	bh=eDbvwpgVTlaaMeKSv9P2rUafKillMkGTYGzhWBpvbv4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oPG0Gp7JBk6pYvBR/k12SmL+Qdvnrv4RIiPvodfSmyRB6EdOJC660xXhksXzYATC8
	 KMYpwDQj4Zb+/Bl4EhlaSJ1v8THLUItYG+EfrZOB8d4RbhAM70Lr0iKYQ1AhXM8xEg
	 GLg9kvEs4Bv3hfBOo6gtVt0sl4uDgtXcE5kRgUH5gBh+3vTConMPH56kSr9DS/R6Jj
	 UWwVuFEnvSnepti11cyfxF5wAb6iAb/nwsbEGfZMWU489PJhs5p6QKOfgGZb4zcvex
	 sAHkUEz++Khmh6Xpl5UxKSGlM6F4g5XeU3cU0gUFSfG40JSyb7GWYLecG1D0WPhnYP
	 Y1wwy7TPWiAmw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba41ea31ccso3989271e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 16:42:31 -0700 (PDT)
X-Gm-Message-State: AFq9FYKaiqQE26E835baekC3uimtJpZ9+dHmbjlK6np64BePgivVYFua
	uBlVl5HcZrtnpcVuVE/AzTXfHu0KFXK7jYf/lMCvHDNGekwKeC4Wk/Kmywm3cRKSqeZ0H2gyn7J
	AAMuDR51s5KPMxBYkP5kjbx+6eqedwuc=
X-Received: by 2002:a05:6512:6d3:b0:5bc:d9d6:6a98 with SMTP id
 2adb3069b0e04-5bcde39f2eamr4571803e87.10.1791934950715; Tue, 13 Oct 2026
 16:42:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <as6VF3GFQdlHkuSL@black.igk.intel.com>
In-Reply-To: <as6VF3GFQdlHkuSL@black.igk.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 01:42:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLnpg-yazUEsm_dFKLBZGM9hV825gbOJ0_3Xw=4jyEozsg@mail.gmail.com>
X-Gm-Features: AclHuK_EKILGJpI7IJ_AVCo5GsEn-lVy2BhvIiajhwYb8iIMTzGfBqVkpf5_elY
Message-ID: <CAD++jLnpg-yazUEsm_dFKLBZGM9hV825gbOJ0_3Xw=4jyEozsg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 7.4-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 10:31=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> A small bunch of changes to the Intel pin control to enable pure platform
> device enumeration. The set was sitting in Linux Next for a long time wit=
h
> no regressions reported. Please, pull for v7.4.

Pulled in, thanks Andy!

Yours,
Linus Walleij
