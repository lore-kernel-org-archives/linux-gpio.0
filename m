Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D854141D20C
	for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2026 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829457; cv=none; b=sAjkn/fztS9Gbp+gDrQxcSAijP9SbugSLbTOeA+aZKybbXja0vwSvQw5YFkA3E1kFQX1hgk+uRhI0heDpR8lHh4Ei4eRInFzJVUj0wDlR9YWiv8nEKJkaFRxFcMm/iHnFIAK+bKLW+GJDoyJ71GwtNgg9+ZYPqDpgb5IFNWp2vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829457; c=relaxed/simple;
	bh=Z2Kv/l7OnlUOaYrkmIOf6qCQDdzulL2UvfL1WoFkS0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8J93I5OfjqMqHjCaqDAEXuT+hps8F442DKNKDj2EjrQ1ejms75flznaZQ3pzUGKhCUwZIxSiLIRZagiNDIcg5sz649iEu8/MkLQip3DNKN5OO2E37KhCYwPgyjh6c6+Phn58pk+7KRCMsFHMBDXwejZ13YbEhoEBZLHq1A1pxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2gsTK4v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2gsTK4v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD75C1F00A3E
	for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2026 07:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785829456;
	bh=Z2Kv/l7OnlUOaYrkmIOf6qCQDdzulL2UvfL1WoFkS0Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S2gsTK4vHSKKVXyY8dri/YRShzeSRuZXlpcuVvqAoxFjcriIK36+aJN4x2JrmpTg2
	 ck7U4S1CLewFRDjZ/Jobj7DGZS39RKwt4N8ds8oteXxcd83/njdrIOmWR/j9oo2HJl
	 KSgJzZ49I4rhr+dJavR/A49azj6ePjCHWKjzPrT3SD/nbv7X+HM/K8H4SkursNxlmc
	 VncA+xabAL84i/+9tmAU7GqkeEDA3DAQcMueFsz5CvEnXh8I0e8IpNUtb6OoU7myHa
	 de4wTbT87357qLcbiGxqf9IVQzj9GATmPD+nUsZGXI+BbXkJrJZMuvwYZGmoxP3xL4
	 xqhjGko6E4zAw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39dbe684115so6309451fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Aug 2026 00:44:16 -0700 (PDT)
X-Gm-Message-State: AOJu0YzHgt/8t83aT1Jum4cJXUttSLnahyBF49dwfzZZ6qGzfLH0zzYe
	nIC+ykDQGkb0ZAzKLU6qAgFI+haNoqlx0kPTUm4PxBgYr0sNMdU5z2oRDgFJKnjs6SaB4g1KwOM
	nzd4Z+BTUxV1rGHEdPZxAiiAT0FtybBE=
X-Received: by 2002:ac2:4e14:0:b0:5b0:1186:fdf with SMTP id
 2adb3069b0e04-5b2f281c00emr380527e87.11.1785829455531; Tue, 04 Aug 2026
 00:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731071845.175120-1-tchan@jacques.com.au>
In-Reply-To: <20260731071845.175120-1-tchan@jacques.com.au>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 4 Aug 2026 09:44:02 +0200
X-Gmail-Original-Message-ID: <CAD++jLk-9Nv=N_CxMKqc_sqteW5+g99vkiO2YrMRLmULom5RWw@mail.gmail.com>
X-Gm-Features: AUfX_mwMGOoQePw2mOedzogMWyiTp8oZuSer2ccdHAOPPRTJz5CvRAwwQF6Su8A
Message-ID: <CAD++jLk-9Nv=N_CxMKqc_sqteW5+g99vkiO2YrMRLmULom5RWw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sx150x: allow build when I2C is a module
To: Tsz Shan Chan <tsz.chan.dev@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tsz Shan Chan <tchan@jacques.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 9:18=E2=80=AFAM Tsz Shan Chan <tsz.chan.dev@gmail.c=
om> wrote:

> PINCTRL_SX150X currently depends on I2C=3Dy. This prevents the driver
> from being built when I2C is configured as module.
>
> Change the Kconfig dependency to just I2C so sx150x can be built as a
> module when I2C is also a module.
>
> Signed-off-by: Tsz Shan Chan <tchan@jacques.com.au>

Patch applied!

Yours,
Linus Walleij
