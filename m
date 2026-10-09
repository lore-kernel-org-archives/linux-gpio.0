Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDDB3D9674
	for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2026 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791580717; cv=none; b=SBxSyThgV2uWbFv27tyrbrRg2MALW0JsMHTk+8pEq+NezaeKI+7miiapbiyCFiy+6tHp1dfusgmNUj06oJ1Ey2iOotRn0mP4hwPyMSuqm8fNi2rbspp2VbP1ajx4Jyeo6Yr5EARMv+ATbiY+7yWjatxSEcl1Lm1jvYq232d0sw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791580717; c=relaxed/simple;
	bh=FeULK5vu/iul2r5gyqoYMX7h+lAsKEhGANssEu+hq3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjsqsKbsHvcYp/cw1iDsjS0STP44Lh5ioo23V8zl2bM3NnkFZEnMRRURZNnDhB0/9y0pW4bZIOIKIliNZWlOoj2opvwer6gByRRpSDQgf6pzo9saalTaXXJk0ieh8Zq353lDYj3e9XxjHtl4ZQDd4KyZP6nKoAYaegkwICrjUOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZ19EhHm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZ19EhHm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58981F00893
	for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2026 21:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791580715;
	bh=VO8929DcFxWMfDXWuB+aNiFWj3RVGm5opqvRhJip1dM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KZ19EhHmkFoU9O/scMHv0XQVVS4qC7DpyvPZAeoVPhacyUTz7LLNkPwtIpVAyjSlA
	 3KGi+fZO7F2L0xN5AN5+gcjRCEbeoTQEmIF3Tjyse6S13ri8stvD62zV16xZdj6UjU
	 FmqrUOCxoGiGr0Zi+wKHNIk4mkkpDG/ziG8HpO1u56rpYqjVrdcJEBH2Ob6o9nhOx8
	 0xZeG2Bnv4d8LCRNQ50TrA4RLPX75vTDhhJby1D9JVqCVcm80bYPTgpbUrbf+4nD0d
	 l6CfeRJUtgHRnhrEHdD10ZHpBDqMVfF7Vg/3lAyglCfqEdBnCDd5Yw/yaXjtjYoMuX
	 xAQ25W2WHeVxQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a9cc82ef31so2151291fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2026 14:18:35 -0700 (PDT)
X-Gm-Message-State: AFq9FYJnH/CIK0UUndoAqCCd7O24DifM48PVlhUTeYhBEbIiRn7elmx7
	Gsamby4NZONSt5C9wqNOiVbZQI52+IP1JrdKkhlpKsqJb33urmgYEgGRLiFyEZNf4bsKqewy+iE
	cCv6czH3iPwZG7fvkwT5dcPT4e8XM42M=
X-Received: by 2002:a2e:b8c7:0:b0:3a9:7160:e83a with SMTP id
 38308e7fff4ca-3a9c5385024mr8277121fa.17.1791580714450; Fri, 09 Oct 2026
 14:18:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202610092056.6NsErH0t-lkp@intel.com>
In-Reply-To: <202610092056.6NsErH0t-lkp@intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Oct 2026 23:18:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLmQAnxhqkzfaC2st3ZF71Bodgg27HhEgGBENi-+kZhs8Q@mail.gmail.com>
X-Gm-Features: AclHuK_LVk9AcZq5Ziw1kalFCEzJ4hebe3yuXUY47EWWhqqXahWC8POAc8e9mOI
Message-ID: <CAD++jLmQAnxhqkzfaC2st3ZF71Bodgg27HhEgGBENi-+kZhs8Q@mail.gmail.com>
Subject: Re: [linusw-pinctrl:devel] BUILD REGRESSION 2430546e8d00b1a00fa85f71b666777bc9e3db27
To: kernel test robot <lkp@intel.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 2:49=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:

> Unverified Error/Warning (likely false positive, kindly check if interest=
ed):
>
>     drivers/pinctrl/sunplus/sppctl.c:980:1: internal compiler error: in f=
inal_scan_insn_1, at final.cc:2823
>
> Error/Warning ids grouped by kconfigs:
>
> recent_errors
> `-- csky-allmodconfig
>     `-- drivers-pinctrl-sunplus-sppctl.c:internal-compiler-error:in-final=
_scan_insn_1-at-final.cc

"Likely" a false positive is an understatement, it literally says
"internal compiler error"...

Yours,
Linus Walleij
