Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744EF3988EE
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775555514; cv=none; b=Vdy2atlnViTZmA/cnQdbnaZpCn+RwS4sqyZ/xoagfSIgG9FWlBTHC8yUC+Gz3Op5iIRr4SqBLwUD4titzAjhssgCAmDdz473pcx/13XfpEHORdmNM474Eh2hTEa6jjGxm4XurTHln/6ZP+mk4ROtL4FGQggvsRkoNAhrs3AKtKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775555514; c=relaxed/simple;
	bh=ChOxFdjgnBojv/cjzQaNp50QO5fzbDjxrkHh2LFJiFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QmwhKaEpljtknhD1rLnG/LQmY0h9TaylqO+DVLfFNhNr4GNNEzf7uxLYjczwdErks9JTzqoPzuYRndWxiClan+eTf/YuDaiq8F4NYn6VrzW2Y0honFJhV3+DjromnJI4CTkpiGhIJHQk/UzqMk8sloFZy5EYOEVN0bhStHTOP0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p06YxY3Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p06YxY3Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19782C116C6
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 09:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775555514;
	bh=ChOxFdjgnBojv/cjzQaNp50QO5fzbDjxrkHh2LFJiFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p06YxY3ZD8wGJf6T9SzfsF2s5d3/LZx6AdOyrnsA847z6mR1km90ZOps2aFoa8DoJ
	 zfIs6fLOU+Ei/7uFtqQrnD+2tI0X0Ozlk4za9y4SrbTDEkKVb+G1LWLLl46VSl3OYK
	 vt4Fi6C6iFl46hTcY83H79zpGo+rqPkwgMUxC6vOcoYqRXAX69klZLAkJ1EOf5UUJV
	 tvOUovluF7LFX0lyC2zT6JGtDyHJtFdWdjS+hlSQL5wcPgekh99q0sUI1dlRDMD8d+
	 O1s18oFxjscO1xVbQwiQv4x8o7ipM4rm8echmxSmA/x5lz9RZHCQt+cSY56AJZGlZx
	 v0bGTdQKIvGdg==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7927261a3acso40617367b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 02:51:54 -0700 (PDT)
X-Gm-Message-State: AOJu0YyuPp6K/9fi9BA4UCGcDtTuN//nWcIwoaGhk+Jcc1ZwWAWKky/7
	xUQghMqMugNrYvAbwrnW/JBz8FLsmVgA+ENS9RbVHpbmbkSOR6Hi6fKXaNaBlzqDnuUMCcYhojz
	LZJVA1oVe93BvGB+rM06HMKv9aFrGaxc=
X-Received: by 2002:a05:690c:6e85:b0:7a2:1f26:3d98 with SMTP id
 00721157ae682-7a4d6c2a9ccmr151535457b3.23.1775555513561; Tue, 07 Apr 2026
 02:51:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401174526.60881-1-alan.borzeszkowski@linux.intel.com>
In-Reply-To: <20260401174526.60881-1-alan.borzeszkowski@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 11:51:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLk40Gw4Gw8rNCWvbUGJhbmd_J2Hdpc2D9kkkncBXxgx8Q@mail.gmail.com>
X-Gm-Features: AQROBzCLLSosRFLO7Ln3DMu6pGikX4UvtU6neCs1YbQT58D08dDCn4CT6KPRDE0
Message-ID: <CAD++jLk40Gw4Gw8rNCWvbUGJhbmd_J2Hdpc2D9kkkncBXxgx8Q@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Add Intel Nova Lake ACPI GPIO events driver
To: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org, 
	mika.westerberg@linux.intel.com, andriy.shevchenko@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 7:45=E2=80=AFPM Alan Borzeszkowski
<alan.borzeszkowski@linux.intel.com> wrote:

> This driver provides support for new way of handling platform events,
> through the use of GPIO-signaled ACPI events. This mechanism is used on
> Intel client platforms released in 2026 and later, starting with Intel
> Nova Lake.
>
> Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Nice driver!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
