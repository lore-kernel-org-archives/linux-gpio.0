Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2936419314
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376434; cv=none; b=EM0eDIt8cuMS5xco4eX7jM2vS9j+FdG2dikbY+eD2NJk05Oe+UBvAXrvhvZD6wx/QuEdSAHHWywxEfpY40lTBi6S7kUOGi1cndHPYI5Nc7Kn5fSPNcV6cZU2KXik5FCH5VPCjdcubTpG43DAPZVxC+el64D93AqMhO/Axt5xsFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376434; c=relaxed/simple;
	bh=Sp6yCaNOU6D36IYfo4LZXO9ayD+FqlfUmdMqZKlPKAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sfpv9W6Fgcje0BE4d0oJYi4Bu8HVIM5sRjEyaDl2Zatrc4D5zDRIIVfNYHpUriDzO32aw9WgPONzgElELAlxwjc3cSck1MW27N58vP5YdXtqc5Y4WkIm7T8WwL/Y20K4CuaBFVTTQ3MNSqAFtCCRUgU04e6adqmo1zJNjWBIf5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmiFeC57; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmiFeC57"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E95D1F0089A
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789376429;
	bh=B4ztkW1Okj1yGPF8RnnaTFZyUekE6CEG7rfr7FQh/R8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lmiFeC57Qlcphe+dLmol+E1ble8uqPT7WC3Nw43acN6MEDWBJ5GtI5Y8eNcOp64YB
	 xeNn/qqojOacSCYyhb1zPNdTCt/8vfE4F3BNgnSJgADMOj4xgkvkYsKdp7hUv5eksF
	 TumSRArpae4UWysWYpjm8an9Q4Fj3eAkMMEMThwzkKRNeQaivGyRUFsedXEiTo/rSD
	 NDtdjss4/Sdo9nI2Yrxfz09iKk3NOc1OktQCi/aeee+HvNbc46ScmXoytrfg2Q7d1t
	 HNRM8kkCCZSlrRHSnOQdrWZHZEsUofNiEqmkMquyX71T41nYBQjMEgaVRB539iPtNN
	 zvV80bH9lxBVg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76462aae9so1299518e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 02:00:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBydaAbDNtCumvJ7ECKcXoyLTgkuJLoifhfC0D1jTSddbrNgaGK9lZUtLWu5/GQ+7SNq/IhYeLOkAvpc@vger.kernel.org
X-Gm-Message-State: AFuF++n4j7R/9OEMtmzBJVB3LcZNWo0NDeBmrZwErKDTBNxt1RwAtkiN
	Q2GW5IbWIfGdZi+A9tNaAoaD6tpMH0ZOnvIutCAqcLuQiCWMnvDSA7onMWrfQR/K/m7krcy89sB
	40Y2XWeLoMizlXCcfB4RIRO+CrGsQlOA=
X-Received: by 2002:ac2:51c3:0:b0:5b4:ac1b:89bc with SMTP id
 2adb3069b0e04-5b8ae66c59amr467116e87.24.1789376428079; Mon, 14 Sep 2026
 02:00:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828155820.4002492-1-sarah.emery@canonical.com>
In-Reply-To: <20260828155820.4002492-1-sarah.emery@canonical.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 11:00:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLmi8q1xduxj_y3hq=8s_0533VPhCknzewBN=w9FmoZKxQ@mail.gmail.com>
X-Gm-Features: AcwNN1WNB9oxZwGTAu8hR8E4yJHjKHse8FPgibB3-3nuDSKB-nChRVnEc8wW69k
Message-ID: <CAD++jLmi8q1xduxj_y3hq=8s_0533VPhCknzewBN=w9FmoZKxQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: generic: serialise pinctrl_generic_dt_node_to_map()
To: Sarah Emery <sarah.emery@canonical.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Yixun Lan <dlan@kernel.org>, 
	Jia Wang <wangjia@ultrarisc.com>, Emil Renner Berthing <kernel@esmil.dk>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 5:58=E2=80=AFPM Sarah Emery <sarah.emery@canonical.=
com> wrote:

> pinctrl_generic_add_group() documents that the caller must take care of
> locking, and pinmux_generic_add_function() needs it too, but
> pinctrl_generic_dt_node_to_map() calls them without holding
> pctldev->mutex, and the core caller in create_pinctrl() does not take it
> either.
>
> The driver core calls pinctrl_bind_pins() before probing a device, so
> two devices that reference the same pin controller can run
> pinctrl_generic_dt_node_to_map() on one pctldev at the same time.
>
> Both `add` functions take the new selector from pctldev->num_groups or
> pctldev->num_functions, and radix_tree_insert() at that index.
> Two racing callers can read the same selector before either
> has inserted, so the second insert collides and fails:
>
>   k1-pinctrl d401e000.pinctrl:
>   error -EEXIST: error adding function pcie2-0-cfg
>   k1-pinctrl d401e000.pinctrl:
>   does not have pin group pcie0-0-cfg.pcie0-0-pins
>
> leaving one consumer without its pin configuration.
>
> This was hit on a SpacemiT K3 board, where PCIe devices probe in parallel
> against the single shared pin controller.
>
> Take pctldev->mutex across the whole function, so that the groups and the
> function referring are in a single critical section.
>
> Fixes: 43722575e5cd ("pinctrl: add generic functions + pins mapper")
> Signed-off-by: Sarah Emery <sarah.emery@canonical.com>

Patch applied for fixes, sorry for taking so long to respond.

Yours,
Linus Walleij
