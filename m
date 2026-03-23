Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30BF33985
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272659; cv=none; b=h5+9jqUk2DdloBJuSSiLUaz1juSHEYKTOYyXRmkYFwr3QGXvPbxJI2F//ObzC312q1+udBm+cdCFOZ2DF0nJqlJwYMT8pNAwdYX9MdJEgc/JCaHGga7h+H96e7pQFpFfQ0/4ipGzl4grHEJM9gBdAOVeDMjY21lIH6qiaY3ItyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272659; c=relaxed/simple;
	bh=swaA/2qJibRRqwxYTpdBsZ3OSUE/9edGptD+0kwCU1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b8HuHU4TayARuFNyGqwvd35ZIx/eS05yXlz40ayHAWZa1/aelvNLzpShZj1tAFX2p/kjkas9w+xEmCjY3WiI9LLFBf66m8jz2B691eMOBlNCoqUj0JtjJ1D0SrQEvF4xGOiCiSzNWuidp5xjXlc2CX+mNMsna1YAqYBt2CZxqNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ssez42qo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ssez42qo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C430CC4AF0B
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 13:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272658;
	bh=swaA/2qJibRRqwxYTpdBsZ3OSUE/9edGptD+0kwCU1Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ssez42qoSdbTGJO9oxKCLv4uFQocdhfnH0IcXzsXrFxQu3sC+LeeCKYfeX4f99kpW
	 LwNjrR6yg5LRymgUTY/opwWP4JIj7nffFYDr5c6lSjt6c/BnyVUemjJqbze7UoXs1I
	 TS5k+t84bIzC+8zAEBoVLVVrCW5TKPycfNFK8eNGE13T6SLJaP3GbHPpNHNivSVMYR
	 eW1VGsSBi8PvFX5LTgPepUuT54N9K9DvFQYfr0yuIow+o3cztrPIjaTRIKUrUmv2qk
	 TUoxjL5unmow3IoQWA3Fzmv1nR/kgupzxfyJUPmwexr3PromfExeSSQhvscN4FrV4b
	 st3XMmsgSR5SQ==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ad46a44easo3794460d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 06:30:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZi930QzORXwkuS0kg/rFTsOFVX/fULroFvApVaIGZlI2iqnII85NOxzfrhJTTMBEgaqN0CJbYoEBI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1WDIFr4YZRNLP1DL9x3kw2jdnhG0rWiuDlae7SExHT89cRVuO
	lE2MiGUSDUrOLcQShcgZpFyp+KM5Sf08jxxFjM7z7rMu1wsraQNL1qnC0iKvWGldbx8B262BoxV
	8CIwYjYwbe8mpNm7XjlSf8fpkEEjIvaw=
X-Received: by 2002:a05:690e:2109:b0:64c:a894:f721 with SMTP id
 956f58d0204a3-64eaa8158a9mr8789262d50.75.1774272658107; Mon, 23 Mar 2026
 06:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320220550.3237142-1-andriy.shevchenko@linux.intel.com>
 <202603211748.5YfMNVO3-lkp@intel.com> <ab6a3MACb9fed99h@ashevche-desk.local>
In-Reply-To: <ab6a3MACb9fed99h@ashevche-desk.local>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 14:30:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLkpPnRCJdFoavwYqMmOUNzU3oZoPm8LDVW5CuLV9PGSAQ@mail.gmail.com>
X-Gm-Features: AaiRm52Dug9rz1SVg2ydoVElKTQq2g0BE8BJeRWC6GfVpYFdCRbfeMgumPQMBSw
Message-ID: <CAD++jLkpPnRCJdFoavwYqMmOUNzU3oZoPm8LDVW5CuLV9PGSAQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: core: Drop unused include
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 2:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Sat, Mar 21, 2026 at 05:55:35PM +0800, kernel test robot wrote:
> > Hi Andy,
> >
> > kernel test robot noticed the following build errors:
>
> Ouch!
>
> So, seems the gpio.h is used as a 'proxy' for some other headers.
> I will test it carefully before sending v2.

It's chill, I don't mind using the autobuilders for testing :)

Yours,
Linus Walleij
