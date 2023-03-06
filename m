Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0152AC678D4
	for <linux-gpio@archiver.kernel.org>; Mon,  6 Mar 2023 13:42:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjCFNmL (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 6 Mar 2023 08:42:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjCFNmK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 08:42:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFB82E809;
        Mon,  6 Mar 2023 05:42:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1F72160F9F;
        Mon,  6 Mar 2023 13:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB57C433D2;
        Mon,  6 Mar 2023 13:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678110128;
        bh=oc41KxB5Njktaetjdw5XRL2t34mdGsunkNm41PXsrLo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OFadLUxpdyOLEUp3fmG5sPXniWyGr3DibSSmd67OMeHftXbd5xH+X4adhDLCf1s04
         jej9S1efK8s6zUrfwpdqRf3HxIArdtciobg5bp6XVEqvYRP/rwojPhcsAVDAwQZMBM
         2nXvuJrPGBVaCz2eYKRQBL6Laeot0Orv49QdORXKyqRvbpwAUbYJYGPrZHb3pd3bQ1
         6Am5YBq/8jQy85H4I46qM0FPzqYFsHOYKGyM8BO4fhA/LLvu9C5yEyBxwZi7j24GeG
         zjTYGA/kk2zXmlg5yDpYE/i3+RLxdKLwvj9lHVNBtSV5HWaNDP9oghgLk0yiHVebDd
         ztCn/elOoMCYQ==
Date:   Mon, 6 Mar 2023 13:42:02 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: at91: Make the irqchip immutable
Message-ID: <a490d19f-b7e2-4cd8-ab39-e96740ae2b4b@sirena.org.uk>
References: <20230216-gpio-at91-immutable-v1-0-44f52f148ab9@kernel.org>
 <20230216-gpio-at91-immutable-v1-1-44f52f148ab9@kernel.org>
 <CACRpkdbeVw1vBikYi3RimOO8K-KKLOpO=9O_yZFBt4oORi=Wgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5CxMvXBYLFR82//9"
Content-Disposition: inline
In-Reply-To: <CACRpkdbeVw1vBikYi3RimOO8K-KKLOpO=9O_yZFBt4oORi=Wgg@mail.gmail.com>
X-Cookie: teamwork, n.:
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--5CxMvXBYLFR82//9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 06, 2023 at 02:20:56PM +0100, Linus Walleij wrote:

> 2) Can you respin this on top of my pinctrl devel branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel
> There are some Andy-cleanups already queued for AT91 so I am a bit
> worried of collisions. (If you feel confident they are orthogonal just
> use v6.3-rc1)

Argh, I'd already started testing with a rebase onto 6.3-rc1.  I've
restarted for your devel branch (neither rebase caused any conflicts).

--5CxMvXBYLFR82//9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQF7akACgkQJNaLcl1U
h9CGagf/bmFHRICeFf7bF1UzcBxM2hGP5V0iT/PsqOwZk0WfHHIcuIxf+JnZsQD/
0bGn/sc6k7b8VwKH1Bw9/eo9rTaSxsCFiQUk0WJUG+g8hJDTdX+C6hWhnpYYKBSo
wa0Mnfa9YR7Yr4LRryJ9e4UGFNnrm3KjPjgk4KAdJ5eBIapfXxrmgzzCq5dSgWah
9UkiJbnoouvpWU0yEb2rBNmExRWH4UCI5DszDHmfq6XLw0Z4LT/XJGPe/hI01dg0
VMrsprzetPQ1fkcg0+vD+sI4RGxZiZqMyrhdnyY/EMZ/35XUh804zjUgIig19qgu
qPRaJbkH6XYqrS9iH0zhzDowjIk4iA==
=JlOS
-----END PGP SIGNATURE-----

--5CxMvXBYLFR82//9--
